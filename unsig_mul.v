module unsigned_mul(clk,reset,A,B,Res);
    input clk, reset;
    input [15:0]A;
    input [15:0]B;
    output [31:0]Res;

    integer i;
    reg [31:0]prod;
    reg [31:0]temp_a;

    always @(posedge clk) begin
        if (!reset) begin
            prod <= 32'd0;
        end
        else begin
            prod = 32'd0;
            temp_a = {16'd0,A}; 
            for (i=0 ; i<32 ; i=i+1 ) begin
                if(B[i]) begin
                  prod = prod + temp_a;
                  temp_a = temp_a<<1;
                end
                else begin
                    temp_a = temp_a<<1;
                end
            end
        end
    end

    assign Res = prod;

endmodule