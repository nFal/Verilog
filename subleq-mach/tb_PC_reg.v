module tb_PC_reg();


reg clk,res;
reg [1:0] mod;
wire [7:0] inp;
wire [7:0] out;



initial begin 
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin
  res = 1;
  #3 res = 0;
  #1 res = 1;
end

initial begin
  mod = 1;
end


PC_reg DUT(clk,res,mod,inp,out);

initial begin
  $dumpfile("PC_reg.vcd");
  $dumpvars(0,DUT);
  #500 $finish;
end


endmodule
