`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////


module simple_uart_rx #(
   parameter DATA_N_BIT = 8,
    parameter BAUD_RATE  = 10,
    parameter F_CLK_Hz   = 100)
(
    input logic clk,
    input logic sync_rst_n,
    input logic uart_din,
    output logic[DATA_N_BIT-1:0] dout,
    output logic dout_valid,
    output logic crc_error,
    output logic uart_dout);
    
    localparam CLK_PER_BIT = F_CLK_Hz/BAUD_RATE;

    logic crc_reg;
    logic[DATA_N_BIT-1:0] data_reg;
    
    logic[$clog2(CLK_PER_BIT+1):0] clk_cnt;
    logic[4:0] bit_cnt;

    
    enum logic[2:0]{IDLE, START, DATA, CRC, STOP} state;
    
    always_ff@(posedge clk) begin
        if(!sync_rst_n) begin
            clk_cnt <= 0;
            bit_cnt <= 0;
            data_reg <= 0;
            state <= IDLE;
        end else begin
            clk_cnt <= clk_cnt + 1;
            
            case(state)
                IDLE: begin
                    clk_cnt <= 0;
                    bit_cnt <= 0;
                    data_reg <= 0;
                    dout_valid <= 0;
                    if(!uart_din) begin
                        clk_cnt <= 0;
                        state <= START;
                    end
                end
                
                START:begin
                    if(clk_cnt == CLK_PER_BIT / 2 - 1) begin
                        clk_cnt <= 0;
                        state <= DATA;
                    end
                end
                
                DATA:begin
                    if(clk_cnt == CLK_PER_BIT - 1) begin
                        data_reg <= {uart_din, data_reg[DATA_N_BIT-1:1]};
                        clk_cnt <= 0;
                        if(bit_cnt == DATA_N_BIT -1) begin
                            bit_cnt <= 0;
                            state <= CRC;
                        end else 
                            bit_cnt <= bit_cnt + 1;
                    end
                end
                
                CRC: begin
                    if(clk_cnt == CLK_PER_BIT -1) begin
                        state <= STOP;
                        crc_reg <= uart_din;
                        clk_cnt <= 0;
                    end
                end
                
                STOP: begin
                    if(clk_cnt == CLK_PER_BIT -1) begin
                        state <= IDLE;
                        dout_valid <= 1;
                        dout <= data_reg;
                        crc_error <= (crc_reg^(^data_reg));
                    end
                end
            endcase;
        end
    end
    
endmodule
