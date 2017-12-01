module tb_reg_sw_with_bimux ();

reg [2:0] sel_tb;
reg       dir_tb;

wire [7:0] reg0_tb;
wire [7:0] reg1_tb;
wire [7:0] reg2_tb;
wire [7:0] reg3_tb;
wire [7:0] reg4_tb;
wire [7:0] reg5_tb;
wire [7:0] reg6_tb;
wire [7:0] reg7_tb;

reg  [7:0] winp0;
reg  [7:0] winp1;
reg  [7:0] winp2;
reg  [7:0] winp3;
reg  [7:0] winp4;
reg  [7:0] winp5;
reg  [7:0] winp6;
reg  [7:0] winp7;

wire [7:0] out_tb;

reg  [7:0] wout;

assign reg0_tb = (dir_tb==0) ? winp0 : 8'bZZZZZZZZ;
assign reg1_tb = (dir_tb==0) ? winp1 : 8'bZZZZZZZZ;
assign reg2_tb = (dir_tb==0) ? winp2 : 8'bZZZZZZZZ;
assign reg3_tb = (dir_tb==0) ? winp3 : 8'bZZZZZZZZ;
assign reg4_tb = (dir_tb==0) ? winp4 : 8'bZZZZZZZZ;
assign reg5_tb = (dir_tb==0) ? winp5 : 8'bZZZZZZZZ;
assign reg6_tb = (dir_tb==0) ? winp6 : 8'bZZZZZZZZ;
assign reg7_tb = (dir_tb==0) ? winp7 : 8'bZZZZZZZZ;

assign out_tb  = (dir_tb==1) ? wout  : 8'bZZZZZZZZ;


initial begin
  sel_tb  = 0;
  dir_tb  = 0;
  winp0   = 0;
  winp1   = 0;
  winp2   = 0;
  winp3   = 0;
  winp4   = 0;
  winp5   = 0;
  winp6   = 0;
  winp7   = 0;

  wout    = 0;
end


initial begin
/*
  #20 winp2=8'hAE;
  #10 sel_tb = 2;
  #40 sel_tb = 4;

  #20 wout=8'hFA;
  #20 sel_tb=6;
  #20 dir_tb=1;
*/

  #20 wout = 8'hFD;
  #20 sel_tb=3;
  #20 dir_tb=1;
  
  #25 winp4 = 8'h30;
  #20 sel_tb=4;
  #25 dir_tb=0;


end




reg_sw_with_bimux DUT(reg0_tb,reg1_tb,reg2_tb,reg3_tb,reg4_tb,reg5_tb,reg6_tb,reg7_tb,sel_tb,dir_tb,out_tb);





initial begin
  $dumpfile("reg_sw_with_bimux.vcd");
  $dumpvars(0,tb_reg_sw_with_bimux);
  #500 $finish;
end












endmodule
