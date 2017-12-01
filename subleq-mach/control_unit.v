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

















endmodule


