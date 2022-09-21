`timescale 1ns / 1ps

module simple_uart_tx#(
    parameter DATA_N_BIT = 8,
    parameter BAUD_RATE  = 10,
    parameter F_CLK_Hz   = 100)
(
    input logic clk,
    input logic sync_rst_n,
    input logic[DATA_N_BIT-1:0] din,
    input logic din_valid,
    output logic ready,
    output logic uart_dout
    );
    
    localparam CLK_PER_BIT = F_CLK_Hz/BAUD_RATE;

    logic crc_reg;
    logic[DATA_N_BIT-1:0] data_reg;
    
    logic[$clog2(CLK_PER_BIT+1):0] clk_cnt;
    logic[4:0] bit_cnt;
        
    enum logic[2:0]{IDLE, START, DATA, CRC, STOP} state;
    

    always_ff@(posedge clk) begin
        if(!sync_rst_n) begin
            state <= IDLE;
            bit_cnt <= 0;
            crc_reg  <= 0;
            data_reg <= 0;
            clk_cnt <= 0;
        end else begin
            clk_cnt <= clk_cnt +1; //default state
            case (state)
                IDLE: begin
                    bit_cnt <= 0;
                    if(din_valid) begin
                        state <= START;
                        clk_cnt <= 0;
                        crc_reg  <= ^din;
                        data_reg <= din;
                    end
                end
                
                START: begin
                    if(clk_cnt == CLK_PER_BIT - 1) begin
                        state <= DATA;
                        clk_cnt <= 0;
                    end                        
                end
                
                
                DATA: begin
                    if(clk_cnt == CLK_PER_BIT - 1) begin
                        clk_cnt <= 0;
                        if(bit_cnt != DATA_N_BIT -1) bit_cnt++;
                        else                         state <= CRC;
                    end
                end
                
                CRC: begin
                    if(clk_cnt == CLK_PER_BIT - 1) begin
                        clk_cnt <= 0;
                        state <= STOP;
                    end
                end
                
                STOP: begin
                    if(clk_cnt == CLK_PER_BIT - 1) begin
                        clk_cnt <= 0;
                        state <= IDLE;
                    end            
                end
            endcase;
        end
    end
    
    always_ff@(posedge clk) begin
        if(!sync_rst_n)
            uart_dout <= 1;
        else begin
            case(state)
                IDLE:  uart_dout <= 1;
                START: uart_dout <= 0;
                DATA:  uart_dout <= data_reg[bit_cnt];
                CRC:   uart_dout <= crc_reg;
                STOP:  uart_dout <= 1;
            endcase
        end
    end

//the UART TX is ready if it's in IDLE state, otherwise it's not ready
always_ff@(posedge clk) begin
    if(!sync_rst_n)  ready <= 0;
    else             ready <= (state == IDLE);
end
    
endmodule
