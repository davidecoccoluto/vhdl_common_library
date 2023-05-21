----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2023 18:39:22
-- Design Name: 
-- Module Name: axilite_tb - Behavioral
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
use work.axi_lite_pack.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axilite_tb is
--  Port ( );
end axilite_tb;

architecture Behavioral of axilite_tb is
signal clk:std_logic := '0';  
signal rst_n: std_logic;
signal M_AXIL:      AXIL_MASTER_TYPE;
signal S_AXIL:      AXIL_SLAVE_TYPE;
signal reg0:       std_logic_vector(31 downto 0); 
signal reg1:       std_logic_vector(31 downto 0); 
signal reg2:       std_logic_vector(31 downto 0); 
signal reg3:       std_logic_vector(31 downto 0);     

signal start_write: boolean := false;
signal start_addr_write: boolean := false;
signal start_read : boolean := false;
signal start_addr_read : boolean := false;

begin

DUT: entity work.s_axi_lite_regs
    Port map( 
        S_AXI_MCLK      =>clk      ,
        S_AXI_RST_N     =>rst_n     ,
        M_AXIL          =>M_AXIL          ,
        S_AXIL          =>S_AXIL          ,
        reg0            =>reg0            ,
        reg1            =>reg1            ,
        reg2            =>reg2            ,
        reg3            =>reg3            
    );

clk <= not clk after 5 ns;
rst_n <= '0', '1' after 50 ns;

process begin
        wait until start_addr_write=true; 

    M_AXIL.AWADDR <= x"00000000";
    M_AXIL.AWVALID <= '1';

    if S_AXIL.AWREADY = '0' then
        wait until S_AXIL.AWREADY = '1';
    end if;
    wait until rising_edge(clk);
    M_AXIL.AWVALID <= '0';
    report "WRITE ADDR COMPLETED";
end process;

process begin
        wait until start_write=true; 
    M_AXIL.WSTRB <= "0011";
    M_AXIL.WDATA <= x"F0F0F0F0";
    M_AXIL.WVALID <= '1';

    if S_AXIL.WREADY = '0' then
        wait until S_AXIL.WREADY = '1';
    end if;
    wait until rising_edge(clk);
    M_AXIL.WVALID <= '0';
    report "WRITE DATA COMPLETED";
end process;

process begin
    wait until start_addr_read=true; 
    M_AXIL.ARADDR <= x"00000000";
    M_AXIL.ARVALID <= '1';

    if S_AXIL.ARREADY = '0' then
        wait until S_AXIL.WREADY = '1';
    end if;
    wait until rising_edge(clk);
    M_AXIL.ARVALID <= '0';
    report "ADDR READ COMPLETED";
end process;


process begin
    wait until S_AXIL.RVALID = '1';
    wait for 100 ns;

    M_AXIL.RREADY <= '1';
    wait for 10 ns;
    M_AXIL.RREADY <= '0';

    report "READ COMPLETED";
end process;


process begin

    wait for 100 ns;
    start_addr_write <= true;
    wait for 1 ns;
    start_addr_write <= false;

    wait for 100 ns;
    start_write <= true;
    wait for 1 ns;
    start_write <= false;

    wait for 100 ns;
    start_addr_read <= true;
    wait for 1 ns;
    start_addr_read <= false;


    wait;
end process;

end Behavioral;
