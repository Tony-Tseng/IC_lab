`timescale 1ns/100ps

`define CYCLE       10.0
`define END_CYCLE   100000 // you can modify this number for longer simulation
`define PIXEL_NUM   28*28

`define PAT_START_NO 0 // Do not modify this (HW5 only test /bmp/test_0000.bmp)
`define PAT_END_NO   0 // Do not modify this (HW5 only test /bmp/test_0000.bmp)

module test_resnet_top;

localparam ACT_PER_ADDR    = 4;
localparam BW_PER_ACT      = 8;
localparam WEIGHT_PER_ADDR = 9;
localparam BIAS_PER_ADDR   = 1;
localparam BW_PER_PARAM    = 4;

//====== module I/O Declaration =====
reg                   clk;          // clock input
reg                   srstn;        // synchronous reset (active low)
  
reg                   start_pulse;  // start to input a new bmp image
wire                  busy;         // halt the input pixels
reg                   input_valid;
reg  [BW_PER_ACT-1:0] input_data;   // input image pixels (28x28 pixels)
wire                  finish_pulse; // output finish_pulse to check the final answer (in SRAM C)

//write enable for SRAM A,B,C (active low)
wire sram_wen_a0;
wire sram_wen_a1;
wire sram_wen_a2;
wire sram_wen_a3;
wire sram_wen_b0;
wire sram_wen_b1;
wire sram_wen_b2;
wire sram_wen_b3;
wire sram_wen_c0;
wire sram_wen_c1;
wire sram_wen_c2;
wire sram_wen_c3;
// read/write address from SRAM A,B,C (read=1, write=0)
wire [7:0] sram_addr_a0;
wire [7:0] sram_addr_a1;
wire [7:0] sram_addr_a2;
wire [7:0] sram_addr_a3;
wire [7:0] sram_addr_b0;
wire [7:0] sram_addr_b1;
wire [7:0] sram_addr_b2;
wire [7:0] sram_addr_b3;
wire [7:0] sram_addr_c0;
wire [7:0] sram_addr_c1;
wire [7:0] sram_addr_c2;
wire [7:0] sram_addr_c3;
// read data from SRAM A,B,C
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a0;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a1;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a2;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_a3;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b0;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b1;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b2;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_b3;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c0;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c1;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c2;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_rdata_c3;
// write data to SRAM A,B,C
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a0;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a1;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a2;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_a3;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b0;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b1;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b2;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_b3;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c0;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c1;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c2;
wire [ACT_PER_ADDR*BW_PER_ACT-1:0] sram_wdata_c3;
// write bytemask to SRAM A,B,C (active low)
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_a0;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_a1;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_a2;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_a3;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_b0;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_b1;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_b2;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_b3;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_c0;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_c1;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_c2;
wire [ACT_PER_ADDR-1:0] sram_bytemask_n_c3;

wire [6:0]                              sram_raddr_weight; //read address from SRAM weight  
wire [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] sram_rdata_weight; //read data from SRAM weight
wire [4:0]                              sram_raddr_bias;   //read address from SRAM bias 
wire [BIAS_PER_ADDR*BW_PER_PARAM-1:0]   sram_rdata_bias;   //read data from SRAM bias


