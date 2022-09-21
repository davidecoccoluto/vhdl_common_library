`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2022 15:23:19
// Design Name: 
// Module Name: simple_spi_TB
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


module simple_spi_TB();

        logic i_clk, i_sync_rst_n;
        logic[0:0] i_slave_num = 0;
        logic[7:0] i_tx_data;
        logic i_tx_data_valid;
        logic o_tx_ready;
        logic[7:0] o_rx_data;
        logic o_rx_data_valid;
        logic o_mosi;
        logic i_miso;
        logic o_sck;
        logic o_ss;



    simple_spi
//    #(
//        .DATA_N_BIT(8),
//        .CPOL(1'b0),
//        .CPHA(1'b0),
//        .N_SLAVES(1),
//        .CLK_FREQ_Hz(100),
//        .SCK_FREQ_Hz(10)
//    )  
SPI_DUT
    ( 
        .i_clk,
        .i_sync_rst_n,
        .i_slave_num,
        .i_tx_data,
        .i_tx_data_valid,
        .o_tx_ready,
        .o_rx_data,
        .o_rx_data_valid,
        .o_mosi,
        .i_miso,
        .o_sck,
        .o_ss
    );

always begin
    i_clk <= 0;
    #5ns;
    i_clk <= 1;
    #5ns;
end 

initial begin
    i_sync_rst_n <= 0;
    #52ns;
    i_sync_rst_n <= 1;
end

initial begin
    #200ns;
    @(negedge i_clk);
    i_tx_data_valid <= 1;
    i_tx_data <= 33;
    @(negedge i_clk);
    i_tx_data_valid <= 0;
end
endmodule
