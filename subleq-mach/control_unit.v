module control_unit (
                      input        clk,
                      input        res,

                      output [2:0] adr_reg_sel,
                      output       adr_dir,
                      
                      output [2:0] dat_reg_sel,
                      output       dat_dir,

                      output       ram_ope,
                      output       ram_ctl,
                      output       ram_ena,
                                           
                      output [1:0] pc_mod,

                      input  [7:0] sub_out,
                      input        sub_val
);


reg [3:0] counter;

reg [2:0] adr_reg_sel;
reg       adr_dir;
reg [2:0] dat_reg_sel;
reg       dat_dir;
reg       ram_ope;
reg       ram_ctl;
reg       ram_ena;                     
//reg [1:0] pc_mod;


always @(posedge clk or negedge res) begin
  if (res==0)
    counter=0;
  else
    counter<= counter+1;
end
always @(posedge clk or negedge res) begin

  if (res==0) begin
    //counter=0;
    ram_ena=0;
    ram_ope=1;
    ram_ctl=1;
    dat_reg_sel=0;
    dat_dir=1;
    adr_reg_sel=0;
    adr_dir=0;
    //pc_mod=0;
  end
  else begin
    if (counter==1) begin
      adr_reg_sel=0;
      dat_reg_sel=0;
      adr_dir=0;
      dat_dir=1;
      ram_ope=0;
      ram_ctl=1;
      //pc_mod=0;
    end
    else if (counter==3) begin
      adr_reg_sel=1;
      dat_reg_sel=1;
      adr_dir=0;
      dat_dir=1;
      ram_ope=0;
      ram_ctl=1;
      //pc_mod=1;
    end
    else if (counter==4) begin
      //pc_mod=0;
    end
    else if (counter==5) begin
      adr_reg_sel=0;
      dat_reg_sel=0;
      adr_dir=0;
      dat_dir=1;
      ram_ope=0;
      ram_ctl=1;
      //pc_mod=0;
    end
    else if (counter==7) begin
      adr_reg_sel=1;
      dat_reg_sel=2;
      adr_dir=0;
      dat_dir=1;
      ram_ope=0;
      ram_ctl=1;
      //pc_mod=1;
    end
    else if(counter==9) begin
      adr_reg_sel=1;
      dat_reg_sel=4;
      adr_dir=0;
      dat_dir=0;
      ram_ope=1;
      ram_ctl=0;
      
      //if (sub_out[7]==0) begin
        




    end
  end



end
assign pc_mod = (counter==3)? 1:0;

endmodule


