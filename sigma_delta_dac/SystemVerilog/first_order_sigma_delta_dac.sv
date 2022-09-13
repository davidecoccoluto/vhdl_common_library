`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2022 19:04:12
// Design Name: 
// Module Name: first_order_sigma_delta_dac
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


module first_order_sigma_delta_dac(
    input logic clk,
    input logic rst_n,
    input logic signed[15:0] din,
    input logic din_valid,
    output logic dac_out
    );
    
logic signed[19:0] din_reg, feedback, sum1_reg;

begin

    always_ff@(posedge clk) begin
        if(!rst_n) begin
            din_reg <= 0;
            sum1_reg <= 0;
        end else begin
            
            if(din_valid) din_reg <= $signed(din);
            
            sum1_reg <= sum1_reg + din_reg - feedback;
        end
    end

    always_comb
        if(sum1_reg >= 0) begin
            feedback <= 2**16;
            dac_out <= 1;
        end else begin
            feedback <= - (2**16);
            dac_out <= 0;
        end
    end
    
endmodule
