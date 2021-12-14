/*
* Module      : rop3_smart
* Description : Implement this module using the bit-hack technique mentioned in the assignment handout.
*               This module should support all the possible modes of ROP3.
* Notes       : Please remember to
*               (1) make the bit-length of {P, S, D, Result} parameterizable
*               (2) make the input/output to be a register
*/

module rop3_smart
#(
  parameter N = 4
)
(
  input clk,
  input data_in_valid,
  input [N-1:0] P,
  input [N-1:0] S,
  input [N-1:0] D,
  input [7:0] Mode,
  output data_out_valid,
  output [N-1:0] Result
);

reg [N-1:0] P_reg, S_reg, D_reg, Result_reg;
reg [7:0] Mode_reg;
reg data_in_reg, data_out_reg;
wire [N-1:0] combin_result;
wire combin_valid;

assign Result = Result_reg;
assign data_out_valid = data_out_reg;

always@(posedge clk) begin
    P_reg <= P;
    S_reg <= S;
    D_reg <= D;
    Mode_reg <= Mode;
    data_in_reg <= data_in_valid;
    data_out_reg <= combin_valid;
    Result_reg <= combin_result;
end

combinational_block_smart #(.N(N)) ROP (.data_in_valid(data_in_reg), .P(P_reg), .S(S_reg), .D(D_reg), .Mode(Mode_reg), .data_out_valid(combin_valid), .Result(combin_result));

endmodule

module combinational_block_smart #( parameter N=8 )
(
	input [N-1:0] P,S,D,
	input [7:0] Mode,
	input data_in_valid,
	output reg data_out_valid,
	output reg [N-1:0] Result	
);

integer i,j;
reg [7:0] temp1;

always@(*) begin
    data_out_valid = 0;
    temp1 = 1;

    if(data_in_valid) begin
	data_out_valid = 1;
	for(i=0;i<N;i=i+1) begin
	    Result[i] =| ((temp1[7:0]<<{P[i],S[i],D[i]}) & Mode[7:0]);
	end
    end
    else Result = 0;
end
endmodule
