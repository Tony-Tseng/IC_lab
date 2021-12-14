/*
* Module      : rop3_lut256
* Description : Implement this module using the look-up table (LUT) 
*               This module should support all the possible modes of ROP3.
* Notes       : Please remember to
*               (1) make the bit-length of {P, S, D, Result} parameterizable
*               (2) make the input/output to be a register
*/

module rop3_lut256
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

wire [N-1:0] combin_result;
wire combin_valid;
reg [N-1:0] P_reg, S_reg, D_reg, Result_reg;
reg [7:0] Mode_reg;
reg data_in_reg, data_out_reg;

assign Result = Result_reg;
assign data_out_valid = data_out_reg;

combinational_block_256 #(.N(N)) ROP (.data_in_valid(data_in_reg), .P(P_reg), .S(S_reg), .D(D_reg), .Mode(Mode_reg), .data_out_valid(combin_valid), .Result(combin_result));

always@(posedge clk)begin
	P_reg <= P;
	S_reg <= S;
	D_reg <= D;
	Mode_reg <= Mode;
	data_in_reg <= data_in_valid;
	Result_reg <= combin_result;
	data_out_reg <= combin_valid;
end

endmodule

module combinational_block_256 #( parameter N=8 )
(
	input [N-1:0] P,S,D,
	input [7:0] Mode,
	input data_in_valid,
	output reg data_out_valid,
	output reg [N-1:0] Result	
);

