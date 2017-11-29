module tb_RAM ();

reg clk,ena,ctl;
reg [7:0] adr;
wire [7:0] dat_tb;


reg [7:0] wdat;


assign dat_tb = (ctl==0)? wdat : 8'hZZ;


initial begin 
  clk = 1;
  forever #5 clk = ~clk;
end

initial begin
  ena = 0;
  #3 ena = 0;
  #1 ena = 1;
end



initial begin
  ctl=0;
  #10 adr=8'hFA;
  #10 wdat=8'hAE;
  #10 ctl=1;
  #10 adr=8'hFE;
  #50 adr=8'hFA;


/*  ctl=1;
  #10 adr=119;
  #10 dat=8'hAF;
  #20 ctl=0;
  #10 ctl=1;
  #10 adr=109;
  #20 ena=0;
  #20 adr=119;
  #10 ctl=1;
  #10 ena =1;
*/

end


RAM DUT(ctl,ena,adr,dat_tb);


initial begin
  $dumpfile("RAM.vcd");
  $dumpvars(0,tb_RAM);
  #500 $finish;
end

endmodule
