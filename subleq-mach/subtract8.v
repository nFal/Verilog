module subtract8 (
                   input  [7:0] ina, 
                   input  [7:0] inb,
                   output [7:0] out,
                   output       val //1=valid ; 0 = invalid
);




reg [7:0] out;
reg val;

always @(ina or inb) begin
  out = inb-ina;
  val = ~( ((ina[7]==0)&(inb[7]==1)&(out[7]==0)) | ((ina[7]==1)&(inb[7]==0)&(out[7]==1)) );
end

endmodule