//====== resnet_top connection =====
resnet_top #(
    .ACT_PER_ADDR   (ACT_PER_ADDR   ),
    .BW_PER_ACT     (BW_PER_ACT     ),
    .WEIGHT_PER_ADDR(WEIGHT_PER_ADDR),
    .BIAS_PER_ADDR  (BIAS_PER_ADDR  ),
    .BW_PER_PARAM   (BW_PER_PARAM   )
) resnet_top_u0 (
    .clk         (clk         ),
    .srstn       (srstn       ),
    .start_pulse (start_pulse ),
    .busy        (busy        ),
    .input_valid (input_valid ),
    .input_data  (input_data  ),
    .finish_pulse(finish_pulse),

    .sram_wen_a0(sram_wen_a0),
    .sram_wen_a1(sram_wen_a1),
    .sram_wen_a2(sram_wen_a2),
    .sram_wen_a3(sram_wen_a3),
    .sram_wen_b0(sram_wen_b0),
    .sram_wen_b1(sram_wen_b1),
    .sram_wen_b2(sram_wen_b2),
    .sram_wen_b3(sram_wen_b3),
    .sram_wen_c0(sram_wen_c0),
    .sram_wen_c1(sram_wen_c1),
    .sram_wen_c2(sram_wen_c2),
    .sram_wen_c3(sram_wen_c3),

    .sram_addr_a0(sram_addr_a0),
    .sram_addr_a1(sram_addr_a1),
    .sram_addr_a2(sram_addr_a2),
    .sram_addr_a3(sram_addr_a3),
    .sram_addr_b0(sram_addr_b0),
    .sram_addr_b1(sram_addr_b1),
    .sram_addr_b2(sram_addr_b2),
    .sram_addr_b3(sram_addr_b3),
    .sram_addr_c0(sram_addr_c0),
    .sram_addr_c1(sram_addr_c1),
    .sram_addr_c2(sram_addr_c2),
    .sram_addr_c3(sram_addr_c3),

    .sram_rdata_a0(sram_rdata_a0),
    .sram_rdata_a1(sram_rdata_a1),
    .sram_rdata_a2(sram_rdata_a2),
    .sram_rdata_a3(sram_rdata_a3),
    .sram_rdata_b0(sram_rdata_b0),
    .sram_rdata_b1(sram_rdata_b1),
    .sram_rdata_b2(sram_rdata_b2),
    .sram_rdata_b3(sram_rdata_b3),
    .sram_rdata_c0(sram_rdata_c0),
    .sram_rdata_c1(sram_rdata_c1),
    .sram_rdata_c2(sram_rdata_c2),
    .sram_rdata_c3(sram_rdata_c3),

    .sram_wdata_a0(sram_wdata_a0),
    .sram_wdata_a1(sram_wdata_a1),
    .sram_wdata_a2(sram_wdata_a2),
    .sram_wdata_a3(sram_wdata_a3),
    .sram_wdata_b0(sram_wdata_b0),
    .sram_wdata_b1(sram_wdata_b1),
    .sram_wdata_b2(sram_wdata_b2),
    .sram_wdata_b3(sram_wdata_b3),
    .sram_wdata_c0(sram_wdata_c0),
    .sram_wdata_c1(sram_wdata_c1),
    .sram_wdata_c2(sram_wdata_c2),
    .sram_wdata_c3(sram_wdata_c3),

    .sram_bytemask_n_a0(sram_bytemask_n_a0),
    .sram_bytemask_n_a1(sram_bytemask_n_a1),
    .sram_bytemask_n_a2(sram_bytemask_n_a2),
    .sram_bytemask_n_a3(sram_bytemask_n_a3),
    .sram_bytemask_n_b0(sram_bytemask_n_b0),
    .sram_bytemask_n_b1(sram_bytemask_n_b1),
    .sram_bytemask_n_b2(sram_bytemask_n_b2),
    .sram_bytemask_n_b3(sram_bytemask_n_b3),
    .sram_bytemask_n_c0(sram_bytemask_n_c0),
    .sram_bytemask_n_c1(sram_bytemask_n_c1),
    .sram_bytemask_n_c2(sram_bytemask_n_c2),
    .sram_bytemask_n_c3(sram_bytemask_n_c3),

    .sram_raddr_weight(sram_raddr_weight),
    .sram_rdata_weight(sram_rdata_weight),
    .sram_raddr_bias  (sram_raddr_bias  ),
    .sram_rdata_bias  (sram_rdata_bias  )
);


//====== SRAM connection =====
//activation sram group A,B,C
sram_256x32b sram_256x32b_a0(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_a0     ),
    .bytemask_n(sram_bytemask_n_a0),
    .waddr   (sram_addr_a0    ),
    .wdata   (sram_wdata_a0   ),
    .raddr   (sram_addr_a0    ),
    .rdata   (sram_rdata_a0   )
);
sram_256x32b sram_256x32b_a1(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_a1     ),
    .bytemask_n(sram_bytemask_n_a1),
    .waddr   (sram_addr_a1    ),
    .wdata   (sram_wdata_a1   ),
    .raddr   (sram_addr_a1    ),
    .rdata   (sram_rdata_a1   )
);
sram_256x32b sram_256x32b_a2(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_a2     ),
    .bytemask_n(sram_bytemask_n_a2),
    .waddr   (sram_addr_a2    ),
    .wdata   (sram_wdata_a2   ),
    .raddr   (sram_addr_a2    ),
    .rdata   (sram_rdata_a2   )
);
sram_256x32b sram_256x32b_a3(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_a3     ),
    .bytemask_n(sram_bytemask_n_a3),
    .waddr   (sram_addr_a3    ),
    .wdata   (sram_wdata_a3   ),
    .raddr   (sram_addr_a3    ),
    .rdata   (sram_rdata_a3   )
);

