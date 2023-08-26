`timescale 1ns/100ps
`include "unsig_mul.v"

module uns_mul_tb;
reg clk;
reg reset;
reg [15:0]A;
reg [15:0]B;
wire [31:0]Res;

unsigned_mul uut(clk,reset,A,B,Res);
always begin
    clk = ~clk; #5;
end
initial begin
    clk = 1'b0; 
    reset= 1'b0; #10;
    reset= 1'b1; 
end
initial begin
    $dumpfile("unsigned multiplier.vcd");
    $dumpvars(0,uns_mul_tb);
    A = 16'b1101101011010110;
    B = 16'b0010011111001101;
    #20;

    $finish;

end

endmodule