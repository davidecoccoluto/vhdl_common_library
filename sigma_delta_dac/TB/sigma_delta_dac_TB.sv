`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2022 19:20:02
// Design Name: 
// Module Name: sigma_delta_dac_TB
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


module sigma_delta_dac_TB();

    logic clk;
    logic rst_n;
    logic[15:0] din;
    logic din_valid;
    logic dac_out_1, dac_out_2;


sigma_delta_dac_second_order DUT2(
    .clk,
    .rst_n,
    .din,
    .din_valid,
    .dac_out(dac_out_2)
    );
    
second_order_sigma_delta_dac DUT1(
    .clk,
    .rst_n,
    .din,
    .din_valid,
    .dac_out(dac_out_1)
    );

always begin
    clk <= 0;
    #5ns;
    clk <= 1;
    #5ns;
end

initial begin
    rst_n <= 0;
    #15us;
    rst_n <= 1;
end


real sig;
int sig_int;
always begin
    #10us;
    @(negedge clk);
    din_valid <= 1;
    sig <= (2**15 * 0.9) * $sin(2*3.14*  20* ($time/1000)  );
    sig_int <= $rtoi(sig);
    din <= sig_int[15:0];
    #10ns;
    din_valid <= 0;
end



int fd1,fd2;

initial begin
fd1 = $fopen("./wave_first_order.txt", "w+");
fd2 = $fopen("./wave_second_order.txt", "w+");
    for(int i = 0; i < 1000000-10; i++) begin
        @(posedge(clk));

        $fdisplay(fd1, "%d,", dac_out_1);
        $fdisplay(fd2, "%d,", dac_out_2);
    end
$fclose(fd1);
$fclose(fd2);
$display("file closed (maybe)");
end


endmodule
