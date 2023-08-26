`timescale 1ns/100ps
`include "sig_mul.v"

module mul_tb;
reg clk,rst,start;
reg signed [7:0]X,Y;
wire signed [15:0]Z;
wire valid;

sign_mul uut(clk,rst,start,X,Y,Z,valid);
always begin
  clk = ~ clk; #5;
end
initial begin
    clk = 1'b0;
    rst = 1'b0; #10;
    rst = 1'b1;
    start = 1'b1;
end
initial begin
    $dumpfile("Signed Multiplier.vcd");
    $dumpvars(0,mul_tb);

    X = 8'h5a;
    Y = 8'h0c;
    #120;
    rst = 1'b0; #10;
    rst = 1'b1;
    X = 8'h3c;
    Y = 8'h0f;
    #120;
    rst = 1'b0; #10;
    rst = 1'b1;
    X = -8'h05;
    Y = 8'h07;
    #120;
    $finish;
end

endmodule