always@(*) begin
    data_out_valid = 1;
    Result = 0;
    if(data_in_valid) begin
	case(Mode)
	    8'h00 : begin Result = 0; end
	    8'h01 : begin Result = ~(P|S|D); end
	    8'h02 : begin Result = ~(P|S)&D; end
	    8'h03 : begin Result = (~(P|S)&D)|(~(P|S|D)); end
	    8'h04 : begin Result = ~(P|D)&S; end
	    8'h05 : begin Result = (~(P|D)&S)|(~(P|S|D)); end
	    8'h06 : begin Result = (~(P|D)&S)|(~(P|S)&D); end
	    8'h07 : begin Result = (~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h08 : begin Result = ~P&S&D; end
	    8'h09 : begin Result = (~P&S&D)|(~(P|S|D)); end
	    8'h0a : begin Result = (~P&S&D)|(~(P|S)&D); end
	    8'h0b : begin Result = (~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h0c : begin Result = (~P&S&D)|(~(P|D)&S); end
	    8'h0d : begin Result = (~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h0e : begin Result = (~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h0f : begin Result = (~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h10 : begin Result = P&~(S|D); end
	    8'h11 : begin Result = (P&~(S|D))|(~(P|S|D)); end
	    8'h12 : begin Result = (P&~(S|D))|(~(P|S)&D); end
	    8'h13 : begin Result = (P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'h14 : begin Result = (P&~(S|D))|(~(P|D)&S); end
	    8'h15 : begin Result = (P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'h16 : begin Result = (P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'h17 : begin Result = (P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h18 : begin Result = (P&~(S|D))|(~P&S&D); end
	    8'h19 : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'h1a : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'h1b : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h1c : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'h1d : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h1e : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h1f : begin Result = (P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h20 : begin Result = P&~S&D; end
	    8'h21 : begin Result = (P&~S&D)|(~(P|S|D)); end
	    8'h22 : begin Result = (P&~S&D)|(~(P|S)&D); end
	    8'h23 : begin Result = (P&~S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h24 : begin Result = (P&~S&D)|(~(P|D)&S); end
	    8'h25 : begin Result = (P&~S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h26 : begin Result = (P&~S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h27 : begin Result = (P&~S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h28 : begin Result = (P&~S&D)|(~P&S&D); end
	    8'h29 : begin Result = (P&~S&D)|(~P&S&D)|(~(P|S|D)); end
	    8'h2a : begin Result = (P&~S&D)|(~P&S&D)|(~(P|S)&D); end
	    8'h2b : begin Result = (P&~S&D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h2c : begin Result = (P&~S&D)|(~P&S&D)|(~(P|D)&S); end
	    8'h2d : begin Result = (P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h2e : begin Result = (P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h2f : begin Result = (P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h30 : begin Result = (P&~S&D)|(P&~(S|D)); end
	    8'h31 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|S|D)); end
	    8'h32 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|S)&D); end
	    8'h33 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'h34 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|D)&S); end
	    8'h35 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'h36 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'h37 : begin Result = (P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h38 : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D); end
	    8'h39 : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'h3a : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'h3b : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h3c : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'h3d : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h3e : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h3f : begin Result = (P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h40 : begin Result = P&S&~D; end
	    8'h41 : begin Result = (P&S&~D)|(~(P|S|D)); end
	    8'h42 : begin Result = (P&S&~D)|(~(P|S)&D); end
	    8'h43 : begin Result = (P&S&~D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h44 : begin Result = (P&S&~D)|(~(P|D)&S); end
	    8'h45 : begin Result = (P&S&~D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h46 : begin Result = (P&S&~D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h47 : begin Result = (P&S&~D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h48 : begin Result = (P&S&~D)|(~P&S&D); end
	    8'h49 : begin Result = (P&S&~D)|(~P&S&D)|(~(P|S|D)); end
	    8'h4a : begin Result = (P&S&~D)|(~P&S&D)|(~(P|S)&D); end
	    8'h4b : begin Result = (P&S&~D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h4c : begin Result = (P&S&~D)|(~P&S&D)|(~(P|D)&S); end
	    8'h4d : begin Result = (P&S&~D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h4e : begin Result = (P&S&~D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h4f : begin Result = (P&S&~D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h50 : begin Result = (P&S&~D)|(P&~(S|D)); end
	    8'h51 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|S|D)); end
	    8'h52 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|S)&D); end
	    8'h53 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'h54 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|D)&S); end
	    8'h55 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'h56 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'h57 : begin Result = (P&S&~D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h58 : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D); end
	    8'h59 : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'h5a : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'h5b : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h5c : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'h5d : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h5e : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h5f : begin Result = (P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h60 : begin Result = (P&S&~D)|(P&~S&D); end
	    8'h61 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|S|D)); end
	    8'h62 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|S)&D); end
	    8'h63 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h64 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|D)&S); end
	    8'h65 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h66 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h67 : begin Result = (P&S&~D)|(P&~S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h68 : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D); end
	    8'h69 : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|S|D)); end
	    8'h6a : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|S)&D); end
	    8'h6b : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h6c : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S); end
	    8'h6d : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h6e : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h6f : begin Result = (P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h70 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D)); end
	    8'h71 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|S|D)); end
	    8'h72 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|S)&D); end
	    8'h73 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'h74 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S); end
	    8'h75 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'h76 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'h77 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h78 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D); end
	    8'h79 : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'h7a : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'h7b : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h7c : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'h7d : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h7e : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h7f : begin Result = (P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h80 : begin Result = P&S&D; end
	    8'h81 : begin Result = (P&S&D)|(~(P|S|D)); end
	    8'h82 : begin Result = (P&S&D)|(~(P|S)&D); end
	    8'h83 : begin Result = (P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h84 : begin Result = (P&S&D)|(~(P|D)&S); end
	    8'h85 : begin Result = (P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h86 : begin Result = (P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h87 : begin Result = (P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h88 : begin Result = (P&S&D)|(~P&S&D); end
	    8'h89 : begin Result = (P&S&D)|(~P&S&D)|(~(P|S|D)); end
	    8'h8a : begin Result = (P&S&D)|(~P&S&D)|(~(P|S)&D); end
	    8'h8b : begin Result = (P&S&D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h8c : begin Result = (P&S&D)|(~P&S&D)|(~(P|D)&S); end
	    8'h8d : begin Result = (P&S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h8e : begin Result = (P&S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h8f : begin Result = (P&S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h90 : begin Result = (P&S&D)|(P&~(S|D)); end
	    8'h91 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|S|D)); end
	    8'h92 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|S)&D); end
	    8'h93 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'h94 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|D)&S); end
	    8'h95 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'h96 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'h97 : begin Result = (P&S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h98 : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D); end
	    8'h99 : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'h9a : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'h9b : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'h9c : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'h9d : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'h9e : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'h9f : begin Result = (P&S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'ha0 : begin Result = (P&S&D)|(P&~S&D); end
	    8'ha1 : begin Result = (P&S&D)|(P&~S&D)|(~(P|S|D)); end
	    8'ha2 : begin Result = (P&S&D)|(P&~S&D)|(~(P|S)&D); end
	    8'ha3 : begin Result = (P&S&D)|(P&~S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'ha4 : begin Result = (P&S&D)|(P&~S&D)|(~(P|D)&S); end
	    8'ha5 : begin Result = (P&S&D)|(P&~S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'ha6 : begin Result = (P&S&D)|(P&~S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'ha7 : begin Result = (P&S&D)|(P&~S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'ha8 : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D); end
	    8'ha9 : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|S|D)); end
	    8'haa : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|S)&D); end
	    8'hab : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hac : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S); end
	    8'had : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hae : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'haf : begin Result = (P&S&D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hb0 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D)); end
	    8'hb1 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|S|D)); end
	    8'hb2 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|S)&D); end
	    8'hb3 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'hb4 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S); end
	    8'hb5 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'hb6 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'hb7 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hb8 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D); end
	    8'hb9 : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'hba : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'hbb : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hbc : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'hbd : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hbe : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'hbf : begin Result = (P&S&D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hc0 : begin Result = (P&S&D)|(P&S&~D); end
	    8'hc1 : begin Result = (P&S&D)|(P&S&~D)|(~(P|S|D)); end
	    8'hc2 : begin Result = (P&S&D)|(P&S&~D)|(~(P|S)&D); end
	    8'hc3 : begin Result = (P&S&D)|(P&S&~D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hc4 : begin Result = (P&S&D)|(P&S&~D)|(~(P|D)&S); end
	    8'hc5 : begin Result = (P&S&D)|(P&S&~D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hc6 : begin Result = (P&S&D)|(P&S&~D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'hc7 : begin Result = (P&S&D)|(P&S&~D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hc8 : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D); end
	    8'hc9 : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|S|D)); end
	    8'hca : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|S)&D); end
	    8'hcb : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hcc : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|D)&S); end
	    8'hcd : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hce : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'hcf : begin Result = (P&S&D)|(P&S&~D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hd0 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D)); end
	    8'hd1 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|S|D)); end
	    8'hd2 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|S)&D); end
	    8'hd3 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'hd4 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|D)&S); end
	    8'hd5 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'hd6 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'hd7 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hd8 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D); end
	    8'hd9 : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'hda : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'hdb : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hdc : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'hdd : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hde : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'hdf : begin Result = (P&S&D)|(P&S&~D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'he0 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D); end
	    8'he1 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|S|D)); end
	    8'he2 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|S)&D); end
	    8'he3 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'he4 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|D)&S); end
	    8'he5 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'he6 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'he7 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'he8 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D); end
	    8'he9 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|S|D)); end
	    8'hea : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|S)&D); end
	    8'heb : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hec : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S); end
	    8'hed : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hee : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'hef : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hf0 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D)); end
	    8'hf1 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|S|D)); end
	    8'hf2 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|S)&D); end
	    8'hf3 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|S)&D)|(~(P|S|D)); end
	    8'hf4 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S); end
	    8'hf5 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S|D)); end
	    8'hf6 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D); end
	    8'hf7 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hf8 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D); end
	    8'hf9 : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S|D)); end
	    8'hfa : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D); end
	    8'hfb : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|S)&D)|(~(P|S|D)); end
	    8'hfc : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S); end
	    8'hfd : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S|D)); end
	    8'hfe : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D); end
	    8'hff : begin Result = (P&S&D)|(P&S&~D)|(P&~S&D)|(P&~(S|D))|(~P&S&D)|(~(P|D)&S)|(~(P|S)&D)|(~(P|S|D)); end
	    default : begin Result = 0; end
	endcase
    end
    else begin
    data_out_valid = 0;
    end
end
endmodule
