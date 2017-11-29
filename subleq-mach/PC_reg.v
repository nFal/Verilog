module PC_reg (
                input        clk,
                input        res,  //active low
                input  [1:0] mod,  // 0 = hold; 1 = increment ; 2 = copy
                input  [7:0] inp,
                output [7:0] out
);

reg [7:0] out;

always @(posedge clk or negedge res) begin
  if (~res) begin
    out <= 0;
  end
  else begin
    if (mod==1) begin
      out <= out + 1;
    end
    else if (mod==2) begin
      out <= inp;
    end
  end
end
endmodule

