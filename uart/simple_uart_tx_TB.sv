`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2022 11:17:15
// Design Name: 
// Module Name: simple_uart_tx_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simple_uart_TB();

localparam DATA_N_BIT = 6;

    logic tx_clk;
    logic tx_sync_rst_n;
    logic[DATA_N_BIT-1:0] tx_din;
    logic tx_din_valid;
    logic tx_ready;
    logic tx_uart_dout;

    logic rx_clk;
    logic rx_sync_rst_n;
    logic rx_uart_din;
    logic[DATA_N_BIT-1:0] rx_dout;
    logic rx_dout_valid;
    logic rx_crc_error;
    logic rx_uart_dout;
  
simple_uart_tx #(
    .DATA_N_BIT(6),
    .BAUD_RATE (10),
    .F_CLK_Hz (1000))
    
    DUT_TX
    (
    .clk(tx_clk),
    .sync_rst_n(tx_sync_rst_n),
    .din(tx_din),
    .din_valid(tx_din_valid),
    .ready(tx_ready),
    .uart_dout(tx_uart_dout)
    );


simple_uart_rx #(
    .DATA_N_BIT(6),
    .BAUD_RATE(10),
    .F_CLK_Hz(500)) DUT_RX
(
    .clk(rx_clk),
    .sync_rst_n(rx_sync_rst_n),
    .uart_din(rx_uart_din),
    .dout(rx_dout),
    .dout_valid(rx_dout_valid),
    .crc_error(rx_crc_error),
    .uart_dout(rx_uart_dout));
    
    always begin
        tx_clk <= 0;
        #5ns;
        tx_clk <= 1;
        #5ns;
    end
    
    initial begin
        tx_sync_rst_n <= 0;
        rx_sync_rst_n <= 0;
        #45ns;
        tx_sync_rst_n <= 1;
        rx_sync_rst_n <= 1;
    end
    
    initial begin
        tx_din_valid <= 0;
        #200ns;
        @(negedge tx_clk);
        tx_din <= 13;
        tx_din_valid <= 1;
        @(negedge tx_clk);
        tx_din_valid <= 0;
        
        #5ns;
        @(posedge tx_ready);
        #20ns;
        @(negedge tx_clk);
        tx_din <= 0;
        tx_din_valid <= 1;
        @(negedge tx_clk);
        tx_din_valid <= 0;        
    end
    
    
    always begin
        rx_clk <= 0;
        #10ns;
        rx_clk <= 1;
        #10ns;
    end
    
    assign rx_uart_din = tx_uart_dout;
    
endmodule
