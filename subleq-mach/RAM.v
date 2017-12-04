module RAM (
             input        ope,  //0 = output enable; 1 = disable
	           input        ctl,  //0 = write; 1 = read
             input        ena,  //0 = enable; 1 = disable
             input  [7:0] adr,
             inout  [7:0] dat
);


reg [7:0] mem[0:255];




assign dat = (ope==1'b1 | ctl==1'b0 | ena==1'b1) ? 
             8'bZZZZZZZZ : mem[adr];

always @(ctl,ena) begin
  @(negedge ctl) begin
    if (ena==1'b0) begin
      mem[adr] <= dat;
    end
  end
end


initial begin
  mem[0]=10;
  mem[1]=12;
  mem[2]=3;
  mem[3]=12;
  mem[4]=11;
  mem[5]=6;
  mem[6]=12;
  mem[7]=12;
  mem[8]=25;

  mem[10]=3;
  mem[11]=2;
  mem[12]=0;

end


endmodule
