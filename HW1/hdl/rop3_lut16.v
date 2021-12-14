/*
* Module      : rop3_lut16
* Description : Implement this module using the look-up table (LUT) 
*               This module should support all the 15-modes listed in table-1
*               For modes not in the table-1, set the Result to 0
* Notes       : Please remember to
*               (1) make the bit-length of {P, S, D, Result} parameterizable
*               (2) make the input/output to be a register 
*/

module rop3_lut16
#(
  parameter N = 8
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
reg data_out_reg, data_in_reg;

assign data_out_valid = data_out_reg;
assign Result = Result_reg;

combinational_block #(.DATA_WIDTH(N)) ROP (.data_in_valid(data_in_reg), .P(P_reg), .S(S_reg), .D(D_reg), .Mode(Mode_reg), .data_out_valid(combin_valid), .Result(combin_result));

always@(posedge clk) begin
  data_in_reg  <= data_in_valid;
  P_reg        <= P;
  S_reg        <= S;
  D_reg        <= D;
  Mode_reg     <= Mode; 
  Result_reg   <= combin_result;
  data_out_reg <= combin_valid;
end
endmodule


module combinational_block #( parameter DATA_WIDTH=8 )
(
	input [DATA_WIDTH-1:0] P,S,D,
	input [7:0] Mode,
	input data_in_valid,
	output reg data_out_valid,
	output reg [DATA_WIDTH-1:0] Result	
);

localparam BLACKNESS   = 8'h00;
localparam NOTSRCERASE = 8'h11;
localparam NOTSRCCOPY  = 8'h33;
localparam SRCERASE    = 8'h44;
localparam DSTINVERT   = 8'h55;
localparam PATINVERT   = 8'h5A;
localparam SRCINVERT   = 8'h66;
localparam SRCAND      = 8'h88;
localparam MERGEPAINT  = 8'hBB;
localparam MERGECOPY   = 8'hC0;
localparam SRCCOPY     = 8'hCC;
localparam SRCPAINT    = 8'hEE;
localparam PARCOPY     = 8'hF0;
localparam PATPAINT    = 8'hFB;
localparam WHITENESS   = 8'hFF;

always@(*) begin
    if(data_in_valid) begin
	data_out_valid = 1;
	case(Mode)
	  BLACKNESS    : begin Result = 0;      end
	  NOTSRCERASE  : begin Result = ~(D|S); end   
	  NOTSRCCOPY   : begin Result = ~S;     end 
          SRCERASE     : begin Result = S&(~D); end 
          DSTINVERT    : begin Result = ~D;     end 
          PATINVERT    : begin Result = D^P;    end 
          SRCINVERT    : begin Result = D^S;    end 
          SRCAND       : begin Result = D&S;    end 
          MERGEPAINT   : begin Result = D|(~S); end 
          MERGECOPY    : begin Result = P&S;    end 
          SRCCOPY      : begin Result = S;      end 
          SRCPAINT     : begin Result = D|S;    end 
          PARCOPY      : begin Result = P;      end 
          PATPAINT     : begin Result = D|P|~S; end 
          WHITENESS    : begin Result = ~0;  end
	  default      : begin Result = 0;      end
	endcase
    end
    else begin
	Result = 0;
    	data_out_valid = 0;
    end
end
endmodule
