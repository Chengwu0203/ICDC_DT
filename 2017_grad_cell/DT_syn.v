/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP2
// Date      : Mon Mar 28 20:16:04 2022
/////////////////////////////////////////////////////////////


module DT_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;
  wire   n1;
  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR22X2 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(A[2]), .B(carry[2]), .Y(n1) );
  XOR2XL U2 ( .A(A[2]), .B(carry[2]), .Y(SUM[2]) );
  CLKINVX1 U3 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1;
  wire   [13:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U2 ( .A(SUM[0]), .Y(n1) );
  XOR2X1 U3 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module DT_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U2 ( .A(n16), .Y(n2) );
  CLKINVX1 U3 ( .A(A[10]), .Y(n3) );
  CLKINVX1 U4 ( .A(A[11]), .Y(n4) );
  AO21X1 U5 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U6 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U7 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U8 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U9 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U10 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U11 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U13 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U14 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U15 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U16 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  OAI21XL U17 ( .A0(n2), .A1(n4), .B0(n15), .Y(SUM[11]) );
  NAND2X1 U18 ( .A(n2), .B(n4), .Y(n15) );
  OAI21XL U19 ( .A0(n6), .A1(n3), .B0(n16), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(n6), .B(n3), .Y(n16) );
  NOR2X1 U21 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U22 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U23 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U24 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U25 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U26 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2X1 U27 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   N35, N36, N37, N38, N39, n373, n374, n375, flag, forward_pixel,
         picture_board, \forward[0][13] , \forward[0][12] , \forward[0][11] ,
         \forward[0][10] , \forward[0][9] , \forward[0][8] , \forward[0][7] ,
         \forward[0][6] , \forward[0][5] , \forward[0][4] , \forward[0][3] ,
         \forward[0][2] , \forward[0][1] , \forward[1][13] , \forward[1][12] ,
         \forward[1][11] , \forward[1][10] , \forward[1][9] , \forward[1][8] ,
         \forward[1][6] , \forward[1][5] , \forward[1][4] , \forward[1][3] ,
         \forward[1][0] , \forward[2][13] , \forward[2][12] , \forward[2][11] ,
         \forward[2][10] , \forward[2][9] , \forward[2][8] , \forward[2][7] ,
         \forward[2][6] , \forward[2][5] , \forward[2][4] , \forward[2][3] ,
         \forward[2][2] , \forward[2][1] , \forward[3][13] , \forward[3][12] ,
         \forward[3][11] , \forward[3][10] , \forward[3][9] , \forward[3][8] ,
         \forward[3][7] , \forward[3][6] , \forward[3][5] , \forward[3][4] ,
         \forward[3][3] , \forward[3][2] , \forward[3][1] , \forward[3][0] ,
         \backward[0][13] , \backward[0][12] , \backward[0][11] ,
         \backward[0][10] , \backward[0][9] , \backward[0][8] ,
         \backward[0][7] , \backward[0][6] , \backward[0][5] ,
         \backward[0][4] , \backward[0][3] , \backward[0][2] ,
         \backward[0][1] , \backward[1][13] , \backward[1][12] ,
         \backward[1][11] , \backward[1][10] , \backward[1][9] ,
         \backward[1][8] , \backward[2][13] , \backward[2][12] ,
         \backward[2][11] , \backward[2][10] , \backward[2][9] ,
         \backward[2][8] , \backward[2][7] , \backward[2][6] ,
         \backward[2][5] , \backward[2][4] , \backward[2][3] ,
         \backward[2][2] , \backward[2][1] , \backward[3][13] ,
         \backward[3][12] , \backward[3][11] , \backward[3][10] ,
         \backward[3][9] , \backward[3][8] , \backward[3][7] ,
         \backward[3][6] , \backward[3][5] , \backward[3][4] ,
         \backward[3][3] , \backward[3][2] , \backward[3][1] ,
         \backward[3][0] , N129, N130, N131, N132, N133, N134, N135, N136,
         N137, N138, N139, N140, N141, N142, N143, N144, N145, N146, N147,
         N148, N149, N150, N151, N152, N153, N154, N155, N156, N181, N183,
         N184, N185, N186, N187, N188, N189, N190, N191, N192, N193, N194,
         N195, N198, N199, N200, N201, N202, N203, N204, N205, N206, N207,
         N208, N209, N210, N211, N222, N223, N224, N225, N226, N227, N228,
         N229, N230, N231, N233, N234, N235, N236, N237, N238, N239, N240, n33,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n60, n62, n64, n65, n66, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n81, n82, n83, n84, n86, n87, n88, n90, n93,
         n94, n95, n96, n97, n99, n105, n110, n111, n113, n114, n115, n117,
         n118, n119, n120, n121, n122, n123, n125, n126, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n146, n147, n148, n149, n150, n151, n152, n153,
         n155, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         \sub_160/carry[2] , \sub_160/carry[3] , \sub_160/carry[4] ,
         \sub_160/carry[5] , \sub_160/carry[6] , \sub_160/carry[7] ,
         \sub_160/carry[8] , \sub_160/carry[9] , \sub_160/carry[10] ,
         \sub_160/carry[11] , \sub_160/carry[12] , \sub_160/carry[13] ,
         \add_155/carry[2] , \add_155/carry[3] , \add_155/carry[4] ,
         \add_155/carry[5] , \add_155/carry[6] , \add_155/carry[7] ,
         \add_155/carry[8] , \add_155/carry[9] , \add_155/carry[10] ,
         \add_155/carry[11] , \add_155/carry[12] , \add_155/carry[13] ,
         \add_49/carry[2] , \add_49/carry[3] , \add_49/carry[4] ,
         \add_49/carry[5] , \add_49/carry[6] , \add_49/carry[7] ,
         \add_49/carry[8] , \add_49/carry[9] , \add_49/carry[10] ,
         \add_49/carry[11] , \add_49/carry[12] , \add_49/carry[13] ,
         \add_47/carry[2] , \add_47/carry[3] , \add_47/carry[4] ,
         \add_47/carry[5] , \add_47/carry[6] , \add_47/carry[7] ,
         \add_47/carry[8] , \add_47/carry[9] , \add_47/carry[10] ,
         \add_47/carry[11] , \add_47/carry[12] , \add_47/carry[13] ,
         \sub_44/carry[2] , \sub_44/carry[3] , \sub_44/carry[4] ,
         \sub_44/carry[5] , \sub_44/carry[6] , \sub_44/carry[7] ,
         \sub_44/carry[8] , \sub_44/carry[9] , \sub_44/carry[10] ,
         \sub_44/carry[11] , \sub_44/carry[12] , \sub_44/carry[13] ,
         \sub_42/carry[2] , \sub_42/carry[3] , \sub_42/carry[4] ,
         \sub_42/carry[5] , \sub_42/carry[6] , \sub_42/carry[7] ,
         \sub_42/carry[8] , \sub_42/carry[9] , \sub_42/carry[10] ,
         \sub_42/carry[11] , \sub_42/carry[12] , \sub_42/carry[13] , n188,
         n189, n190, n191, n192, n193, n194, n195, n197, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n286, n287, n288, n290, n291, n292, n293, n295, n297,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372;
  wire   [7:0] min_value;
  wire   [3:0] state;
  wire   [13:1] \add_48/carry ;
  wire   [14:0] \sub_43/carry ;
  wire   [7:1] \add_34/carry ;

  DT_DW01_inc_0_DW01_inc_1 add_166_2 ( .A(res_di), .SUM({N240, N239, N238, 
        N237, N236, N235, N234, N233}) );
  DT_DW01_inc_1_DW01_inc_2 add_166 ( .A({1'b0, res_di}), .SUM({N230, N229, 
        N228, N227, N226, N225, N224, N223, N222}) );
  DT_DW01_inc_2_DW01_inc_3 add_50 ( .A({sti_addr[9:4], n199, sti_addr[2:0], 
        n286, n287, n288, n290}), .SUM({\backward[3][13] , \backward[3][12] , 
        \backward[3][11] , \backward[3][10] , \backward[3][9] , 
        \backward[3][8] , \backward[3][7] , \backward[3][6] , \backward[3][5] , 
        \backward[3][4] , \backward[3][3] , \backward[3][2] , \backward[3][1] , 
        \backward[3][0] }) );
  DT_DW01_dec_0 sub_45 ( .A({sti_addr[9:4], n292, sti_addr[2:0], n286, n287, 
        n288, n290}), .SUM({\forward[3][13] , \forward[3][12] , 
        \forward[3][11] , \forward[3][10] , \forward[3][9] , \forward[3][8] , 
        \forward[3][7] , \forward[3][6] , \forward[3][5] , \forward[3][4] , 
        \forward[3][3] , \forward[3][2] , \forward[3][1] , \forward[3][0] })
         );
  DFFSX1 \min_value_reg[7]  ( .D(n187), .CK(clk), .SN(reset), .Q(min_value[7]), 
        .QN(n146) );
  DFFSX1 \min_value_reg[3]  ( .D(n183), .CK(clk), .SN(n300), .Q(min_value[3]), 
        .QN(n150) );
  DFFSX1 \min_value_reg[1]  ( .D(n185), .CK(clk), .SN(n300), .Q(min_value[1]), 
        .QN(n148) );
  DFFSX1 \min_value_reg[5]  ( .D(n181), .CK(clk), .SN(n300), .Q(min_value[5]), 
        .QN(n152) );
  DFFSX1 \min_value_reg[2]  ( .D(n184), .CK(clk), .SN(n300), .Q(min_value[2]), 
        .QN(n149) );
  DFFSX1 \min_value_reg[0]  ( .D(n186), .CK(clk), .SN(reset), .Q(min_value[0]), 
        .QN(n147) );
  DFFSX1 flag_reg ( .D(n179), .CK(clk), .SN(reset), .Q(flag), .QN(n178) );
  DFFRX1 \pixel_addr_reg[3]  ( .D(n175), .CK(clk), .RN(reset), .Q(
        \forward[1][3] ), .QN(N38) );
  DFFRX1 \pixel_addr_reg[2]  ( .D(n176), .CK(clk), .RN(reset), .Q(n316), .QN(
        N37) );
  DFFRX1 \pixel_addr_reg[1]  ( .D(n177), .CK(clk), .RN(reset), .Q(n317), .QN(
        N36) );
  DFFSX1 \pixel_addr_reg[0]  ( .D(n165), .CK(clk), .SN(n300), .Q(
        \forward[1][0] ), .QN(N35) );
  DFFSX1 \min_value_reg[4]  ( .D(n182), .CK(clk), .SN(n300), .Q(min_value[4]), 
        .QN(n151) );
  DFFRX1 \counter_reg[2]  ( .D(n162), .CK(clk), .RN(reset), .Q(n359), .QN(n155) );
  DFFRX1 \counter_reg[1]  ( .D(n157), .CK(clk), .RN(reset), .Q(n372), .QN(n267) );
  DFFSX1 \pixel_addr_reg[7]  ( .D(n171), .CK(clk), .SN(reset), .Q(n292), .QN(
        n293) );
  DFFRX1 \state_reg[1]  ( .D(n160), .CK(clk), .RN(reset), .Q(state[1]), .QN(
        n366) );
  DFFRX1 \state_reg[3]  ( .D(n158), .CK(clk), .RN(reset), .Q(state[3]), .QN(
        n370) );
  DFFRX1 \pixel_addr_reg[5]  ( .D(n173), .CK(clk), .RN(reset), .Q(
        \forward[1][5] ), .QN(n188) );
  DFFRX1 \pixel_addr_reg[4]  ( .D(n174), .CK(clk), .RN(reset), .Q(
        \forward[1][4] ), .QN(n192) );
  DFFRX1 \pixel_addr_reg[6]  ( .D(n172), .CK(clk), .RN(n300), .Q(
        \forward[1][6] ), .QN(n190) );
  DFFRX1 \state_reg[2]  ( .D(n159), .CK(clk), .RN(reset), .Q(state[2]), .QN(
        n369) );
  DFFRX1 \pixel_addr_reg[8]  ( .D(n170), .CK(clk), .RN(n300), .QN(n295) );
  DFFRX1 \pixel_addr_reg[9]  ( .D(n169), .CK(clk), .RN(n300), .QN(n297) );
  DFFRX1 \pixel_addr_reg[10]  ( .D(n168), .CK(clk), .RN(n300), .Q(n375), .QN(
        n194) );
  DFFRX1 \pixel_addr_reg[11]  ( .D(n167), .CK(clk), .RN(n300), .Q(n374), .QN(
        n191) );
  DFFRX1 \pixel_addr_reg[12]  ( .D(n166), .CK(clk), .RN(reset), .QN(n299) );
  DFFRX1 \pixel_addr_reg[13]  ( .D(n164), .CK(clk), .RN(reset), .Q(n373), .QN(
        n195) );
  DFFRX2 \counter_reg[0]  ( .D(n163), .CK(clk), .RN(reset), .Q(N39), .QN(n268)
         );
  DFFSX2 \min_value_reg[6]  ( .D(n180), .CK(clk), .SN(reset), .Q(min_value[6]), 
        .QN(n153) );
  DFFRX2 \state_reg[0]  ( .D(n161), .CK(clk), .RN(reset), .Q(state[0]), .QN(
        n360) );
  OAI222X1 U181 ( .A0(N227), .A1(n352), .B0(N227), .B1(n345), .C0(n352), .C1(
        n345), .Y(n346) );
  OAI211X1 U182 ( .A0(n151), .A1(n202), .B0(n64), .C0(n69), .Y(n182) );
  OAI211X1 U183 ( .A0(n149), .A1(n202), .B0(n64), .C0(n71), .Y(n184) );
  OAI211X1 U184 ( .A0(n152), .A1(n202), .B0(n64), .C0(n68), .Y(n181) );
  OAI211X1 U185 ( .A0(n148), .A1(n202), .B0(n64), .C0(n72), .Y(n185) );
  OAI211X1 U186 ( .A0(n150), .A1(n202), .B0(n64), .C0(n70), .Y(n183) );
  OAI211X1 U187 ( .A0(n146), .A1(n202), .B0(n64), .C0(n74), .Y(n187) );
  NOR2XL U188 ( .A(n267), .B(n268), .Y(n189) );
  OR4X1 U189 ( .A(n369), .B(state[0]), .C(state[1]), .D(state[3]), .Y(n193) );
  INVX3 U190 ( .A(n197), .Y(sti_addr[3]) );
  INVX3 U191 ( .A(n193), .Y(res_wr) );
  OAI211X1 U192 ( .A0(n153), .A1(n202), .B0(n64), .C0(n65), .Y(n180) );
  NAND2BXL U193 ( .AN(n268), .B(n267), .Y(n205) );
  OAI31X4 U194 ( .A0(n359), .A1(n267), .A2(n268), .B0(n113), .Y(n111) );
  CLKINVX1 U195 ( .A(n292), .Y(n197) );
  CLKINVX2 U196 ( .A(n197), .Y(n199) );
  CLKXOR2X2 U197 ( .A(min_value[7]), .B(\add_34/carry [7]), .Y(res_do[7]) );
  CLKXOR2X2 U198 ( .A(min_value[6]), .B(\add_34/carry [6]), .Y(res_do[6]) );
  CLKXOR2X2 U199 ( .A(flag), .B(min_value[0]), .Y(res_do[0]) );
  CLKXOR2X2 U200 ( .A(min_value[5]), .B(\add_34/carry [5]), .Y(res_do[5]) );
  CLKXOR2X2 U201 ( .A(min_value[1]), .B(\add_34/carry [1]), .Y(res_do[1]) );
  CLKXOR2X2 U202 ( .A(min_value[3]), .B(\add_34/carry [3]), .Y(res_do[3]) );
  CLKXOR2X2 U203 ( .A(min_value[2]), .B(\add_34/carry [2]), .Y(res_do[2]) );
  CLKXOR2X2 U204 ( .A(min_value[4]), .B(\add_34/carry [4]), .Y(res_do[4]) );
  CLKINVX1 U205 ( .A(N226), .Y(n200) );
  OAI211X1 U206 ( .A0(n147), .A1(n202), .B0(n64), .C0(n73), .Y(n186) );
  AOI22XL U207 ( .A0(N234), .A1(n66), .B0(res_di[1]), .B1(n357), .Y(n72) );
  AOI22XL U208 ( .A0(N233), .A1(n66), .B0(res_di[0]), .B1(n357), .Y(n73) );
  AND3X4 U209 ( .A(n367), .B(n76), .C(N231), .Y(n66) );
  NAND2X1 U210 ( .A(min_value[4]), .B(n200), .Y(n345) );
  NAND2BX1 U211 ( .AN(res_rd), .B(n82), .Y(n76) );
  AND2XL U212 ( .A(n204), .B(n76), .Y(n201) );
  AND2X4 U213 ( .A(n203), .B(n201), .Y(n202) );
  OR2XL U214 ( .A(N231), .B(n77), .Y(n203) );
  OAI31X1 U215 ( .A0(n146), .A1(N230), .A2(N229), .B0(n356), .Y(N231) );
  INVX3 U216 ( .A(n291), .Y(n290) );
  INVX1 U217 ( .A(N228), .Y(n355) );
  INVX1 U218 ( .A(n342), .Y(n354) );
  CLKINVX1 U219 ( .A(\forward[1][0] ), .Y(n291) );
  CLKBUFX3 U220 ( .A(n128), .Y(n277) );
  CLKBUFX3 U221 ( .A(n131), .Y(n279) );
  OR2X1 U222 ( .A(N211), .B(n81), .Y(n204) );
  OAI32X1 U223 ( .A0(n51), .A1(n290), .A2(n178), .B0(n52), .B1(n53), .Y(
        picture_board) );
  CLKBUFX3 U224 ( .A(n317), .Y(n288) );
  NAND2X1 U225 ( .A(state[1]), .B(n370), .Y(n88) );
  CLKBUFX3 U226 ( .A(n36), .Y(n280) );
  NAND2X1 U227 ( .A(state[1]), .B(state[2]), .Y(n77) );
  INVX3 U228 ( .A(n93), .Y(n363) );
  NAND2X1 U229 ( .A(n368), .B(n364), .Y(n93) );
  OAI21XL U230 ( .A0(N36), .A1(n277), .B0(n144), .Y(n177) );
  AOI22X1 U231 ( .A0(N183), .A1(n278), .B0(N198), .B1(n279), .Y(n144) );
  CLKBUFX3 U232 ( .A(n130), .Y(n278) );
  NOR2BX1 U233 ( .AN(n277), .B(n62), .Y(n130) );
  OAI21XL U234 ( .A0(n291), .A1(n277), .B0(n132), .Y(n165) );
  AOI22X1 U235 ( .A0(n291), .A1(n278), .B0(N35), .B1(n279), .Y(n132) );
  CLKBUFX3 U236 ( .A(n269), .Y(n270) );
  CLKBUFX3 U237 ( .A(n189), .Y(n269) );
  CLKBUFX3 U238 ( .A(n262), .Y(n271) );
  INVX3 U239 ( .A(n50), .Y(n361) );
  INVX3 U240 ( .A(n82), .Y(sti_rd) );
  OR2X1 U241 ( .A(n51), .B(n194), .Y(n105) );
  CLKINVX1 U242 ( .A(n77), .Y(n367) );
  INVX3 U243 ( .A(n45), .Y(res_addr[13]) );
  AOI222XL U244 ( .A0(N129), .A1(n363), .B0(sti_addr[9]), .B1(n361), .C0(N143), 
        .C1(n280), .Y(n45) );
  INVX3 U245 ( .A(n46), .Y(res_addr[12]) );
  AOI222XL U246 ( .A0(N130), .A1(n363), .B0(sti_addr[8]), .B1(n361), .C0(N144), 
        .C1(n280), .Y(n46) );
  INVX3 U247 ( .A(n47), .Y(res_addr[11]) );
  AOI222XL U248 ( .A0(N131), .A1(n363), .B0(sti_addr[7]), .B1(n361), .C0(N145), 
        .C1(n280), .Y(n47) );
  OAI21XL U249 ( .A0(n195), .A1(n277), .B0(n129), .Y(n164) );
  AOI22X1 U250 ( .A0(N195), .A1(n278), .B0(N210), .B1(n279), .Y(n129) );
  NAND4X1 U251 ( .A(n287), .B(n286), .C(n288), .D(n110), .Y(n51) );
  NOR3X1 U252 ( .A(n192), .B(n190), .C(n188), .Y(n110) );
  ADDFXL U253 ( .A(n288), .B(n301), .CI(n290), .CO(\sub_160/carry[2] ), .S(
        N198) );
  CLKINVX1 U254 ( .A(picture_board), .Y(n301) );
  INVX3 U255 ( .A(n48), .Y(res_addr[10]) );
  AOI222XL U256 ( .A0(N132), .A1(n363), .B0(sti_addr[6]), .B1(n361), .C0(N146), 
        .C1(n280), .Y(n48) );
  OAI21XL U257 ( .A0(n299), .A1(n277), .B0(n133), .Y(n166) );
  AOI22X1 U258 ( .A0(N194), .A1(n278), .B0(N209), .B1(n279), .Y(n133) );
  ADDFXL U259 ( .A(n288), .B(picture_board), .CI(n290), .CO(\add_155/carry[2] ), .S(N183) );
  OAI21XL U260 ( .A0(n191), .A1(n277), .B0(n134), .Y(n167) );
  AOI22X1 U261 ( .A0(N193), .A1(n278), .B0(N208), .B1(n279), .Y(n134) );
  INVX3 U262 ( .A(n33), .Y(res_addr[9]) );
  AOI222XL U263 ( .A0(N133), .A1(n363), .B0(sti_addr[5]), .B1(n361), .C0(N147), 
        .C1(n280), .Y(n33) );
  CLKINVX1 U264 ( .A(n111), .Y(n358) );
  OAI211X1 U265 ( .A0(n358), .A1(n93), .B0(n94), .C0(n95), .Y(n159) );
  AOI211X1 U266 ( .A0(n96), .A1(n97), .B0(n362), .C0(n280), .Y(n95) );
  NOR4X1 U267 ( .A(n99), .B(n295), .C(n88), .D(n297), .Y(n97) );
  NOR4X1 U268 ( .A(n105), .B(n191), .C(n195), .D(n299), .Y(n96) );
  OAI21XL U269 ( .A0(n194), .A1(n277), .B0(n135), .Y(n168) );
  AOI22X1 U270 ( .A0(N192), .A1(n278), .B0(N207), .B1(n279), .Y(n135) );
  OAI211X1 U271 ( .A0(n83), .A1(n111), .B0(n82), .C0(n50), .Y(n160) );
  INVX3 U272 ( .A(n37), .Y(res_addr[8]) );
  AOI222XL U273 ( .A0(N134), .A1(n363), .B0(sti_addr[4]), .B1(n361), .C0(N148), 
        .C1(n280), .Y(n37) );
  OAI21XL U274 ( .A0(n297), .A1(n277), .B0(n136), .Y(n169) );
  AOI22X1 U275 ( .A0(N191), .A1(n278), .B0(N206), .B1(n279), .Y(n136) );
  INVX3 U276 ( .A(n38), .Y(res_addr[7]) );
  AOI222XL U277 ( .A0(N135), .A1(n363), .B0(sti_addr[3]), .B1(n361), .C0(N149), 
        .C1(n280), .Y(n38) );
  OAI21XL U278 ( .A0(n295), .A1(n277), .B0(n137), .Y(n170) );
  AOI22X1 U279 ( .A0(N190), .A1(n278), .B0(N205), .B1(n279), .Y(n137) );
  INVX3 U280 ( .A(n39), .Y(res_addr[6]) );
  AOI222XL U281 ( .A0(N136), .A1(n363), .B0(sti_addr[2]), .B1(n361), .C0(N150), 
        .C1(n280), .Y(n39) );
  OAI21XL U282 ( .A0(n293), .A1(n277), .B0(n138), .Y(n171) );
  AOI22X1 U283 ( .A0(N189), .A1(n278), .B0(N204), .B1(n279), .Y(n138) );
  INVX6 U284 ( .A(n295), .Y(sti_addr[4]) );
  INVX3 U285 ( .A(n40), .Y(res_addr[5]) );
  AOI222XL U286 ( .A0(N137), .A1(n363), .B0(sti_addr[1]), .B1(n361), .C0(N151), 
        .C1(n280), .Y(n40) );
  OAI21XL U287 ( .A0(n190), .A1(n277), .B0(n139), .Y(n172) );
  AOI22X1 U288 ( .A0(N188), .A1(n278), .B0(N203), .B1(n279), .Y(n139) );
  INVX3 U289 ( .A(n41), .Y(res_addr[4]) );
  AOI222XL U290 ( .A0(N138), .A1(n363), .B0(sti_addr[0]), .B1(n361), .C0(N152), 
        .C1(n280), .Y(n41) );
  OAI21XL U291 ( .A0(n188), .A1(n277), .B0(n140), .Y(n173) );
  AOI22X1 U292 ( .A0(N187), .A1(n278), .B0(N202), .B1(n279), .Y(n140) );
  INVX6 U293 ( .A(n297), .Y(sti_addr[5]) );
  OAI21XL U294 ( .A0(n192), .A1(n277), .B0(n141), .Y(n174) );
  AOI22X1 U295 ( .A0(N186), .A1(n278), .B0(N201), .B1(n279), .Y(n141) );
  INVX3 U296 ( .A(n42), .Y(res_addr[3]) );
  AOI222XL U297 ( .A0(N139), .A1(n363), .B0(n286), .B1(n361), .C0(N153), .C1(
        n280), .Y(n42) );
  OAI21XL U298 ( .A0(N38), .A1(n277), .B0(n142), .Y(n175) );
  AOI22X1 U299 ( .A0(N185), .A1(n278), .B0(N200), .B1(n279), .Y(n142) );
  NAND2X2 U300 ( .A(n83), .B(n84), .Y(res_rd) );
  NOR2X1 U301 ( .A(n363), .B(n280), .Y(n83) );
  CLKINVX1 U302 ( .A(n88), .Y(n368) );
  INVX3 U303 ( .A(n43), .Y(res_addr[2]) );
  AOI222XL U304 ( .A0(N140), .A1(n363), .B0(n287), .B1(n361), .C0(N154), .C1(
        n280), .Y(n43) );
  OAI31XL U305 ( .A0(n62), .A1(n88), .A2(n371), .B0(n117), .Y(n128) );
  CLKINVX1 U306 ( .A(N181), .Y(n371) );
  NOR2BX1 U307 ( .AN(n277), .B(n77), .Y(n131) );
  OAI21XL U308 ( .A0(N37), .A1(n277), .B0(n143), .Y(n176) );
  AOI22X1 U309 ( .A0(N184), .A1(n278), .B0(N199), .B1(n279), .Y(n143) );
  CLKINVX1 U310 ( .A(n81), .Y(n364) );
  INVX6 U311 ( .A(n299), .Y(sti_addr[8]) );
  INVX3 U312 ( .A(n44), .Y(res_addr[1]) );
  AOI222XL U313 ( .A0(N141), .A1(n363), .B0(n288), .B1(n361), .C0(N155), .C1(
        n280), .Y(n44) );
  INVX3 U314 ( .A(n49), .Y(res_addr[0]) );
  AOI222XL U315 ( .A0(N142), .A1(n363), .B0(n290), .B1(n361), .C0(N156), .C1(
        n280), .Y(n49) );
  NAND3X2 U316 ( .A(n76), .B(n366), .C(n364), .Y(n64) );
  CLKBUFX3 U317 ( .A(n273), .Y(n274) );
  CLKBUFX3 U318 ( .A(n263), .Y(n273) );
  CLKBUFX3 U319 ( .A(n262), .Y(n272) );
  CLKBUFX3 U320 ( .A(n275), .Y(n276) );
  CLKBUFX3 U321 ( .A(n264), .Y(n275) );
  NOR2X1 U322 ( .A(n362), .B(res_wr), .Y(n50) );
  CLKINVX1 U323 ( .A(n84), .Y(n362) );
  NAND3X1 U324 ( .A(n366), .B(n370), .C(n364), .Y(n82) );
  NAND2X1 U325 ( .A(n360), .B(n369), .Y(n62) );
  CLKINVX1 U326 ( .A(n117), .Y(n365) );
  AO21X1 U327 ( .A0(n90), .A1(n365), .B0(done), .Y(n158) );
  NOR3X1 U328 ( .A(n190), .B(sti_addr[0]), .C(n293), .Y(n118) );
  AND4X1 U329 ( .A(n118), .B(n119), .C(n120), .D(n121), .Y(n90) );
  NOR3X1 U330 ( .A(sti_addr[7]), .B(sti_addr[9]), .C(sti_addr[8]), .Y(n120) );
  NOR4X1 U331 ( .A(sti_addr[6]), .B(sti_addr[5]), .C(sti_addr[4]), .D(
        sti_addr[1]), .Y(n119) );
  NOR4X1 U332 ( .A(n286), .B(n287), .C(n288), .D(n290), .Y(n121) );
  NAND3X1 U333 ( .A(n293), .B(n291), .C(n360), .Y(n99) );
  CLKINVX1 U334 ( .A(n351), .Y(n356) );
  AOI22X1 U335 ( .A0(N235), .A1(n66), .B0(res_di[2]), .B1(n357), .Y(n71) );
  AOI22X1 U336 ( .A0(N236), .A1(n66), .B0(res_di[3]), .B1(n357), .Y(n70) );
  AOI22X1 U337 ( .A0(N237), .A1(n66), .B0(res_di[4]), .B1(n357), .Y(n69) );
  AOI22X1 U338 ( .A0(N238), .A1(n66), .B0(res_di[5]), .B1(n357), .Y(n68) );
  AOI22X1 U339 ( .A0(N239), .A1(n66), .B0(res_di[6]), .B1(n357), .Y(n65) );
  AOI22X1 U340 ( .A0(N240), .A1(n66), .B0(res_di[7]), .B1(n357), .Y(n74) );
  INVX3 U341 ( .A(n75), .Y(n357) );
  OAI211X1 U342 ( .A0(state[2]), .A1(N211), .B0(n76), .C0(n77), .Y(n75) );
  CLKINVX1 U343 ( .A(N223), .Y(n353) );
  CLKINVX1 U344 ( .A(res_di[6]), .Y(n336) );
  OAI211X1 U345 ( .A0(n113), .A1(n84), .B0(n94), .C0(n114), .Y(n161) );
  AOI32X1 U346 ( .A0(n369), .A1(n370), .A2(n115), .B0(n358), .B1(n363), .Y(
        n114) );
  OAI2BB1X1 U347 ( .A0N(forward_pixel), .A1N(n366), .B0(state[0]), .Y(n115) );
  NAND4X1 U348 ( .A(n190), .B(N36), .C(N37), .D(N38), .Y(n52) );
  NAND4X1 U349 ( .A(n178), .B(n290), .C(n192), .D(n188), .Y(n53) );
  CLKBUFX6 U350 ( .A(\forward[1][6] ), .Y(sti_addr[2]) );
  CLKBUFX6 U351 ( .A(\forward[1][5] ), .Y(sti_addr[1]) );
  BUFX4 U352 ( .A(n316), .Y(n287) );
  CLKBUFX6 U353 ( .A(\forward[1][4] ), .Y(sti_addr[0]) );
  BUFX4 U354 ( .A(\forward[1][3] ), .Y(n286) );
  NAND2X1 U355 ( .A(n122), .B(n123), .Y(n113) );
  NOR4X1 U356 ( .A(res_di[3]), .B(res_di[2]), .C(res_di[1]), .D(res_di[0]), 
        .Y(n122) );
  NOR4X1 U357 ( .A(res_di[7]), .B(res_di[6]), .C(res_di[5]), .D(res_di[4]), 
        .Y(n123) );
  CLKINVX1 U358 ( .A(min_value[5]), .Y(n352) );
  CLKBUFX6 U359 ( .A(n375), .Y(sti_addr[6]) );
  NAND2X1 U360 ( .A(state[0]), .B(n369), .Y(n81) );
  CLKBUFX6 U361 ( .A(n374), .Y(sti_addr[7]) );
  NOR3X1 U362 ( .A(n369), .B(state[0]), .C(n88), .Y(n36) );
  BUFX4 U363 ( .A(n373), .Y(sti_addr[9]) );
  CLKINVX1 U364 ( .A(n205), .Y(n263) );
  NAND2BX1 U365 ( .AN(n267), .B(n268), .Y(n206) );
  CLKINVX1 U366 ( .A(n206), .Y(n262) );
  NAND2BX1 U367 ( .AN(N39), .B(n267), .Y(n207) );
  CLKINVX1 U368 ( .A(n207), .Y(n264) );
  NAND3X1 U369 ( .A(state[2]), .B(state[0]), .C(n368), .Y(n117) );
  NAND4X1 U370 ( .A(state[2]), .B(state[0]), .C(n366), .D(n370), .Y(n84) );
  OAI2BB2XL U371 ( .B0(n178), .B1(n60), .A0N(n366), .A1N(n60), .Y(n179) );
  AOI211X1 U372 ( .A0(state[1]), .A1(N181), .B0(state[3]), .C0(n62), .Y(n60)
         );
  OAI32X1 U373 ( .A0(n372), .A1(n268), .A2(n83), .B0(n267), .B1(n86), .Y(n157)
         );
  AOI21X1 U374 ( .A0(n268), .A1(n87), .B0(n88), .Y(n86) );
  OAI21XL U375 ( .A0(state[0]), .A1(n369), .B0(n81), .Y(n87) );
  OAI22XL U376 ( .A0(n83), .A1(N39), .B0(n268), .B1(n368), .Y(n163) );
  AOI2BB2X1 U377 ( .B0(n178), .B1(res_wr), .A0N(n90), .A1N(n117), .Y(n94) );
  AOI211X1 U378 ( .A0(n368), .A1(n125), .B0(n126), .C0(n365), .Y(n162) );
  OAI31XL U379 ( .A0(n268), .A1(n267), .A2(n155), .B0(n62), .Y(n125) );
  AOI31X1 U380 ( .A0(N39), .A1(n372), .A2(n368), .B0(n359), .Y(n126) );
  NOR3X4 U381 ( .A(n62), .B(state[1]), .C(n370), .Y(done) );
  CLKBUFX3 U382 ( .A(reset), .Y(n300) );
  AOI22X1 U383 ( .A0(N35), .A1(n272), .B0(\backward[3][0] ), .B1(n270), .Y(
        n209) );
  AOI22X1 U384 ( .A0(N35), .A1(n276), .B0(n290), .B1(n274), .Y(n208) );
  NAND2X1 U385 ( .A(n209), .B(n208), .Y(N156) );
  AOI22X1 U386 ( .A0(\backward[2][1] ), .A1(n272), .B0(\backward[3][1] ), .B1(
        n270), .Y(n211) );
  AOI22X1 U387 ( .A0(\backward[0][1] ), .A1(n276), .B0(n288), .B1(n274), .Y(
        n210) );
  NAND2X1 U388 ( .A(n211), .B(n210), .Y(N155) );
  AOI22X1 U389 ( .A0(\backward[2][2] ), .A1(n272), .B0(\backward[3][2] ), .B1(
        n270), .Y(n213) );
  AOI22X1 U390 ( .A0(\backward[0][2] ), .A1(n276), .B0(n287), .B1(n274), .Y(
        n212) );
  NAND2X1 U391 ( .A(n213), .B(n212), .Y(N154) );
  AOI22X1 U392 ( .A0(\backward[2][3] ), .A1(n272), .B0(\backward[3][3] ), .B1(
        n270), .Y(n215) );
  AOI22X1 U393 ( .A0(\backward[0][3] ), .A1(n276), .B0(n286), .B1(n274), .Y(
        n214) );
  NAND2X1 U394 ( .A(n215), .B(n214), .Y(N153) );
  AOI22X1 U395 ( .A0(\backward[2][4] ), .A1(n272), .B0(\backward[3][4] ), .B1(
        n270), .Y(n217) );
  AOI22X1 U396 ( .A0(\backward[0][4] ), .A1(n276), .B0(sti_addr[0]), .B1(n274), 
        .Y(n216) );
  NAND2X1 U397 ( .A(n217), .B(n216), .Y(N152) );
  AOI22X1 U398 ( .A0(\backward[2][5] ), .A1(n272), .B0(\backward[3][5] ), .B1(
        n270), .Y(n219) );
  AOI22X1 U399 ( .A0(\backward[0][5] ), .A1(n276), .B0(sti_addr[1]), .B1(n274), 
        .Y(n218) );
  NAND2X1 U400 ( .A(n219), .B(n218), .Y(N151) );
  AOI22X1 U401 ( .A0(\backward[2][6] ), .A1(n272), .B0(\backward[3][6] ), .B1(
        n270), .Y(n221) );
  AOI22X1 U402 ( .A0(\backward[0][6] ), .A1(n276), .B0(sti_addr[2]), .B1(n274), 
        .Y(n220) );
  NAND2X1 U403 ( .A(n221), .B(n220), .Y(N150) );
  AOI22X1 U404 ( .A0(\backward[2][7] ), .A1(n272), .B0(\backward[3][7] ), .B1(
        n270), .Y(n223) );
  AOI22X1 U405 ( .A0(\backward[0][7] ), .A1(n276), .B0(n293), .B1(n274), .Y(
        n222) );
  NAND2X1 U406 ( .A(n223), .B(n222), .Y(N149) );
  AOI22X1 U407 ( .A0(\backward[2][8] ), .A1(n272), .B0(\backward[3][8] ), .B1(
        n270), .Y(n225) );
  AOI22X1 U408 ( .A0(\backward[0][8] ), .A1(n276), .B0(\backward[1][8] ), .B1(
        n274), .Y(n224) );
  NAND2X1 U409 ( .A(n225), .B(n224), .Y(N148) );
  AOI22X1 U410 ( .A0(\backward[2][9] ), .A1(n272), .B0(\backward[3][9] ), .B1(
        n270), .Y(n227) );
  AOI22X1 U411 ( .A0(\backward[0][9] ), .A1(n276), .B0(\backward[1][9] ), .B1(
        n274), .Y(n226) );
  NAND2X1 U412 ( .A(n227), .B(n226), .Y(N147) );
  AOI22X1 U413 ( .A0(\backward[2][10] ), .A1(n272), .B0(\backward[3][10] ), 
        .B1(n270), .Y(n229) );
  AOI22X1 U414 ( .A0(\backward[0][10] ), .A1(n276), .B0(\backward[1][10] ), 
        .B1(n274), .Y(n228) );
  NAND2X1 U415 ( .A(n229), .B(n228), .Y(N146) );
  AOI22X1 U416 ( .A0(\backward[2][11] ), .A1(n272), .B0(\backward[3][11] ), 
        .B1(n270), .Y(n231) );
  AOI22X1 U417 ( .A0(\backward[0][11] ), .A1(n276), .B0(\backward[1][11] ), 
        .B1(n274), .Y(n230) );
  NAND2X1 U418 ( .A(n231), .B(n230), .Y(N145) );
  AOI22X1 U419 ( .A0(\backward[2][12] ), .A1(n271), .B0(\backward[3][12] ), 
        .B1(n269), .Y(n233) );
  AOI22X1 U420 ( .A0(\backward[0][12] ), .A1(n275), .B0(\backward[1][12] ), 
        .B1(n273), .Y(n232) );
  NAND2X1 U421 ( .A(n233), .B(n232), .Y(N144) );
  AOI22X1 U422 ( .A0(\backward[2][13] ), .A1(n271), .B0(\backward[3][13] ), 
        .B1(n270), .Y(n235) );
  AOI22X1 U423 ( .A0(\backward[0][13] ), .A1(n276), .B0(\backward[1][13] ), 
        .B1(n274), .Y(n234) );
  NAND2X1 U424 ( .A(n235), .B(n234), .Y(N143) );
  AOI22X1 U425 ( .A0(n291), .A1(n271), .B0(\forward[3][0] ), .B1(n269), .Y(
        n237) );
  AOI22X1 U426 ( .A0(n291), .A1(n275), .B0(n290), .B1(n273), .Y(n236) );
  NAND2X1 U427 ( .A(n237), .B(n236), .Y(N142) );
  AOI22X1 U428 ( .A0(\forward[2][1] ), .A1(n271), .B0(\forward[3][1] ), .B1(
        n269), .Y(n239) );
  AOI22X1 U429 ( .A0(\forward[0][1] ), .A1(n275), .B0(n288), .B1(n273), .Y(
        n238) );
  NAND2X1 U430 ( .A(n239), .B(n238), .Y(N141) );
  AOI22X1 U431 ( .A0(\forward[2][2] ), .A1(n271), .B0(\forward[3][2] ), .B1(
        n269), .Y(n241) );
  AOI22X1 U432 ( .A0(\forward[0][2] ), .A1(n275), .B0(n287), .B1(n273), .Y(
        n240) );
  NAND2X1 U433 ( .A(n241), .B(n240), .Y(N140) );
  AOI22X1 U434 ( .A0(\forward[2][3] ), .A1(n271), .B0(\forward[3][3] ), .B1(
        n269), .Y(n243) );
  AOI22X1 U435 ( .A0(\forward[0][3] ), .A1(n275), .B0(n286), .B1(n273), .Y(
        n242) );
  NAND2X1 U436 ( .A(n243), .B(n242), .Y(N139) );
  AOI22X1 U437 ( .A0(\forward[2][4] ), .A1(n271), .B0(\forward[3][4] ), .B1(
        n269), .Y(n245) );
  AOI22X1 U438 ( .A0(\forward[0][4] ), .A1(n275), .B0(sti_addr[0]), .B1(n273), 
        .Y(n244) );
  NAND2X1 U439 ( .A(n245), .B(n244), .Y(N138) );
  AOI22X1 U440 ( .A0(\forward[2][5] ), .A1(n271), .B0(\forward[3][5] ), .B1(
        n269), .Y(n247) );
  AOI22X1 U441 ( .A0(\forward[0][5] ), .A1(n275), .B0(sti_addr[1]), .B1(n273), 
        .Y(n246) );
  NAND2X1 U442 ( .A(n247), .B(n246), .Y(N137) );
  AOI22X1 U443 ( .A0(\forward[2][6] ), .A1(n271), .B0(\forward[3][6] ), .B1(
        n269), .Y(n249) );
  AOI22X1 U444 ( .A0(\forward[0][6] ), .A1(n264), .B0(sti_addr[2]), .B1(n263), 
        .Y(n248) );
  NAND2X1 U445 ( .A(n249), .B(n248), .Y(N136) );
  AOI22X1 U446 ( .A0(\forward[2][7] ), .A1(n271), .B0(\forward[3][7] ), .B1(
        n189), .Y(n251) );
  AOI22X1 U447 ( .A0(\forward[0][7] ), .A1(n264), .B0(n293), .B1(n263), .Y(
        n250) );
  NAND2X1 U448 ( .A(n251), .B(n250), .Y(N135) );
  AOI22X1 U449 ( .A0(\forward[2][8] ), .A1(n271), .B0(\forward[3][8] ), .B1(
        n269), .Y(n253) );
  AOI22X1 U450 ( .A0(\forward[0][8] ), .A1(n264), .B0(\forward[1][8] ), .B1(
        n263), .Y(n252) );
  NAND2X1 U451 ( .A(n253), .B(n252), .Y(N134) );
  AOI22X1 U452 ( .A0(\forward[2][9] ), .A1(n271), .B0(\forward[3][9] ), .B1(
        n269), .Y(n255) );
  AOI22X1 U453 ( .A0(\forward[0][9] ), .A1(n264), .B0(\forward[1][9] ), .B1(
        n263), .Y(n254) );
  NAND2X1 U454 ( .A(n255), .B(n254), .Y(N133) );
  AOI22X1 U455 ( .A0(\forward[2][10] ), .A1(n262), .B0(\forward[3][10] ), .B1(
        n269), .Y(n257) );
  AOI22X1 U456 ( .A0(\forward[0][10] ), .A1(n275), .B0(\forward[1][10] ), .B1(
        n273), .Y(n256) );
  NAND2X1 U457 ( .A(n257), .B(n256), .Y(N132) );
  AOI22X1 U458 ( .A0(\forward[2][11] ), .A1(n262), .B0(\forward[3][11] ), .B1(
        n269), .Y(n259) );
  AOI22X1 U459 ( .A0(\forward[0][11] ), .A1(n275), .B0(\forward[1][11] ), .B1(
        n273), .Y(n258) );
  NAND2X1 U460 ( .A(n259), .B(n258), .Y(N131) );
  AOI22X1 U461 ( .A0(\forward[2][12] ), .A1(n271), .B0(\forward[3][12] ), .B1(
        n269), .Y(n261) );
  AOI22X1 U462 ( .A0(\forward[0][12] ), .A1(n276), .B0(\forward[1][12] ), .B1(
        n274), .Y(n260) );
  NAND2X1 U463 ( .A(n261), .B(n260), .Y(N130) );
  AOI22X1 U464 ( .A0(\forward[2][13] ), .A1(n272), .B0(\forward[3][13] ), .B1(
        n270), .Y(n266) );
  AOI22X1 U465 ( .A0(\forward[0][13] ), .A1(n264), .B0(\forward[1][13] ), .B1(
        n263), .Y(n265) );
  NAND2X1 U466 ( .A(n266), .B(n265), .Y(N129) );
  AND2X1 U467 ( .A(min_value[6]), .B(\add_34/carry [6]), .Y(\add_34/carry [7])
         );
  AND2X1 U468 ( .A(min_value[5]), .B(\add_34/carry [5]), .Y(\add_34/carry [6])
         );
  AND2X1 U469 ( .A(min_value[4]), .B(\add_34/carry [4]), .Y(\add_34/carry [5])
         );
  AND2X1 U470 ( .A(min_value[3]), .B(\add_34/carry [3]), .Y(\add_34/carry [4])
         );
  AND2X1 U471 ( .A(min_value[2]), .B(\add_34/carry [2]), .Y(\add_34/carry [3])
         );
  AND2X1 U472 ( .A(min_value[1]), .B(\add_34/carry [1]), .Y(\add_34/carry [2])
         );
  AND2X1 U473 ( .A(flag), .B(min_value[0]), .Y(\add_34/carry [1]) );
  XOR2X1 U474 ( .A(sti_addr[9]), .B(\add_48/carry [13]), .Y(\backward[1][13] )
         );
  AND2X1 U475 ( .A(sti_addr[8]), .B(\add_48/carry [12]), .Y(\add_48/carry [13]) );
  XOR2X1 U476 ( .A(sti_addr[8]), .B(\add_48/carry [12]), .Y(\backward[1][12] )
         );
  AND2X1 U477 ( .A(sti_addr[7]), .B(\add_48/carry [11]), .Y(\add_48/carry [12]) );
  XOR2X1 U478 ( .A(sti_addr[7]), .B(\add_48/carry [11]), .Y(\backward[1][11] )
         );
  AND2X1 U479 ( .A(sti_addr[6]), .B(\add_48/carry [10]), .Y(\add_48/carry [11]) );
  XOR2X1 U480 ( .A(sti_addr[6]), .B(\add_48/carry [10]), .Y(\backward[1][10] )
         );
  AND2X1 U481 ( .A(sti_addr[5]), .B(\add_48/carry [9]), .Y(\add_48/carry [10])
         );
  XOR2X1 U482 ( .A(sti_addr[5]), .B(\add_48/carry [9]), .Y(\backward[1][9] )
         );
  AND2X1 U483 ( .A(sti_addr[4]), .B(sti_addr[3]), .Y(\add_48/carry [9]) );
  XOR2X1 U484 ( .A(sti_addr[4]), .B(sti_addr[3]), .Y(\backward[1][8] ) );
  XOR2X1 U485 ( .A(sti_addr[9]), .B(\add_47/carry[13] ), .Y(\backward[0][13] )
         );
  AND2X1 U486 ( .A(sti_addr[8]), .B(\add_47/carry[12] ), .Y(\add_47/carry[13] ) );
  XOR2X1 U487 ( .A(sti_addr[8]), .B(\add_47/carry[12] ), .Y(\backward[0][12] )
         );
  AND2X1 U488 ( .A(sti_addr[7]), .B(\add_47/carry[11] ), .Y(\add_47/carry[12] ) );
  XOR2X1 U489 ( .A(sti_addr[7]), .B(\add_47/carry[11] ), .Y(\backward[0][11] )
         );
  AND2X1 U490 ( .A(sti_addr[6]), .B(\add_47/carry[10] ), .Y(\add_47/carry[11] ) );
  XOR2X1 U491 ( .A(sti_addr[6]), .B(\add_47/carry[10] ), .Y(\backward[0][10] )
         );
  AND2X1 U492 ( .A(sti_addr[5]), .B(\add_47/carry[9] ), .Y(\add_47/carry[10] )
         );
  XOR2X1 U493 ( .A(sti_addr[5]), .B(\add_47/carry[9] ), .Y(\backward[0][9] )
         );
  AND2X1 U494 ( .A(sti_addr[4]), .B(\add_47/carry[8] ), .Y(\add_47/carry[9] )
         );
  XOR2X1 U495 ( .A(sti_addr[4]), .B(\add_47/carry[8] ), .Y(\backward[0][8] )
         );
  OR2X1 U496 ( .A(n292), .B(\add_47/carry[7] ), .Y(\add_47/carry[8] ) );
  XNOR2X1 U497 ( .A(\add_47/carry[7] ), .B(n199), .Y(\backward[0][7] ) );
  AND2X1 U498 ( .A(sti_addr[2]), .B(\add_47/carry[6] ), .Y(\add_47/carry[7] )
         );
  XOR2X1 U499 ( .A(sti_addr[2]), .B(\add_47/carry[6] ), .Y(\backward[0][6] )
         );
  AND2X1 U500 ( .A(sti_addr[1]), .B(\add_47/carry[5] ), .Y(\add_47/carry[6] )
         );
  XOR2X1 U501 ( .A(sti_addr[1]), .B(\add_47/carry[5] ), .Y(\backward[0][5] )
         );
  AND2X1 U502 ( .A(sti_addr[0]), .B(\add_47/carry[4] ), .Y(\add_47/carry[5] )
         );
  XOR2X1 U503 ( .A(sti_addr[0]), .B(\add_47/carry[4] ), .Y(\backward[0][4] )
         );
  AND2X1 U504 ( .A(n286), .B(\add_47/carry[3] ), .Y(\add_47/carry[4] ) );
  XOR2X1 U505 ( .A(n286), .B(\add_47/carry[3] ), .Y(\backward[0][3] ) );
  AND2X1 U506 ( .A(n287), .B(\add_47/carry[2] ), .Y(\add_47/carry[3] ) );
  XOR2X1 U507 ( .A(n287), .B(\add_47/carry[2] ), .Y(\backward[0][2] ) );
  AND2X1 U508 ( .A(n288), .B(n290), .Y(\add_47/carry[2] ) );
  XOR2X1 U509 ( .A(n288), .B(n290), .Y(\backward[0][1] ) );
  XOR2X1 U510 ( .A(sti_addr[9]), .B(\add_49/carry[13] ), .Y(\backward[2][13] )
         );
  AND2X1 U511 ( .A(sti_addr[8]), .B(\add_49/carry[12] ), .Y(\add_49/carry[13] ) );
  XOR2X1 U512 ( .A(sti_addr[8]), .B(\add_49/carry[12] ), .Y(\backward[2][12] )
         );
  AND2X1 U513 ( .A(sti_addr[7]), .B(\add_49/carry[11] ), .Y(\add_49/carry[12] ) );
  XOR2X1 U514 ( .A(sti_addr[7]), .B(\add_49/carry[11] ), .Y(\backward[2][11] )
         );
  AND2X1 U515 ( .A(sti_addr[6]), .B(\add_49/carry[10] ), .Y(\add_49/carry[11] ) );
  XOR2X1 U516 ( .A(sti_addr[6]), .B(\add_49/carry[10] ), .Y(\backward[2][10] )
         );
  AND2X1 U517 ( .A(sti_addr[5]), .B(\add_49/carry[9] ), .Y(\add_49/carry[10] )
         );
  XOR2X1 U518 ( .A(sti_addr[5]), .B(\add_49/carry[9] ), .Y(\backward[2][9] )
         );
  AND2X1 U519 ( .A(sti_addr[4]), .B(\add_49/carry[8] ), .Y(\add_49/carry[9] )
         );
  XOR2X1 U520 ( .A(sti_addr[4]), .B(\add_49/carry[8] ), .Y(\backward[2][8] )
         );
  AND2X1 U521 ( .A(n292), .B(\add_49/carry[7] ), .Y(\add_49/carry[8] ) );
  XOR2X1 U522 ( .A(sti_addr[3]), .B(\add_49/carry[7] ), .Y(\backward[2][7] )
         );
  OR2X1 U523 ( .A(sti_addr[2]), .B(\add_49/carry[6] ), .Y(\add_49/carry[7] )
         );
  XNOR2X1 U524 ( .A(\add_49/carry[6] ), .B(sti_addr[2]), .Y(\backward[2][6] )
         );
  OR2X1 U525 ( .A(sti_addr[1]), .B(\add_49/carry[5] ), .Y(\add_49/carry[6] )
         );
  XNOR2X1 U526 ( .A(\add_49/carry[5] ), .B(sti_addr[1]), .Y(\backward[2][5] )
         );
  OR2X1 U527 ( .A(sti_addr[0]), .B(\add_49/carry[4] ), .Y(\add_49/carry[5] )
         );
  XNOR2X1 U528 ( .A(\add_49/carry[4] ), .B(sti_addr[0]), .Y(\backward[2][4] )
         );
  OR2X1 U529 ( .A(n286), .B(\add_49/carry[3] ), .Y(\add_49/carry[4] ) );
  XNOR2X1 U530 ( .A(\add_49/carry[3] ), .B(n286), .Y(\backward[2][3] ) );
  OR2X1 U531 ( .A(n287), .B(\add_49/carry[2] ), .Y(\add_49/carry[3] ) );
  XNOR2X1 U532 ( .A(\add_49/carry[2] ), .B(n287), .Y(\backward[2][2] ) );
  OR2X1 U533 ( .A(n288), .B(n290), .Y(\add_49/carry[2] ) );
  XNOR2X1 U534 ( .A(n290), .B(n288), .Y(\backward[2][1] ) );
  XNOR2X1 U535 ( .A(sti_addr[9]), .B(\sub_43/carry [13]), .Y(\forward[1][13] )
         );
  OR2X1 U536 ( .A(sti_addr[8]), .B(\sub_43/carry [12]), .Y(\sub_43/carry [13])
         );
  XNOR2X1 U537 ( .A(\sub_43/carry [12]), .B(sti_addr[8]), .Y(\forward[1][12] )
         );
  OR2X1 U538 ( .A(sti_addr[7]), .B(\sub_43/carry [11]), .Y(\sub_43/carry [12])
         );
  XNOR2X1 U539 ( .A(\sub_43/carry [11]), .B(sti_addr[7]), .Y(\forward[1][11] )
         );
  OR2X1 U540 ( .A(sti_addr[6]), .B(\sub_43/carry [10]), .Y(\sub_43/carry [11])
         );
  XNOR2X1 U541 ( .A(\sub_43/carry [10]), .B(sti_addr[6]), .Y(\forward[1][10] )
         );
  OR2X1 U542 ( .A(sti_addr[5]), .B(\sub_43/carry [9]), .Y(\sub_43/carry [10])
         );
  XNOR2X1 U543 ( .A(\sub_43/carry [9]), .B(sti_addr[5]), .Y(\forward[1][9] )
         );
  OR2X1 U544 ( .A(sti_addr[4]), .B(sti_addr[3]), .Y(\sub_43/carry [9]) );
  XNOR2X1 U545 ( .A(sti_addr[3]), .B(sti_addr[4]), .Y(\forward[1][8] ) );
  XNOR2X1 U546 ( .A(sti_addr[9]), .B(\sub_42/carry[13] ), .Y(\forward[0][13] )
         );
  OR2X1 U547 ( .A(sti_addr[8]), .B(\sub_42/carry[12] ), .Y(\sub_42/carry[13] )
         );
  XNOR2X1 U548 ( .A(\sub_42/carry[12] ), .B(sti_addr[8]), .Y(\forward[0][12] )
         );
  OR2X1 U549 ( .A(sti_addr[7]), .B(\sub_42/carry[11] ), .Y(\sub_42/carry[12] )
         );
  XNOR2X1 U550 ( .A(\sub_42/carry[11] ), .B(sti_addr[7]), .Y(\forward[0][11] )
         );
  OR2X1 U551 ( .A(sti_addr[6]), .B(\sub_42/carry[10] ), .Y(\sub_42/carry[11] )
         );
  XNOR2X1 U552 ( .A(\sub_42/carry[10] ), .B(sti_addr[6]), .Y(\forward[0][10] )
         );
  OR2X1 U553 ( .A(sti_addr[5]), .B(\sub_42/carry[9] ), .Y(\sub_42/carry[10] )
         );
  XNOR2X1 U554 ( .A(\sub_42/carry[9] ), .B(sti_addr[5]), .Y(\forward[0][9] )
         );
  OR2X1 U555 ( .A(sti_addr[4]), .B(\sub_42/carry[8] ), .Y(\sub_42/carry[9] )
         );
  XNOR2X1 U556 ( .A(\sub_42/carry[8] ), .B(sti_addr[4]), .Y(\forward[0][8] )
         );
  AND2X1 U557 ( .A(\sub_42/carry[7] ), .B(sti_addr[3]), .Y(\sub_42/carry[8] )
         );
  XOR2X1 U558 ( .A(n199), .B(\sub_42/carry[7] ), .Y(\forward[0][7] ) );
  OR2X1 U559 ( .A(sti_addr[2]), .B(\sub_42/carry[6] ), .Y(\sub_42/carry[7] )
         );
  XNOR2X1 U560 ( .A(\sub_42/carry[6] ), .B(sti_addr[2]), .Y(\forward[0][6] )
         );
  OR2X1 U561 ( .A(sti_addr[1]), .B(\sub_42/carry[5] ), .Y(\sub_42/carry[6] )
         );
  XNOR2X1 U562 ( .A(\sub_42/carry[5] ), .B(sti_addr[1]), .Y(\forward[0][5] )
         );
  OR2X1 U563 ( .A(sti_addr[0]), .B(\sub_42/carry[4] ), .Y(\sub_42/carry[5] )
         );
  XNOR2X1 U564 ( .A(\sub_42/carry[4] ), .B(sti_addr[0]), .Y(\forward[0][4] )
         );
  OR2X1 U565 ( .A(n286), .B(\sub_42/carry[3] ), .Y(\sub_42/carry[4] ) );
  XNOR2X1 U566 ( .A(\sub_42/carry[3] ), .B(n286), .Y(\forward[0][3] ) );
  OR2X1 U567 ( .A(n287), .B(\sub_42/carry[2] ), .Y(\sub_42/carry[3] ) );
  XNOR2X1 U568 ( .A(\sub_42/carry[2] ), .B(n287), .Y(\forward[0][2] ) );
  OR2X1 U569 ( .A(n288), .B(n290), .Y(\sub_42/carry[2] ) );
  XNOR2X1 U570 ( .A(n290), .B(n288), .Y(\forward[0][1] ) );
  XNOR2X1 U571 ( .A(sti_addr[9]), .B(\sub_44/carry[13] ), .Y(\forward[2][13] )
         );
  OR2X1 U572 ( .A(sti_addr[8]), .B(\sub_44/carry[12] ), .Y(\sub_44/carry[13] )
         );
  XNOR2X1 U573 ( .A(\sub_44/carry[12] ), .B(sti_addr[8]), .Y(\forward[2][12] )
         );
  OR2X1 U574 ( .A(sti_addr[7]), .B(\sub_44/carry[11] ), .Y(\sub_44/carry[12] )
         );
  XNOR2X1 U575 ( .A(\sub_44/carry[11] ), .B(sti_addr[7]), .Y(\forward[2][11] )
         );
  OR2X1 U576 ( .A(sti_addr[6]), .B(\sub_44/carry[10] ), .Y(\sub_44/carry[11] )
         );
  XNOR2X1 U577 ( .A(\sub_44/carry[10] ), .B(sti_addr[6]), .Y(\forward[2][10] )
         );
  OR2X1 U578 ( .A(sti_addr[5]), .B(\sub_44/carry[9] ), .Y(\sub_44/carry[10] )
         );
  XNOR2X1 U579 ( .A(\sub_44/carry[9] ), .B(sti_addr[5]), .Y(\forward[2][9] )
         );
  OR2X1 U580 ( .A(sti_addr[4]), .B(\sub_44/carry[8] ), .Y(\sub_44/carry[9] )
         );
  XNOR2X1 U581 ( .A(\sub_44/carry[8] ), .B(sti_addr[4]), .Y(\forward[2][8] )
         );
  OR2X1 U582 ( .A(n292), .B(\sub_44/carry[7] ), .Y(\sub_44/carry[8] ) );
  XNOR2X1 U583 ( .A(\sub_44/carry[7] ), .B(n199), .Y(\forward[2][7] ) );
  AND2X1 U584 ( .A(\sub_44/carry[6] ), .B(sti_addr[2]), .Y(\sub_44/carry[7] )
         );
  XOR2X1 U585 ( .A(sti_addr[2]), .B(\sub_44/carry[6] ), .Y(\forward[2][6] ) );
  AND2X1 U586 ( .A(\sub_44/carry[5] ), .B(sti_addr[1]), .Y(\sub_44/carry[6] )
         );
  XOR2X1 U587 ( .A(sti_addr[1]), .B(\sub_44/carry[5] ), .Y(\forward[2][5] ) );
  AND2X1 U588 ( .A(\sub_44/carry[4] ), .B(sti_addr[0]), .Y(\sub_44/carry[5] )
         );
  XOR2X1 U589 ( .A(sti_addr[0]), .B(\sub_44/carry[4] ), .Y(\forward[2][4] ) );
  AND2X1 U590 ( .A(\sub_44/carry[3] ), .B(n286), .Y(\sub_44/carry[4] ) );
  XOR2X1 U591 ( .A(n286), .B(\sub_44/carry[3] ), .Y(\forward[2][3] ) );
  AND2X1 U592 ( .A(\sub_44/carry[2] ), .B(n287), .Y(\sub_44/carry[3] ) );
  XOR2X1 U593 ( .A(n287), .B(\sub_44/carry[2] ), .Y(\forward[2][2] ) );
  AND2X1 U594 ( .A(n290), .B(n288), .Y(\sub_44/carry[2] ) );
  XOR2X1 U595 ( .A(n288), .B(n290), .Y(\forward[2][1] ) );
  XNOR2X1 U596 ( .A(sti_addr[9]), .B(\sub_160/carry[13] ), .Y(N210) );
  OR2X1 U597 ( .A(sti_addr[8]), .B(\sub_160/carry[12] ), .Y(
        \sub_160/carry[13] ) );
  XNOR2X1 U598 ( .A(\sub_160/carry[12] ), .B(sti_addr[8]), .Y(N209) );
  OR2X1 U599 ( .A(sti_addr[7]), .B(\sub_160/carry[11] ), .Y(
        \sub_160/carry[12] ) );
  XNOR2X1 U600 ( .A(\sub_160/carry[11] ), .B(sti_addr[7]), .Y(N208) );
  OR2X1 U601 ( .A(sti_addr[6]), .B(\sub_160/carry[10] ), .Y(
        \sub_160/carry[11] ) );
  XNOR2X1 U602 ( .A(\sub_160/carry[10] ), .B(sti_addr[6]), .Y(N207) );
  OR2X1 U603 ( .A(sti_addr[5]), .B(\sub_160/carry[9] ), .Y(\sub_160/carry[10] ) );
  XNOR2X1 U604 ( .A(\sub_160/carry[9] ), .B(sti_addr[5]), .Y(N206) );
  OR2X1 U605 ( .A(sti_addr[4]), .B(\sub_160/carry[8] ), .Y(\sub_160/carry[9] )
         );
  XNOR2X1 U606 ( .A(\sub_160/carry[8] ), .B(sti_addr[4]), .Y(N205) );
  OR2X1 U607 ( .A(sti_addr[3]), .B(\sub_160/carry[7] ), .Y(\sub_160/carry[8] )
         );
  XNOR2X1 U608 ( .A(\sub_160/carry[7] ), .B(n199), .Y(N204) );
  OR2X1 U609 ( .A(sti_addr[2]), .B(\sub_160/carry[6] ), .Y(\sub_160/carry[7] )
         );
  XNOR2X1 U610 ( .A(\sub_160/carry[6] ), .B(sti_addr[2]), .Y(N203) );
  OR2X1 U611 ( .A(sti_addr[1]), .B(\sub_160/carry[5] ), .Y(\sub_160/carry[6] )
         );
  XNOR2X1 U612 ( .A(\sub_160/carry[5] ), .B(sti_addr[1]), .Y(N202) );
  OR2X1 U613 ( .A(sti_addr[0]), .B(\sub_160/carry[4] ), .Y(\sub_160/carry[5] )
         );
  XNOR2X1 U614 ( .A(\sub_160/carry[4] ), .B(sti_addr[0]), .Y(N201) );
  OR2X1 U615 ( .A(n286), .B(\sub_160/carry[3] ), .Y(\sub_160/carry[4] ) );
  XNOR2X1 U616 ( .A(\sub_160/carry[3] ), .B(n286), .Y(N200) );
  OR2X1 U617 ( .A(n287), .B(\sub_160/carry[2] ), .Y(\sub_160/carry[3] ) );
  XNOR2X1 U618 ( .A(\sub_160/carry[2] ), .B(n287), .Y(N199) );
  XOR2X1 U619 ( .A(sti_addr[9]), .B(\add_155/carry[13] ), .Y(N195) );
  AND2X1 U620 ( .A(\add_155/carry[12] ), .B(sti_addr[8]), .Y(
        \add_155/carry[13] ) );
  XOR2X1 U621 ( .A(sti_addr[8]), .B(\add_155/carry[12] ), .Y(N194) );
  AND2X1 U622 ( .A(\add_155/carry[11] ), .B(sti_addr[7]), .Y(
        \add_155/carry[12] ) );
  XOR2X1 U623 ( .A(sti_addr[7]), .B(\add_155/carry[11] ), .Y(N193) );
  AND2X1 U624 ( .A(\add_155/carry[10] ), .B(sti_addr[6]), .Y(
        \add_155/carry[11] ) );
  XOR2X1 U625 ( .A(sti_addr[6]), .B(\add_155/carry[10] ), .Y(N192) );
  AND2X1 U626 ( .A(\add_155/carry[9] ), .B(sti_addr[5]), .Y(
        \add_155/carry[10] ) );
  XOR2X1 U627 ( .A(sti_addr[5]), .B(\add_155/carry[9] ), .Y(N191) );
  AND2X1 U628 ( .A(\add_155/carry[8] ), .B(sti_addr[4]), .Y(\add_155/carry[9] ) );
  XOR2X1 U629 ( .A(sti_addr[4]), .B(\add_155/carry[8] ), .Y(N190) );
  AND2X1 U630 ( .A(\add_155/carry[7] ), .B(n199), .Y(\add_155/carry[8] ) );
  XOR2X1 U631 ( .A(sti_addr[3]), .B(\add_155/carry[7] ), .Y(N189) );
  AND2X1 U632 ( .A(\add_155/carry[6] ), .B(sti_addr[2]), .Y(\add_155/carry[7] ) );
  XOR2X1 U633 ( .A(sti_addr[2]), .B(\add_155/carry[6] ), .Y(N188) );
  AND2X1 U634 ( .A(\add_155/carry[5] ), .B(sti_addr[1]), .Y(\add_155/carry[6] ) );
  XOR2X1 U635 ( .A(sti_addr[1]), .B(\add_155/carry[5] ), .Y(N187) );
  AND2X1 U636 ( .A(\add_155/carry[4] ), .B(sti_addr[0]), .Y(\add_155/carry[5] ) );
  XOR2X1 U637 ( .A(sti_addr[0]), .B(\add_155/carry[4] ), .Y(N186) );
  AND2X1 U638 ( .A(\add_155/carry[3] ), .B(n286), .Y(\add_155/carry[4] ) );
  XOR2X1 U639 ( .A(n286), .B(\add_155/carry[3] ), .Y(N185) );
  AND2X1 U640 ( .A(\add_155/carry[2] ), .B(n287), .Y(\add_155/carry[3] ) );
  XOR2X1 U641 ( .A(n287), .B(\add_155/carry[2] ), .Y(N184) );
  NOR2X1 U642 ( .A(n317), .B(N35), .Y(n311) );
  NOR2X1 U643 ( .A(n317), .B(\forward[1][0] ), .Y(n310) );
  NOR2X1 U644 ( .A(n290), .B(N36), .Y(n308) );
  NOR2X1 U645 ( .A(N35), .B(N36), .Y(n307) );
  AO22X1 U646 ( .A0(sti_di[5]), .A1(n308), .B0(sti_di[4]), .B1(n307), .Y(n302)
         );
  AOI221XL U647 ( .A0(sti_di[6]), .A1(n311), .B0(sti_di[7]), .B1(n310), .C0(
        n302), .Y(n305) );
  AO22X1 U648 ( .A0(sti_di[1]), .A1(n308), .B0(sti_di[0]), .B1(n307), .Y(n303)
         );
  AOI221XL U649 ( .A0(sti_di[2]), .A1(n311), .B0(sti_di[3]), .B1(n310), .C0(
        n303), .Y(n304) );
  OA22X1 U650 ( .A0(n316), .A1(n305), .B0(N37), .B1(n304), .Y(n315) );
  AO22X1 U651 ( .A0(sti_di[13]), .A1(n308), .B0(sti_di[12]), .B1(n307), .Y(
        n306) );
  AOI221XL U652 ( .A0(sti_di[14]), .A1(n311), .B0(sti_di[15]), .B1(n310), .C0(
        n306), .Y(n313) );
  AO22X1 U653 ( .A0(sti_di[9]), .A1(n308), .B0(sti_di[8]), .B1(n307), .Y(n309)
         );
  AOI221XL U654 ( .A0(sti_di[10]), .A1(n311), .B0(sti_di[11]), .B1(n310), .C0(
        n309), .Y(n312) );
  OAI22XL U655 ( .A0(n313), .A1(n316), .B0(N37), .B1(n312), .Y(n314) );
  OAI2BB2XL U656 ( .B0(n315), .B1(N38), .A0N(N38), .A1N(n314), .Y(
        forward_pixel) );
  AND4X1 U657 ( .A(sti_addr[0]), .B(n286), .C(n287), .D(n288), .Y(n319) );
  AOI21X1 U658 ( .A0(sti_addr[2]), .A1(sti_addr[1]), .B0(n199), .Y(n318) );
  AOI2BB1X1 U659 ( .A0N(n319), .A1N(n199), .B0(n318), .Y(n321) );
  AND4X1 U660 ( .A(sti_addr[5]), .B(sti_addr[4]), .C(sti_addr[9]), .D(
        sti_addr[8]), .Y(n320) );
  NAND4X1 U661 ( .A(sti_addr[7]), .B(sti_addr[6]), .C(n321), .D(n320), .Y(N181) );
  NAND2BX1 U662 ( .AN(res_di[4]), .B(min_value[4]), .Y(n322) );
  OAI222XL U663 ( .A0(res_di[5]), .A1(n152), .B0(res_di[5]), .B1(n322), .C0(
        n152), .C1(n322), .Y(n323) );
  OAI222XL U664 ( .A0(min_value[6]), .A1(n323), .B0(n336), .B1(n323), .C0(
        min_value[6]), .C1(n336), .Y(n334) );
  NAND2BX1 U665 ( .AN(res_di[2]), .B(min_value[2]), .Y(n326) );
  OAI22XL U666 ( .A0(res_di[3]), .A1(n150), .B0(res_di[3]), .B1(n326), .Y(n332) );
  NOR2BX1 U667 ( .AN(res_di[2]), .B(min_value[2]), .Y(n324) );
  OA22X1 U668 ( .A0(n324), .A1(res_di[3]), .B0(n324), .B1(n150), .Y(n328) );
  AOI21X1 U669 ( .A0(res_di[1]), .A1(n148), .B0(res_di[0]), .Y(n325) );
  AOI2BB2X1 U670 ( .B0(n325), .B1(min_value[0]), .A0N(res_di[1]), .A1N(n148), 
        .Y(n327) );
  OAI22XL U671 ( .A0(n328), .A1(n327), .B0(n326), .B1(n150), .Y(n331) );
  NOR2BX1 U672 ( .AN(res_di[4]), .B(min_value[4]), .Y(n329) );
  OAI22XL U673 ( .A0(n329), .A1(n152), .B0(res_di[5]), .B1(n329), .Y(n330) );
  OAI221XL U674 ( .A0(min_value[6]), .A1(n336), .B0(n332), .B1(n331), .C0(n330), .Y(n333) );
  AO22X1 U675 ( .A0(n146), .A1(res_di[7]), .B0(n334), .B1(n333), .Y(n335) );
  OAI21XL U676 ( .A0(res_di[7]), .A1(n146), .B0(n335), .Y(N211) );
  NOR2BX1 U677 ( .AN(min_value[2]), .B(N224), .Y(n342) );
  AOI2BB1X1 U678 ( .A0N(n353), .A1N(min_value[1]), .B0(N222), .Y(n337) );
  AO22X1 U679 ( .A0(n337), .A1(min_value[0]), .B0(min_value[1]), .B1(n353), 
        .Y(n341) );
  NOR2BX1 U680 ( .AN(N224), .B(min_value[2]), .Y(n338) );
  OAI22XL U681 ( .A0(n338), .A1(n150), .B0(N225), .B1(n338), .Y(n340) );
  OAI22XL U682 ( .A0(N225), .A1(n150), .B0(N225), .B1(n354), .Y(n339) );
  AOI221XL U683 ( .A0(min_value[3]), .A1(n342), .B0(n341), .B1(n340), .C0(n339), .Y(n349) );
  NOR2X1 U684 ( .A(n200), .B(min_value[4]), .Y(n343) );
  OAI22XL U685 ( .A0(n343), .A1(n352), .B0(N227), .B1(n343), .Y(n344) );
  OAI21XL U686 ( .A0(min_value[6]), .A1(n355), .B0(n344), .Y(n348) );
  OAI222XL U687 ( .A0(min_value[6]), .A1(n346), .B0(n355), .B1(n346), .C0(
        min_value[6]), .C1(n355), .Y(n347) );
  OA21XL U688 ( .A0(n349), .A1(n348), .B0(n347), .Y(n350) );
  AOI211X1 U689 ( .A0(n146), .A1(N229), .B0(N230), .C0(n350), .Y(n351) );
endmodule

