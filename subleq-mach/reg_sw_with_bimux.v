module reg_sw_with_bimux (
                           inout [7:0] reg0,
                           inout [7:0] reg1,
                           inout [7:0] reg2,
                           inout [7:0] reg3,
                           inout [7:0] reg4,
                           inout [7:0] reg5,
                           inout [7:0] reg6,
                           inout [7:0] reg7,

                           input [2:0] sel,
                           input       dir,

                           inout [7:0] out
);

bimux_8x1  bmux0(dir,sel,{reg7[0],reg6[0],reg5[0],reg4[0],reg3[0],reg2[0],reg1[0],reg0[0]},out[0]);
bimux_8x1  bmux1(dir,sel,{reg7[1],reg6[1],reg5[1],reg4[1],reg3[1],reg2[1],reg1[1],reg0[1]},out[1]);
bimux_8x1  bmux2(dir,sel,{reg7[2],reg6[2],reg5[2],reg4[2],reg3[2],reg2[2],reg1[2],reg0[2]},out[2]);
bimux_8x1  bmux3(dir,sel,{reg7[3],reg6[3],reg5[3],reg4[3],reg3[3],reg2[3],reg1[3],reg0[3]},out[3]);
bimux_8x1  bmux4(dir,sel,{reg7[4],reg6[4],reg5[4],reg4[4],reg3[4],reg2[4],reg1[4],reg0[4]},out[4]);
bimux_8x1  bmux5(dir,sel,{reg7[5],reg6[5],reg5[5],reg4[5],reg3[5],reg2[5],reg1[5],reg0[5]},out[5]);
bimux_8x1  bmux6(dir,sel,{reg7[6],reg6[6],reg5[6],reg4[6],reg3[6],reg2[6],reg1[6],reg0[6]},out[6]);
bimux_8x1  bmux7(dir,sel,{reg7[7],reg6[7],reg5[7],reg4[7],reg3[7],reg2[7],reg1[7],reg0[7]},out[7]);

endmodule
