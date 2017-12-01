module tb_bimux_8x1 ();


reg        dir_tb;
reg  [2:0] sel_tb;
reg  [7:0] winp;
reg        wout;
wire [7:0] inp_tb;
wire       out_tb;


assign inp_tb = (dir_tb==0) ? winp : 8'bZZZZZZZZ;
assign out_tb = (dir_tb==1) ? wout : 8'bZZZZZZZZ;


initial begin 
  dir_tb=0;
  sel_tb=0;
  wout=0;
  winp=0;

end

initial begin
  #20 winp=1;
  #40 sel_tb=2;
  #10 wout=1;
  #20 dir_tb=1;


end



bimux_8x1 DUT(dir_tb,sel_tb,inp_tb,out_tb);

initial begin
  $dumpfile("bimux_8x1.vcd");
  $dumpvars(0,tb_bimux_8x1);
  #500 $finish;
end


endmodule