sram_256x32b sram_256x32b_b0(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_b0     ),
    .bytemask_n(sram_bytemask_n_b0),
    .waddr   (sram_addr_b0    ),
    .wdata   (sram_wdata_b0   ),
    .raddr   (sram_addr_b0    ),
    .rdata   (sram_rdata_b0   )
);
sram_256x32b sram_256x32b_b1(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_b1     ),
    .bytemask_n(sram_bytemask_n_b1),
    .waddr   (sram_addr_b1    ),
    .wdata   (sram_wdata_b1   ),
    .raddr   (sram_addr_b1    ),
    .rdata   (sram_rdata_b1   )
);
sram_256x32b sram_256x32b_b2(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_b2     ),
    .bytemask_n(sram_bytemask_n_b2),
    .waddr   (sram_addr_b2    ),
    .wdata   (sram_wdata_b2   ),
    .raddr   (sram_addr_b2    ),
    .rdata   (sram_rdata_b2   )
);
sram_256x32b sram_256x32b_b3(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_b3     ),
    .bytemask_n(sram_bytemask_n_b3),
    .waddr   (sram_addr_b3    ),
    .wdata   (sram_wdata_b3   ),
    .raddr   (sram_addr_b3    ),
    .rdata   (sram_rdata_b3   )
);

