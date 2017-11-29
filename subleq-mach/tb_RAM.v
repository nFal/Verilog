module tb_RAM ();

reg clk,ena,ctl;
reg [7:0] adr;
wire [7:0] dat_tb;
reg ope_tb;

reg [7:0] wdat;
assign dat_tb = wdat;


initial begin 
  clk = 1;
  forever #5 clk = ~clk;
end

initial begin
ena=1;
ctl=1;
ope_tb=1;
adr=0;
wdat=0;
end


initial begin
#10 ena=0; 

#5 ctl=1;
adr=8'h35;
wdat=8'h10;
#5 ctl=0;
#5 ctl=1;

#5 ctl=1;
ope_tb =0;

#25 adr=8'h50;
#10 adr=8'h60;
#10 adr=8'h35;

end


RAM DUT(ope_tb,ctl,ena,adr,dat_tb);


initial begin
  $dumpfile("RAM.vcd");
  $dumpvars(0,tb_RAM);
  #500 $finish;
end

endmodule
