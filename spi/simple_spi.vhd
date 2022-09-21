----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2022 14:30:20
-- Design Name: 
-- Module Name: simple_spi - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_spi is
    generic(
        DATA_N_BIT: integer := 8;
        CPOL: std_logic := '1';
        CPHA: std_logic := '0';
        N_SLAVES: integer := 1;
        CLK_FREQ_Hz: integer := 100;
        SCK_FREQ_Hz: integer := 10
    );
    Port ( 
        i_clk: in std_logic;
        i_sync_rst_n: in std_logic;
        
        
        i_slave_num: in std_logic_vector(0 downto 0); --(clog2(N_SLAVES+1) downto 0);
        i_tx_data: in std_logic_vector(DATA_N_BIT - 1 downto 0);
        i_tx_data_valid: in std_logic;
        o_tx_ready: out std_logic;
        
        o_rx_data: out std_logic_vector(DATA_N_BIT -1 downto 0);
        o_rx_data_valid: out std_logic;
        
        o_mosi: out std_logic;
        i_miso: in std_logic;
        o_sck: out std_logic;
        o_ss: out std_logic_vector(N_SLAVES-1 downto 0)
    );
end simple_spi;

architecture Behavioral of simple_spi is

    constant CLK_PER_BIT: integer := CLK_FREQ_Hz / SCK_FREQ_Hz;
    constant CLK_PER_HALF_BIT: integer := CLK_PER_BIT / 2;


    signal tx_data_reg: std_logic_vector(i_tx_data'range);
    signal rx_data_reg: std_logic_vector(o_rx_data'range);
    
    signal first_edge,second_edge: std_logic;
    
    signal clk_cnt: unsigned(31 downto 0);
    signal bit_cnt: unsigned(2 downto 0);

    type fsm_state_type is (IDLE, CS_LOW, WAIT_AFTER_FIRST_EDGE,  WAIT_AFTER_SECOND_EDGE, CS_HIGH);
    signal state, state_d1: fsm_state_type;

    signal sck: std_logic;
    signal cs: std_logic;
    
    signal shift_trigger,sample_trigger: std_logic;
    
begin

    process(i_clk) begin
        if(rising_edge(i_clk)) then
            if(i_sync_rst_n = '0') then
                clk_cnt <= (others => '0');
                --bit_cnt <= (others => '0');
                state <= IDLE;
                cs <= '1';
            else
                clk_cnt <= clk_cnt + 1; --default increment

                case(state) is
                    when IDLE =>
                        cs <= '1';
                        if(i_tx_data_valid = '1') then
                            tx_data_reg <= i_tx_data;
                            state <= CS_LOW;
                            clk_cnt <= (others => '0');
                        end if;
                        
                        
                    when CS_LOW =>
                        cs <= '0';
                        if(clk_cnt = CLK_PER_HALF_BIT - 1) then
                            state <= WAIT_AFTER_FIRST_EDGE;
                            clk_cnt <= (others => '0');
                        end if;
                                                    
                    when WAIT_AFTER_FIRST_EDGE =>
                        if(clk_cnt = CLK_PER_HALF_BIT - 1) then
                            clk_cnt <= (others => '0');
                            state <= WAIT_AFTER_SECOND_EDGE;
                        end if;
                        
                    when WAIT_AFTER_SECOND_EDGE=>
                        if(clk_cnt = CLK_PER_HALF_BIT - 1) then
                            clk_cnt <= (others => '0');
                            
                            if(bit_cnt = DATA_N_BIT - 1) then
                                state <= CS_HIGH;
                            else
                                state <= WAIT_AFTER_FIRST_EDGE;
                            end if;
                        end if;    
                                        
                    when CS_HIGH =>
                        if(clk_cnt = CLK_PER_HALF_BIT - 1) then
                            clk_cnt <= (others => '0');
                            state <= IDLE;
                        end if;
                    end case;
            end if;
        end if;
    end process;

    process(i_clk) begin
        if(rising_edge(i_clk)) then
            state_d1 <= state;
        end if;
    end process;
    
    first_edge  <= '1' when (state = WAIT_AFTER_FIRST_EDGE  and state_d1 /= WAIT_AFTER_FIRST_EDGE ) else '0';    
    second_edge <= '1' when (state = WAIT_AFTER_SECOND_EDGE and state_d1 /= WAIT_AFTER_SECOND_EDGE) else '0';
    o_rx_data_valid <= '1' when (state = IDLE and state_d1 = CS_HIGH) else '0';

    process(i_clk) begin
        if(rising_edge(i_clk)) then
            if(i_sync_rst_n = '0') then
                sck <= CPOL;
            else
                if(first_edge = '1') then
                    sck <= not CPOL;
                elsif(second_edge = '1') then
                    sck <= CPOL;
                end if;
            end if;
        end if;
    end process;

shift_trigger   <= first_edge  when (CPHA = '1') else second_edge;
sample_trigger  <= second_edge when (CPHA = '1') else first_edge;

    process(i_clk) begin
        if(rising_edge(i_clk)) then
            if(i_sync_rst_n = '0') then
                rx_data_reg <= (others => '0');
                bit_cnt <= (others => '1');
            else
                if(shift_trigger = '1') then
                    bit_cnt <= bit_cnt + 1;
                end if;
                
                if(sample_trigger = '1') then
                    rx_data_reg(to_integer(bit_cnt)) <= i_miso;
                end if;
            end if;
        end if;
    end process;

o_sck <= sck;
o_mosi <= tx_data_reg(to_integer(bit_cnt));


end Behavioral;
