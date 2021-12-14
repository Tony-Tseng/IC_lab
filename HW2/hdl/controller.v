module controller
#(
    parameter IO_BW=32
)
(
    input signed [IO_BW-1:0] x,
    input signed [IO_BW-1:0] y,
    input [2:0] mode,
    input [1:0] phase_mode,
    input valid_in,
    output reg signed [IO_BW-1:0] result,
    output reg valid_out
);

localparam SIN = 3'd0, COS = 3'd1, SIN2 = 3'd2, COS2 = 3'd3, SINCOS = 3'd4;

always@(*) begin
    // set K = 0.6072529351031394 >> 16
    // K = 32'h9B74;
    valid_out = 0;
    result = 0;
    if(valid_in) begin
        case(mode)
            SIN  : begin
		if(phase_mode[1]) result = -y >>>12;
		else result = y>>>12;
	    end
            COS  : begin
		if(phase_mode[1]^phase_mode[0]) result = -x >>>12;
		else result = x >>>12;
	    end
            SIN2 : begin 
		if(phase_mode[1]^phase_mode[0]) result = (32'h10000000 + x)>>>13;
		else result = (32'h10000000 - x)>>>13; 
	    end
            COS2 : begin 
		if(phase_mode[1]^phase_mode[0]) result = (32'h10000000 - x) >>>13;
		else result = (32'h10000000 + x)>>>13; 
	    end
            SINCOS:begin
		if(phase_mode[1]) result = -y>>>13;
		else result = y>>>13;
	    end
	    default: begin result = 0; end
        endcase
        valid_out = 1;
    end
end

endmodule
// SIN
//		case(phase_mode)
//		    2 : begin result_tmp = -y >>12; end
//		    3 : begin result_tmp = -y >>12; end
//		    default : begin result_tmp = y>>12;end
//		endcase
// COS
//		case(phase_mode)
//		    1 : begin result_tmp = -x >>12; end
//		    2 : begin result_tmp = -x >>12; end
//		    default : begin result_tmp = x>>12;end
//		endcase
// SINCOS
//		case(phase_mode)
//		    1 : begin result_tmp = -(x * y)>>40; end
//		    3 : begin result_tmp = -(x * y)>>40; end
//		    default : begin result_tmp = (x * y)>>40;end
//		endcase
