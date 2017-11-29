module bimux_8x1 (
                   input       dir, //0 = normal, 1 = reverse
                   input [2:0] sel,
                   inout [7:0] inp,
                   inout       out
);

reg out1;
reg [7:0] inp1;

always @(sel or dir) begin
  if (dir==0) begin
    case (sel)
      0: out1 = inp[0];
      1: out1 = inp[1];
      2: out1 = inp[2];
      3: out1 = inp[3];
      4: out1 = inp[4];
      5: out1 = inp[5];
      6: out1 = inp[6];
      7: out1 = inp[7];
    endcase
  end
  else if (dir==1) begin
    case (sel)
      0: inp1[0] = out;
      1: inp1[1] = out;
      2: inp1[2] = out;
      3: inp1[3] = out;
      4: inp1[4] = out;
      5: inp1[5] = out;
      6: inp1[6] = out;
      7: inp1[7] = out;
    endcase
  end
end
assign out=out1;
assign inp=inp1;

endmodule
