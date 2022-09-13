`timescale 1ns / 1ps


module second_order_sigma_delta_dac(
    input logic clk,
    input logic rst_n,
    input logic[15:0] din,
    input logic din_valid,
    output logic dac_out
    );

logic signed[19:0] din_reg, feedback, sum1, sum1_reg,sum2,sum2_reg;

always_ff@(posedge clk) begin
    if(!rst_n) begin
        din_reg <= 0;
        sum1_reg <= 0;
        sum2_reg <= 0;
    end else begin
        if(din_valid) din_reg <= $signed(din);

        sum1_reg <= sum1;
        sum2_reg <= sum2;        
    end
end
    
    always_comb begin
        sum1 <= sum1_reg + din_reg - feedback;
        sum2 <= sum2_reg + sum1    - feedback;
        
        if(sum2_reg >= 0) begin
            feedback <= $signed(2**16);
            dac_out <= 1;
        end else begin
            feedback <= $signed(-(2**16));
            dac_out <= 0;
        end
    end
    
endmodule
