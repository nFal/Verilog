module tb_top ();


reg clk;
reg res;

wire [1:0] pc_mod;
wire [7:0] pc_inp;
wire [7:0] pc_out;

wire [7:0] AP_inp;
wire [7:0] AP_out;

wire [7:0] aA_inp;
wire [7:0] aA_out;

wire [7:0] aB_inp;
wire [7:0] aB_out;

 
wire [7:0] O_inp;
wire [7:0] O_out;

wire       ram_ope;
wire       ram_ctl;
wire       ram_ena;
wire [7:0] ram_adr;
wire [7:0] ram_dat;

wire [7:0] sub_out;
wire       sub_val;

wire [2:0] C_adr_reg_sel;
wire       C_adr_dir;
wire [2:0] C_dat_reg_sel;
wire       C_dat_dir;

PC_reg   PC(clk,res,pc_mod,pc_inp,pc_out);

gen_reg   RegAP(clk,res,AP_inp,AP_out);
gen_reg   RegaA(clk,res,aA_inp,aA_out);
gen_reg   RegaB(clk,res,aB_inp,aB_out);
//gen_reg   RegO(clk,res,O_inp,O_out);

RAM       mem(ram_ope,ram_ctl,ram_ena,ram_adr,ram_dat);
subtract8 Sub8(aA_out,aB_out,sub_out,sub_val);



reg_sw_with_bimux DATmux ( 
                           .reg0(AP_inp),
                           .reg1(aA_inp),
                           .reg2(aB_inp),
                           .reg3(pc_inp),
                           .sel(C_dat_reg_sel),
                           .dir(C_dat_dir),
                           .out(ram_dat)
);
                         
reg_sw_with_bimux ADRmux (
                          .reg0(pc_out),
                          .reg1(AP_out),
                          .sel(C_adr_reg_sel),
                          .dir(C_adr_dir),
                          .out(ram_adr)
);

control_unit CU(clk,res,C_adr_reg_sel,C_adr_dir,C_dat_reg_sel,C_dat_dir,ram_ope,ram_ctl,ram_ena,pc_mod,sub_out,sub_val);

initial begin
  $dumpfile("tb_top.vcd");
  $dumpvars(0,tb_top);
  #500 $finish;
end

endmodule


























