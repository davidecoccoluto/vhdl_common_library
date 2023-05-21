----------------------------------------------------------------------------------
-- Module Name: uart_tx - Behavioral
-- Engineer: Davide Coccoluto
-- Create Date: 22.04.2023 17:09:23
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    generic(
        DATA_N_BIT: POSITIVE := 8;
        M_CLK_Hz: POSITIVE   := 100_000_000;
        BAUD_RATE: POSITIVE  := 9600
    );
    Port (
        clk: in std_logic;
        rst_n: in std_logic;

        data: in std_logic_vector(DATA_N_BIT - 1 downto 0);
        data_valid: in std_logic;

        uart_tx: out std_logic;

        ready: out std_logic
     );

end uart_tx;

architecture Behavioral of uart_tx is
    constant clk_cnt_top: positive := M_CLK_Hz/BAUD_RATE-1;

    type uart_fsm_t is (WAIT_FOR_START, START, SEND_DATA, PARITY, STOP_BIT);
    signal uart_fsm: uart_fsm_t;

    signal clk_cnt: natural;
    signal data_cnt: natural;

    signal din_buf: std_logic_vector(data'range);

begin
    process(clk) begin
        if rising_edge(clk) then
            if not rst_n then
                clk_cnt <= 0;
                data_cnt <= 0;
                uart_fsm <= WAIT_FOR_START;
            else
                clk_cnt <= clk_cnt + 1;

                case uart_fsm is
                when WAIT_FOR_START =>
                    if data_valid then
                        din_buf <= data;
                        clk_cnt <= 0;
                        uart_fsm <= START;
                    end if;
                when START =>
                    if clk_cnt = clk_cnt_top then
                        clk_cnt <= 0;
                        uart_fsm <= SEND_DATA;
                    end if;
                when SEND_DATA =>
                    if clk_cnt = clk_cnt_top then
                        clk_cnt <= 0;
                        data_cnt <= data_cnt + 1;
                        if data_cnt = DATA_N_BIT-1 then
                            data_cnt <= 0;
                            uart_fsm <= PARITY;
                        end if;
                    end if;
                when PARITY =>
                    if clk_cnt = clk_cnt_top then
                        clk_cnt <= 0;
                        uart_fsm <= STOP_BIT;
                    end if;
                when STOP_BIT =>
                    if clk_cnt = clk_cnt_top then
                        clk_cnt <= 0;
                        uart_fsm <= WAIT_FOR_START;
                    end if;
                end case;
            end if;
        end if;
    end process;

    process(clk) begin
        if rising_edge(clk) then
            
            case uart_fsm is
                when WAIT_FOR_START | STOP_BIT =>
                    uart_tx <= '1';
                when START =>
                    uart_tx <= '0';
                when SEND_DATA =>
                    uart_tx <= din_buf(data_cnt);
                when PARITY =>
                    uart_tx <= xor(din_buf);
            end case;

        end if;
    end process;
    ready <= '1' when uart_fsm = WAIT_FOR_START else '0';
end Behavioral;
