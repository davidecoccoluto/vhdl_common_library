----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2022 16:55:53
-- Design Name: 
-- Module Name: sigma_delta_dac - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity sigma_delta_dac is
Port ( 
    clk: in std_logic;
    rst_n: in std_logic;
    din_valid: in std_logic;
    din: in std_logic_vector(15 downto 0);
    dac_out: out std_logic
);
end sigma_delta_dac;

architecture first_order of sigma_delta_dac is

    signal din_reg, feedback, sum1_reg: signed(19 downto 0);
    signal feedback_integer: integer;

begin

    process(clk, rst_n) begin
        if(rst_n = '0') then
            din_reg <= (others => '0');
            sum1_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            if(din_valid = '1') then
                din_reg <= resize(signed(din), din_reg'length);
            end if;
            
            sum1_reg <= sum1_reg + din_reg - feedback;
            
        end if;
    end process;


    feedback_integer <= 2**16 when sum1_reg >= 0 else -2**16;
    feedback <= to_signed(feedback_integer, feedback'length);
    dac_out <= '1' when sum1_reg >= 0 else '0';


end first_order;


architecture second_order of sigma_delta_dac is

    signal din_reg, feedback, sum1, sum1_reg,sum2,sum2_reg: signed(19 downto 0);
    signal feedback_integer: integer;

begin

    process(clk, rst_n) begin
        if(rst_n = '0') then
            din_reg <= (others => '0');
            sum1_reg <= (others => '0');
            sum2_reg <= (others => '0');
        elsif(rising_edge(clk)) then
            if(din_valid = '1') then
                din_reg <= resize(signed(din), din_reg'length);
            end if;
            
            sum1_reg <= sum1;
            sum2_reg <= sum2;
        end if;
    end process;
    
    sum1 <= sum1_reg + din_reg - feedback;
    sum2 <= sum2_reg + sum1    - feedback;
    
    feedback_integer <= 2**16 when sum2_reg >= 0 else -(2**16);
    feedback <= to_signed(feedback_integer, feedback'length);
    
    dac_out <= '1' when sum2_reg >= 0 else '0';
    
end second_order;
