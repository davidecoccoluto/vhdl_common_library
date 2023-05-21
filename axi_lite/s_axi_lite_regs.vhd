library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.axi_lite_pack.all;

entity s_axi_lite_regs is
    Port ( 
        S_AXI_MCLK: in std_logic;
        S_AXI_RST_N: in std_logic;

        M_AXIL: in AXIL_MASTER_TYPE;
        S_AXIL: out AXIL_SLAVE_TYPE;

        reg0,reg1,reg2,reg3: out std_logic_vector(31 downto 0)
    );
end s_axi_lite_regs;

architecture Behavioral of s_axi_lite_regs is
    -- reg address
    constant reg0_addr: natural := 16#00#;    
    constant reg1_addr: natural := 16#04#;    
    constant reg2_addr: natural := 16#08#;    
    constant reg3_addr: natural := 16#0c#;    


    signal reg_wr_en: std_logic; -- internal trigger to write a reg
    signal reg_rd_en: std_logic; -- internal trigger to read a reg

begin

----------------------------------------------------------------------------
-- WRITE SECTION 
----------------------------------------------------------------------------
reg_write_proc: process(S_AXI_MCLK) begin
if rising_edge(S_AXI_MCLK) then
    if S_AXI_RST_N = '0' then
        reg0 <= (others => '0');
        reg1 <= (others => '0');
        reg2 <= (others => '0');
        reg3 <= (others => '0');
    else
        if reg_wr_en = '1' then
            case to_integer(unsigned(M_AXIL.AWADDR(3 downto 0))) is
                when reg0_addr =>
                    reg0 <= apply_strobe(M_AXIL.WSTRB, M_AXIL.WDATA, reg0);
                when reg1_addr =>
                    reg1 <= apply_strobe(M_AXIL.WSTRB, M_AXIL.WDATA, reg1);
                when reg2_addr =>
                    reg2 <= apply_strobe(M_AXIL.WSTRB, M_AXIL.WDATA, reg2);
                when reg3_addr =>
                    reg3 <= apply_strobe(M_AXIL.WSTRB, M_AXIL.WDATA, reg3);
                when others =>
                    NULL;
            end case;
        end if;
    end if;
end if;
end process;


----------------------------------------------------------------------------
----------           READ SECTION 
----------------------------------------------------------------------------
read_data_proc: process(S_AXI_MCLK) begin
if rising_edge(S_AXI_MCLK) then
    if reg_rd_en then
        case to_integer(unsigned(M_AXIL.ARADDR)) is
            when reg0_addr =>
                S_AXIL.RDATA <= reg0;
            when reg1_addr =>
                S_AXIL.RDATA <= reg1;
            when reg2_addr =>
                S_AXIL.RDATA <= reg2;
            when reg3_addr =>
                S_AXIL.RDATA <= reg3;
            when others =>
                NULL;
        end case;
    end if;
end if;
end process;


-------
-- WRITE ENABLE PROCESS
-------
-- generates only the trigger to write the regs
-- contitions to write:
--   - write address and data both valid 
--   - return channel free
--  [NB **return channel is NOT free when (BVALID and !BREADY)**]
-- the reg_wr_enable flag enables one single write so it's only one clock high
wr_en_proc: process(S_AXI_MCLK) begin
if rising_edge(S_AXI_MCLK) then
    if S_AXI_RST_N = '0' then
        reg_wr_en <= '0';
    else
        --default assignment
        reg_wr_en <= '0';

        if( (not reg_wr_en) and
            (M_AXIL.WVALID and M_AXIL.AWVALID) and
            (M_AXIL.BREADY or (not S_AXIL.BVALID))) 
        then
            reg_wr_en <= '1';
        end if;
    end if;
end if;
end process;


-- generate the response valid
-- set when a reg is written
-- cleared on resp ready
resp_prot: process(S_AXI_MCLK) begin
if rising_edge(S_AXI_MCLK) then
    if S_AXI_RST_N = '0' then
        S_AXIL.BVALID <= '0';
    else
        if reg_wr_en then
            S_AXIL.BVALID <= '1';
        elsif M_AXIL.BREADY then
            S_AXIL.BVALID <= '0';
        end if;
    end if;
end if;
end process;


-- While writing the reg I'm giving the ack to the master
S_AXIL.WREADY  <= reg_wr_en;
S_AXIL.AWREADY <= reg_wr_en;
S_AXIL.BRESP   <= "00"; -- write on reg cannot fail 


--always response OKAY
S_AXIL.RRESP   <= "00";

-- if there is no data valid in output to be read
-- I'm ready to accept a new address
S_AXIL.ARREADY <= not S_AXIL.RVALID;

-- I can read a new reg if the address is valid and the slave is ready
-- its equal to ARVALID and NOT RVALID
reg_rd_en <= M_AXIL.ARVALID and S_AXIL.ARREADY;

-- data read valid is set when a reg_rd_en trigger is set
-- it's cleared when master assert read ready RREADY
read_valid_proc: process(S_AXI_MCLK) begin
    if rising_edge(S_AXI_MCLK) then
        if S_AXI_RST_N = '0' then
            S_AXIL.RVALID <= '0';
        else
            if reg_rd_en then
                S_AXIL.RVALID <= '1';
            elsif M_AXIL.RREADY then
                S_AXIL.RVALID <= '0';
            end if;
        end if;
    end if;
end process;





end Behavioral;
