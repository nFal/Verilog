module RAM (
             input        ctl,  //0 = write; 1 = read
             input        ena,  //1 = enable; 0 = disable
             input  [7:0] adr,
             inout  [7:0] dat
);


reg [7:0] mem[0:255];
reg [7:0] dt;

always @(adr or ctl or ena) begin
  if (ena==1) begin
    if (ctl)
      dt=mem[adr];
    else 
      mem[adr]=dat;
  end
end

assign dat = (ctl==1) ? dt : 8'hZZ;

endmodule