sram_256x32b sram_256x32b_c0(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_c0     ),
    .bytemask_n(sram_bytemask_n_c0),
    .waddr   (sram_addr_c0    ),
    .wdata   (sram_wdata_c0   ),
    .raddr   (sram_addr_c0    ),
    .rdata   (sram_rdata_c0   )
);
sram_256x32b sram_256x32b_c1(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_c1     ),
    .bytemask_n(sram_bytemask_n_c1),
    .waddr   (sram_addr_c1    ),
    .wdata   (sram_wdata_c1   ),
    .raddr   (sram_addr_c1    ),
    .rdata   (sram_rdata_c1   )
);
sram_256x32b sram_256x32b_c2(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_c2     ),
    .bytemask_n(sram_bytemask_n_c2),
    .waddr   (sram_addr_c2    ),
    .wdata   (sram_wdata_c2   ),
    .raddr   (sram_addr_c2    ),
    .rdata   (sram_rdata_c2   )
);
sram_256x32b sram_256x32b_c3(
    .clk     (clk             ),
    .csb     (1'b0            ),
    .wsb     (sram_wen_c3     ),
    .bytemask_n(sram_bytemask_n_c3),
    .waddr   (sram_addr_c3    ),
    .wdata   (sram_wdata_c3   ),
    .raddr   (sram_addr_c3    ),
    .rdata   (sram_rdata_c3   )
);

//weight sram
sram_128x36b sram_128x36b_weight(
    .clk  (clk              ),
    .csb  (1'b0             ),
    .wsb  (1'b1             ),
    .waddr(7'd0             ),
    .wdata(36'd0            ),
    .raddr(sram_raddr_weight),
    .rdata(sram_rdata_weight)
);

//bias sram
sram_20x4b sram_20x4b_bias(
    .clk  (clk            ),
    .csb  (1'b0           ),
    .wsb  (1'b1           ),
    .waddr(5'd0           ),
    .wdata(4'd0           ),
    .raddr(sram_raddr_bias),
    .rdata(sram_rdata_bias)
);



//========== Dump waveform ==========//
`ifdef FSDB
    initial begin
        $fsdbDumpfile("resnet_top.fsdb");
        $fsdbDumpvars("+mda");
    end
`endif

//========== Store parameters to SRAM ==========//
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] conv1_w [0:64-1];
reg [BIAS_PER_ADDR*BW_PER_PARAM-1:0]   conv1_b [0:16-1];
reg [WEIGHT_PER_ADDR*BW_PER_PARAM-1:0] conv2_w [0:64-1];
reg [BIAS_PER_ADDR*BW_PER_PARAM-1:0]   conv2_b [0: 4-1];
reg [784*BW_PER_PARAM-1:0] fc1_w [0:500-1];
reg [BW_PER_PARAM-1:0]     fc1_b [0:500-1];
reg [500*BW_PER_PARAM-1:0] fc2_w [0: 10-1];
reg [BW_PER_PARAM-1:0]     fc2_b [0: 10-1];

reg [ACT_PER_ADDR*BW_PER_ACT-1:0] unshuffle_ans_a0 [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] unshuffle_ans_a1 [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] unshuffle_ans_a2 [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] unshuffle_ans_a3 [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] conv1_ans_b0     [0:256-1]; //totally 256 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] conv1_ans_b1     [0:256-1]; //totally 256 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] conv1_ans_b2     [0:256-1]; //totally 256 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] conv1_ans_b3     [0:256-1]; //totally 256 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] residue_ans_c0   [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] residue_ans_c1   [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] residue_ans_c2   [0: 64-1]; //totally  64 addresses
reg [ACT_PER_ADDR*BW_PER_ACT-1:0] residue_ans_c3   [0: 64-1]; //totally  64 addresses
 

integer load_idx;
initial begin
    //load parameters data
    $readmemb("parameter/conv1_weight.dat", conv1_w);
    $readmemb("parameter/conv1_bias.dat"  , conv1_b);
    $readmemb("parameter/conv2_weight.dat", conv2_w);
    $readmemb("parameter/conv2_bias.dat"  , conv2_b);
    $readmemb("parameter/fc1_weight.dat"  , fc1_w  );
    $readmemb("parameter/fc1_bias.dat"    , fc1_b  );
    $readmemb("parameter/fc2_weight.dat"  , fc2_w  );
    $readmemb("parameter/fc2_bias.dat"    , fc2_b  );

    //load golden data
    // `ifdef Check_SRAM_A_without_pad
    //     $readmemb("golden/unshuffle_a0_gold.dat", unshuffle_ans_a0);
    //     $readmemb("golden/unshuffle_a1_gold.dat", unshuffle_ans_a1);
    //     $readmemb("golden/unshuffle_a2_gold.dat", unshuffle_ans_a2);
    //     $readmemb("golden/unshuffle_a3_gold.dat", unshuffle_ans_a3);
    // `else
    //     $readmemb("golden/unshuffle_a0_pad_gold.dat", unshuffle_ans_a0);
    //     $readmemb("golden/unshuffle_a1_pad_gold.dat", unshuffle_ans_a1);
    //     $readmemb("golden/unshuffle_a2_pad_gold.dat", unshuffle_ans_a2);
    //     $readmemb("golden/unshuffle_a3_pad_gold.dat", unshuffle_ans_a3);
    // `endif
    // `ifdef Check_SRAM_B_without_pad
    //     $readmemb("golden/conv1_b0_gold.dat", conv1_ans_b0);
    //     $readmemb("golden/conv1_b1_gold.dat", conv1_ans_b1);
    //     $readmemb("golden/conv1_b2_gold.dat", conv1_ans_b2);
    //     $readmemb("golden/conv1_b3_gold.dat", conv1_ans_b3);
    // `else
    //     $readmemb("golden/conv1_b0_pad_gold.dat", conv1_ans_b0);
    //     $readmemb("golden/conv1_b1_pad_gold.dat", conv1_ans_b1);
    //     $readmemb("golden/conv1_b2_pad_gold.dat", conv1_ans_b2);
    //     $readmemb("golden/conv1_b3_pad_gold.dat", conv1_ans_b3);
    // `endif
    $readmemb("golden/res_c0_gold.dat", residue_ans_c0);
    $readmemb("golden/res_c1_gold.dat", residue_ans_c1);
    $readmemb("golden/res_c2_gold.dat", residue_ans_c2);
    $readmemb("golden/res_c3_gold.dat", residue_ans_c3);

    //store weights into sram
    for(load_idx=0; load_idx<64; load_idx=load_idx+1) begin
        sram_128x36b_weight.load_param(load_idx, conv1_w[load_idx]);
    end
    for(load_idx=0; load_idx<64; load_idx=load_idx+1) begin
        sram_128x36b_weight.load_param(load_idx+64, conv2_w[load_idx]);
    end

    //store biases into sram
    for(load_idx=0; load_idx<16; load_idx=load_idx+1) begin
        sram_20x4b_bias.load_param(load_idx, conv1_b[load_idx]);
    end
    for(load_idx=0; load_idx<4; load_idx=load_idx+1) begin
        sram_20x4b_bias.load_param(load_idx+16, conv2_b[load_idx]);
    end
end

//========== system reset ==========//
initial begin
    clk   = 0;
    srstn = 1;
end
always #(`CYCLE/2) clk = ~clk;

initial begin
    #(`CYCLE*`END_CYCLE) $finish;
end


//========== Pattern feeder ==========//
reg [BW_PER_ACT-1:0] mem_img [0:`PIXEL_NUM-1];
integer pat_no, px_idx;
integer sram_ch, sram_i, sram_j, sram_idx;
integer cycle_cnt, error_cnt;
reg [3:0] match;

initial begin
    for(pat_no=`PAT_START_NO; pat_no<=`PAT_END_NO; pat_no=pat_no+1) begin
        // load bmp into mem_img
        bmp2reg(pat_no);

        // display current bmp image
        $display("\ncurrent image: test_%04d.bmp", pat_no);
        display_reg;

        px_idx = 0;
        start_pulse = 1'b0;
        input_valid = 1'b0;
        
        @(negedge clk);
        srstn = 1'b0;
        #(`CYCLE*4);

        @(negedge clk);
        srstn = 1'b1;
        start_pulse = 1'b1;
        cycle_cnt = 0;

        @(negedge clk);
        start_pulse = 1'b0;

        while(!finish_pulse) begin
            @(negedge clk);
            cycle_cnt = cycle_cnt+1;
            if(!busy && px_idx<`PIXEL_NUM) begin
                input_data = mem_img[px_idx];
                input_valid = 1'b1;
                px_idx = px_idx+1;
            end
            else begin
                input_data  = 'd0;
                input_valid = 'b0;
            end
        end
        #(`CYCLE*4);

        // //========== Check Unshuffle Result in SRAM A ==========//
        // error_cnt = 0;
        // $display("\n===================================================");
        // $display("Check your data in SRAM A..");
        // for(sram_ch=0; sram_ch<4; sram_ch=sram_ch+1) begin
        //     for(sram_i=0; sram_i<4; sram_i=sram_i+1) begin
        //         for(sram_j=0; sram_j<4; sram_j=sram_j+1) begin
        //             sram_idx = sram_ch*16 + sram_i*4 + sram_j;
        //             match = {(sram_256x32b_a3.mem[sram_idx]===unshuffle_ans_a3[sram_idx]), (sram_256x32b_a2.mem[sram_idx]===unshuffle_ans_a2[sram_idx]), 
        //                         (sram_256x32b_a1.mem[sram_idx]===unshuffle_ans_a1[sram_idx]), (sram_256x32b_a0.mem[sram_idx]===unshuffle_ans_a0[sram_idx])};
        //             `ifdef Check_SRAM_A_without_pad
        //                 if(sram_i==3 & sram_j==3)begin
        //                     if(~match[0])begin
        //                         $display("ADDR[%02d] SRAM_a0         : %x                            !== Golden Answer: %x", sram_idx, sram_256x32b_a0.mem[sram_idx], unshuffle_ans_a0[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //                 else if(sram_i==3)begin
        //                     if(~match[0] | ~match[1])begin
        //                         $display("ADDR[%02d] SRAM_a0_a1      : %x_%x                   !== Golden Answer: %x_%x", sram_idx, sram_256x32b_a0.mem[sram_idx], sram_256x32b_a1.mem[sram_idx], unshuffle_ans_a0[sram_idx], unshuffle_ans_a1[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //                 else if(sram_j==3)begin
        //                     if(~match[0] | ~match[2])begin
        //                         $display("ADDR[%02d] SRAM_a0   _a2   : %x         _%x          !== Golden Answer: %x         _%x", sram_idx, sram_256x32b_a0.mem[sram_idx], sram_256x32b_a2.mem[sram_idx], unshuffle_ans_a0[sram_idx], unshuffle_ans_a2[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //                 else begin
        //                     if(~(&match))begin
        //                         $display("ADDR[%02d] SRAM_a0_a1_a2_a3: %x_%x_%x_%x !== Golden Answer: %x_%x_%x_%x", sram_idx, 
        //                         sram_256x32b_a0.mem[sram_idx], sram_256x32b_a1.mem[sram_idx], sram_256x32b_a2.mem[sram_idx], sram_256x32b_a3.mem[sram_idx], 
        //                         unshuffle_ans_a0[sram_idx], unshuffle_ans_a1[sram_idx], unshuffle_ans_a2[sram_idx], unshuffle_ans_a3[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //             `else // Check_SRAM_A_with_zero_pad (default)
        //                 if(~(&match))begin
        //                     $display("ADDR[%02d] SRAM_a0_a1_a2_a3: %x_%x_%x_%x !== Golden Answer: %x_%x_%x_%x", sram_idx, 
        //                     sram_256x32b_a0.mem[sram_idx], sram_256x32b_a1.mem[sram_idx], sram_256x32b_a2.mem[sram_idx], sram_256x32b_a3.mem[sram_idx], 
        //                     unshuffle_ans_a0[sram_idx], unshuffle_ans_a1[sram_idx], unshuffle_ans_a2[sram_idx], unshuffle_ans_a3[sram_idx]);
        //                     error_cnt = error_cnt + 1;
        //                 end
        //             `endif
        //         end
        //     end
        // end
        // if(error_cnt)begin
        //     $display("There are total %3d errors in your SRAM_A, so sad (つд⊂)", error_cnt);
        //     $display("===================================================\n");
        //     $finish;
        // end
        // else begin
        //     $display("SRAM_A Passed!!! Your Unshuffle is correct!!! o(^▽^)o");
        // end

        // //========== Check CONV1 Result in SRAM B ==========//
        // error_cnt = 0;
        // $display("\n===================================================");
        // $display("Check your data in SRAM B..");
        // for(sram_ch=0; sram_ch<16; sram_ch=sram_ch+1) begin
        //     for(sram_i=0; sram_i<4; sram_i=sram_i+1) begin
        //         for(sram_j=0; sram_j<4; sram_j=sram_j+1) begin
        //             sram_idx = sram_ch*16 + sram_i*4 + sram_j;
        //             match = {(sram_256x32b_b3.mem[sram_idx]===conv1_ans_b3[sram_idx]), (sram_256x32b_b2.mem[sram_idx]===conv1_ans_b2[sram_idx]), 
        //                         (sram_256x32b_b1.mem[sram_idx]===conv1_ans_b1[sram_idx]), (sram_256x32b_b0.mem[sram_idx]===conv1_ans_b0[sram_idx])};
        //             `ifdef Check_SRAM_B_without_pad
        //                 if(sram_i==3 & sram_j==3)begin
        //                     if(~match[0])begin
        //                         $display("ADDR[%03d] SRAM_b0         : %x                            !== Golden Answer: %x", sram_idx, sram_256x32b_b0.mem[sram_idx], conv1_ans_b0[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //                 else if(sram_i==3)begin
        //                     if(~match[0] | ~match[1])begin
        //                         $display("ADDR[%03d] SRAM_b0_b1      : %x_%x                   !== Golden Answer: %x_%x", sram_idx, sram_256x32b_b0.mem[sram_idx], sram_256x32b_b1.mem[sram_idx], conv1_ans_b0[sram_idx], conv1_ans_b1[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //                 else if(sram_j==3)begin
        //                     if(~match[0] | ~match[2])begin
        //                         $display("ADDR[%03d] SRAM_b0   _b2   : %x         _%x          !== Golden Answer: %x         _%x", sram_idx, sram_256x32b_b0.mem[sram_idx], sram_256x32b_b2.mem[sram_idx], conv1_ans_b0[sram_idx], conv1_ans_b2[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //                 else begin
        //                     if(~(&match))begin
        //                         $display("ADDR[%03d] SRAM_b0_b1_b2_b3: %x_%x_%x_%x !== Golden Answer: %x_%x_%x_%x", sram_idx, 
        //                         sram_256x32b_b0.mem[sram_idx], sram_256x32b_b1.mem[sram_idx], sram_256x32b_b2.mem[sram_idx], sram_256x32b_b3.mem[sram_idx], 
        //                         conv1_ans_b0[sram_idx], conv1_ans_b1[sram_idx], conv1_ans_b2[sram_idx], conv1_ans_b3[sram_idx]);
        //                         error_cnt = error_cnt + 1;
        //                     end
        //                 end
        //             `else // Check_SRAM_B_with_zero_pad (default)
        //                 if(~(&match))begin
        //                     $display("ADDR[%03d] SRAM_b0_b1_b2_b3: %x_%x_%x_%x !== Golden Answer: %x_%x_%x_%x", sram_idx, 
        //                     sram_256x32b_b0.mem[sram_idx], sram_256x32b_b1.mem[sram_idx], sram_256x32b_b2.mem[sram_idx], sram_256x32b_b3.mem[sram_idx], 
        //                     conv1_ans_b0[sram_idx], conv1_ans_b1[sram_idx], conv1_ans_b2[sram_idx], conv1_ans_b3[sram_idx]);
        //                     error_cnt = error_cnt + 1;
        //                 end
        //             `endif
        //         end
        //     end
        // end
        // if(error_cnt)begin
        //     $display("There are total %3d errors in your SRAM_B, so sad (つд⊂)", error_cnt);
        //     $display("===================================================\n");
        //     $finish;
        // end
        // else begin
        //     $display("SRAM_B Passed!!! Your CONV1 is correct!!! o(^▽^)o");
        // end

        //========== Check CONV2+Residue Result in SRAM C ==========//
        error_cnt = 0;
        $display("\n===================================================");
        $display("Check your data in SRAM C..");
        for(sram_ch=0; sram_ch<4; sram_ch=sram_ch+1) begin
            for(sram_i=0; sram_i<4; sram_i=sram_i+1) begin
                for(sram_j=0; sram_j<4; sram_j=sram_j+1) begin
                    sram_idx = sram_ch*16 + sram_i*4 + sram_j;
                    match = {(sram_256x32b_c3.mem[sram_idx]===residue_ans_c3[sram_idx]), (sram_256x32b_c2.mem[sram_idx]===residue_ans_c2[sram_idx]), 
                             (sram_256x32b_c1.mem[sram_idx]===residue_ans_c1[sram_idx]), (sram_256x32b_c0.mem[sram_idx]===residue_ans_c0[sram_idx])};
                    if(sram_i==3 & sram_j==3)begin
                        if(~match[0])begin
                            $display("ADDR[%02d] SRAM_c0         : %x                            !== Golden Answer: %x", sram_idx, sram_256x32b_c0.mem[sram_idx], residue_ans_c0[sram_idx]);
                            error_cnt = error_cnt + 1;
                        end
                    end
                    else if(sram_i==3)begin
                        if(~match[0] | ~match[1])begin
                            $display("ADDR[%02d] SRAM_c0_c1      : %x_%x                   !== Golden Answer: %x_%x", sram_idx, sram_256x32b_c0.mem[sram_idx], sram_256x32b_c1.mem[sram_idx], residue_ans_c0[sram_idx], residue_ans_c1[sram_idx]);
                            error_cnt = error_cnt + 1;
                        end
                    end
                    else if(sram_j==3)begin
                        if(~match[0] | ~match[2])begin
                            $display("ADDR[%02d] SRAM_c0   _c2   : %x         _%x          !== Golden Answer: %x         _%x", sram_idx, sram_256x32b_c0.mem[sram_idx], sram_256x32b_c2.mem[sram_idx], residue_ans_c0[sram_idx], residue_ans_c2[sram_idx]);
                            error_cnt = error_cnt + 1;
                        end
                    end
                    else begin
                        if(~(&match))begin
                            $display("ADDR[%02d] SRAM_c0_c1_c2_c3: %x_%x_%x_%x !== Golden Answer: %x_%x_%x_%x", sram_idx, 
                            sram_256x32b_c0.mem[sram_idx], sram_256x32b_c1.mem[sram_idx], sram_256x32b_c2.mem[sram_idx], sram_256x32b_c3.mem[sram_idx], 
                            residue_ans_c0[sram_idx], residue_ans_c1[sram_idx], residue_ans_c2[sram_idx], residue_ans_c3[sram_idx]);
                            error_cnt = error_cnt + 1;
                        end
                    end
                end
            end
        end
        if(error_cnt)begin
            $display("There are total %3d errors in your SRAM_C, so sad (つд⊂)", error_cnt);
            $display("===================================================\n");
            $finish;
        end
        else begin
            $display("SRAM_C Passed!!! Your CONV2 + Residue is correct!!! o(^▽^)o");
        end

    end

    FC1_layer;
    FC2_layer;
    if(error_cnt==0)begin
        $display("\n===================================================");
        $display("Congratulations! Simulation is successfully passed!");
        $display("Total cycle count = %d", cycle_cnt);
        $display("===================================================\n");
    end
    $finish;
end



task bmp2reg(
    input [31:0] pat_no
);
    reg [23*8-1:0] bmp_filename;
    integer this_i, this_j;
    integer file_in;
    reg [7:0] char_in;

    begin
        bmp_filename = "../../bmp/test_0000.bmp";
        bmp_filename[8*8-1:7*8] = (pat_no/1000)+48;
        bmp_filename[7*8-1:6*8] = (pat_no%1000)/100+48;
        bmp_filename[6*8-1:5*8] = (pat_no%100)/10+48;
        bmp_filename[5*8-1:4*8] = pat_no%10+48;

        file_in = $fopen(bmp_filename, "rb");

        // skip the header
        for(this_i=0; this_i<1078; this_i=this_i+1)
           char_in = $fgetc(file_in);

        for(this_i=27; this_i>=0; this_i=this_i-1) begin
            for(this_j=0; this_j<28; this_j=this_j+1) begin //four-byte alignment
                char_in = $fgetc(file_in);
                if(char_in <= 127)  
                    mem_img[this_i*28 + this_j] = char_in;
                else 
                    mem_img[this_i*28 + this_j] = 127;
            end
        end
    end

endtask

//display the image in 28x28 reg
task display_reg;
    
    integer this_i, this_j;

    begin
        for(this_i=0; this_i<28; this_i=this_i+1) begin
            for(this_j=0; this_j<28; this_j=this_j+1) begin
               $write("%d", mem_img[this_i*28 + this_j]);
            end
            $write("\n");
        end
    end

endtask


integer fc1_ch, fc1_i, fc1_j, fc1_idx;
integer i, j;
reg [BW_PER_ACT-1:0] flatten [0:784-1];
reg signed [BW_PER_ACT-1:0] fc1_out [0:784-1];
reg signed [BW_PER_ACT-1:0] fc2_out [0:9];
reg signed [BW_PER_ACT-1:0] tmp_big;
reg [BW_PER_ACT-1:0] ans;
reg signed [31:0] tmp_sum;

task FC1_layer;
    begin
        //flatten
        for(fc1_ch=0; fc1_ch<4; fc1_ch=fc1_ch+1) begin
            for(fc1_i=0; fc1_i<4; fc1_i=fc1_i+1) begin
                for(fc1_j=0; fc1_j<4; fc1_j=fc1_j+1) begin
                    sram_idx = fc1_ch*16 + fc1_i*4 + fc1_j;
                    fc1_idx = fc1_ch*14*14 + fc1_i*4*14 + fc1_j*4;
                    flatten[fc1_idx   ] = sram_256x32b_c0.mem[sram_idx][31:24];
                    flatten[fc1_idx+1 ] = sram_256x32b_c0.mem[sram_idx][23:16];
                    flatten[fc1_idx+14] = sram_256x32b_c0.mem[sram_idx][15: 8];
                    flatten[fc1_idx+15] = sram_256x32b_c0.mem[sram_idx][ 7: 0];
                    if(fc1_j!=3)begin
                        flatten[fc1_idx+2 ] = sram_256x32b_c1.mem[sram_idx][31:24];
                        flatten[fc1_idx+3 ] = sram_256x32b_c1.mem[sram_idx][23:16];
                        flatten[fc1_idx+16] = sram_256x32b_c1.mem[sram_idx][15: 8];
                        flatten[fc1_idx+17] = sram_256x32b_c1.mem[sram_idx][ 7: 0];
                    end
                    if(fc1_i!=3)begin
                        flatten[fc1_idx+28] = sram_256x32b_c2.mem[sram_idx][31:24];
                        flatten[fc1_idx+29] = sram_256x32b_c2.mem[sram_idx][23:16];
                        flatten[fc1_idx+42] = sram_256x32b_c2.mem[sram_idx][15: 8];
                        flatten[fc1_idx+43] = sram_256x32b_c2.mem[sram_idx][ 7: 0];
                    end
                    if(fc1_i!=3 & fc1_j!=3)begin
                        flatten[fc1_idx+30] = sram_256x32b_c3.mem[sram_idx][31:24];
                        flatten[fc1_idx+31] = sram_256x32b_c3.mem[sram_idx][23:16];
                        flatten[fc1_idx+44] = sram_256x32b_c3.mem[sram_idx][15: 8];
                        flatten[fc1_idx+45] = sram_256x32b_c3.mem[sram_idx][ 7: 0];
                    end
                end
            end
        end
        
        // calculate for fc1_out
        for(i=0; i<500; i=i+1) begin
            tmp_sum = 0;
            for(j=0; j<784; j=j+1) begin
                tmp_sum = tmp_sum + $signed(flatten[j]) * $signed(fc1_w[i][(784-1-j)*4 +: 4]);
            end
            tmp_sum = tmp_sum + $signed(fc1_b[i]) * (1 << 3);
            tmp_sum = tmp_sum + (1 << 6);
            tmp_sum = tmp_sum >>> 7;
            if(tmp_sum >= 127) 
                fc1_out[i] = 127;
            else if(tmp_sum < 0) 
                fc1_out[i] = 0;
            else 
                fc1_out[i] = tmp_sum[7:0];
        end
    end
endtask

task FC2_layer;
    begin
        //calculate for fc2_out
        for(i=0; i<10; i=i+1) begin
            tmp_sum = 0;
            for(j=0; j<500; j=j+1) begin
                tmp_sum = tmp_sum + $signed(fc1_out[j]) * $signed(fc2_w[i][(500-1-j)*4 +: 4]);
            end
            tmp_sum = tmp_sum + $signed(fc2_b[i]) * (1 << 2);
            tmp_sum = tmp_sum + (1 << 4);
            tmp_sum = tmp_sum >>> 5;
            if(tmp_sum >= 127) 
                fc2_out[i] = 127;
            else if(tmp_sum < -128) 
                fc2_out[i] = -128;
            else 
                fc2_out[i] = tmp_sum[7:0];
        end
        $write("\n------Show the output of FC2------\n");
        tmp_big = 0;
        ans = 0;
        for(i=0; i<10; i=i+1) begin
            $write("%d ", fc2_out[i]);
            ans = (tmp_big >= fc2_out[i]) ? ans : i[7:0];
            tmp_big = (tmp_big >= fc2_out[i]) ? tmp_big : fc2_out[i];
        end
        $write("\nAnd the recognition result is : %d\n", ans);
    end
endtask

endmodule
