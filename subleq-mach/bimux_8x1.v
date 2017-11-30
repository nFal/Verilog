module bimux_8x1 (
                   input       dir, //0 = normal, 1 = reverse
                   input [2:0] sel,
                   inout [7:0] inp,
                   inout       out
);

reg [7:0] inp1;
always @(sel or posedge dir or out) begin
  if (dir==1) begin
    inp1[sel]=out;
  end
end



assign out = (dir==0)? inp[sel] : 8'bZZZZZZZZ;
assign inp = (dir==1)? inp1 : 8'bZZZZZZZZ;

endmodule
