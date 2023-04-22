----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.04.2023 17:26:41
-- Design Name: 
-- Module Name: uart_tb - Behavioral
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

entity uart_tb is
--  Port ( );
end uart_tb;

architecture Behavioral of uart_tb is
        signal clk:   std_logic;
        signal rst_n:   std_logic;
        signal data,data_rcv:   std_logic_vector(8 - 1 downto 0);
        signal data_valid:   std_logic;
        signal uart_tx,uart_rx:   std_logic;
        signal ready,parity_error,data_rcv_valid:   std_logic;

        
begin
i_UART_TX: entity work.uart_tx
    generic map(
        DATA_N_BIT    => 8,
        M_CLK_Hz      => 50_000_000,
        BAUD_RATE     => 50_000 
    )
    Port map(
        clk           =>clk        ,
        rst_n         => rst_n     ,
        data          => data      ,
        data_valid    => data_valid,
        uart_tx       => uart_tx   ,
        ready         => ready     
     );

i_UART_RX: entity work.uart_rx
    generic map(
        DATA_N_BIT      => 8, 
        M_CLK_Hz        => 50_000_000,
        BAUD_RATE       => 50_000 
    )
    Port map(
    clk                 => clk,
    rst_n               => rst_n,
    uart_rx             => uart_rx,
    data_rcv            => data_rcv,
    parity_error        => parity_error,
    data_rcv_valid      => data_rcv_valid
   );


   process begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    rst_n <= '0', '1' after 50 ns;

    process 
        variable cnt : integer := 0;
    begin
        wait for 50 ns;
        if not ready then
            wait until ready;
        end if;

        wait for 500 ns;
        wait until falling_edge(clk);
        cnt := cnt +1;
        data <= std_logic_vector(to_signed(cnt,data'length));
        data_valid <= '1';
        wait for 10 ns;
        data_valid <= '0';

    end process;
    
    uart_rx <= uart_tx;
end Behavioral;
