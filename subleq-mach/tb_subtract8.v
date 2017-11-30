module tb_subtract8 ();

reg [7:0] ina_tb;
reg [7:0] inb_tb;
wire [7:0] out_tb;
wire val_tb;



initial begin

ina_tb=0;
inb_tb=0;

#20 inb_tb=-123;
#10 ina_tb=125;

#20 inb_tb=-9;
#10 ina_tb=-110;

#20 inb_tb=0;
#10 ina_tb=125;

#20 inb_tb=25;
#10 ina_tb=12;


#20 inb_tb=120;
#10 ina_tb=125;


#20 inb_tb=12;
#10 ina_tb=15;


#20 inb_tb=12;
#10 ina_tb=-126;


#20 inb_tb=125;
#10 ina_tb=-125;

end

subtract8 DUT(ina_tb,inb_tb,out_tb,val_tb);
initial begin
  $dumpfile("subtract8.vcd");
  $dumpvars(0,DUT);
  #500 $finish;
end





endmodule
