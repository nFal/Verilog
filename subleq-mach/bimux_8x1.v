module bimux_8x1 (
                   input       dir, //0 = normal, 1 = reverse
                   input [2:0] sel,
                   inout [7:0] inp,
                   inout       out
);

always @(sel or dir) begin
  if (dir==0) begin
    case (sel)
      0: out = inp[0];
      1: out = inp[1];
      2: out = inp[2];
      3: out = inp[3];
      4: out = inp[4];
      5: out = inp[5];
      6: out = inp[6];
      7: out = inp[7];
    endcase
  end
  else if (dir==1) begin
    case (sel)
      0: inp[0] = out;
      1: inp[1] = out;
      2: inp[2] = out;
      3: inp[3] = out;
      4: inp[4] = out;
      5: inp[5] = out;
      6: inp[6] = out;
      7: inp[7] = out;
    endcase
  end
end

endmodule
