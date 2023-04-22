library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity uart_rx is
    generic(
        DATA_N_BIT: POSITIVE := 8;
        M_CLK_Hz: POSITIVE   := 100_000_000;
        BAUD_RATE: POSITIVE  := 9600
    );
    Port (
    clk: in std_logic;
    rst_n: in std_logic;

    uart_rx: in std_logic;

    data_rcv: out std_logic_vector(DATA_N_BIT-1 downto 0);
    parity_error: out std_logic;
    data_rcv_valid: out std_logic
   );
end uart_rx;

architecture Behavioral of uart_rx is
    constant clk_cnt_top: positive := M_CLK_Hz/BAUD_RATE-1;

    type uart_fsm_t is (WAIT_FOR_START, WAIT_HALF, READ_DATA, READ_PARITY, STOP_BIT);
    signal uart_fsm: uart_fsm_t;

    signal clk_cnt: natural;
    signal data_cnt: natural;

begin
    process(clk) begin
        if rising_edge(clk) then
            if not rst_n then
                clk_cnt <= 0;
                data_rcv_valid <= '0';
                parity_error <= '0';
                data_cnt <= 0;
                uart_fsm <= WAIT_FOR_START;
                data_rcv <= (others => '0');
            else
                clk_cnt <= clk_cnt + 1;
                case uart_fsm is
                    when WAIT_FOR_START=>
                        if uart_rx = '0' then
                            uart_fsm <= WAIT_HALF;
                            clk_cnt <= 0;
                        end if;
                    when WAIT_HALF =>
                        if clk_cnt = clk_cnt_top/2 then
                            clk_cnt <= 0;
                            uart_fsm <= READ_DATA;
                        end if;
                    when READ_DATA =>
                        if clk_cnt = clk_cnt_top then
                            clk_cnt <= 0;
                            data_cnt <= data_cnt + 1;
                            data_rcv <= uart_rx  &  data_rcv(data_rcv'high downto 1);
                            if data_cnt = DATA_N_BIT-1 then
                                data_cnt <= 0;
                                uart_fsm <= READ_PARITY;
                            end if;
                        end if;
                    when READ_PARITY=>
                            if clk_cnt = clk_cnt_top then
                                clk_cnt <= 0;
                                uart_fsm <= STOP_BIT;
                                if uart_rx = xor(data_rcv) then
                                    data_rcv_valid <= '1';
                                    parity_error <= '0';
                                else
                                    data_rcv_valid <= '0';
                                    parity_error <= '1';
                                end if;
                            end if;
                    when STOP_BIT =>
                        data_rcv_valid <= '0';
                        parity_error <= '0';
                    if clk_cnt = clk_cnt_top then
                        clk_cnt <= 0;
                            uart_fsm <= WAIT_FOR_START;
                        end if;
                
                end case;
            end if;
        end if;
    end process;

end Behavioral;
