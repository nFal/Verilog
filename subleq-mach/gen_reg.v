module gen_reg (
                 input         clk,
                 input         res,
                 input  [7:0]  inp,
                 output [7:0]  out
);

reg [7:0] out;

always @(posedge clk or negedge res) begin
  if (~res) begin
    out <= 0;
  end
  else begin
    out <= inp;
  end
end

endmodule

