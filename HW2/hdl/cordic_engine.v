module cordic_engine
#(
    parameter IO_BW=32
)
(
    clk,
    rst_n,
    phase,
    mode,
    pop,
    valid_in,
    valid_out,
    result
);


input   clk;
input   rst_n;
input   valid_in;
input   [IO_BW-1:0] phase;
input   [2:0] mode;
output reg [IO_BW-1:0] result;
output reg valid_out;
output reg pop;

reg valid_in_reg;
reg [IO_BW-1:0] phase_reg;
reg [2:0] mode_reg; 
reg [31:0] compute_phase;
reg [1:0] phase_mode; 
wire valid_out_reg;
wire [IO_BW-1:0] result_reg;

localparam PHASE_SHIFT = 21;
localparam ITER_NUM = 15;

always@(posedge clk) begin
    if(!rst_n) begin
        valid_in_reg <= 0;
        phase_reg <= 0;
        mode_reg <= 0;
        valid_out <= 0;
        pop <= 1;
        result <= 0;
    end
    else begin
        valid_in_reg <= valid_in;
        phase_reg <= phase << PHASE_SHIFT;
        mode_reg <= mode;
        valid_out <= valid_out_reg;
        pop <= 0;
        result <= result_reg;
    end
end

reg [31:0] phase_new;
always@(*) begin
    if(mode_reg>1) begin
	if(phase_reg <<< 1 >= 32'h5A000000) begin
		phase_new = (phase_reg <<< 1) - 32'h5A000000;
	end
	else phase_new = phase_reg <<< 1;
    end
    else phase_new = phase_reg;

    if(phase_new <= 32'h16800000) begin
	compute_phase = phase_new;
	phase_mode = 0;
    end
    else if (phase_new <= 32'h2D000000) begin
	compute_phase = 32'h2D000000 - phase_new;
	phase_mode = 1;
    end
    else if (phase_new <= 32'h43800000) begin
	compute_phase = phase_new - 32'h2D000000;
	phase_mode = 2;
    end
    else begin
	compute_phase = 32'h5A000000 - phase_new;
	phase_mode = 3;
    end
end

                                        // shift 21	 // shift 22
wire [31:0] arctan_table [0:ITER_NUM-1];
assign arctan_table[0] = 32'hb400000; // 32'hb400000 32'h16800000
assign arctan_table[1] = 32'h6a429cc; // 32'h6a429cc 32'h0d485398
assign arctan_table[2] = 32'h38251d0; // 32'h38251d0 32'h0704a3a0
assign arctan_table[3] = 32'h1c80044; // 32'h1c80044 32'h03900089
assign arctan_table[4] = 32'h0e4e2a9; // 32'h0e4e2a9 32'h01c9c553
assign arctan_table[5] = 32'h0728de5; // 32'h0728de5 32'h00e51bca
assign arctan_table[6] = 32'h0394a86; // 32'h0394a86 32'h0072950d
assign arctan_table[7] = 32'h01ca5b5; // 32'h01ca5b5 32'h00394b6b
assign arctan_table[8] = 32'h00e52e9; // 32'h00e52e9 32'h001ca5d2
assign arctan_table[9] = 32'h0072976; // 32'h0072976 32'h000e52ec
assign arctan_table[10]= 32'h00394bb; // 32'h00394bb 32'h00072976
assign arctan_table[11]= 32'h001ca5d; // 32'h001ca5d 32'h000394bb
assign arctan_table[12]= 32'h000e52e; // 32'h000e52e 32'h0001ca5d
assign arctan_table[13]= 32'h0007297; // 32'h0007297 32'h0000e52e
assign arctan_table[14]= 32'h000394b; // 32'h000394b 32'h00007297
//assign arctan_table[15]= 32'h0001ca5; // 32'h0001ca5 32'h0000394b
//assign arctan_table[16]= 32'h0000e52; // 32'h0000e52 32'h00001ca5
//assign arctan_table[17]= 32'h0000729; // 32'h0000729 32'h00000e52

integer i,j,k;
reg signed [IO_BW-1:0] x_in [0:ITER_NUM];
reg signed [IO_BW-1:0] y_in [0:ITER_NUM];
reg signed [IO_BW-1:0] z_in [0:ITER_NUM];
reg [1:0] phase_mode_in [0:ITER_NUM];
reg [2:0] mode_in [0:ITER_NUM];
reg valid_cp [0:ITER_NUM];

always@(posedge clk) begin
	if(~rst_n) begin
		for(i=0;i<ITER_NUM;i=i+1) begin
			x_in[i]<=0;
			y_in[i]<=0;
			z_in[i]<=0;
			phase_mode_in[i]<=0;
			mode_in[i]<=0;
			valid_cp[i]<=0;
		end
	end
	else begin
		x_in[0] <= 32'h09B74000;
		y_in[0] <= 32'h00000000;
		z_in[0] <= compute_phase;
		phase_mode_in[0] <= phase_mode;
		mode_in[0] <= mode_reg;
		valid_cp[0] <= valid_in_reg;
		for(k=0;k<ITER_NUM;k=k+1) begin
			if( z_in[k] >= 0) begin
		    		x_in[k+1] <= x_in[k] - (y_in[k]>>>k);
		    		y_in[k+1] <= y_in[k] + (x_in[k]>>>k);
		    		z_in[k+1] <= z_in[k] - arctan_table[k];
			end
			else begin
		    		x_in[k+1] <= x_in[k] + (y_in[k]>>>k);
		    		y_in[k+1] <= y_in[k] - (x_in[k]>>>k);
		    		z_in[k+1] <= z_in[k] + arctan_table[k];
			end
			phase_mode_in[k+1]<=phase_mode_in[k];
			mode_in[k+1]<=mode_in[k];
			valid_cp[k+1]<=valid_cp[k];
		end
	end
end

controller controller (
    .x(x_in[ITER_NUM]), 
    .y(y_in[ITER_NUM]), 
    .mode(mode_in[ITER_NUM]), 
    .phase_mode(phase_mode_in[ITER_NUM]),
    .valid_in(valid_cp[ITER_NUM]), 
    .result(result_reg), 
    .valid_out(valid_out_reg)
);
endmodule
