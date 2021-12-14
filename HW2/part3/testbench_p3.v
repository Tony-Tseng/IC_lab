`timescale 1ns/1ps

module hw2_testbench;
parameter BW=32;
parameter CYCLE=3;
parameter N=3600;
// Inputs
reg clk;
reg rst_n;
reg [BW-1:0] phase;
reg valid_in;
reg [2:0] mode;
wire pop;
wire valid_out;
wire [BW-1:0] result;
reg [15:0] cnt, cnt_n;
integer i,j,k;
integer cycle_cnt;

`define SDFFILE "../../syn_ref/netlist/cordic_engine_syn.sdf"
`ifdef GATESIM
initial $sdf_annotate(`SDFFILE, U0);
cordic_engine 
U0
(
    .clk(clk),
    .rst_n(rst_n),
    .phase(phase),
    .mode(mode),
    .pop(pop),
    .valid_in(valid_in),
    .valid_out(valid_out),
    .result(result)
);
`else
cordic_engine
#( 
    .IO_BW(BW)
)   
U0
(
    .clk(clk),
    .rst_n(rst_n),
    .phase(phase),
    .mode(mode),
    .pop(pop),
    .valid_in(valid_in),
    .valid_out(valid_out),
    .result(result)
);
`endif

initial begin
    clk = 1;
    rst_n = 1;
    #(CYCLE) rst_n = 0;
    #(CYCLE) rst_n = 1;  
    #(CYCLE*100000) $finish;
end

initial begin
    cycle_cnt=0;

    @(negedge clk);
    while(1) begin
        cycle_cnt = cycle_cnt+1;
        @(negedge clk);
    end
end

always #(CYCLE/2) clk = ~clk;

reg [71:0] pattern [0:N-1];

initial begin
    $readmemh("part3.txt",pattern);
    phase = 0;
    valid_in = 0;
    mode = 0;
    cnt=0;
    k=0;
    wait(rst_n==0);
    wait(rst_n==1);
    #(CYCLE*2);
    while(1)    begin
        @(negedge clk); 
        if(!pop && k<N) begin 
            phase = pattern[k][63:32];
            mode = pattern[k][67:64];
            valid_in=pattern[k][71:68];
            k=k+1;
        end
    end
end


initial begin
    i=0;
    wait(rst_n==0);
    wait(rst_n==1);
    #(CYCLE*2);
    for(j=0;j<N;j=j+1) begin
        @(negedge clk);
        if(pattern[j][71:68] == 1 ) begin
            if(valid_out === 1 || valid_out ===1'bx) begin
                if($signed(result-pattern[j][31:0])<-5 || $signed(result-pattern[j][31:0])>5  || result===32'bx) begin
                    $display("**** phase = %x mode = %x is wrong, your result = %x, golden = %x ****\n",pattern[j][63:32],pattern[j][67:64],result,pattern[j][31:0]);
                    i=i+1;
                    $finish;
                end
            end
            else begin
                j=j-1;
            end
        end       
    end 
    if(i==0) begin
        $display("Your cordic_engine is correct\n");
        $display("Total cycle count C = %d.", cycle_cnt);
        $finish;
    end
    else begin
        $display("Something wrong in your code\n");
    end
end


initial begin
   $fsdbDumpfile("hw2_p3.fsdb");
   //$fsdbDumpvars("+mda");
   $fsdbDumpvars;
end

endmodule

