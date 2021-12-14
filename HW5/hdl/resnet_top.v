module resnet_top #(
parameter ACT_PER_ADDR = 4,
parameter BW_PER_ACT = 8,

parameter WEIGHT_PER_ADDR = 9, 
parameter BIAS_PER_ADDR = 1,
parameter BW_PER_PARAM = 4
)
(
    input                  clk,          // clock input
    input                  srstn,        // synchronous reset (active low)
  
    input                  start_pulse,  // start to input a new bmp image
    output reg             busy,         // halt the input pixels
    input                  input_valid,
    input [BW_PER_ACT-1:0] input_data,   // input image pixels (28x28 pixels)
    output reg             finish_pulse, // output valid to check the final answer

    //write enable for SRAM A,B,C (active low)
    output reg sram_wen_a0,
    output reg sram_wen_a1,
    output reg sram_wen_a2,
    output reg sram_wen_a3,
    output reg sram_wen_b0,
    output reg sram_wen_b1,
    output reg sram_wen_b2,
    output reg sram_wen_b3,
    output reg sram_wen_c0,
    output reg sram_wen_c1,
    output reg sram_wen_c2,
    output reg sram_wen_c3,
    // read/write address from SRAM A,B,C (read=1, write=0)
    output reg [7:0] sram_addr_a0,
    output reg [7:0] sram_addr_a1,
    output reg [7:0] sram_addr_a2,
    output reg [7:0] sram_addr_a3,
    output reg [7:0] sram_addr_b0,
    output reg [7:0] sram_addr_b1,
    output reg [7:0] sram_addr_b2,
    output reg [7:0] sram_addr_b3,
    output reg [7:0] sram_addr_c0,
    output reg [7:0] sram_addr_c1,
    output reg [7:0] sram_addr_c2,
    output reg [7:0] sram_addr_c3,
    // read data from SRAM A,B,C
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a0,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a1,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a2,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a3,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b0,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b1,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b2,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b3,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c0,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c1,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c2,
    input [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c3,
    // write data to SRAM A,B,C
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a0,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a1,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a2,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a3,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b0,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b1,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b2,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b3,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c0,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c1,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c2,
    output reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c3,
    // write bytemask to SRAM A,B,C (active low)
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_a0,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_a1,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_a2,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_a3,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_b0,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_b1,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_b2,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_b3,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_c0,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_c1,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_c2,
    output reg [ACT_PER_ADDR-1:0] sram_bytemask_n_c3,

    output reg [6:0]                         sram_raddr_weight, //read address from SRAM weight  
    input [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_weight, //read data from SRAM weight
    output reg [4:0]                         sram_raddr_bias,   //read address from SRAM bias 
    input [BIAS_PER_ADDR*BW_PER_PARAM-1:0]   sram_rdata_bias    //read data from SRAM bias

);
// ******************** PART1 IO  ********************
reg start_pulse_reg, busy_reg, finish_pulse_reg;//, input_valid_reg;
reg [BW_PER_ACT-1:0] input_data_reg;
reg [4:0] nstate, state;
reg [6:0] busy_cnt, busy_tmp;
reg sram_wen_a0_reg, sram_wen_a1_reg, sram_wen_a2_reg, sram_wen_a3_reg;
reg [7:0] sram_addr_a0_reg, sram_addr_a1_reg, sram_addr_a2_reg, sram_addr_a3_reg;
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a0_reg,sram_wdata_a1_reg,sram_wdata_a2_reg,sram_wdata_a3_reg;
reg [ACT_PER_ADDR-1:0] sram_bytemask_n_a0_reg, sram_bytemask_n_a1_reg, sram_bytemask_n_a2_reg, sram_bytemask_n_a3_reg;

reg [10:0] read_input_cnt, read_input_tmp;
reg [9:0] ind;
reg [3:0] sram_row_sel; 
reg [5:0] sram_col_sel;

localparam IDLE=5'd0, READ_INPUT=5'd1, DONE=5'd2;

// ******************** PART2 IO ********************
reg sram_wen_b0_reg, sram_wen_b1_reg, sram_wen_b2_reg, sram_wen_b3_reg;
reg [7:0] sram_addr_b0_reg, sram_addr_b1_reg, sram_addr_b2_reg, sram_addr_b3_reg;
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b0_reg,sram_wdata_b1_reg,sram_wdata_b2_reg,sram_wdata_b3_reg;
reg [ACT_PER_ADDR-1:0] sram_bytemask_n_b0_reg, sram_bytemask_n_b1_reg, sram_bytemask_n_b2_reg, sram_bytemask_n_b3_reg;
reg [6:0] sram_raddr_weight_reg;
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_weight_reg;
reg [4:0] sram_raddr_bias_reg;
reg signed [BIAS_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_bias_reg;
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a0_reg, sram_rdata_a1_reg, sram_rdata_a2_reg, sram_rdata_a3_reg;

reg [4:0] channel_cnt, channel_tmp; 
reg [1:0] conv_cnt, conv_tmp;

reg signed [14:0] conv_a0_tmp, conv_a1_tmp, conv_a2_tmp, conv_a3_tmp;
reg signed [14:0] conv_a0_reg, conv_a1_reg, conv_a2_reg, conv_a3_reg;
reg signed [7:0] store_conv1_b0, store_conv1_b1, store_conv1_b2, store_conv1_b3;
reg signed [8:0] store_conv1_b0_tmp, store_conv1_b1_tmp, store_conv1_b2_tmp, store_conv1_b3_tmp;
reg signed [3:0] weight [0:8];
reg signed [12:0] bias;
reg [6:0] data_a0 [0:3];
reg [6:0] data_a1 [0:3];
reg [6:0] data_a2 [0:3];
reg [6:0] data_a3 [0:3];


reg [10:0] nread_cnt;

localparam READ_A_SRAM=5'd3, CONV1=5'd5, STORE_CONV1=5'd7, CONV1_PADDING=5'd6;

// ******************** PART3 IO ********************

reg sram_wen_c0_reg, sram_wen_c1_reg, sram_wen_c2_reg, sram_wen_c3_reg;
reg [7:0] sram_addr_c0_reg, sram_addr_c1_reg, sram_addr_c2_reg, sram_addr_c3_reg;
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c0_reg,sram_wdata_c1_reg,sram_wdata_c2_reg,sram_wdata_c3_reg;
reg [ACT_PER_ADDR-1:0] sram_bytemask_n_c0_reg, sram_bytemask_n_c1_reg, sram_bytemask_n_c2_reg, sram_bytemask_n_c3_reg;
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b0_reg, sram_rdata_b1_reg, sram_rdata_b2_reg, sram_rdata_b3_reg;
//reg [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c0_reg, sram_rdata_c1_reg, sram_rdata_c2_reg, sram_rdata_c3_reg;

reg signed [7:0] store_conv2_c0, store_conv2_c1, store_conv2_c2, store_conv2_c3;
reg signed [10:0] store_conv2_c0_tmp, store_conv2_c1_tmp, store_conv2_c2_tmp, store_conv2_c3_tmp;
reg [7:0] c0_tmp, c1_tmp, c2_tmp, c3_tmp;
reg [8:0] store_residue_c0_tmp,store_residue_c1_tmp,store_residue_c2_tmp,store_residue_c3_tmp;
reg [7:0] store_residue_c0, store_residue_c1, store_residue_c2, store_residue_c3;
reg [7:0] residue_0, residue_1, residue_2, residue_3;
reg [10:0] control;
reg flag, flag_tmp;

localparam READ_B_SRAM=5'd8, CONV2=5'd10, STORE_CONV2=5'd11, STORE_RESIDUAL=5'd12;

//  ******************** FINITE STATE MACHINE START ********************
always@* begin
    case(state)
	IDLE: begin nstate = start_pulse_reg? READ_INPUT:IDLE; end // 0
	READ_INPUT: begin nstate = read_input_cnt==956? READ_A_SRAM:READ_INPUT; end // 1
	READ_A_SRAM: begin // 3
	    if(read_input_cnt == 1018) nstate = CONV1_PADDING;
	    else if(channel_cnt==3) nstate = CONV1;
	    else nstate = READ_A_SRAM;
	end
	CONV1: begin nstate = conv_cnt == 1? STORE_CONV1:CONV1; end // 5
	STORE_CONV1: begin nstate = READ_A_SRAM; end // 6
	//READ_A_SRAM: begin nstate = channel_cnt==2? CONV1:READ_A_SRAM;end // 3
	//CONV1: begin 
	//    if(read_input_cnt == 1024) nstate = CONV1_PADDING;
	//    else nstate = conv_cnt == 2? STORE_CONV1:CONV1; 
	//end // 5
	//STORE_CONV1: begin nstate = CONV1; end // 6
	CONV1_PADDING: begin nstate = READ_B_SRAM; end // 7

	READ_B_SRAM: begin // 8
	    if(read_input_cnt == 256) nstate = DONE;
	    else if(channel_cnt==15) nstate = CONV2;
	    else nstate = READ_B_SRAM;
	end
	CONV2: begin nstate = conv_cnt == 1? STORE_CONV2:CONV2; end // 10
	STORE_CONV2: begin nstate = STORE_RESIDUAL; end // 11
	STORE_RESIDUAL: begin nstate = READ_B_SRAM; end // 12

	DONE: begin nstate = IDLE; end // 2
	default: begin nstate = IDLE; end
    endcase
end

always@* begin
    case(state)
	// 0
	IDLE: begin
	    finish_pulse_reg = 0;
	    read_input_tmp = 0;
	    channel_tmp = 0;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = 0;
	    sram_raddr_bias_reg = 0;
	end
	// 1
	READ_INPUT: begin
	    finish_pulse_reg = 0;
	    if(read_input_cnt==956) read_input_tmp = 0;
	    else if(read_input_cnt[4:0]==30&&read_input_cnt>258) read_input_tmp = read_input_cnt+5;
	    else read_input_tmp = read_input_cnt+1;
	    channel_tmp = 0;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = 0;
	    sram_raddr_bias_reg = 0;
	end
	// 3
	READ_A_SRAM: begin
	    finish_pulse_reg = 0;
	    if(read_input_cnt[9:8]==1 && read_input_cnt[3:0]==11) read_input_tmp = read_input_cnt+5;
	    else if(read_input_cnt[9:8]==3 && read_input_cnt[3:0]==10) read_input_tmp = read_input_cnt+6;
	    else if(read_input_cnt[9]==1 && read_input_cnt[1:0]==2) read_input_tmp = read_input_cnt+2;
	    else read_input_tmp = read_input_cnt+1;
//	    read_input_tmp = read_input_cnt;
	    if(channel_cnt==3) channel_tmp = 0;
	    else channel_tmp = channel_cnt + 1;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = {nread_cnt[7:4],channel_cnt[1:0]};
	    sram_raddr_bias_reg = {read_input_cnt[7:4]};
	end
	// 5
	CONV1: begin
	    finish_pulse_reg = 0;
	    read_input_tmp = read_input_cnt;
	    channel_tmp = channel_cnt + 1;
	    conv_tmp = conv_cnt+1;
	    sram_raddr_weight_reg = {nread_cnt[7:4],channel_cnt[1:0]};
	    sram_raddr_bias_reg = {read_input_cnt[7:4]};
	end
	// 6
	STORE_CONV1: begin
	    finish_pulse_reg = 0;
//	    if(read_input_cnt[9:8]==1 && read_input_cnt[3:0]==11) read_input_tmp = read_input_cnt+5;
//	    else if(read_input_cnt[9:8]==3 && read_input_cnt[3:0]==10) read_input_tmp = read_input_cnt+6;
//	    else if(read_input_cnt[9]==1 && read_input_cnt[1:0]==2) read_input_tmp = read_input_cnt+2;
//	    else read_input_tmp = read_input_cnt+1;
	    read_input_tmp = read_input_cnt;
	    channel_tmp = channel_cnt+1;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = {nread_cnt[7:4],channel_cnt[1:0]};
	    sram_raddr_bias_reg = {read_input_cnt[7:4]};
	end
	// 7
	CONV1_PADDING: begin
	    finish_pulse_reg = 0;
	    read_input_tmp = 0;
	    channel_tmp = 0;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = 0;
	    sram_raddr_bias_reg = 0;
	end
	// 8
	READ_B_SRAM: begin
	    finish_pulse_reg = 0;
	    if(channel_cnt==4&&flag==1) begin
		if(read_input_cnt[7:6]==1 && read_input_cnt[3:0]==11) read_input_tmp = read_input_cnt+5;
		else if(read_input_cnt[7:6]==3 && read_input_cnt[3:0]==10) read_input_tmp = read_input_cnt+6;
		else if(read_input_cnt[7]==1 && read_input_cnt[1:0]==2) read_input_tmp = read_input_cnt+2;
		else read_input_tmp = read_input_cnt+1;
	    end
	    else read_input_tmp = read_input_cnt;
	    if(channel_cnt==15) channel_tmp = 0;
	    else channel_tmp = channel_cnt + 1;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = {1'b1,read_input_tmp[5:4],channel_cnt[3:0]};
	    sram_raddr_bias_reg = {3'b100,read_input_cnt[5:4]};
	end
	// 10
	CONV2: begin
	    finish_pulse_reg = 0;
	    read_input_tmp = read_input_cnt;
	    channel_tmp = channel_cnt + 1;
	    conv_tmp = conv_cnt+1;
	    sram_raddr_weight_reg = {1'b1,nread_cnt[5:4],channel_cnt[3:0]};
	    sram_raddr_bias_reg = {3'b100,read_input_cnt[5:4]};
	end
	// 11
	STORE_CONV2: begin
	    finish_pulse_reg = 0;
	    read_input_tmp = read_input_cnt;
	    channel_tmp = channel_cnt+1;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = {1'b1,nread_cnt[5:4],channel_cnt[3:0]};
	    sram_raddr_bias_reg = {3'b100,read_input_cnt[5:4]};
	end
	// 12
	STORE_RESIDUAL: begin
	    finish_pulse_reg = 0;
//	    if(read_input_cnt[7:6]==1 && read_input_cnt[3:0]==11) read_input_tmp = read_input_cnt+5;
//	    else if(read_input_cnt[7:6]==3 && read_input_cnt[3:0]==10) read_input_tmp = read_input_cnt+6;
//	    else if(read_input_cnt[7]==1 && read_input_cnt[1:0]==2) read_input_tmp = read_input_cnt+2;
//	    else read_input_tmp = read_input_cnt+1;
	    read_input_tmp = read_input_cnt;
	    channel_tmp = channel_cnt+1;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = {1'b1,nread_cnt[5:4],channel_cnt[3:0]};
	    sram_raddr_bias_reg = {3'b100,read_input_cnt[5:4]};
	end
	// 2
	DONE: begin
	    finish_pulse_reg = 1;
	    read_input_tmp = 0;
	    channel_tmp = 0;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = 0;
	    sram_raddr_bias_reg = 0;
	end
	default: begin
	    finish_pulse_reg = 0;
	    read_input_tmp = 0;
	    channel_tmp = 0;
	    conv_tmp = 0;
	    sram_raddr_weight_reg = 0;
	    sram_raddr_bias_reg = 0;
	end
    endcase
end
//  ******************** FINITE STATE MACHINE END ********************

always@* begin
    if(state==IDLE) flag_tmp=0;
    else if(state==STORE_CONV2) flag_tmp=1;
    else flag_tmp = flag;
end

always@(posedge clk) begin
    flag<=flag_tmp;
end

//******************************** PART3 START ********************************
always@* begin
    if(!state[3]&state[0]) begin
        if(read_input_cnt[9:8]==1 && read_input_cnt[3:0]==11) nread_cnt = read_input_cnt+5;
        else if(read_input_cnt[9:8]==3 && read_input_cnt[3:0]==10) nread_cnt = read_input_cnt+6;
        else if(read_input_cnt[9:8]==2 && read_input_cnt[1:0]==2) nread_cnt = read_input_cnt+2;
        else nread_cnt = read_input_cnt+1;
    end
    else begin
	if(read_input_cnt[7:6]==1 && read_input_cnt[3:0]==11) nread_cnt = read_input_cnt+5;
	else if(read_input_cnt[7:6]==3 && read_input_cnt[3:0]==10) nread_cnt = read_input_cnt+6;
	else if(read_input_cnt[7]==1 && read_input_cnt[1:0]==2) nread_cnt = read_input_cnt+2;
	else nread_cnt = read_input_cnt+1;
    end
end

always@* begin
    if((state==READ_B_SRAM&&channel_cnt>4)||state==CONV2) control = read_input_cnt;
    else control = nread_cnt;
end

always@* begin
    if(state[3]) begin
        case(control[7:6])
            0: begin
                data_a0[0] = sram_rdata_b0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_b0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_b0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_b0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_b1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_b1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_b1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_b1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_b2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_b2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_b2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_b2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_b3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_b3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_b3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_b3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
            1: begin
                data_a0[0] = sram_rdata_b2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_b2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_b2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_b2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_b3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_b3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_b3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_b3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_b0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_b0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_b0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_b0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_b1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_b1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_b1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_b1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
            2: begin
                data_a0[0] = sram_rdata_b1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_b1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_b1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_b1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_b0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_b0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_b0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_b0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_b3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_b3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_b3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_b3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_b2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_b2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_b2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_b2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
            3: begin
                data_a0[0] = sram_rdata_b3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_b3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_b3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_b3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_b2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_b2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_b2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_b2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_b1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_b1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_b1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_b1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_b0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_b0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_b0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_b0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
        endcase
    end
    else if(state[0]) begin // add store_conv1
        case(control[9:8])
            0: begin
                data_a0[0] = sram_rdata_a0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_a0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_a0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_a0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_a1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_a1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_a1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_a1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_a2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_a2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_a2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_a2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_a3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_a3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_a3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_a3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
            1: begin
                data_a0[0] = sram_rdata_a2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_a2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_a2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_a2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_a3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_a3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_a3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_a3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_a0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_a0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_a0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_a0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_a1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_a1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_a1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_a1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
            2: begin
                data_a0[0] = sram_rdata_a1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_a1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_a1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_a1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_a0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_a0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_a0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_a0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_a3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_a3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_a3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_a3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_a2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_a2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_a2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_a2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
            3: begin
                data_a0[0] = sram_rdata_a3_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a0[1] = sram_rdata_a3_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a0[2] = sram_rdata_a3_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a0[3] = sram_rdata_a3_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a1[0] = sram_rdata_a2_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a1[1] = sram_rdata_a2_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a1[2] = sram_rdata_a2_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a1[3] = sram_rdata_a2_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a2[0] = sram_rdata_a1_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a2[1] = sram_rdata_a1_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a2[2] = sram_rdata_a1_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a2[3] = sram_rdata_a1_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
                data_a3[0] = sram_rdata_a0_reg[1*BW_PER_ACT-2:0*BW_PER_ACT];
                data_a3[1] = sram_rdata_a0_reg[2*BW_PER_ACT-2:1*BW_PER_ACT];
                data_a3[2] = sram_rdata_a0_reg[3*BW_PER_ACT-2:2*BW_PER_ACT];
                data_a3[3] = sram_rdata_a0_reg[4*BW_PER_ACT-2:3*BW_PER_ACT];
            end
        endcase
    end
    else begin
	data_a0[0] = 0;
	data_a0[1] = 0;
	data_a0[2] = 0;
	data_a0[3] = 0;
	data_a1[0] = 0;
	data_a1[1] = 0;
	data_a1[2] = 0;
	data_a1[3] = 0;
	data_a2[0] = 0;
	data_a2[1] = 0;
	data_a2[2] = 0;
	data_a2[3] = 0;
	data_a3[0] = 0;
	data_a3[1] = 0;
	data_a3[2] = 0;
	data_a3[3] = 0;    
    end
end

always@ * begin
    store_conv2_c0_tmp = (conv_a0_reg[14:3]+(bias)+3'b100);
    store_conv2_c1_tmp = (conv_a1_reg[14:3]+(bias)+3'b100);
    store_conv2_c2_tmp = (conv_a2_reg[14:3]+(bias)+3'b100);
    store_conv2_c3_tmp = (conv_a3_reg[14:3]+(bias)+3'b100);
    store_conv2_c0 = store_conv2_c0_tmp[10:3];
    store_conv2_c1 = store_conv2_c1_tmp[10:3];
    store_conv2_c2 = store_conv2_c2_tmp[10:3];
    store_conv2_c3 = store_conv2_c3_tmp[10:3];
end

always@* begin
    if(state==STORE_RESIDUAL) begin
	if(store_conv2_c0[7]) c0_tmp=0; 
	else if(store_conv2_c0>=127) c0_tmp=127; 
	else c0_tmp = store_conv2_c0;

	if(store_conv2_c1[7]) c1_tmp=0; 
	else if(store_conv2_c1>=127) c1_tmp=127; 
	else c1_tmp = store_conv2_c1;

	if(store_conv2_c2[7]) c2_tmp=0; 
	else if(store_conv2_c2>=127) c2_tmp=127; 
	else c2_tmp = store_conv2_c2;

	if(store_conv2_c3[7]) c3_tmp=0; 
	else if(store_conv2_c3>=127) c3_tmp=127; 
	else c3_tmp = store_conv2_c3;
    end
    else begin
	c0_tmp = c0_tmp;
	c1_tmp = c1_tmp;
	c2_tmp = c2_tmp;
	c3_tmp = c3_tmp;
    end
end

always@* begin
    case(read_input_cnt[7:6])
    	0: begin
	    residue_0 = sram_rdata_a0_reg[1*BW_PER_ACT-1:0*BW_PER_ACT];
	    residue_1 = sram_rdata_a1_reg[2*BW_PER_ACT-1:1*BW_PER_ACT];
	    residue_2 = sram_rdata_a2_reg[3*BW_PER_ACT-1:2*BW_PER_ACT];
	    residue_3 = sram_rdata_a3_reg[4*BW_PER_ACT-1:3*BW_PER_ACT];
	end
    	1: begin
	    residue_0 = sram_rdata_a2_reg[1*BW_PER_ACT-1:0*BW_PER_ACT];
	    residue_1 = sram_rdata_a3_reg[2*BW_PER_ACT-1:1*BW_PER_ACT];
	    residue_2 = sram_rdata_a0_reg[3*BW_PER_ACT-1:2*BW_PER_ACT];
	    residue_3 = sram_rdata_a1_reg[4*BW_PER_ACT-1:3*BW_PER_ACT];
	end
    	2: begin
	    residue_0 = sram_rdata_a1_reg[1*BW_PER_ACT-1:0*BW_PER_ACT];
	    residue_1 = sram_rdata_a0_reg[2*BW_PER_ACT-1:1*BW_PER_ACT];
	    residue_2 = sram_rdata_a3_reg[3*BW_PER_ACT-1:2*BW_PER_ACT];
	    residue_3 = sram_rdata_a2_reg[4*BW_PER_ACT-1:3*BW_PER_ACT];
	end
    	3: begin
	    residue_0 = sram_rdata_a3_reg[1*BW_PER_ACT-1:0*BW_PER_ACT];
	    residue_1 = sram_rdata_a2_reg[2*BW_PER_ACT-1:1*BW_PER_ACT];
	    residue_2 = sram_rdata_a1_reg[3*BW_PER_ACT-1:2*BW_PER_ACT];
	    residue_3 = sram_rdata_a0_reg[4*BW_PER_ACT-1:3*BW_PER_ACT];
	end
    endcase
end

always@* begin
    store_residue_c0_tmp = {c0_tmp,1'b0}+residue_0[7:4]+1'b1; // 
    store_residue_c1_tmp = {c1_tmp,1'b0}+residue_1[7:4]+1'b1; // 
    store_residue_c2_tmp = {c2_tmp,1'b0}+residue_2[7:4]+1'b1; // 
    store_residue_c3_tmp = {c3_tmp,1'b0}+residue_3[7:4]+1'b1; // 
    store_residue_c0 = store_residue_c0_tmp[8:1];
    store_residue_c1 = store_residue_c1_tmp[8:1];
    store_residue_c2 = store_residue_c2_tmp[8:1];
    store_residue_c3 = store_residue_c3_tmp[8:1];
end

always@* begin
//    if(state==STORE_RESIDUAL) begin
    if(state==READ_B_SRAM && flag==1 && channel_cnt==4) begin
	sram_wdata_c0_reg = {store_residue_c0,store_residue_c1,store_residue_c2,store_residue_c3};
	sram_wdata_c1_reg = {store_residue_c0,store_residue_c1,store_residue_c2,store_residue_c3};
	sram_wdata_c2_reg = {store_residue_c0,store_residue_c1,store_residue_c2,store_residue_c3};
	sram_wdata_c3_reg = {store_residue_c0,store_residue_c1,store_residue_c2,store_residue_c3};
    end
    else begin
	sram_wdata_c0_reg = 0;
	sram_wdata_c1_reg = 0;
	sram_wdata_c2_reg = 0;
	sram_wdata_c3_reg = 0;
    end
end

always@* begin
    sram_wen_c0_reg = 1;
    sram_wen_c1_reg = 1;
    sram_wen_c2_reg = 1;
    sram_wen_c3_reg = 1;
    sram_addr_c0_reg = read_input_cnt[5:0];
    sram_addr_c1_reg = read_input_cnt[5:0];
    sram_addr_c2_reg = read_input_cnt[5:0];
    sram_addr_c3_reg = read_input_cnt[5:0];
    sram_bytemask_n_c0_reg = 4'b1111;
    sram_bytemask_n_c1_reg = 4'b1111;
    sram_bytemask_n_c2_reg = 4'b1111;
    sram_bytemask_n_c3_reg = 4'b1111;

//    if(state==STORE_RESIDUAL) begin
    if(state==READ_B_SRAM&&channel_cnt==4) begin
    	sram_bytemask_n_c0_reg = 4'b0000;
    	sram_bytemask_n_c1_reg = 4'b0000;
    	sram_bytemask_n_c2_reg = 4'b0000;
    	sram_bytemask_n_c3_reg = 4'b0000;
	if(read_input_cnt<=63)	sram_wen_c0_reg = 0;
	else if(read_input_cnt<=127) sram_wen_c2_reg = 0;
	else if(read_input_cnt<=191) sram_wen_c1_reg = 0;
	else if(read_input_cnt<=255) sram_wen_c3_reg = 0;
    end
end


always@(posedge clk) begin
    sram_bytemask_n_c0 <= sram_bytemask_n_c0_reg;
    sram_bytemask_n_c1 <= sram_bytemask_n_c1_reg;
    sram_bytemask_n_c2 <= sram_bytemask_n_c2_reg;
    sram_bytemask_n_c3 <= sram_bytemask_n_c3_reg;
    sram_wdata_c0 <= sram_wdata_c0_reg;
    sram_wdata_c1 <= sram_wdata_c1_reg;
    sram_wdata_c2 <= sram_wdata_c2_reg;
    sram_wdata_c3 <= sram_wdata_c3_reg;
    sram_addr_c0 <= sram_addr_c0_reg;
    sram_addr_c1 <= sram_addr_c1_reg;
    sram_addr_c2 <= sram_addr_c2_reg;
    sram_addr_c3 <= sram_addr_c3_reg;
    sram_wen_c0 <= sram_wen_c0_reg;
    sram_wen_c1 <= sram_wen_c1_reg;
    sram_wen_c2 <= sram_wen_c2_reg;
    sram_wen_c3 <= sram_wen_c3_reg;
    sram_rdata_b0_reg <= sram_rdata_b0;
    sram_rdata_b1_reg <= sram_rdata_b1;
    sram_rdata_b2_reg <= sram_rdata_b2;
    sram_rdata_b3_reg <= sram_rdata_b3;
end

//******************************** PART3 END ********************************

//******************************** PART2 START ***********************

always@ *begin
    weight[0] = sram_rdata_weight_reg[1*BW_PER_PARAM-1:0*BW_PER_PARAM];
    weight[1] = sram_rdata_weight_reg[2*BW_PER_PARAM-1:1*BW_PER_PARAM];
    weight[2] = sram_rdata_weight_reg[3*BW_PER_PARAM-1:2*BW_PER_PARAM];
    weight[3] = sram_rdata_weight_reg[4*BW_PER_PARAM-1:3*BW_PER_PARAM];
    weight[4] = sram_rdata_weight_reg[5*BW_PER_PARAM-1:4*BW_PER_PARAM];
    weight[5] = sram_rdata_weight_reg[6*BW_PER_PARAM-1:5*BW_PER_PARAM];
    weight[6] = sram_rdata_weight_reg[7*BW_PER_PARAM-1:6*BW_PER_PARAM];
    weight[7] = sram_rdata_weight_reg[8*BW_PER_PARAM-1:7*BW_PER_PARAM];
    weight[8] = sram_rdata_weight_reg[9*BW_PER_PARAM-1:8*BW_PER_PARAM];
    bias = sram_rdata_bias_reg;
end

reg [2:0] comp_weight [0:8];
reg signed [10:0] mult_a0_0, mult_a1_0, mult_a2_0, mult_a3_0;
reg signed [10:0] mult_a0_2, mult_a1_2, mult_a2_2, mult_a3_2;
reg signed [10:0] mult_a0_4, mult_a1_4, mult_a2_4, mult_a3_4;
reg signed [10:0] mult_a0_6, mult_a1_6, mult_a2_6, mult_a3_6;
reg signed [10:0] mult_a0_8, mult_a1_8, mult_a2_8, mult_a3_8;
reg signed [10:0] mult_a0_1, mult_a1_1, mult_a2_1, mult_a3_1;
reg signed [10:0] mult_a0_3, mult_a1_3, mult_a2_3, mult_a3_3;
reg signed [10:0] mult_a0_5, mult_a1_5, mult_a2_5, mult_a3_5;
reg signed [10:0] mult_a0_7, mult_a1_7, mult_a2_7, mult_a3_7;
reg [9:0] mult_a0_tmp_0, mult_a1_tmp_0, mult_a2_tmp_0, mult_a3_tmp_0;
reg [9:0] mult_a0_tmp_1, mult_a1_tmp_1, mult_a2_tmp_1, mult_a3_tmp_1;
reg [9:0] mult_a0_tmp_2, mult_a1_tmp_2, mult_a2_tmp_2, mult_a3_tmp_2;
reg [9:0] mult_a0_tmp_3, mult_a1_tmp_3, mult_a2_tmp_3, mult_a3_tmp_3;
reg [9:0] mult_a0_tmp_4, mult_a1_tmp_4, mult_a2_tmp_4, mult_a3_tmp_4;
reg [9:0] mult_a0_tmp_5, mult_a1_tmp_5, mult_a2_tmp_5, mult_a3_tmp_5;
reg [9:0] mult_a0_tmp_6, mult_a1_tmp_6, mult_a2_tmp_6, mult_a3_tmp_6;
reg [9:0] mult_a0_tmp_7, mult_a1_tmp_7, mult_a2_tmp_7, mult_a3_tmp_7;
reg [9:0] mult_a0_tmp_8, mult_a1_tmp_8, mult_a2_tmp_8, mult_a3_tmp_8;
reg signed [10:0] mult_a0_tmp_0_signed, mult_a1_tmp_0_signed, mult_a2_tmp_0_signed, mult_a3_tmp_0_signed;
reg signed [10:0] mult_a0_tmp_1_signed, mult_a1_tmp_1_signed, mult_a2_tmp_1_signed, mult_a3_tmp_1_signed;
reg signed [10:0] mult_a0_tmp_2_signed, mult_a1_tmp_2_signed, mult_a2_tmp_2_signed, mult_a3_tmp_2_signed;
reg signed [10:0] mult_a0_tmp_3_signed, mult_a1_tmp_3_signed, mult_a2_tmp_3_signed, mult_a3_tmp_3_signed;
reg signed [10:0] mult_a0_tmp_4_signed, mult_a1_tmp_4_signed, mult_a2_tmp_4_signed, mult_a3_tmp_4_signed;
reg signed [10:0] mult_a0_tmp_5_signed, mult_a1_tmp_5_signed, mult_a2_tmp_5_signed, mult_a3_tmp_5_signed;
reg signed [10:0] mult_a0_tmp_6_signed, mult_a1_tmp_6_signed, mult_a2_tmp_6_signed, mult_a3_tmp_6_signed;
reg signed [10:0] mult_a0_tmp_7_signed, mult_a1_tmp_7_signed, mult_a2_tmp_7_signed, mult_a3_tmp_7_signed;
reg signed [10:0] mult_a0_tmp_8_signed, mult_a1_tmp_8_signed, mult_a2_tmp_8_signed, mult_a3_tmp_8_signed;

always@* begin
    comp_weight[0] = weight[0][2:0];   
    comp_weight[1] = weight[1][2:0];
    comp_weight[2] = weight[2][2:0];
    comp_weight[3] = weight[3][2:0];
    comp_weight[4] = weight[4][2:0];
    comp_weight[5] = weight[5][2:0];
    comp_weight[6] = weight[6][2:0];
    comp_weight[7] = weight[7][2:0];
    comp_weight[8] = weight[8][2:0];
    if(weight[0][3]) comp_weight[0] = -weight[0][2:0];
    if(weight[1][3]) comp_weight[1] = -weight[1][2:0];
    if(weight[2][3]) comp_weight[2] = -weight[2][2:0];
    if(weight[3][3]) comp_weight[3] = -weight[3][2:0];
    if(weight[4][3]) comp_weight[4] = -weight[4][2:0];
    if(weight[5][3]) comp_weight[5] = -weight[5][2:0];
    if(weight[6][3]) comp_weight[6] = -weight[6][2:0];
    if(weight[7][3]) comp_weight[7] = -weight[7][2:0];
    if(weight[8][3]) comp_weight[8] = -weight[8][2:0];
end

always@* begin
    mult_a0_tmp_0_signed =  weight[8][3] == 1 ? -mult_a0_tmp_0:mult_a0_tmp_0;//
    mult_a0_tmp_1_signed =  weight[7][3] == 1 ? -mult_a0_tmp_1:mult_a0_tmp_1;//
    mult_a0_tmp_2_signed =  weight[6][3] == 1 ? -mult_a0_tmp_2:mult_a0_tmp_2;//
    mult_a0_tmp_3_signed =  weight[5][3] == 1 ? -mult_a0_tmp_3:mult_a0_tmp_3;//
    mult_a0_tmp_4_signed =  weight[4][3] == 1 ? -mult_a0_tmp_4:mult_a0_tmp_4;//
    mult_a0_tmp_5_signed =  weight[3][3] == 1 ? -mult_a0_tmp_5:mult_a0_tmp_5;//
    mult_a0_tmp_6_signed =  weight[2][3] == 1 ? -mult_a0_tmp_6:mult_a0_tmp_6;//
    mult_a0_tmp_7_signed =  weight[1][3] == 1 ? -mult_a0_tmp_7:mult_a0_tmp_7;//
    mult_a0_tmp_8_signed =  weight[0][3] == 1 ? -mult_a0_tmp_8:mult_a0_tmp_8;//
                                                                             //
    mult_a1_tmp_0_signed =  weight[8][3] == 1 ? -mult_a1_tmp_0:mult_a1_tmp_0;//
    mult_a1_tmp_1_signed =  weight[7][3] == 1 ? -mult_a1_tmp_1:mult_a1_tmp_1;//
    mult_a1_tmp_2_signed =  weight[6][3] == 1 ? -mult_a1_tmp_2:mult_a1_tmp_2;//
    mult_a1_tmp_3_signed =  weight[5][3] == 1 ? -mult_a1_tmp_3:mult_a1_tmp_3;//
    mult_a1_tmp_4_signed =  weight[4][3] == 1 ? -mult_a1_tmp_4:mult_a1_tmp_4;//
    mult_a1_tmp_5_signed =  weight[3][3] == 1 ? -mult_a1_tmp_5:mult_a1_tmp_5;//
    mult_a1_tmp_6_signed =  weight[2][3] == 1 ? -mult_a1_tmp_6:mult_a1_tmp_6;//
    mult_a1_tmp_7_signed =  weight[1][3] == 1 ? -mult_a1_tmp_7:mult_a1_tmp_7;//
    mult_a1_tmp_8_signed =  weight[0][3] == 1 ? -mult_a1_tmp_8:mult_a1_tmp_8;//
                                                                             //
    mult_a2_tmp_0_signed =  weight[8][3] == 1 ? -mult_a2_tmp_0:mult_a2_tmp_0;//
    mult_a2_tmp_1_signed =  weight[7][3] == 1 ? -mult_a2_tmp_1:mult_a2_tmp_1;//
    mult_a2_tmp_2_signed =  weight[6][3] == 1 ? -mult_a2_tmp_2:mult_a2_tmp_2;//
    mult_a2_tmp_3_signed =  weight[5][3] == 1 ? -mult_a2_tmp_3:mult_a2_tmp_3;//
    mult_a2_tmp_4_signed =  weight[4][3] == 1 ? -mult_a2_tmp_4:mult_a2_tmp_4;//
    mult_a2_tmp_5_signed =  weight[3][3] == 1 ? -mult_a2_tmp_5:mult_a2_tmp_5;//
    mult_a2_tmp_6_signed =  weight[2][3] == 1 ? -mult_a2_tmp_6:mult_a2_tmp_6;//
    mult_a2_tmp_7_signed =  weight[1][3] == 1 ? -mult_a2_tmp_7:mult_a2_tmp_7;//
    mult_a2_tmp_8_signed =  weight[0][3] == 1 ? -mult_a2_tmp_8:mult_a2_tmp_8;//
                                                                             //
    mult_a3_tmp_0_signed =  weight[8][3] == 1 ? -mult_a3_tmp_0:mult_a3_tmp_0;//
    mult_a3_tmp_1_signed =  weight[7][3] == 1 ? -mult_a3_tmp_1:mult_a3_tmp_1;//
    mult_a3_tmp_2_signed =  weight[6][3] == 1 ? -mult_a3_tmp_2:mult_a3_tmp_2;//
    mult_a3_tmp_3_signed =  weight[5][3] == 1 ? -mult_a3_tmp_3:mult_a3_tmp_3;//
    mult_a3_tmp_4_signed =  weight[4][3] == 1 ? -mult_a3_tmp_4:mult_a3_tmp_4;//
    mult_a3_tmp_5_signed =  weight[3][3] == 1 ? -mult_a3_tmp_5:mult_a3_tmp_5;//
    mult_a3_tmp_6_signed =  weight[2][3] == 1 ? -mult_a3_tmp_6:mult_a3_tmp_6;//
    mult_a3_tmp_7_signed =  weight[1][3] == 1 ? -mult_a3_tmp_7:mult_a3_tmp_7;//
    mult_a3_tmp_8_signed =  weight[0][3] == 1 ? -mult_a3_tmp_8:mult_a3_tmp_8;//

//    if(weight[8][3]) begin
//	mult_a0_tmp_0_signed =  -mult_a0_tmp_0;
//	mult_a1_tmp_0_signed =  -mult_a1_tmp_0;
//	mult_a2_tmp_0_signed =  -mult_a2_tmp_0;
//	mult_a3_tmp_0_signed =  -mult_a3_tmp_0;
//    end
//    if(weight[7][3]) begin
//	mult_a0_tmp_1_signed =  -mult_a0_tmp_1;
//	mult_a1_tmp_1_signed =  -mult_a1_tmp_1;
//	mult_a2_tmp_1_signed =  -mult_a2_tmp_1;
//	mult_a3_tmp_1_signed =  -mult_a3_tmp_1;
//    end
//    if(weight[6][3]) begin
//	mult_a0_tmp_2_signed =  -mult_a0_tmp_2;
//	mult_a1_tmp_2_signed =  -mult_a1_tmp_2;
//	mult_a2_tmp_2_signed =  -mult_a2_tmp_2;
//	mult_a3_tmp_2_signed =  -mult_a3_tmp_2;
//    end
//    if(weight[5][3]) begin
//	mult_a0_tmp_3_signed =  -mult_a0_tmp_3;
//	mult_a1_tmp_3_signed =  -mult_a1_tmp_3;
//	mult_a2_tmp_3_signed =  -mult_a2_tmp_3;
//	mult_a3_tmp_3_signed =  -mult_a3_tmp_3;
//    end
//    if(weight[4][3]) begin
//	mult_a0_tmp_4_signed =  -mult_a0_tmp_4;
//	mult_a1_tmp_4_signed =  -mult_a1_tmp_4;
//	mult_a2_tmp_4_signed =  -mult_a2_tmp_4;
//	mult_a3_tmp_4_signed =  -mult_a3_tmp_4;
//    end
//    if(weight[3][3]) begin
//	mult_a0_tmp_5_signed =  -mult_a0_tmp_5;
//	mult_a1_tmp_5_signed =  -mult_a1_tmp_5;
//	mult_a2_tmp_5_signed =  -mult_a2_tmp_5;
//	mult_a3_tmp_5_signed =  -mult_a3_tmp_5;
//    end
//    if(weight[2][3]) begin
//	mult_a0_tmp_6_signed =  -mult_a0_tmp_6;
//	mult_a1_tmp_6_signed =  -mult_a1_tmp_6;
//	mult_a2_tmp_6_signed =  -mult_a2_tmp_6;
//	mult_a3_tmp_6_signed =  -mult_a3_tmp_6;
//    end
//    if(weight[1][3]) begin
//	mult_a0_tmp_7_signed =  -mult_a0_tmp_7;
//	mult_a1_tmp_7_signed =  -mult_a1_tmp_7;
//	mult_a2_tmp_7_signed =  -mult_a2_tmp_7;
//	mult_a3_tmp_7_signed =  -mult_a3_tmp_7;
//    end
//    if(weight[0][3]) begin
//	mult_a0_tmp_8_signed =  -mult_a0_tmp_8;
//	mult_a1_tmp_8_signed =  -mult_a1_tmp_8;
//	mult_a2_tmp_8_signed =  -mult_a2_tmp_8;
//	mult_a3_tmp_8_signed =  -mult_a3_tmp_8;
//    end

end

reg signed [14:0] conv_a0, conv_a1, conv_a2, conv_a3;
always@* begin
    mult_a0_tmp_0 = comp_weight[8]*data_a0[3]; 
    mult_a0_tmp_1 = comp_weight[7]*data_a0[2]; 
    mult_a0_tmp_2 = comp_weight[6]*data_a1[3]; 
    mult_a0_tmp_3 = comp_weight[5]*data_a0[1]; 
    mult_a0_tmp_4 = comp_weight[4]*data_a0[0]; 
    mult_a0_tmp_5 = comp_weight[3]*data_a1[1]; 
    mult_a0_tmp_6 = comp_weight[2]*data_a2[3]; 
    mult_a0_tmp_7 = comp_weight[1]*data_a2[2]; 
    mult_a0_tmp_8 = comp_weight[0]*data_a3[3]; 
                                               
    mult_a1_tmp_0 = comp_weight[8]*data_a0[2]; 
    mult_a1_tmp_1 = comp_weight[7]*data_a1[3]; 
    mult_a1_tmp_2 = comp_weight[6]*data_a1[2]; 
    mult_a1_tmp_3 = comp_weight[5]*data_a0[0]; 
    mult_a1_tmp_4 = comp_weight[4]*data_a1[1]; 
    mult_a1_tmp_5 = comp_weight[3]*data_a1[0]; 
    mult_a1_tmp_6 = comp_weight[2]*data_a2[2]; 
    mult_a1_tmp_7 = comp_weight[1]*data_a3[3]; 
    mult_a1_tmp_8 = comp_weight[0]*data_a3[2]; 
                                               
    mult_a2_tmp_0 = comp_weight[8]*data_a0[1]; 
    mult_a2_tmp_1 = comp_weight[7]*data_a0[0]; 
    mult_a2_tmp_2 = comp_weight[6]*data_a1[1]; 
    mult_a2_tmp_3 = comp_weight[5]*data_a2[3]; 
    mult_a2_tmp_4 = comp_weight[4]*data_a2[2]; 
    mult_a2_tmp_5 = comp_weight[3]*data_a3[3]; 
    mult_a2_tmp_6 = comp_weight[2]*data_a2[1]; 
    mult_a2_tmp_7 = comp_weight[1]*data_a2[0]; 
    mult_a2_tmp_8 = comp_weight[0]*data_a3[1]; 
                                               
    mult_a3_tmp_0 = comp_weight[8]*data_a0[0]; 
    mult_a3_tmp_1 = comp_weight[7]*data_a1[1]; 
    mult_a3_tmp_2 = comp_weight[6]*data_a1[0]; 
    mult_a3_tmp_3 = comp_weight[5]*data_a2[2]; 
    mult_a3_tmp_4 = comp_weight[4]*data_a3[3]; 
    mult_a3_tmp_5 = comp_weight[3]*data_a3[2]; 
    mult_a3_tmp_6 = comp_weight[2]*data_a2[0]; 
    mult_a3_tmp_7 = comp_weight[1]*data_a3[1]; 
    mult_a3_tmp_8 = comp_weight[0]*data_a3[0]; 
end



always@(posedge clk) begin
    mult_a0_0 <= mult_a0_tmp_0_signed;
    mult_a1_0 <= mult_a1_tmp_0_signed;
    mult_a2_0 <= mult_a2_tmp_0_signed;
    mult_a3_0 <= mult_a3_tmp_0_signed;
    mult_a0_1 <= mult_a0_tmp_1_signed;
    mult_a1_1 <= mult_a1_tmp_1_signed;
    mult_a2_1 <= mult_a2_tmp_1_signed;
    mult_a3_1 <= mult_a3_tmp_1_signed;
    mult_a0_2 <= mult_a0_tmp_2_signed;
    mult_a1_2 <= mult_a1_tmp_2_signed;
    mult_a2_2 <= mult_a2_tmp_2_signed;
    mult_a3_2 <= mult_a3_tmp_2_signed;
    mult_a0_3 <= mult_a0_tmp_3_signed;
    mult_a1_3 <= mult_a1_tmp_3_signed;
    mult_a2_3 <= mult_a2_tmp_3_signed;
    mult_a3_3 <= mult_a3_tmp_3_signed;
    mult_a0_4 <= mult_a0_tmp_4_signed;
    mult_a1_4 <= mult_a1_tmp_4_signed;
    mult_a2_4 <= mult_a2_tmp_4_signed;
    mult_a3_4 <= mult_a3_tmp_4_signed;
    mult_a0_5 <= mult_a0_tmp_5_signed;
    mult_a1_5 <= mult_a1_tmp_5_signed;
    mult_a2_5 <= mult_a2_tmp_5_signed;
    mult_a3_5 <= mult_a3_tmp_5_signed;
    mult_a0_6 <= mult_a0_tmp_6_signed;
    mult_a1_6 <= mult_a1_tmp_6_signed;
    mult_a2_6 <= mult_a2_tmp_6_signed;
    mult_a3_6 <= mult_a3_tmp_6_signed;
    mult_a0_7 <= mult_a0_tmp_7_signed;
    mult_a1_7 <= mult_a1_tmp_7_signed;
    mult_a2_7 <= mult_a2_tmp_7_signed;
    mult_a3_7 <= mult_a3_tmp_7_signed;
    mult_a0_8 <= mult_a0_tmp_8_signed;
    mult_a1_8 <= mult_a1_tmp_8_signed;
    mult_a2_8 <= mult_a2_tmp_8_signed;
    mult_a3_8 <= mult_a3_tmp_8_signed;
end
reg signed [13:0] conv_a0_a0, conv_a1_a0, conv_a2_a0, conv_a3_a0;
reg signed [13:0] conv_a0_a1, conv_a1_a1, conv_a2_a1, conv_a3_a1;
reg signed [14:0] conv_a0_a, conv_a1_a, conv_a2_a, conv_a3_a;

always@* begin
    conv_a0_a0 = mult_a0_0+mult_a0_1+mult_a0_2+mult_a0_3+mult_a0_4;
    conv_a1_a0 = mult_a1_0+mult_a1_1+mult_a1_2+mult_a1_3+mult_a1_4;
    conv_a2_a0 = mult_a2_0+mult_a2_1+mult_a2_2+mult_a2_3+mult_a2_4;
    conv_a3_a0 = mult_a3_0+mult_a3_1+mult_a3_2+mult_a3_3+mult_a3_4;
    conv_a0_a1 = mult_a0_5+mult_a0_6+mult_a0_7+mult_a0_8;
    conv_a1_a1 = mult_a1_5+mult_a1_6+mult_a1_7+mult_a1_8;
    conv_a2_a1 = mult_a2_5+mult_a2_6+mult_a2_7+mult_a2_8;
    conv_a3_a1 = mult_a3_5+mult_a3_6+mult_a3_7+mult_a3_8;
end

always@* begin
    conv_a0_a = conv_a0_a0 + conv_a0_a1;
    conv_a1_a = conv_a1_a0 + conv_a1_a1;
    conv_a2_a = conv_a2_a0 + conv_a2_a1;
    conv_a3_a = conv_a3_a0 + conv_a3_a1;
end

always@* begin
    conv_a0 = conv_a0_a;
    conv_a1 = conv_a1_a;
    conv_a2 = conv_a2_a;
    conv_a3 = conv_a3_a;
end

always@* begin
    conv_a0_tmp = 0;
    conv_a1_tmp = 0;
    conv_a2_tmp = 0;
    conv_a3_tmp = 0;
    if((state==READ_A_SRAM&&channel_cnt==3)||state==STORE_RESIDUAL||(flag==0&&channel_cnt==3)) begin
	conv_a0_tmp = conv_a0;
	conv_a1_tmp = conv_a1;
	conv_a2_tmp = conv_a2;
	conv_a3_tmp = conv_a3;
    end
    else if(state==CONV1||state==STORE_CONV1||state==CONV2||state==STORE_CONV2||state==READ_B_SRAM) begin
	conv_a0_tmp = conv_a0_reg+conv_a0;
	conv_a1_tmp = conv_a1_reg+conv_a1;
	conv_a2_tmp = conv_a2_reg+conv_a2;
	conv_a3_tmp = conv_a3_reg+conv_a3;
    end
end

always@ * begin
    case(nread_cnt[9:8])
	0: begin
	    store_conv1_b0_tmp = (conv_a0_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b1_tmp = (conv_a1_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b2_tmp = (conv_a2_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b3_tmp = (conv_a3_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
	end                                                    
	1: begin 
	    store_conv1_b0_tmp = (conv_a2_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b1_tmp = (conv_a3_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b2_tmp = (conv_a0_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b3_tmp = (conv_a1_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
	end                                                    
	2: begin 
	    store_conv1_b0_tmp = (conv_a1_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b1_tmp = (conv_a0_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b2_tmp = (conv_a3_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b3_tmp = (conv_a2_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
	end                                                    
	3: begin
	    store_conv1_b0_tmp = (conv_a3_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b1_tmp = (conv_a2_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b2_tmp = (conv_a1_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
    	    store_conv1_b3_tmp = (conv_a0_reg[14:6]+{bias[3],bias[3],bias[3],bias,1'b1});
	end
    endcase
    store_conv1_b0 = store_conv1_b0_tmp[8:1];
    store_conv1_b1 = store_conv1_b1_tmp[8:1];
    store_conv1_b2 = store_conv1_b2_tmp[8:1];
    store_conv1_b3 = store_conv1_b3_tmp[8:1];
end

always@* begin
//    if(state==STORE_CONV1) begin
    if(state==READ_A_SRAM) begin
	if(store_conv1_b0[7]) sram_wdata_b0_reg = 0;
	else if(store_conv1_b0>=127) sram_wdata_b0_reg = {8'd127,8'd127,8'd127,8'd127};
	else sram_wdata_b0_reg = {store_conv1_b0,store_conv1_b0,store_conv1_b0,store_conv1_b0};

	if(store_conv1_b1[7]) sram_wdata_b1_reg = 0;
	else if(store_conv1_b1>=127) sram_wdata_b1_reg = {8'd127,8'd127,8'd127,8'd127};
	else sram_wdata_b1_reg = {store_conv1_b1,store_conv1_b1,store_conv1_b1,store_conv1_b1};

	if(store_conv1_b2[7]) sram_wdata_b2_reg = 0;
	else if(store_conv1_b2>=127) sram_wdata_b2_reg = {8'd127,8'd127,8'd127,8'd127};
	else sram_wdata_b2_reg = {store_conv1_b2,store_conv1_b2,store_conv1_b2,store_conv1_b2};

	if(store_conv1_b3[7]) sram_wdata_b3_reg = 0;
	else if(store_conv1_b3>=127) sram_wdata_b3_reg = {8'd127,8'd127,8'd127,8'd127};
	else sram_wdata_b3_reg = {store_conv1_b3,store_conv1_b3,store_conv1_b3,store_conv1_b3};
    end
    else begin
	sram_wdata_b0_reg = 0;
	sram_wdata_b1_reg = 0;
	sram_wdata_b2_reg = 0;
	sram_wdata_b3_reg = 0;
    end
end

always@* begin
    sram_wen_b0_reg = 1;
    sram_wen_b1_reg = 1;
    sram_wen_b2_reg = 1;
    sram_wen_b3_reg = 1;
    sram_addr_b0_reg = read_input_cnt[7:0]+read_input_cnt[9]+{read_input_cnt[8],2'b00};
    sram_addr_b1_reg = read_input_cnt[7:0]+{read_input_cnt[8],2'b00};
    sram_addr_b2_reg = read_input_cnt[7:0]+read_input_cnt[9];
    sram_addr_b3_reg = read_input_cnt[7:0];
    sram_bytemask_n_b0_reg = 4'b1111;
    sram_bytemask_n_b1_reg = 4'b1111;
    sram_bytemask_n_b2_reg = 4'b1111;
    sram_bytemask_n_b3_reg = 4'b1111;
    if(state==READ_INPUT) begin
	sram_wen_b0_reg = 0;
	sram_wen_b1_reg = 0;
	sram_wen_b2_reg = 0;
	sram_wen_b3_reg = 0;
	sram_bytemask_n_b0_reg = 4'b0000;
	sram_bytemask_n_b1_reg = 4'b0000;
	sram_bytemask_n_b2_reg = 4'b0000;
	sram_bytemask_n_b3_reg = 4'b0000;
    end

    else if(state==READ_A_SRAM) begin
	sram_wen_b0_reg = 0;
	sram_wen_b1_reg = 0;
	sram_wen_b2_reg = 0;
	sram_wen_b3_reg = 0;
	case(read_input_cnt[9:8])
	    0:begin
		sram_bytemask_n_b0_reg = 4'b1110;
		sram_bytemask_n_b1_reg = 4'b1101;
		sram_bytemask_n_b2_reg = 4'b1011;
		sram_bytemask_n_b3_reg = 4'b0111;
	    end
	    1:begin
		sram_bytemask_n_b0_reg = 4'b1011;
		sram_bytemask_n_b1_reg = 4'b0111;
		sram_bytemask_n_b2_reg = 4'b1110;
		sram_bytemask_n_b3_reg = 4'b1101;
	    end
	    2:begin
		sram_bytemask_n_b0_reg = 4'b1101;
		sram_bytemask_n_b1_reg = 4'b1110;
		sram_bytemask_n_b2_reg = 4'b0111;
		sram_bytemask_n_b3_reg = 4'b1011;
	    end
	    3:begin
		sram_bytemask_n_b0_reg = 4'b0111;
		sram_bytemask_n_b1_reg = 4'b1011;
		sram_bytemask_n_b2_reg = 4'b1101;
		sram_bytemask_n_b3_reg = 4'b1110;
	    end
	endcase
    end
    else if(state==READ_B_SRAM) begin
	sram_addr_b0_reg = {channel_cnt[3:0],read_input_tmp[3:0]}+{read_input_tmp[6],2'b00}+read_input_tmp[7];
	sram_addr_b1_reg = {channel_cnt[3:0],read_input_tmp[3:0]}+{read_input_tmp[6],2'b00};
	sram_addr_b2_reg = {channel_cnt[3:0],read_input_tmp[3:0]} +read_input_tmp[7];
	sram_addr_b3_reg = {channel_cnt[3:0],read_input_tmp[3:0]};
    end
    else if(state[3]) begin
	sram_addr_b0_reg = {channel_cnt[3:0],nread_cnt[3:0]}+{nread_cnt[6],2'b00}+nread_cnt[7];
	sram_addr_b1_reg = {channel_cnt[3:0],nread_cnt[3:0]}+{nread_cnt[6],2'b00};
	sram_addr_b2_reg = {channel_cnt[3:0],nread_cnt[3:0]}+ nread_cnt[7];
	sram_addr_b3_reg = {channel_cnt[3:0],nread_cnt[3:0]};
    end
end


always@(posedge clk) begin 
    sram_bytemask_n_b0 <= sram_bytemask_n_b0_reg;
    sram_bytemask_n_b1 <= sram_bytemask_n_b1_reg;
    sram_bytemask_n_b2 <= sram_bytemask_n_b2_reg;
    sram_bytemask_n_b3 <= sram_bytemask_n_b3_reg;
    sram_wdata_b0 <= sram_wdata_b0_reg;
    sram_wdata_b1 <= sram_wdata_b1_reg;
    sram_wdata_b2 <= sram_wdata_b2_reg;
    sram_wdata_b3 <= sram_wdata_b3_reg;
    sram_wen_b0 <= sram_wen_b0_reg;
    sram_wen_b1 <= sram_wen_b1_reg;
    sram_wen_b2 <= sram_wen_b2_reg;
    sram_wen_b3 <= sram_wen_b3_reg;
    sram_addr_b0 <= sram_addr_b0_reg;
    sram_addr_b1 <= sram_addr_b1_reg;
    sram_addr_b2 <= sram_addr_b2_reg;
    sram_addr_b3 <= sram_addr_b3_reg;
    sram_rdata_a0_reg <= sram_rdata_a0;
    sram_rdata_a1_reg <= sram_rdata_a1;
    sram_rdata_a2_reg <= sram_rdata_a2;
    sram_rdata_a3_reg <= sram_rdata_a3;
    sram_raddr_weight <= sram_raddr_weight_reg;
    sram_raddr_bias <= sram_raddr_bias_reg;
    sram_rdata_weight_reg <= sram_rdata_weight;
    sram_rdata_bias_reg <= sram_rdata_bias;
    channel_cnt <= channel_tmp;
    conv_cnt <= conv_tmp;
    conv_a0_reg <= conv_a0_tmp;
    conv_a1_reg <= conv_a1_tmp;
    conv_a2_reg <= conv_a2_tmp;
    conv_a3_reg <= conv_a3_tmp;
end

//******************************** PART2 END ********************************

//******************************** PART1 START ********************************
// Control zero padding by setting busy output
always@* begin
    if(read_input_cnt<258) begin
        if(read_input_cnt<65||read_input_cnt>957) begin
            busy_reg = 1;
            busy_tmp = busy_cnt+1;
        end
        else if(busy && busy_cnt>3) begin
            busy_reg = 0;
            busy_tmp = 1;
        end
        else if(busy) begin
            busy_reg = 1;
            busy_tmp = busy_cnt + 1;
        end	
        else if(!busy && busy_cnt>27) begin
            busy_reg = 1;
            busy_tmp = 1;
        end
        else begin
            busy_reg = 0;
            busy_tmp = busy_cnt + 1;
        end
    end
    else begin
	busy_reg = 0;
	busy_tmp = 0;
    end
end


always@* begin
    sram_wen_a0_reg = 1;
    sram_wen_a1_reg = 1;
    sram_wen_a2_reg = 1;
    sram_wen_a3_reg = 1;
    sram_bytemask_n_a0_reg = 4'b1111;
    sram_bytemask_n_a1_reg = 4'b1111;
    sram_bytemask_n_a2_reg = 4'b1111;
    sram_bytemask_n_a3_reg = 4'b1111;
    sram_wdata_a0_reg = {input_data_reg,input_data_reg,input_data_reg,input_data_reg};
    sram_wdata_a1_reg = {input_data_reg,input_data_reg,input_data_reg,input_data_reg};
    sram_wdata_a2_reg = {input_data_reg,input_data_reg,input_data_reg,input_data_reg};
    sram_wdata_a3_reg = {input_data_reg,input_data_reg,input_data_reg,input_data_reg};
    sram_addr_a0_reg = 0;
    sram_addr_a1_reg = 0;
    sram_addr_a2_reg = 0;
    sram_addr_a3_reg = 0;

    if(state==READ_INPUT) begin
        ind = read_input_cnt-1;
        sram_row_sel = ind[9:6];
        sram_col_sel = ind[6:0];
        if(read_input_cnt<65) begin
            sram_wen_a0_reg = 0;
            sram_wen_a1_reg = 0;
            sram_wen_a2_reg = 0;
            sram_wen_a3_reg = 0;
            sram_bytemask_n_a0_reg = 0;
            sram_bytemask_n_a1_reg = 0;
            sram_bytemask_n_a2_reg = 0;
            sram_bytemask_n_a3_reg = 0;
            sram_wdata_a0_reg = 0;
            sram_wdata_a1_reg = 0;
            sram_wdata_a2_reg = 0;
            sram_wdata_a3_reg = 0;
            sram_addr_a0_reg = read_input_cnt;
            sram_addr_a1_reg = read_input_cnt;
            sram_addr_a2_reg = read_input_cnt;
            sram_addr_a3_reg = read_input_cnt;
        end
        else if(read_input_cnt>0) begin
            if(!sram_row_sel[1]) begin
                if(!sram_col_sel[2]) begin
            	sram_wen_a0_reg = 0;
            	sram_bytemask_n_a0_reg[{!sram_row_sel[0],!sram_col_sel[1]}] = 0;
            	sram_addr_a0_reg = {sram_col_sel[5],sram_col_sel[0],sram_row_sel[3:2],sram_col_sel[4:3]};
                end
                else begin
            	sram_wen_a1_reg = 0;
            	sram_bytemask_n_a1_reg[{!sram_row_sel[0],!sram_col_sel[1]}] = 0;
            	sram_addr_a1_reg = {sram_col_sel[5],sram_col_sel[0],sram_row_sel[3:2],sram_col_sel[4:3]};
                end
            end
            else begin
                if(!sram_col_sel[2]) begin
            	sram_wen_a2_reg = 0;
            	sram_bytemask_n_a2_reg[{!sram_row_sel[0],!sram_col_sel[1]}] = 0;
            	sram_addr_a2_reg = {sram_col_sel[5],sram_col_sel[0],sram_row_sel[3:2],sram_col_sel[4:3]};
                end
                else begin
            	sram_wen_a3_reg = 0;
            	sram_bytemask_n_a3_reg[{!sram_row_sel[0],!sram_col_sel[1]}] = 0;
            	sram_addr_a3_reg = {sram_col_sel[5],sram_col_sel[0],sram_row_sel[3:2],sram_col_sel[4:3]};
                end
            end
        end
    end
    else if(state==READ_A_SRAM) begin
	sram_wen_a0_reg = 0;
	sram_wen_a1_reg = 0;
	sram_wen_a2_reg = 0;
	sram_wen_a3_reg = 0;
	sram_addr_a0_reg = {channel_cnt[1:0],read_input_tmp[3:0]}+{read_input_tmp[8],2'b00}+read_input_tmp[9];
	sram_addr_a1_reg = {channel_cnt[1:0],read_input_tmp[3:0]}+{read_input_tmp[8],2'b00};
	sram_addr_a2_reg = {channel_cnt[1:0],read_input_tmp[3:0]}+ read_input_tmp[9];
	sram_addr_a3_reg = {channel_cnt[1:0],read_input_tmp[3:0]};
    end
    else if(state[2]&state[0]) begin
	sram_wen_a0_reg = 0;
	sram_wen_a1_reg = 0;
	sram_wen_a2_reg = 0;
	sram_wen_a3_reg = 0;
	sram_addr_a0_reg = {channel_cnt[1:0],nread_cnt[3:0]}+{nread_cnt[8],2'b00}+nread_cnt[9];
	sram_addr_a1_reg = {channel_cnt[1:0],nread_cnt[3:0]}+{nread_cnt[8],2'b00};
	sram_addr_a2_reg = {channel_cnt[1:0],nread_cnt[3:0]}+ nread_cnt[9];
	sram_addr_a3_reg = {channel_cnt[1:0],nread_cnt[3:0]};
    end
    else if(state[3])  begin
	sram_addr_a0_reg = read_input_cnt[5:0]+{read_input_cnt[6],2'b00}+read_input_cnt[7];
	sram_addr_a1_reg = read_input_cnt[5:0]+{read_input_cnt[6],2'b00};
	sram_addr_a2_reg = read_input_cnt[5:0]+ read_input_cnt[7];
	sram_addr_a3_reg = read_input_cnt[5:0];
    end
end


always@(posedge clk) begin
    read_input_cnt  <= read_input_tmp;
    start_pulse_reg <= start_pulse;
    busy	    <= busy_reg;
    input_data_reg  <= input_data;
    finish_pulse    <= finish_pulse_reg;

    sram_bytemask_n_a0 <= sram_bytemask_n_a0_reg;
    sram_bytemask_n_a1 <= sram_bytemask_n_a1_reg;
    sram_bytemask_n_a2 <= sram_bytemask_n_a2_reg;
    sram_bytemask_n_a3 <= sram_bytemask_n_a3_reg;
    sram_wdata_a0 <= sram_wdata_a0_reg;
    sram_wdata_a1 <= sram_wdata_a1_reg;
    sram_wdata_a2 <= sram_wdata_a2_reg;
    sram_wdata_a3 <= sram_wdata_a3_reg;
    sram_addr_a0 <= sram_addr_a0_reg;
    sram_addr_a1 <= sram_addr_a1_reg;
    sram_addr_a2 <= sram_addr_a2_reg;
    sram_addr_a3 <= sram_addr_a3_reg;
    sram_wen_a0 <= sram_wen_a0_reg;
    sram_wen_a1 <= sram_wen_a1_reg;
    sram_wen_a2 <= sram_wen_a2_reg;
    sram_wen_a3 <= sram_wen_a3_reg;
end


always@(posedge clk) begin
    if(~srstn) begin
	state <= IDLE;
	busy_cnt <= 0;
    end
    else begin
	state <= nstate;
	busy_cnt <= busy_tmp;
    end
end

//******************************** PART1 END ********************************
endmodule
