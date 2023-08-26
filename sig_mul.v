module sign_mul(
    input clk,
    input rst,
    input start,
    input signed [7:0] X,
    input signed [7:0] Y,
    output signed [15:0] Z,
    output valid
);

reg signed [15:0] prod, next_prod, temp_prod;
reg prs_state, nxt_state;
reg [1:0] op, nxt_op;
reg [2:0] count, nxt_count;
reg vld,nxt_vld;

parameter IDLE = 1'b0;
parameter START = 1'b1;

always @(posedge clk) begin
    if (!rst) begin
        prod <= 16'd0;
        prs_state <= 1'b0;
        op <= 2'b00;
        count <= 3'b000;
        vld <= 1'b0;
    end
    else begin
        prod <= next_prod;
        prs_state <= nxt_state;
        op <= nxt_op;
        count <= nxt_count;
        vld <= nxt_vld;
    end
end

always @(*) begin
    case (prs_state)
        IDLE: begin
            nxt_count = 3'b000;
            nxt_vld = 1'b0;
            if (start) begin
                nxt_state = START;
                nxt_op = {X[0], 1'b0};
                next_prod = {8'd0, X};
            end
            else begin
                nxt_state = IDLE;
                nxt_op = 2'b00;
                next_prod = 16'd0;
            end
        end
        START: begin
            case (op)
                2'b10: temp_prod = {prod[15:8] - Y, prod[7:0]}; 
                2'b01: temp_prod = {prod[15:8] + Y, prod[7:0]};
                default: temp_prod = {prod[15:8],prod[7:0]};
            endcase
            nxt_op = {X[count+1'b1], X[count]};
            nxt_count = count + 1'b1;
            next_prod = temp_prod >>> 1;
            nxt_state = (&count) ? IDLE : prs_state;
            nxt_vld = (&count) ? 1'b1 : 1'b0;
        end
    endcase
end

assign Z = prod;
assign valid = vld;

endmodule
