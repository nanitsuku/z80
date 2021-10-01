module ALU(
  input  [7:0] io_input_A,
  input  [7:0] io_input_B,
  input        io_input_carry,
  input  [7:0] io_calc_type,
  output [7:0] io_output_C,
  output [7:0] io_flag
);
  wire  _T_1 = 4'h8 == io_calc_type[7:4]; // @[Conditional.scala 37:30]
  wire [8:0] _temp_T = {1'h0,io_input_A}; // @[Cat.scala 30:58]
  wire [8:0] _temp_T_1 = {1'h0,io_input_B}; // @[Cat.scala 30:58]
  wire [8:0] _temp_T_3 = _temp_T + _temp_T_1; // @[ALU.scala 74:43]
  wire  _temp_T_5 = io_calc_type[3] & io_input_carry; // @[ALU.scala 74:90]
  wire [8:0] _GEN_98 = {{8'd0}, _temp_T_5}; // @[ALU.scala 74:71]
  wire [8:0] _temp_T_7 = _temp_T_3 + _GEN_98; // @[ALU.scala 74:71]
  wire [16:0] _temph_T_1 = {{13'd0}, io_input_A[3:0]}; // @[ALU.scala 75:28]
  wire [15:0] _GEN_99 = {{12'd0}, io_input_B[3:0]}; // @[ALU.scala 75:46]
  wire [15:0] _temph_T_5 = _temph_T_1[15:0] + _GEN_99; // @[ALU.scala 75:46]
  wire [15:0] _GEN_100 = {{15'd0}, _temp_T_5}; // @[ALU.scala 75:64]
  wire [15:0] _temph_T_9 = _temph_T_5 + _GEN_100; // @[ALU.scala 75:64]
  wire  _T_2 = 4'h9 == io_calc_type[7:4]; // @[Conditional.scala 37:30]
  wire [15:0] _temph_T_15 = _temph_T_1[15:0] - _GEN_99; // @[ALU.scala 84:44]
  wire [15:0] _temph_T_19 = _temph_T_15 - _GEN_100; // @[ALU.scala 84:62]
  wire  _T_3 = 4'ha == io_calc_type[7:4]; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'hb == io_calc_type[7:4]; // @[Conditional.scala 37:30]
  wire  _T_5 = 8'hb0 == io_calc_type; // @[Conditional.scala 37:30]
  wire  _T_6 = 8'hb8 == io_calc_type; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_57 = _T_6 ? _temph_T_15 : 16'h0; // @[Conditional.scala 39:67 ALU.scala 111:17]
  wire [15:0] _GEN_69 = _T_5 ? 16'h0 : _GEN_57; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_76 = _T_4 ? _GEN_69 : 16'h0; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_83 = _T_3 ? 16'h0 : _GEN_76; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_85 = _T_2 ? _temph_T_19 : _GEN_83; // @[Conditional.scala 39:67 ALU.scala 84:13]
  wire [15:0] _GEN_92 = _T_1 ? _temph_T_9 : _GEN_85; // @[Conditional.scala 40:58 ALU.scala 75:15]
  wire [7:0] temph = _GEN_92[7:0];
  wire  _PV_T_2 = io_input_A[7] ^ io_input_B[7]; // @[ALU.scala 77:31]
  wire [8:0] _temp_T_11 = _temp_T - _temp_T_1; // @[ALU.scala 83:41]
  wire [8:0] _temp_T_15 = _temp_T_11 - _GEN_98; // @[ALU.scala 83:69]
  wire [7:0] _temp_T_17 = io_input_A ^ io_input_B; // @[ALU.scala 92:47]
  wire [7:0] _temp_T_18 = io_input_A & io_input_B; // @[ALU.scala 92:73]
  wire [7:0] _temp_T_19 = io_calc_type[3] ? _temp_T_17 : _temp_T_18; // @[ALU.scala 92:18]
  wire [7:0] _temp_T_20 = io_input_A | io_input_B; // @[ALU.scala 102:30]
  wire [15:0] _GEN_56 = _T_6 ? {{7'd0}, _temp_T_11} : 16'h0; // @[Conditional.scala 39:67 ALU.scala 110:16]
  wire [15:0] _GEN_63 = _T_5 ? {{8'd0}, _temp_T_20} : _GEN_56; // @[Conditional.scala 40:58 ALU.scala 102:16]
  wire [15:0] _GEN_70 = _T_4 ? _GEN_63 : 16'h0; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_77 = _T_3 ? {{8'd0}, _temp_T_19} : _GEN_70; // @[Conditional.scala 39:67 ALU.scala 92:12]
  wire [15:0] _GEN_84 = _T_2 ? {{7'd0}, _temp_T_15} : _GEN_77; // @[Conditional.scala 39:67 ALU.scala 83:12]
  wire [15:0] temp = _T_1 ? {{7'd0}, _temp_T_7} : _GEN_84; // @[Conditional.scala 40:58 ALU.scala 74:14]
  wire  _PV_T_6 = io_input_A[7] ^ temp[7]; // @[ALU.scala 77:65]
  wire  _GEN_1 = 2'h1 == temp[7:6] ? 1'h0 : 1'h1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_2 = 2'h2 == temp[7:6] ? 1'h0 : _GEN_1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_3 = 2'h3 == temp[7:6] | _GEN_2; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_5 = 2'h1 == temp[5:4] ? 1'h0 : 1'h1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_6 = 2'h2 == temp[5:4] ? 1'h0 : _GEN_5; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_7 = 2'h3 == temp[5:4] | _GEN_6; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [1:0] _PV_T_17 = {_GEN_3,_GEN_7}; // @[Cat.scala 30:58]
  wire  _GEN_9 = 2'h1 == temp[3:2] ? 1'h0 : 1'h1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_10 = 2'h2 == temp[3:2] ? 1'h0 : _GEN_9; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_11 = 2'h3 == temp[3:2] | _GEN_10; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_13 = 2'h1 == temp[1:0] ? 1'h0 : 1'h1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_14 = 2'h2 == temp[1:0] ? 1'h0 : _GEN_13; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_15 = 2'h3 == temp[1:0] | _GEN_14; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [1:0] _PV_T_20 = {_GEN_11,_GEN_15}; // @[Cat.scala 30:58]
  wire  _GEN_17 = 2'h1 == _PV_T_17 ? 1'h0 : 1'h1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_18 = 2'h2 == _PV_T_17 ? 1'h0 : _GEN_17; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_19 = 2'h3 == _PV_T_17 | _GEN_18; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_21 = 2'h1 == _PV_T_20 ? 1'h0 : 1'h1; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_22 = 2'h2 == _PV_T_20 ? 1'h0 : _GEN_21; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire  _GEN_23 = 2'h3 == _PV_T_20 | _GEN_22; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [1:0] _PV_T_21 = {_GEN_19,_GEN_23}; // @[Cat.scala 30:58]
  wire  _GEN_25 = 2'h1 == _PV_T_21 ? 1'h0 : 1'h1; // @[ALU.scala 94:10 ALU.scala 94:10]
  wire  _GEN_26 = 2'h2 == _PV_T_21 ? 1'h0 : _GEN_25; // @[ALU.scala 94:10 ALU.scala 94:10]
  wire  _GEN_27 = 2'h3 == _PV_T_21 | _GEN_26; // @[ALU.scala 94:10 ALU.scala 94:10]
  wire  _GEN_58 = _T_6 ? temph[4] : 1'h1; // @[Conditional.scala 39:67 ALU.scala 112:13]
  wire  _GEN_59 = _T_6 ? (io_input_A[7] | io_input_B[7]) ^ temp[7] : 1'h1; // @[Conditional.scala 39:67 ALU.scala 113:14]
  wire  _GEN_61 = _T_6 ? temp[8] : 1'h1; // @[Conditional.scala 39:67 ALU.scala 115:13]
  wire [7:0] _GEN_62 = _T_6 ? io_input_A : 8'h0; // @[Conditional.scala 39:67 ALU.scala 116:23 ALU.scala 52:15]
  wire  _GEN_64 = _T_5 | _GEN_58; // @[Conditional.scala 40:58 ALU.scala 103:13]
  wire  _GEN_65 = _T_5 ? _GEN_27 : _GEN_59; // @[Conditional.scala 40:58 ALU.scala 104:14]
  wire  _GEN_66 = _T_5 ? 1'h0 : 1'h1; // @[Conditional.scala 40:58 ALU.scala 105:13]
  wire  _GEN_67 = _T_5 ? 1'h0 : _GEN_61; // @[Conditional.scala 40:58 ALU.scala 106:13]
  wire [15:0] _GEN_68 = _T_5 ? temp : {{8'd0}, _GEN_62}; // @[Conditional.scala 40:58 ALU.scala 107:23]
  wire  _GEN_71 = _T_4 ? _GEN_64 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_4 ? _GEN_65 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_73 = _T_4 ? _GEN_66 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_74 = _T_4 ? _GEN_67 : 1'h1; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_75 = _T_4 ? _GEN_68 : 16'h0; // @[Conditional.scala 39:67 ALU.scala 52:15]
  wire  _GEN_78 = _T_3 | _GEN_71; // @[Conditional.scala 39:67 ALU.scala 93:9]
  wire  _GEN_79 = _T_3 ? 2'h3 == _PV_T_21 | _GEN_26 : _GEN_72; // @[Conditional.scala 39:67 ALU.scala 94:10]
  wire  _GEN_80 = _T_3 ? 1'h0 : _GEN_73; // @[Conditional.scala 39:67 ALU.scala 95:9]
  wire  _GEN_81 = _T_3 ? 1'h0 : _GEN_74; // @[Conditional.scala 39:67 ALU.scala 96:9]
  wire [15:0] _GEN_82 = _T_3 ? temp : _GEN_75; // @[Conditional.scala 39:67 ALU.scala 97:19]
  wire  _GEN_86 = _T_2 ? temph[4] : _GEN_78; // @[Conditional.scala 39:67 ALU.scala 85:9]
  wire  _GEN_87 = _T_2 ? _PV_T_2 & _PV_T_6 : _GEN_79; // @[Conditional.scala 39:67 ALU.scala 86:10]
  wire  _GEN_88 = _T_2 | _GEN_80; // @[Conditional.scala 39:67 ALU.scala 87:9]
  wire  _GEN_89 = _T_2 ? temp[8] : _GEN_81; // @[Conditional.scala 39:67 ALU.scala 88:9]
  wire [15:0] _GEN_90 = _T_2 ? temp : _GEN_82; // @[Conditional.scala 39:67 ALU.scala 89:19]
  wire  H = _T_1 ? temph[4] : _GEN_86; // @[Conditional.scala 40:58 ALU.scala 76:11]
  wire  PV = _T_1 ? ~(io_input_A[7] ^ io_input_B[7]) & (io_input_A[7] ^ temp[7]) : _GEN_87; // @[Conditional.scala 40:58 ALU.scala 77:12]
  wire  N = _T_1 ? 1'h0 : _GEN_88; // @[Conditional.scala 40:58 ALU.scala 78:11]
  wire  C = _T_1 ? temp[8] : _GEN_89; // @[Conditional.scala 40:58 ALU.scala 79:11]
  wire [15:0] _GEN_97 = _T_1 ? temp : _GEN_90; // @[Conditional.scala 40:58 ALU.scala 80:21]
  wire  Z = temp[7:0] == 8'h0; // @[ALU.scala 123:19]
  wire [3:0] io_flag_lo = {1'h1,PV,N,C}; // @[Cat.scala 30:58]
  wire [3:0] io_flag_hi = {temp[7],Z,1'h1,H}; // @[Cat.scala 30:58]
  assign io_output_C = _GEN_97[7:0];
  assign io_flag = {io_flag_hi,io_flag_lo}; // @[Cat.scala 30:58]
endmodule
module ALU16(
  input  [15:0] io_input_register,
  input  [7:0]  io_offset,
  output [15:0] io_output
);
  wire [16:0] _io_output_T = {1'b0,$signed(io_input_register)}; // @[ALU.scala 14:39]
  wire [16:0] _GEN_0 = {{9{io_offset[7]}},io_offset}; // @[ALU.scala 14:42]
  wire [16:0] _io_output_T_3 = $signed(_io_output_T) + $signed(_GEN_0); // @[ALU.scala 14:42]
  assign io_output = _io_output_T_3[15:0]; // @[ALU.scala 14:54]
endmodule
module Core(
  input         clock,
  input         reset,
  output [15:0] io_bus_addr,
  input  [7:0]  io_bus_data,
  output [7:0]  io_bus_data1,
  output        io_bus_RD_,
  output        io_bus_WR_,
  output        io_bus_MREQ_,
  output        io_exit
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] alu_io_input_A; // @[Core.scala 52:19]
  wire [7:0] alu_io_input_B; // @[Core.scala 52:19]
  wire  alu_io_input_carry; // @[Core.scala 52:19]
  wire [7:0] alu_io_calc_type; // @[Core.scala 52:19]
  wire [7:0] alu_io_output_C; // @[Core.scala 52:19]
  wire [7:0] alu_io_flag; // @[Core.scala 52:19]
  wire [15:0] alu16_io_input_register; // @[Core.scala 53:21]
  wire [7:0] alu16_io_offset; // @[Core.scala 53:21]
  wire [15:0] alu16_io_output; // @[Core.scala 53:21]
  reg [7:0] regfiles_front [0:7]; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_A_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_A_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_B_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_B_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_C_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_C_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_D_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_D_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_E_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_E_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_H_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_H_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_L_MPORT_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_L_MPORT_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_1_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_1_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_1_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_1_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_2_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_2_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_2_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_2_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_2_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_2_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_1_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_1_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_1_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_1_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_39_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_39_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_1_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_1_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_4_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_4_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_4_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_4_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_5_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_5_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_5_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_5_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_6_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_6_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_1_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_1_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_95_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_95_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_7_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_7_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_6_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_6_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_6_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_6_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_7_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_7_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_7_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_7_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_8_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_8_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_8_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_8_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_10_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_10_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_5_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_5_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_2_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_2_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_5_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_5_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_152_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_152_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_11_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_11_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_5_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_5_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_9_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_9_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_9_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_9_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_10_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_10_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_10_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_10_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_11_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_11_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_11_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_11_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_14_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_14_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_7_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_7_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_3_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_3_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_7_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_7_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_208_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_208_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_15_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_15_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_7_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_7_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_12_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_12_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_12_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_12_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_13_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_13_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_13_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_13_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_14_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_14_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_14_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_14_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_18_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_18_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_9_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_9_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_4_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_4_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_9_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_9_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_264_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_264_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_19_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_19_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_9_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_9_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_15_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_15_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_15_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_15_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_16_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_16_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_16_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_16_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_17_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_17_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_17_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_17_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_22_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_22_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_11_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_11_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_5_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_5_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_11_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_11_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_320_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_320_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_23_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_23_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_11_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_11_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_18_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_18_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_18_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_18_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_19_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_19_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_19_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_19_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_hi_20_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_hi_20_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_register_lo_20_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_register_lo_20_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_26_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_26_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_io_bus_data1_MPORT_13_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_io_bus_data1_MPORT_13_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_hi_6_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_hi_6_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_mem_refer_addr_lo_13_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_mem_refer_addr_lo_13_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_376_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_376_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_A_MPORT_27_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_A_MPORT_27_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_alu_io_input_B_MPORT_13_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_alu_io_input_B_MPORT_13_addr; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_22_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_22_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_22_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_22_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_23_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_23_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_23_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_23_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_24_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_24_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_24_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_24_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_25_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_25_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_25_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_25_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_26_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_26_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_26_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_26_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_27_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_27_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_27_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_27_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_31_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_31_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_31_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_31_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_38_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_38_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_38_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_38_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_40_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_40_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_40_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_40_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_45_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_45_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_45_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_45_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_49_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_49_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_49_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_49_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_56_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_56_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_56_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_56_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_78_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_78_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_78_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_78_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_79_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_79_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_79_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_79_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_80_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_80_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_80_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_80_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_81_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_81_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_81_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_81_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_82_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_82_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_82_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_82_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_83_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_83_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_83_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_83_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_87_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_87_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_87_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_87_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_94_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_94_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_94_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_94_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_96_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_96_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_96_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_96_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_101_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_101_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_101_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_101_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_105_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_105_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_105_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_105_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_112_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_112_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_112_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_112_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_135_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_135_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_135_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_135_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_136_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_136_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_136_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_136_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_137_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_137_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_137_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_137_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_138_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_138_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_138_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_138_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_139_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_139_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_139_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_139_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_140_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_140_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_140_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_140_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_144_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_144_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_144_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_144_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_151_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_151_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_151_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_151_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_153_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_153_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_153_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_153_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_158_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_158_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_158_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_158_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_162_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_162_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_162_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_162_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_169_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_169_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_169_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_169_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_191_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_191_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_191_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_191_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_192_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_192_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_192_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_192_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_193_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_193_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_193_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_193_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_194_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_194_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_194_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_194_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_195_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_195_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_195_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_195_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_196_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_196_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_196_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_196_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_200_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_200_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_200_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_200_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_207_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_207_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_207_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_207_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_209_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_209_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_209_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_209_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_214_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_214_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_214_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_214_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_218_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_218_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_218_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_218_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_225_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_225_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_225_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_225_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_247_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_247_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_247_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_247_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_248_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_248_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_248_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_248_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_249_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_249_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_249_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_249_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_250_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_250_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_250_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_250_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_251_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_251_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_251_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_251_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_252_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_252_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_252_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_252_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_256_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_256_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_256_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_256_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_263_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_263_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_263_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_263_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_265_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_265_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_265_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_265_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_270_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_270_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_270_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_270_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_274_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_274_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_274_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_274_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_281_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_281_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_281_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_281_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_303_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_303_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_303_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_303_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_304_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_304_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_304_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_304_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_305_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_305_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_305_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_305_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_306_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_306_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_306_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_306_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_307_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_307_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_307_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_307_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_308_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_308_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_308_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_308_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_312_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_312_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_312_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_312_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_319_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_319_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_319_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_319_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_321_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_321_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_321_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_321_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_326_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_326_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_326_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_326_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_330_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_330_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_330_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_330_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_337_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_337_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_337_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_337_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_359_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_359_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_359_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_359_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_360_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_360_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_360_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_360_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_361_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_361_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_361_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_361_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_362_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_362_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_362_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_362_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_363_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_363_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_363_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_363_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_364_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_364_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_364_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_364_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_368_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_368_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_368_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_368_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_375_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_375_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_375_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_375_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_377_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_377_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_377_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_377_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_382_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_382_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_382_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_382_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_386_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_386_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_386_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_386_en; // @[Core.scala 90:27]
  wire [7:0] regfiles_front_MPORT_393_data; // @[Core.scala 90:27]
  wire [2:0] regfiles_front_MPORT_393_addr; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_393_mask; // @[Core.scala 90:27]
  wire  regfiles_front_MPORT_393_en; // @[Core.scala 90:27]
  reg [7:0] opcodes [0:3]; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_7_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_7_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_9_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_9_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_11_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_11_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_13_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_13_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_15_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_15_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_16_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_16_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_18_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_18_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_20_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_20_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_21_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_21_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_28_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_28_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_29_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_29_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_30_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_30_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_32_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_32_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_34_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_34_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_36_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_36_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_37_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_37_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_41_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_41_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_42_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_42_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_43_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_43_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_44_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_44_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_46_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_46_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_47_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_47_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_48_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_48_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_50_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_50_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_51_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_51_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_54_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_54_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_57_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_57_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_58_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_58_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_59_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_59_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_61_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_61_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_63_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_63_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_64_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_64_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_65_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_65_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_66_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_66_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_67_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_67_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_68_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_68_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_69_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_69_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_71_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_71_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_72_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_72_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_7_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_7_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_74_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_74_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_9_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_9_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_76_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_76_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_77_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_77_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_84_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_84_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_85_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_85_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_1_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_1_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_86_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_86_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_88_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_88_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_90_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_90_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_92_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_92_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_93_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_93_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_97_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_97_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_98_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_98_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_99_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_99_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_100_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_100_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_102_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_102_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_103_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_103_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_104_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_104_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_106_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_106_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_107_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_107_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_11_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_11_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_110_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_110_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_114_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_114_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_115_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_115_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_116_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_116_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_118_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_118_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_120_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_120_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_121_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_121_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_122_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_122_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_123_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_123_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_124_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_124_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_125_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_125_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_126_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_126_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_128_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_128_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_129_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_129_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_13_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_13_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_131_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_131_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_14_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_14_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_15_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_15_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_7_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_7_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_133_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_133_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_134_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_134_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_141_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_141_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_142_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_142_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_2_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_2_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_9_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_9_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_143_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_143_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_145_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_145_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_147_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_147_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_149_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_149_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_150_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_150_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_154_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_154_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_155_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_155_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_156_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_156_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_157_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_157_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_159_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_159_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_160_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_160_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_161_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_161_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_163_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_163_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_164_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_164_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_16_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_16_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_17_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_17_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_167_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_167_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_170_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_170_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_171_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_171_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_172_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_172_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_174_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_174_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_176_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_176_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_177_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_177_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_178_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_178_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_179_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_179_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_180_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_180_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_181_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_181_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_182_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_182_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_184_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_184_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_185_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_185_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_18_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_18_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_19_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_19_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_9_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_9_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_187_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_187_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_20_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_20_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_21_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_21_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_189_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_189_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_190_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_190_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_197_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_197_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_198_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_198_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_3_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_3_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_13_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_13_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_199_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_199_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_201_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_201_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_203_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_203_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_205_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_205_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_206_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_206_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_210_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_210_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_211_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_211_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_212_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_212_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_213_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_213_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_215_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_215_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_216_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_216_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_217_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_217_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_219_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_219_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_220_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_220_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_22_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_22_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_23_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_23_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_11_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_11_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_7_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_7_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_223_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_223_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_7_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_7_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_226_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_226_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_227_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_227_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_228_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_228_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_230_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_230_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_232_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_232_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_233_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_233_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_234_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_234_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_235_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_235_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_236_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_236_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_237_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_237_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_238_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_238_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_240_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_240_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_241_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_241_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_24_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_24_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_25_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_25_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_243_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_243_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_26_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_26_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_27_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_27_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_13_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_13_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_245_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_245_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_246_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_246_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_253_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_253_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_254_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_254_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_4_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_4_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_16_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_16_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_17_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_17_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_255_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_255_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_257_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_257_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_259_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_259_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_261_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_261_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_262_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_262_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_266_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_266_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_267_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_267_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_268_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_268_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_269_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_269_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_271_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_271_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_272_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_272_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_273_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_273_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_275_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_275_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_276_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_276_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_28_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_28_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_29_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_29_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_14_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_14_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_9_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_9_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_279_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_279_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_8_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_8_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_9_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_9_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_282_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_282_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_283_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_283_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_284_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_284_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_286_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_286_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_288_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_288_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_289_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_289_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_290_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_290_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_291_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_291_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_292_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_292_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_293_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_293_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_294_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_294_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_296_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_296_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_297_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_297_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_30_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_30_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_31_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_31_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_15_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_15_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_299_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_299_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_32_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_32_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_33_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_33_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_16_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_16_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_301_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_301_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_302_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_302_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_309_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_309_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_310_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_310_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_5_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_5_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_20_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_20_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_21_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_21_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_311_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_311_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_313_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_313_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_315_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_315_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_317_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_317_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_318_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_318_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_322_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_322_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_323_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_323_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_324_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_324_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_325_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_325_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_327_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_327_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_328_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_328_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_329_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_329_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_331_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_331_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_332_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_332_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_34_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_34_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_35_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_35_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_17_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_17_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_11_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_11_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_335_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_335_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_10_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_10_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_11_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_11_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_338_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_338_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_339_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_339_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_340_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_340_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_342_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_342_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_mem_refer_addr_lo_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_mem_refer_addr_lo_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_344_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_344_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_345_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_345_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_346_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_346_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_347_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_347_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_348_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_348_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_349_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_349_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_350_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_350_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_IFF_MPORT_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_IFF_MPORT_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_352_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_352_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_353_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_353_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_36_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_36_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_37_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_37_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_18_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_18_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_355_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_355_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_38_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_38_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_39_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_39_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_19_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_19_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_357_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_357_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_358_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_358_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_365_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_365_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_366_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_366_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_calc_type_MPORT_6_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_calc_type_MPORT_6_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_24_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_24_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_A_MPORT_25_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_A_MPORT_25_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_367_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_367_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_369_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_369_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_371_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_371_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_io_bus_data1_MPORT_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_io_bus_data1_MPORT_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_373_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_373_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_374_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_374_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_378_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_378_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_379_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_379_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_380_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_380_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_381_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_381_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_383_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_383_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_384_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_384_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_385_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_385_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu_io_input_B_MPORT_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu_io_input_B_MPORT_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_387_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_387_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_388_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_388_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_40_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_40_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_op_MPORT_41_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_op_MPORT_41_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_hi_20_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_hi_20_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_PC_next_lo_13_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_PC_next_lo_13_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_391_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_391_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_12_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_12_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_alu16_io_offset_MPORT_13_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_alu16_io_offset_MPORT_13_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_394_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_394_addr; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_53_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_53_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_53_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_53_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_109_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_109_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_109_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_109_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_113_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_113_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_113_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_113_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_166_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_166_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_166_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_166_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_222_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_222_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_222_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_222_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_278_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_278_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_278_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_278_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_334_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_334_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_334_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_334_en; // @[Core.scala 724:20]
  wire [7:0] opcodes_MPORT_390_data; // @[Core.scala 724:20]
  wire [1:0] opcodes_MPORT_390_addr; // @[Core.scala 724:20]
  wire  opcodes_MPORT_390_mask; // @[Core.scala 724:20]
  wire  opcodes_MPORT_390_en; // @[Core.scala 724:20]
  reg  reset_hold; // @[Core.scala 34:27]
  wire  _T_1 = ~reset; // @[Core.scala 772:30]
  reg  REG; // @[Core.scala 772:43]
  wire  _T_2 = ~reset & REG; // @[Core.scala 772:33]
  wire  _GEN_0 = _T_2 ? 1'h0 : reset_hold; // @[Core.scala 36:35 Core.scala 37:16 Core.scala 34:27]
  reg [7:0] F; // @[Core.scala 41:18]
  wire  S_flag = F[7]; // @[Core.scala 42:29]
  wire  Z_flag = F[6]; // @[Core.scala 43:29]
  wire  PV_flag = F[2]; // @[Core.scala 45:30]
  wire  C_flag = F[0]; // @[Core.scala 47:29]
  reg [7:0] R; // @[Core.scala 49:18]
  reg [15:0] PC_next; // @[Core.scala 58:24]
  reg [2:0] machine_state; // @[Core.scala 67:30]
  reg [2:0] machine_state_next; // @[Core.scala 68:35]
  reg  IFF; // @[Core.scala 71:20]
  reg [15:0] mem_refer_addr; // @[Core.scala 73:31]
  reg [15:0] PC; // @[Core.scala 110:19]
  reg [15:0] SP; // @[Core.scala 113:19]
  reg [7:0] opcode_index; // @[Core.scala 725:29]
  reg [7:0] m1_t_cycle; // @[Core.scala 770:27]
  reg [2:0] dummy_cycle; // @[Core.scala 775:28]
  wire  _T_3 = ~reset_hold; // @[Core.scala 777:8]
  wire  _T_4 = 3'h1 == machine_state; // @[Conditional.scala 37:30]
  wire  _T_5 = m1_t_cycle < 8'h4; // @[Core.scala 783:25]
  wire [7:0] _m1_t_cycle_T_1 = m1_t_cycle + 8'h1; // @[Core.scala 784:36]
  wire  R_hi = R[7]; // @[Core.scala 787:21]
  wire [6:0] R_lo = R[6:0] + 7'h1; // @[Core.scala 787:34]
  wire [7:0] _R_T_3 = {R_hi,R_lo}; // @[Cat.scala 30:58]
  wire [7:0] _GEN_1 = m1_t_cycle < 8'h4 ? _m1_t_cycle_T_1 : 8'h1; // @[Core.scala 783:32 Core.scala 784:22 Core.scala 786:22]
  wire  _T_6 = m1_t_cycle == 8'h1; // @[Core.scala 790:25]
  reg  REG_1; // @[Core.scala 772:43]
  wire  _T_10 = ~clock & REG_1; // @[Core.scala 772:33]
  wire  _GEN_3 = _T_10 ? 1'h0 : 1'h1; // @[Core.scala 796:43 Core.scala 797:26 Core.scala 793:24]
  wire  _T_12 = m1_t_cycle == 8'h2; // @[Core.scala 801:32]
  wire [15:0] _PC_next_T_1 = PC_next + 16'h1; // @[Core.scala 803:30]
  wire [7:0] _T_15 = opcodes_MPORT_3_data; // @[Core.scala 730:22]
  wire  _T_16 = 8'h0 == _T_15; // @[Core.scala 730:22]
  wire [7:0] _T_19 = opcodes_MPORT_5_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_20 = 8'hd3 == _T_19; // @[Core.scala 731:27]
  wire [7:0] _opcode_index_T_1 = opcode_index + 8'h1; // @[Core.scala 554:40]
  wire [2:0] _GEN_4 = _T_12 ? 3'h2 : machine_state_next; // @[Core.scala 551:32 Core.scala 552:30 Core.scala 68:35]
  wire [15:0] _GEN_5 = _T_12 ? _PC_next_T_1 : mem_refer_addr; // @[Core.scala 551:32 Core.scala 553:26 Core.scala 73:31]
  wire [7:0] _GEN_6 = _T_12 ? _opcode_index_T_1 : opcode_index; // @[Core.scala 551:32 Core.scala 554:24 Core.scala 725:29]
  wire  _T_25 = 3'h2 == machine_state; // @[Conditional.scala 37:30]
  wire [7:0] A = regfiles_front_A_MPORT_data;
  wire [15:0] _mem_refer_addr_T_2 = {A,opcodes_mem_refer_addr_lo_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_7 = _T_12 ? 3'h5 : machine_state_next; // @[Core.scala 558:32 Core.scala 559:30 Core.scala 68:35]
  wire [15:0] _GEN_11 = _T_12 ? _mem_refer_addr_T_2 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  wire [15:0] _GEN_12 = _T_12 ? _PC_next_T_1 : _PC_next_T_1; // @[Core.scala 558:32 Core.scala 561:19 Core.scala 803:19]
  wire  _T_27 = 3'h5 == machine_state; // @[Conditional.scala 37:30]
  wire  _T_28 = 8'h1 == m1_t_cycle; // @[Conditional.scala 37:30]
  reg  REG_2; // @[Core.scala 772:43]
  wire  _T_32 = ~clock & REG_2; // @[Core.scala 772:33]
  wire [7:0] _GEN_13 = ~opcodes_MPORT_7_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_17 = _T_32 ? _GEN_13 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire  _T_35 = 8'h2 == m1_t_cycle; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_18 = ~opcodes_MPORT_8_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_3; // @[Core.scala 772:43]
  wire  _T_41 = ~clock & REG_3; // @[Core.scala 772:33]
  wire  _GEN_26 = _T_41 ? opcodes_MPORT_9_data[3] : 1'h1; // @[Core.scala 583:47 Core.scala 758:14]
  wire  _T_44 = 8'h3 == m1_t_cycle; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_27 = ~opcodes_MPORT_10_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire  _T_47 = 8'h4 == m1_t_cycle; // @[Conditional.scala 37:30]
  wire [7:0] _GEN_28 = ~opcodes_MPORT_11_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_4; // @[Core.scala 772:43]
  wire  _T_53 = ~clock & REG_4; // @[Core.scala 772:33]
  wire  _GEN_35 = _T_53 & opcodes_MPORT_12_data[3]; // @[Core.scala 602:48 Core.scala 807:22]
  wire [7:0] _GEN_40 = _T_47 ? _GEN_28 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_47 = _T_47 ? 8'h0 : opcode_index; // @[Conditional.scala 39:67 Core.scala 610:26 Core.scala 725:29]
  wire [7:0] _GEN_51 = _T_44 ? _GEN_27 : _GEN_40; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_52 = _T_44 ? 3'h1 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 596:32 Core.scala 68:35]
  wire  _GEN_55 = _T_44 ? 1'h0 : _T_47; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_59 = _T_44 ? 1'h0 : _T_47 & _T_53; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_60 = _T_44 ? 1'h0 : _T_47 & _GEN_35; // @[Conditional.scala 39:67 Core.scala 807:22]
  wire [7:0] _GEN_62 = _T_44 ? opcode_index : _GEN_47; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [7:0] _GEN_66 = _T_35 ? _GEN_18 : _GEN_51; // @[Conditional.scala 39:67]
  wire  _GEN_70 = _T_35 & _T_41; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_71 = _T_35 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67]
  wire  _GEN_72 = _T_35 ? _GEN_26 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_75 = _T_35 ? 1'h0 : _T_44; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [2:0] _GEN_76 = _T_35 ? machine_state_next : _GEN_52; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire  _GEN_79 = _T_35 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_82 = _T_35 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_83 = _T_35 ? opcode_index : _GEN_62; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire  _GEN_86 = _T_28 & _T_32; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_87 = _T_28 ? _GEN_17 : _GEN_66; // @[Conditional.scala 40:58]
  wire  _GEN_90 = _T_28 ? 1'h0 : _T_35; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_94 = _T_28 ? 1'h0 : _GEN_70; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_95 = _T_28 ? 1'h0 : _GEN_71; // @[Conditional.scala 40:58 Core.scala 807:22]
  wire  _GEN_96 = _T_28 | _GEN_72; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_99 = _T_28 ? 1'h0 : _GEN_75; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [2:0] _GEN_100 = _T_28 ? machine_state_next : _GEN_76; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire  _GEN_103 = _T_28 ? 1'h0 : _GEN_79; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_106 = _T_28 ? 1'h0 : _GEN_82; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_107 = _T_28 ? opcode_index : _GEN_83; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [15:0] _GEN_108 = _T_27 ? mem_refer_addr : PC_next; // @[Conditional.scala 39:67 Core.scala 565:21 Core.scala 802:23]
  wire [7:0] _GEN_112 = _T_27 ? _GEN_87 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_121 = _T_27 ? _GEN_96 : 1'h1; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire [2:0] _GEN_125 = _T_27 ? _GEN_100 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [7:0] _GEN_132 = _T_27 ? _GEN_107 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_133 = _T_25 ? _GEN_7 : _GEN_125; // @[Conditional.scala 39:67]
  wire  _GEN_136 = _T_25 & _T_12; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_137 = _T_25 ? _GEN_11 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [15:0] _GEN_138 = _T_25 ? _GEN_12 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [15:0] _GEN_139 = _T_25 ? PC_next : _GEN_108; // @[Conditional.scala 39:67 Core.scala 802:23]
  wire  _GEN_142 = _T_25 ? 1'h0 : _T_27 & _GEN_86; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_143 = _T_25 ? 8'h0 : _GEN_112; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_146 = _T_25 ? 1'h0 : _T_27 & _GEN_90; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_150 = _T_25 ? 1'h0 : _T_27 & _GEN_94; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_151 = _T_25 ? 1'h0 : _T_27 & _GEN_95; // @[Conditional.scala 39:67 Core.scala 807:22]
  wire  _GEN_152 = _T_25 | _GEN_121; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire  _GEN_155 = _T_25 ? 1'h0 : _T_27 & _GEN_99; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_158 = _T_25 ? 1'h0 : _T_27 & _GEN_103; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_161 = _T_25 ? 1'h0 : _T_27 & _GEN_106; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_162 = _T_25 ? opcode_index : _GEN_132; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_163 = _T_4 ? _GEN_4 : _GEN_133; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_164 = _T_4 ? _GEN_5 : _GEN_137; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_165 = _T_4 ? _GEN_6 : _GEN_162; // @[Conditional.scala 40:58]
  wire  _GEN_168 = _T_4 ? 1'h0 : _GEN_136; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_169 = _T_4 ? _PC_next_T_1 : _GEN_138; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire [15:0] _GEN_170 = _T_4 ? PC_next : _GEN_139; // @[Conditional.scala 40:58 Core.scala 802:23]
  wire  _GEN_173 = _T_4 ? 1'h0 : _GEN_142; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_174 = _T_4 ? 8'h0 : _GEN_143; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_177 = _T_4 ? 1'h0 : _GEN_146; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_181 = _T_4 ? 1'h0 : _GEN_150; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_182 = _T_4 ? 1'h0 : _GEN_151; // @[Conditional.scala 40:58 Core.scala 807:22]
  wire  _GEN_183 = _T_4 | _GEN_152; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_186 = _T_4 ? 1'h0 : _GEN_155; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_189 = _T_4 ? 1'h0 : _GEN_158; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_192 = _T_4 ? 1'h0 : _GEN_161; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_56 = opcodes_MPORT_13_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_57 = 8'hf3 == _T_56; // @[Core.scala 732:27]
  wire [7:0] _T_60 = opcodes_MPORT_15_data; // @[Core.scala 733:27]
  wire [7:0] _T_62 = opcodes_MPORT_16_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_64 = 8'hcd == _T_60 | 8'hc4 == _T_62; // @[Core.scala 733:51]
  wire  op_hi = opcodes_op_MPORT_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo = opcodes_op_MPORT_1_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op = {op_hi,op_lo}; // @[Cat.scala 30:58]
  wire  _cond_T = op == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_2 = ~Z_flag; // @[Core.scala 627:35]
  wire  _cond_T_3 = op == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_6 = op == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_8 = ~C_flag; // @[Core.scala 629:35]
  wire  _cond_T_9 = op == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_12 = op == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_14 = ~PV_flag; // @[Core.scala 631:35]
  wire  _cond_T_15 = op == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_18 = op == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_20 = ~S_flag; // @[Core.scala 633:35]
  wire  _cond_T_21 = op == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_24 = op == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond = _cond_T | (_cond_T_3 | (_cond_T_6 | (_cond_T_9 | (_cond_T_12 | (_cond_T_15 | (_cond_T_18 | (_cond_T_21 |
    _cond_T_24))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_193 = _T_35 ? 3'h2 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 646:30 Core.scala 68:35]
  wire [15:0] _GEN_194 = _T_35 ? _PC_next_T_1 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 648:26 Core.scala 73:31]
  wire [7:0] _GEN_195 = _T_35 ? _opcode_index_T_1 : opcode_index; // @[Conditional.scala 39:67 Core.scala 649:24 Core.scala 725:29]
  wire [15:0] _GEN_196 = _T_28 ? _PC_next_T_1 : _PC_next_T_1; // @[Conditional.scala 40:58 Core.scala 642:19 Core.scala 803:19]
  wire [2:0] _GEN_197 = _T_28 ? machine_state_next : _GEN_193; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _GEN_198 = _T_28 ? mem_refer_addr : _GEN_194; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_199 = _T_28 ? opcode_index : _GEN_195; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire  _T_75 = opcode_index == 8'h2; // @[Core.scala 669:28]
  wire [2:0] _GEN_200 = cond ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_201 = cond ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_202 = opcode_index == 8'h2 ? _GEN_200 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_203 = opcode_index == 8'h2 ? _GEN_201 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [2:0] _GEN_204 = opcode_index == 8'h2 ? 3'h1 : dummy_cycle; // @[Core.scala 669:36 Core.scala 677:25 Core.scala 775:28]
  wire [15:0] _GEN_206 = _T_35 ? _PC_next_T_1 : _PC_next_T_1; // @[Conditional.scala 40:58 Core.scala 667:23 Core.scala 803:19]
  wire [7:0] _GEN_207 = _T_35 ? _GEN_203 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_208 = _T_35 ? _GEN_202 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_209 = _T_35 ? _GEN_204 : dummy_cycle; // @[Conditional.scala 40:58 Core.scala 775:28]
  wire  _T_77 = 3'h4 == machine_state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_210 = _T_28 ? 3'h3 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 691:30 Core.scala 68:35]
  wire  _T_79 = 3'h3 == machine_state; // @[Conditional.scala 37:30]
  wire  _T_81 = 8'h3 == opcode_index; // @[Conditional.scala 37:30]
  wire  _T_82 = 8'h4 == opcode_index; // @[Conditional.scala 37:30]
  wire [15:0] _PC_next_T_8 = {opcodes_PC_next_hi_data,opcodes_PC_next_lo_data}; // @[Cat.scala 30:58]
  wire  _GEN_212 = _T_82 ? $signed(1'sh1) : $signed(1'sh0); // @[Conditional.scala 39:67 Core.scala 711:30 Core.scala 56:19]
  wire [2:0] _GEN_213 = _T_82 ? 3'h1 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 712:32 Core.scala 68:35]
  wire [7:0] _GEN_214 = _T_82 ? 8'h0 : opcode_index; // @[Conditional.scala 39:67 Core.scala 713:26 Core.scala 725:29]
  wire [7:0] _GEN_215 = _T_82 ? PC[7:0] : 8'h0; // @[Conditional.scala 39:67 Core.scala 714:25 Core.scala 77:16]
  wire [15:0] _GEN_216 = _T_82 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 715:16 Core.scala 113:19]
  wire [15:0] _GEN_221 = _T_82 ? _PC_next_T_8 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 803:19]
  wire  _GEN_223 = _T_81 ? $signed(1'sh0) : $signed(_GEN_212); // @[Conditional.scala 40:58 Core.scala 702:23]
  wire [15:0] _GEN_224 = alu16_io_output; // @[Conditional.scala 40:58 Core.scala 703:29 Core.scala 697:29]
  wire [7:0] _GEN_225 = _T_81 ? _opcode_index_T_1 : _GEN_214; // @[Conditional.scala 40:58 Core.scala 704:26]
  wire [7:0] _GEN_226 = _T_81 ? PC[15:8] : _GEN_215; // @[Conditional.scala 40:58 Core.scala 706:25]
  wire [2:0] _GEN_227 = _T_81 ? machine_state_next : _GEN_213; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _GEN_228 = _T_81 ? SP : _GEN_216; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_231 = _T_81 ? 1'h0 : _T_82; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_233 = _T_81 ? _PC_next_T_1 : _GEN_221; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire  _GEN_235 = _T_12 ? $signed(_GEN_223) : $signed(1'sh0); // @[Core.scala 698:30 Core.scala 56:19]
  wire [15:0] _GEN_236 = _T_12 ? _GEN_224 : alu16_io_output; // @[Core.scala 698:30 Core.scala 697:29]
  wire [7:0] _GEN_237 = _T_12 ? _GEN_225 : opcode_index; // @[Core.scala 698:30 Core.scala 725:29]
  wire [7:0] _GEN_238 = _T_12 ? _GEN_226 : 8'h0; // @[Core.scala 698:30 Core.scala 77:16]
  wire [2:0] _GEN_239 = _T_12 ? _GEN_227 : machine_state_next; // @[Core.scala 698:30 Core.scala 68:35]
  wire [15:0] _GEN_240 = _T_12 ? _GEN_228 : SP; // @[Core.scala 698:30 Core.scala 113:19]
  wire  _GEN_243 = _T_12 & _GEN_231; // @[Core.scala 698:30 Core.scala 724:20]
  wire [15:0] _GEN_245 = _T_12 ? _GEN_233 : _PC_next_T_1; // @[Core.scala 698:30 Core.scala 803:19]
  wire [15:0] _GEN_246 = _T_79 ? SP : 16'h0; // @[Conditional.scala 39:67 Core.scala 55:27]
  wire [15:0] _GEN_247 = _T_79 ? _GEN_236 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_248 = _T_79 ? $signed(_GEN_235) : $signed(1'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_249 = _T_79 ? _GEN_237 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [7:0] _GEN_250 = _T_79 ? _GEN_238 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [2:0] _GEN_251 = _T_79 ? _GEN_239 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [15:0] _GEN_252 = _T_79 ? _GEN_240 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire [15:0] _GEN_257 = _T_79 ? _GEN_245 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [15:0] _GEN_258 = _T_77 ? SP : _GEN_246; // @[Conditional.scala 39:67 Core.scala 688:31]
  wire [2:0] _GEN_259 = _T_77 ? _GEN_210 : _GEN_251; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_260 = _T_77 ? mem_refer_addr : _GEN_247; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_261 = _T_77 ? $signed(1'sh0) : $signed(_GEN_248); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_262 = _T_77 ? opcode_index : _GEN_249; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [7:0] _GEN_263 = _T_77 ? 8'h0 : _GEN_250; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [15:0] _GEN_264 = _T_77 ? SP : _GEN_252; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_267 = _T_77 ? 1'h0 : _T_79 & _GEN_243; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_269 = _T_77 ? _PC_next_T_1 : _GEN_257; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [15:0] _GEN_270 = _T_25 ? _GEN_194 : _GEN_260; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_271 = _T_25 ? _GEN_206 : _GEN_269; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_272 = _T_25 ? _GEN_207 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_273 = _T_25 ? _GEN_208 : _GEN_259; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_274 = _T_25 ? _GEN_209 : dummy_cycle; // @[Conditional.scala 39:67 Core.scala 775:28]
  wire [15:0] _GEN_275 = _T_25 ? 16'h0 : _GEN_258; // @[Conditional.scala 39:67 Core.scala 55:27]
  wire  _GEN_276 = _T_25 ? $signed(1'sh0) : $signed(_GEN_261); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_277 = _T_25 ? 8'h0 : _GEN_263; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [15:0] _GEN_278 = _T_25 ? SP : _GEN_264; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_281 = _T_25 ? 1'h0 : _GEN_267; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_283 = _T_4 ? _GEN_196 : _GEN_271; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_284 = _T_4 ? _GEN_197 : _GEN_273; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_285 = _T_4 ? _GEN_198 : _GEN_270; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_286 = _T_4 ? _GEN_199 : _GEN_272; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_287 = _T_4 ? dummy_cycle : _GEN_274; // @[Conditional.scala 40:58 Core.scala 775:28]
  wire [15:0] _GEN_288 = _T_4 ? 16'h0 : _GEN_275; // @[Conditional.scala 40:58 Core.scala 55:27]
  wire  _GEN_289 = _T_4 ? $signed(1'sh0) : $signed(_GEN_276); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_290 = _T_4 ? 8'h0 : _GEN_277; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [15:0] _GEN_291 = _T_4 ? SP : _GEN_278; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_294 = _T_4 ? 1'h0 : _GEN_281; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_83 = opcodes_MPORT_18_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_84 = 8'hc0 == _T_83; // @[Core.scala 734:27]
  wire  op_hi_1 = opcodes_op_MPORT_2_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_1 = opcodes_op_MPORT_3_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_1 = {op_hi_1,op_lo_1}; // @[Cat.scala 30:58]
  wire  _cond_T_33 = op_1 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_36 = op_1 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_39 = op_1 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_42 = op_1 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_45 = op_1 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_48 = op_1 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_51 = op_1 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_54 = op_1 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_57 = op_1 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_1 = _cond_T_33 | (_cond_T_36 | (_cond_T_39 | (_cond_T_42 | (_cond_T_45 | (_cond_T_48 | (_cond_T_51 | (
    _cond_T_54 | _cond_T_57))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_296 = _cond_T_33 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_297 = _T_35 ? _GEN_296 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_298 = _T_35 ? 3'h1 : dummy_cycle; // @[Conditional.scala 40:58 Core.scala 516:25 Core.scala 775:28]
  wire [15:0] _GEN_299 = _T_35 ? SP : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 517:28 Core.scala 73:31]
  wire [2:0] _GEN_301 = cond_1 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_302 = cond_1 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _SP_T_1 = SP + 16'h1; // @[Core.scala 534:22]
  wire [15:0] _PC_next_T_9 = {opcodes_PC_next_hi_1_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_306 = _T_75 ? _PC_next_T_9 : _PC_next_T_1; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 803:19]
  wire [7:0] _GEN_307 = _T_75 ? 8'h0 : _opcode_index_T_1; // @[Core.scala 537:38 Core.scala 539:28 Core.scala 535:26]
  wire [2:0] _GEN_308 = _T_75 ? 3'h1 : machine_state_next; // @[Core.scala 537:38 Core.scala 540:34 Core.scala 68:35]
  wire [15:0] _GEN_309 = _T_35 ? _SP_T_1 : SP; // @[Conditional.scala 40:58 Core.scala 534:16 Core.scala 113:19]
  wire [7:0] _GEN_310 = _T_35 ? _GEN_307 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [15:0] _GEN_311 = _T_35 ? _SP_T_1 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 536:28 Core.scala 73:31]
  wire  _GEN_314 = _T_35 & _T_75; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_315 = _T_35 ? _GEN_306 : _PC_next_T_1; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire [2:0] _GEN_316 = _T_35 ? _GEN_308 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _GEN_317 = _T_25 ? _GEN_309 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire [7:0] _GEN_318 = _T_25 ? _GEN_310 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [15:0] _GEN_319 = _T_25 ? _GEN_311 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [15:0] _GEN_323 = _T_25 ? _GEN_315 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [2:0] _GEN_324 = _T_25 ? _GEN_316 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [2:0] _GEN_325 = _T_77 ? _GEN_301 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_326 = _T_77 ? _GEN_302 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_327 = _T_77 ? SP : _GEN_317; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire [15:0] _GEN_328 = _T_77 ? mem_refer_addr : _GEN_319; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_331 = _T_77 ? 1'h0 : _T_25 & _GEN_314; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_332 = _T_77 ? _PC_next_T_1 : _GEN_323; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [2:0] _GEN_333 = _T_4 ? _GEN_297 : _GEN_325; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_334 = _T_4 ? _GEN_298 : dummy_cycle; // @[Conditional.scala 40:58 Core.scala 775:28]
  wire [15:0] _GEN_335 = _T_4 ? _GEN_299 : _GEN_328; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_336 = _T_4 ? _GEN_195 : _GEN_326; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_337 = _T_4 ? SP : _GEN_327; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_340 = _T_4 ? 1'h0 : _GEN_331; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_341 = _T_4 ? _PC_next_T_1 : _GEN_332; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire [7:0] _T_95 = opcodes_MPORT_20_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_96 = 8'h3 == _T_95; // @[Core.scala 735:27]
  wire  _register_T_2 = opcodes_MPORT_21_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_3 = {regfiles_front_register_hi_data,regfiles_front_register_lo_data}; // @[Cat.scala 30:58]
  wire  _register_T_5 = opcodes_MPORT_21_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_6 = {regfiles_front_register_hi_1_data,regfiles_front_register_lo_1_data}; // @[Cat.scala 30:58]
  wire  _register_T_8 = opcodes_MPORT_21_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_9 = {regfiles_front_register_hi_2_data,regfiles_front_register_lo_2_data}; // @[Cat.scala 30:58]
  wire  _register_T_11 = opcodes_MPORT_21_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_12 = _register_T_11 ? SP : {{14'd0}, opcodes_MPORT_21_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_13 = _register_T_8 ? _register_T_9 : _register_T_12; // @[Mux.scala 98:16]
  wire [15:0] _register_T_14 = _register_T_5 ? _register_T_6 : _register_T_13; // @[Mux.scala 98:16]
  wire [15:0] register = _register_T_2 ? _register_T_3 : _register_T_14; // @[Mux.scala 98:16]
  reg [15:0] input_; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_2 = ~opcodes_MPORT_21_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_101 = m1_t_cycle == 8'h3; // @[Core.scala 197:31]
  wire  _T_105 = 2'h0 == opcodes_MPORT_21_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_108 = 2'h1 == opcodes_MPORT_21_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_111 = 2'h2 == opcodes_MPORT_21_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_114 = 2'h3 == opcodes_MPORT_21_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_344 = _T_114 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_352 = _T_111 ? SP : _GEN_344; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_362 = _T_108 ? 1'h0 : _T_111; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_367 = _T_108 ? SP : _GEN_352; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_377 = _T_105 ? 1'h0 : _T_108; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_384 = _T_105 ? 1'h0 : _GEN_362; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_389 = _T_105 ? SP : _GEN_367; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [2:0] _GEN_390 = _T_28 ? 3'h1 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 232:32 Core.scala 68:35]
  wire [7:0] _GEN_391 = _T_28 ? 8'h0 : opcode_index; // @[Conditional.scala 39:67 Core.scala 233:26 Core.scala 725:29]
  wire  _GEN_394 = _T_35 & _T_105; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_401 = _T_35 & _GEN_377; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_408 = _T_35 & _GEN_384; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_413 = _T_35 ? _GEN_389 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [2:0] _GEN_414 = _T_35 ? 3'h1 : _GEN_390; // @[Conditional.scala 40:58 Core.scala 227:32]
  wire [7:0] _GEN_415 = _T_35 ? 8'h0 : _GEN_391; // @[Conditional.scala 40:58 Core.scala 228:26]
  wire  _GEN_419 = _T_77 & _GEN_394; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_426 = _T_77 & _GEN_401; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_433 = _T_77 & _GEN_408; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_438 = _T_77 ? _GEN_413 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire [2:0] _GEN_439 = _T_77 ? _GEN_414 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [7:0] _GEN_440 = _T_77 ? _GEN_415 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_443 = _T_4 ? 3'h4 : _GEN_439; // @[Conditional.scala 40:58 Core.scala 193:28]
  wire [2:0] _GEN_445 = _T_4 ? 3'h2 : dummy_cycle; // @[Conditional.scala 40:58 Core.scala 195:21 Core.scala 775:28]
  wire  _GEN_448 = _T_4 ? 1'h0 : _GEN_419; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_455 = _T_4 ? 1'h0 : _GEN_426; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_462 = _T_4 ? 1'h0 : _GEN_433; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_467 = _T_4 ? SP : _GEN_438; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _GEN_468 = _T_4 ? opcode_index : _GEN_440; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [7:0] _T_116 = opcodes_MPORT_28_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_117 = 8'h4 == _T_116; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_1 = opcodes_alu_io_calc_type_MPORT_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_120 = opcodes_MPORT_29_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_121 = 8'h34 == _T_120; // @[Core.scala 244:22]
  reg [7:0] temp; // @[Core.scala 245:25]
  wire [7:0] H = regfiles_front_H_MPORT_data;
  wire [7:0] L = regfiles_front_L_MPORT_data;
  wire [15:0] _mem_refer_addr_T_9 = {H,L}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_471 = _T_6 ? 3'h3 : machine_state_next; // @[Core.scala 269:36 Core.scala 270:32 Core.scala 68:35]
  wire [7:0] _GEN_472 = _T_12 ? temp : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [15:0] _GEN_473 = _T_12 ? PC_next : mem_refer_addr; // @[Core.scala 275:36 Core.scala 277:28 Core.scala 73:31]
  wire [7:0] _GEN_474 = _T_12 ? 8'h0 : opcode_index; // @[Core.scala 275:36 Core.scala 278:26 Core.scala 725:29]
  wire [2:0] _GEN_475 = _T_79 ? 3'h1 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 274:30 Core.scala 68:35]
  wire [7:0] _GEN_476 = _T_79 ? _GEN_472 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [15:0] _GEN_477 = _T_79 ? _GEN_473 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [7:0] _GEN_478 = _T_79 ? _GEN_474 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_479 = _T_77 ? _GEN_471 : _GEN_475; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_480 = _T_77 ? 8'h0 : _GEN_476; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [15:0] _GEN_481 = _T_77 ? mem_refer_addr : _GEN_477; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [7:0] _GEN_482 = _T_77 ? opcode_index : _GEN_478; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_483 = _T_25 ? 3'h4 : _GEN_479; // @[Conditional.scala 39:67 Core.scala 256:30]
  wire [2:0] _GEN_485 = _T_25 ? 3'h1 : dummy_cycle; // @[Conditional.scala 39:67 Core.scala 266:23 Core.scala 775:28]
  wire [7:0] _GEN_486 = _T_25 ? 8'h0 : _GEN_480; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [15:0] _GEN_487 = _T_25 ? mem_refer_addr : _GEN_481; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [7:0] _GEN_488 = _T_25 ? opcode_index : _GEN_482; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_489 = _T_4 ? 3'h2 : _GEN_483; // @[Conditional.scala 40:58 Core.scala 250:30]
  wire [15:0] _GEN_490 = _T_4 ? _mem_refer_addr_T_9 : _GEN_487; // @[Conditional.scala 40:58 Core.scala 251:26]
  wire [7:0] _GEN_491 = _T_4 ? 8'h1 : _GEN_488; // @[Conditional.scala 40:58 Core.scala 252:24]
  wire [2:0] _GEN_493 = _T_4 ? dummy_cycle : _GEN_485; // @[Conditional.scala 40:58 Core.scala 775:28]
  wire [7:0] _GEN_494 = _T_4 ? 8'h0 : _GEN_486; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_129 = opcodes_MPORT_29_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_130 = 8'h4 == _T_129; // @[Core.scala 282:29]
  wire [7:0] _GEN_505 = 8'h4 == _T_129 ? regfiles_front_alu_io_input_A_MPORT_2_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_508 = 8'h4 == _T_129 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_515 = 8'h34 == _T_120 ? opcodes_alu_io_input_A_MPORT_data : _GEN_505; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_516 = 8'h34 == _T_120 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_517 = 8'h34 == _T_120 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_518 = 8'h34 == _T_120 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_519 = 8'h34 == _T_120 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_520 = 8'h34 == _T_120 ? _GEN_494 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_523 = 8'h34 == _T_120 ? 1'h0 : _T_130; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_527 = 8'h34 == _T_120 ? 1'h0 : _GEN_508; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_133 = opcodes_MPORT_32_data; // @[Core.scala 737:27]
  wire  _T_134 = 8'h76 == _T_133; // @[Core.scala 737:27]
  wire [7:0] _T_137 = opcodes_MPORT_34_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_138 = 8'h70 == _T_137; // @[Core.scala 738:27]
  wire [2:0] _GEN_531 = _T_101 ? 3'h3 : machine_state_next; // @[Core.scala 396:32 Core.scala 397:30 Core.scala 68:35]
  wire [7:0] _GEN_532 = _T_101 ? 8'h1 : opcode_index; // @[Core.scala 396:32 Core.scala 398:24 Core.scala 725:29]
  wire [15:0] _GEN_533 = _T_101 ? _mem_refer_addr_T_9 : mem_refer_addr; // @[Core.scala 396:32 Core.scala 399:26 Core.scala 73:31]
  wire [7:0] _GEN_538 = _T_79 ? regfiles_front_io_bus_data1_MPORT_1_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_540 = _T_79 ? 8'h0 : opcode_index; // @[Conditional.scala 39:67 Core.scala 406:22 Core.scala 725:29]
  wire [2:0] _GEN_541 = _T_4 ? _GEN_531 : _GEN_475; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_542 = _T_4 ? _GEN_532 : _GEN_540; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_543 = _T_4 ? _GEN_533 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire  _GEN_546 = _T_4 ? 1'h0 : _T_79; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_548 = _T_4 ? 8'h0 : _GEN_538; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_144 = opcodes_MPORT_36_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_145 = 8'h40 == _T_144; // @[Core.scala 739:27]
  wire [2:0] src_reg = opcodes_MPORT_37_data[2:0]; // @[Core.scala 298:27]
  wire  _T_149 = src_reg == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_11 = {regfiles_front_mem_refer_addr_hi_data,regfiles_front_mem_refer_addr_lo_1_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_549 = src_reg == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_554 = src_reg == 3'h6 ? _mem_refer_addr_T_11 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_557 = src_reg == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_566 = _T_12 ? 3'h1 : machine_state_next; // @[Core.scala 316:32 Core.scala 318:30 Core.scala 68:35]
  wire [2:0] _GEN_573 = _T_25 ? _GEN_566 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [7:0] _GEN_574 = _T_25 ? _GEN_474 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_575 = _T_4 ? _GEN_549 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_578 = _T_4 & _T_149; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_580 = _T_4 ? _GEN_554 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_581 = _T_4 ? {{7'd0}, _T_149} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_584 = _T_4 & _GEN_557; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_153 = opcodes_MPORT_41_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_154 = 8'h6 == _T_153; // @[Core.scala 740:27]
  wire [15:0] _GEN_593 = ~opcodes_MPORT_43_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [2:0] _GEN_595 = _T_101 ? 3'h2 : machine_state_next; // @[Core.scala 331:41 Core.scala 333:30 Core.scala 68:35]
  wire [15:0] _GEN_599 = _T_101 ? _GEN_593 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [7:0] _GEN_600 = _T_12 ? opcode_index : _GEN_532; // @[Core.scala 329:34 Core.scala 725:29]
  wire [2:0] _GEN_601 = _T_12 ? machine_state_next : _GEN_595; // @[Core.scala 329:34 Core.scala 68:35]
  wire  _GEN_604 = _T_12 ? 1'h0 : _T_101; // @[Core.scala 329:34 Core.scala 724:20]
  wire [15:0] _GEN_605 = _T_12 ? mem_refer_addr : _GEN_599; // @[Core.scala 329:34 Core.scala 73:31]
  wire [2:0] _GEN_606 = _T_25 ? 3'h1 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 342:28 Core.scala 68:35]
  wire [7:0] _GEN_607 = _T_25 ? 8'h0 : opcode_index; // @[Conditional.scala 39:67 Core.scala 343:22 Core.scala 725:29]
  wire [15:0] _GEN_614 = _T_25 ? _PC_next_T_1 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 345:17 Core.scala 803:19]
  wire [7:0] _GEN_615 = _T_4 ? _GEN_600 : _GEN_607; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_616 = _T_4 ? _GEN_601 : _GEN_606; // @[Conditional.scala 40:58]
  wire  _GEN_619 = _T_4 & _GEN_604; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_620 = _T_4 ? _GEN_605 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire  _GEN_623 = _T_4 ? 1'h0 : _T_25; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_627 = _T_4 ? _PC_next_T_1 : _GEN_614; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire [7:0] _T_166 = opcodes_MPORT_47_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_167 = 8'h80 == _T_166; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_2 = opcodes_MPORT_48_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _GEN_633 = _T_101 ? alu_io_flag : F; // @[Core.scala 358:32 Core.scala 387:11 Core.scala 41:18]
  wire  _GEN_636 = _T_4 & _T_101; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _GEN_639 = _T_4 ? _GEN_633 : F; // @[Conditional.scala 40:58 Core.scala 41:18]
  wire [7:0] _T_185 = opcodes_MPORT_50_data; // @[Core.scala 742:27]
  wire [7:0] _T_187 = opcodes_MPORT_51_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_189 = 8'hc3 == _T_185 | 8'hc2 == _T_187; // @[Core.scala 742:51]
  wire  op_hi_2 = opcodes_op_MPORT_4_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_2 = opcodes_op_MPORT_5_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_3 = {op_hi_2,op_lo_2}; // @[Cat.scala 30:58]
  wire [7:0] _GEN_641 = _T_35 ? 8'h1 : opcode_index; // @[Conditional.scala 40:58 Core.scala 419:22 Core.scala 725:29]
  wire  _T_197 = 8'h1 == opcode_index; // @[Conditional.scala 37:30]
  wire  _T_198 = 8'h2 == opcode_index; // @[Conditional.scala 37:30]
  wire  _cond_T_66 = op_3 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_69 = op_3 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_72 = op_3 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_75 = op_3 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_78 = op_3 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_81 = op_3 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_84 = op_3 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_87 = op_3 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_90 = op_3 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_2 = _cond_T_66 | (_cond_T_69 | (_cond_T_72 | (_cond_T_75 | (_cond_T_78 | (_cond_T_81 | (_cond_T_84 | (
    _cond_T_87 | _cond_T_90))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_16 = {opcodes_PC_next_hi_2_data,opcodes_PC_next_lo_1_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_643 = ~cond_2 ? _PC_next_T_1 : _PC_next_T_16; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_646 = ~cond_2 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [7:0] _GEN_648 = _T_198 ? 8'h0 : opcode_index; // @[Conditional.scala 39:67 Core.scala 436:28 Core.scala 725:29]
  wire [2:0] _GEN_649 = _T_198 ? 3'h1 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 437:34 Core.scala 68:35]
  wire [15:0] _GEN_650 = _T_198 ? _GEN_643 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire  _GEN_653 = _T_198 & _GEN_646; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_655 = _T_197 ? _opcode_index_T_1 : _GEN_648; // @[Conditional.scala 40:58 Core.scala 432:28]
  wire [15:0] _GEN_656 = _T_197 ? _PC_next_T_1 : _GEN_650; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire [2:0] _GEN_657 = _T_197 ? machine_state_next : _GEN_649; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire  _GEN_660 = _T_197 ? 1'h0 : _GEN_653; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_663 = _T_12 ? _GEN_655 : opcode_index; // @[Core.scala 428:34 Core.scala 725:29]
  wire [15:0] _GEN_664 = _T_12 ? _GEN_656 : _PC_next_T_1; // @[Core.scala 428:34 Core.scala 803:19]
  wire [2:0] _GEN_665 = _T_12 ? _GEN_657 : machine_state_next; // @[Core.scala 428:34 Core.scala 68:35]
  wire  _GEN_668 = _T_12 & _GEN_660; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_675 = _T_25 ? _GEN_5 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [7:0] _GEN_676 = _T_25 ? _GEN_663 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [15:0] _GEN_677 = _T_25 ? _GEN_664 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [2:0] _GEN_678 = _T_25 ? _GEN_665 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire  _GEN_681 = _T_25 & _GEN_668; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [2:0] _GEN_683 = _T_4 ? _GEN_193 : _GEN_678; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_684 = _T_4 ? _GEN_641 : _GEN_676; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_685 = _T_4 ? _GEN_194 : _GEN_675; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_691 = _T_4 ? _PC_next_T_1 : _GEN_677; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire  _GEN_694 = _T_4 ? 1'h0 : _GEN_681; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_200 = opcodes_MPORT_54_data; // @[Core.scala 743:27]
  wire [2:0] _GEN_696 = opcode_index == 8'h1 ? 3'h1 : 3'h2; // @[Core.scala 129:38 Core.scala 130:34 Core.scala 132:34]
  wire [15:0] _GEN_697 = opcode_index == 8'h1 ? mem_refer_addr : PC_next; // @[Core.scala 129:38 Core.scala 73:31 Core.scala 133:30]
  wire [2:0] _GEN_698 = _T_44 ? _GEN_696 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [15:0] _GEN_699 = _T_44 ? _GEN_697 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [2:0] _GEN_701 = _T_35 ? machine_state_next : _GEN_698; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _GEN_702 = _T_35 ? mem_refer_addr : _GEN_699; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [2:0] _GEN_703 = _T_12 ? 3'h4 : machine_state_next; // @[Core.scala 142:36 Core.scala 143:36 Core.scala 68:35]
  wire [2:0] _GEN_704 = _T_12 ? 3'h5 : dummy_cycle; // @[Core.scala 142:36 Core.scala 144:29 Core.scala 775:28]
  wire [7:0] _GEN_718 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [15:0] _GEN_719 = _T_81 ? alu16_io_output : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 152:28 Core.scala 73:31]
  wire [7:0] _GEN_720 = _T_81 ? _GEN_474 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [2:0] _GEN_721 = _T_81 ? _GEN_566 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire  _GEN_724 = _T_81 & _T_12; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_727 = _T_198 ? PC_next : _GEN_719; // @[Conditional.scala 40:58 Core.scala 141:28]
  wire [2:0] _GEN_728 = _T_198 ? _GEN_703 : _GEN_721; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_729 = _T_198 ? _GEN_704 : dummy_cycle; // @[Conditional.scala 40:58 Core.scala 775:28]
  wire [15:0] _GEN_730 = _T_198 ? _GEN_12 : _PC_next_T_1; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire [7:0] _GEN_731 = _T_198 ? _GEN_6 : _GEN_720; // @[Conditional.scala 40:58]
  wire  _GEN_735 = _T_198 ? 1'h0 : _T_81; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_736 = _T_198 ? $signed(8'sh0) : $signed(_GEN_718); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire  _GEN_739 = _T_198 ? 1'h0 : _GEN_724; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _T_215 = m1_t_cycle == 8'h4; // @[Core.scala 165:24]
  wire [7:0] _GEN_747 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_1_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [15:0] _GEN_748 = m1_t_cycle == 8'h4 ? alu16_io_output : mem_refer_addr; // @[Core.scala 165:32 Core.scala 168:26 Core.scala 73:31]
  wire [2:0] _GEN_749 = _T_77 ? _GEN_595 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [7:0] _GEN_754 = _T_77 ? $signed(_GEN_747) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [15:0] _GEN_755 = _T_77 ? _GEN_748 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [15:0] _GEN_756 = _T_25 ? _GEN_727 : _GEN_755; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_757 = _T_25 ? _GEN_728 : _GEN_749; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_758 = _T_25 ? _GEN_729 : dummy_cycle; // @[Conditional.scala 39:67 Core.scala 775:28]
  wire [15:0] _GEN_759 = _T_25 ? _GEN_730 : _PC_next_T_1; // @[Conditional.scala 39:67 Core.scala 803:19]
  wire [7:0] _GEN_760 = _T_25 ? _GEN_731 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire  _GEN_764 = _T_25 & _GEN_735; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_765 = _T_25 ? $signed(_GEN_736) : $signed(_GEN_754); // @[Conditional.scala 39:67]
  wire  _GEN_768 = _T_25 & _GEN_739; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_773 = _T_25 ? 1'h0 : _T_77 & _T_215; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_774 = _T_4 ? _GEN_195 : _GEN_760; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_775 = _T_4 ? _GEN_701 : _GEN_757; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_776 = _T_4 ? _GEN_702 : _GEN_756; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_777 = _T_4 ? dummy_cycle : _GEN_758; // @[Conditional.scala 40:58 Core.scala 775:28]
  wire [15:0] _GEN_778 = _T_4 ? _PC_next_T_1 : _GEN_759; // @[Conditional.scala 40:58 Core.scala 803:19]
  wire  _GEN_782 = _T_4 ? 1'h0 : _GEN_764; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_783 = _T_4 ? $signed(8'sh0) : $signed(_GEN_765); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire  _GEN_786 = _T_4 ? 1'h0 : _GEN_768; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_791 = _T_4 ? 1'h0 : _GEN_773; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_792 = 8'hdd == _T_200 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_793 = 8'hdd == _T_200 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_794 = 8'hdd == _T_200 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_795 = 8'hdd == _T_200 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_796 = 8'hdd == _T_200 ? _GEN_778 : _PC_next_T_1; // @[Core.scala 743:52 Core.scala 803:19]
  wire  _GEN_800 = 8'hdd == _T_200 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_801 = 8'hdd == _T_200 ? $signed(_GEN_783) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_804 = 8'hdd == _T_200 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_809 = 8'hdd == _T_200 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_813 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? _GEN_683 : _GEN_793; // @[Core.scala 742:90]
  wire [7:0] _GEN_814 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? _GEN_684 : _GEN_792; // @[Core.scala 742:90]
  wire [15:0] _GEN_815 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? _GEN_685 : _GEN_794; // @[Core.scala 742:90]
  wire  _GEN_818 = (8'hc3 == _T_185 | 8'hc2 == _T_187) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_821 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? _GEN_691 : _GEN_796; // @[Core.scala 742:90]
  wire  _GEN_824 = (8'hc3 == _T_185 | 8'hc2 == _T_187) & _GEN_694; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_828 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_829 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? dummy_cycle : _GEN_795; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_833 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? 1'h0 : _GEN_800; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_834 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? $signed(8'sh0) : $signed(_GEN_801); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_837 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? 1'h0 : _GEN_804; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_842 = 8'hc3 == _T_185 | 8'hc2 == _T_187 ? 1'h0 : _GEN_809; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_847 = 8'h80 == _T_166 ? regfiles_front_alu_io_input_A_MPORT_3_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_849 = 8'h80 == _T_166 ? regfiles_front_alu_io_input_B_MPORT_1_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_850 = 8'h80 == _T_166 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_851 = 8'h80 == _T_166 ? _alu_io_calc_type_T_2 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_854 = 8'h80 == _T_166 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_857 = 8'h80 == _T_166 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_860 = 8'h80 == _T_166 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_863 = 8'h80 == _T_166 ? 1'h0 : _T_189; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_864 = 8'h80 == _T_166 ? machine_state_next : _GEN_813; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_865 = 8'h80 == _T_166 ? opcode_index : _GEN_814; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_866 = 8'h80 == _T_166 ? mem_refer_addr : _GEN_815; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_869 = 8'h80 == _T_166 ? 1'h0 : _GEN_818; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_872 = 8'h80 == _T_166 ? _PC_next_T_1 : _GEN_821; // @[Core.scala 741:52 Core.scala 803:19]
  wire  _GEN_875 = 8'h80 == _T_166 ? 1'h0 : _GEN_824; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_879 = 8'h80 == _T_166 ? 1'h0 : _GEN_828; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_880 = 8'h80 == _T_166 ? dummy_cycle : _GEN_829; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_884 = 8'h80 == _T_166 ? 1'h0 : _GEN_833; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_885 = 8'h80 == _T_166 ? $signed(8'sh0) : $signed(_GEN_834); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_888 = 8'h80 == _T_166 ? 1'h0 : _GEN_837; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_893 = 8'h80 == _T_166 ? 1'h0 : _GEN_842; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_897 = 8'h6 == _T_153 ? _GEN_615 : _GEN_865; // @[Core.scala 740:52]
  wire [2:0] _GEN_898 = 8'h6 == _T_153 ? _GEN_616 : _GEN_864; // @[Core.scala 740:52]
  wire  _GEN_901 = 8'h6 == _T_153 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_902 = 8'h6 == _T_153 ? _GEN_620 : _GEN_866; // @[Core.scala 740:52]
  wire  _GEN_905 = 8'h6 == _T_153 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_909 = 8'h6 == _T_153 ? _GEN_627 : _GEN_872; // @[Core.scala 740:52]
  wire  _GEN_912 = 8'h6 == _T_153 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_915 = 8'h6 == _T_153 ? 1'h0 : _T_167; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_917 = 8'h6 == _T_153 ? 8'h0 : _GEN_847; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_919 = 8'h6 == _T_153 ? 8'h0 : _GEN_849; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_920 = 8'h6 == _T_153 ? 1'h0 : _GEN_850; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_921 = 8'h6 == _T_153 ? 8'h0 : _GEN_851; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_924 = 8'h6 == _T_153 ? 1'h0 : _GEN_854; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_927 = 8'h6 == _T_153 ? F : _GEN_857; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_930 = 8'h6 == _T_153 ? 1'h0 : _GEN_860; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_933 = 8'h6 == _T_153 ? 1'h0 : _GEN_863; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_936 = 8'h6 == _T_153 ? 1'h0 : _GEN_869; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_941 = 8'h6 == _T_153 ? 1'h0 : _GEN_875; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_945 = 8'h6 == _T_153 ? 1'h0 : _GEN_879; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_946 = 8'h6 == _T_153 ? dummy_cycle : _GEN_880; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_950 = 8'h6 == _T_153 ? 1'h0 : _GEN_884; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_951 = 8'h6 == _T_153 ? $signed(8'sh0) : $signed(_GEN_885); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_954 = 8'h6 == _T_153 ? 1'h0 : _GEN_888; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_959 = 8'h6 == _T_153 ? 1'h0 : _GEN_893; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_963 = 8'h40 == _T_144 ? _GEN_575 : _GEN_898; // @[Core.scala 739:52]
  wire  _GEN_966 = 8'h40 == _T_144 & _GEN_578; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_968 = 8'h40 == _T_144 ? _GEN_580 : _GEN_902; // @[Core.scala 739:52]
  wire [7:0] _GEN_969 = 8'h40 == _T_144 ? _GEN_581 : _GEN_897; // @[Core.scala 739:52]
  wire  _GEN_972 = 8'h40 == _T_144 & _GEN_584; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_978 = 8'h40 == _T_144 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_983 = 8'h40 == _T_144 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_986 = 8'h40 == _T_144 ? 1'h0 : _T_154; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_989 = 8'h40 == _T_144 ? 1'h0 : _GEN_901; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_992 = 8'h40 == _T_144 ? 1'h0 : _GEN_905; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_996 = 8'h40 == _T_144 ? _PC_next_T_1 : _GEN_909; // @[Core.scala 739:52 Core.scala 803:19]
  wire  _GEN_999 = 8'h40 == _T_144 ? 1'h0 : _GEN_912; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_1002 = 8'h40 == _T_144 ? 1'h0 : _GEN_915; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_1004 = 8'h40 == _T_144 ? 8'h0 : _GEN_917; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_1006 = 8'h40 == _T_144 ? 8'h0 : _GEN_919; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_1007 = 8'h40 == _T_144 ? 1'h0 : _GEN_920; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_1008 = 8'h40 == _T_144 ? 8'h0 : _GEN_921; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_1011 = 8'h40 == _T_144 ? 1'h0 : _GEN_924; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_1014 = 8'h40 == _T_144 ? F : _GEN_927; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_1017 = 8'h40 == _T_144 ? 1'h0 : _GEN_930; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_1020 = 8'h40 == _T_144 ? 1'h0 : _GEN_933; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_1023 = 8'h40 == _T_144 ? 1'h0 : _GEN_936; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_1028 = 8'h40 == _T_144 ? 1'h0 : _GEN_941; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_1032 = 8'h40 == _T_144 ? 1'h0 : _GEN_945; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_1033 = 8'h40 == _T_144 ? dummy_cycle : _GEN_946; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_1037 = 8'h40 == _T_144 ? 1'h0 : _GEN_950; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_1038 = 8'h40 == _T_144 ? $signed(8'sh0) : $signed(_GEN_951); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_1041 = 8'h40 == _T_144 ? 1'h0 : _GEN_954; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_1046 = 8'h40 == _T_144 ? 1'h0 : _GEN_959; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_1047 = 8'h70 == _T_137 ? _GEN_541 : _GEN_963; // @[Core.scala 738:52]
  wire [7:0] _GEN_1048 = 8'h70 == _T_137 ? _GEN_542 : _GEN_969; // @[Core.scala 738:52]
  wire [15:0] _GEN_1049 = 8'h70 == _T_137 ? _GEN_543 : _GEN_968; // @[Core.scala 738:52]
  wire  _GEN_1052 = 8'h70 == _T_137 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_1054 = 8'h70 == _T_137 ? _GEN_548 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_1057 = 8'h70 == _T_137 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_1060 = 8'h70 == _T_137 ? 1'h0 : _T_145; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1063 = 8'h70 == _T_137 ? 1'h0 : _GEN_966; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_1067 = 8'h70 == _T_137 ? 1'h0 : _GEN_972; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_1073 = 8'h70 == _T_137 ? 1'h0 : _GEN_978; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_1078 = 8'h70 == _T_137 ? 1'h0 : _GEN_983; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1081 = 8'h70 == _T_137 ? 1'h0 : _GEN_986; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1084 = 8'h70 == _T_137 ? 1'h0 : _GEN_989; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1087 = 8'h70 == _T_137 ? 1'h0 : _GEN_992; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_1091 = 8'h70 == _T_137 ? _PC_next_T_1 : _GEN_996; // @[Core.scala 738:52 Core.scala 803:19]
  wire  _GEN_1094 = 8'h70 == _T_137 ? 1'h0 : _GEN_999; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1097 = 8'h70 == _T_137 ? 1'h0 : _GEN_1002; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_1099 = 8'h70 == _T_137 ? 8'h0 : _GEN_1004; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_1101 = 8'h70 == _T_137 ? 8'h0 : _GEN_1006; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_1102 = 8'h70 == _T_137 ? 1'h0 : _GEN_1007; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_1103 = 8'h70 == _T_137 ? 8'h0 : _GEN_1008; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_1106 = 8'h70 == _T_137 ? 1'h0 : _GEN_1011; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_1109 = 8'h70 == _T_137 ? F : _GEN_1014; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_1112 = 8'h70 == _T_137 ? 1'h0 : _GEN_1017; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1115 = 8'h70 == _T_137 ? 1'h0 : _GEN_1020; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1118 = 8'h70 == _T_137 ? 1'h0 : _GEN_1023; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1123 = 8'h70 == _T_137 ? 1'h0 : _GEN_1028; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_1127 = 8'h70 == _T_137 ? 1'h0 : _GEN_1032; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_1128 = 8'h70 == _T_137 ? dummy_cycle : _GEN_1033; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_1132 = 8'h70 == _T_137 ? 1'h0 : _GEN_1037; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_1133 = 8'h70 == _T_137 ? $signed(8'sh0) : $signed(_GEN_1038); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_1136 = 8'h70 == _T_137 ? 1'h0 : _GEN_1041; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_1141 = 8'h70 == _T_137 ? 1'h0 : _GEN_1046; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_1142 = 8'h76 == _T_133 ? 3'h1 : _GEN_1047; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_1143 = 8'h76 == _T_133 ? 8'h0 : _GEN_1048; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_1144 = 8'h76 == _T_133 ? PC : _GEN_1049; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_1145 = 8'h76 == _T_133 ? PC_next : _GEN_1091; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_1148 = 8'h76 == _T_133 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_1151 = 8'h76 == _T_133 ? 1'h0 : _GEN_1052; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_1153 = 8'h76 == _T_133 ? 8'h0 : _GEN_1054; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_1156 = 8'h76 == _T_133 ? 1'h0 : _GEN_1057; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1159 = 8'h76 == _T_133 ? 1'h0 : _GEN_1060; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1162 = 8'h76 == _T_133 ? 1'h0 : _GEN_1063; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_1166 = 8'h76 == _T_133 ? 1'h0 : _GEN_1067; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_1172 = 8'h76 == _T_133 ? 1'h0 : _GEN_1073; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_1177 = 8'h76 == _T_133 ? 1'h0 : _GEN_1078; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1180 = 8'h76 == _T_133 ? 1'h0 : _GEN_1081; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1183 = 8'h76 == _T_133 ? 1'h0 : _GEN_1084; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1186 = 8'h76 == _T_133 ? 1'h0 : _GEN_1087; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1192 = 8'h76 == _T_133 ? 1'h0 : _GEN_1094; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1195 = 8'h76 == _T_133 ? 1'h0 : _GEN_1097; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_1197 = 8'h76 == _T_133 ? 8'h0 : _GEN_1099; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_1199 = 8'h76 == _T_133 ? 8'h0 : _GEN_1101; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_1200 = 8'h76 == _T_133 ? 1'h0 : _GEN_1102; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_1201 = 8'h76 == _T_133 ? 8'h0 : _GEN_1103; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_1204 = 8'h76 == _T_133 ? 1'h0 : _GEN_1106; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_1207 = 8'h76 == _T_133 ? F : _GEN_1109; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_1210 = 8'h76 == _T_133 ? 1'h0 : _GEN_1112; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1213 = 8'h76 == _T_133 ? 1'h0 : _GEN_1115; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1216 = 8'h76 == _T_133 ? 1'h0 : _GEN_1118; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1221 = 8'h76 == _T_133 ? 1'h0 : _GEN_1123; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_1225 = 8'h76 == _T_133 ? 1'h0 : _GEN_1127; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_1226 = 8'h76 == _T_133 ? dummy_cycle : _GEN_1128; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_1230 = 8'h76 == _T_133 ? 1'h0 : _GEN_1132; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_1231 = 8'h76 == _T_133 ? $signed(8'sh0) : $signed(_GEN_1133); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_1234 = 8'h76 == _T_133 ? 1'h0 : _GEN_1136; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_1239 = 8'h76 == _T_133 ? 1'h0 : _GEN_1141; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_1243 = 8'h4 == _T_116 ? 8'h1 : _GEN_1199; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_1244 = 8'h4 == _T_116 ? 1'h0 : _GEN_1200; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_1245 = 8'h4 == _T_116 ? _alu_io_calc_type_T_1 : _GEN_1201; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_1248 = 8'h4 == _T_116 & _T_121; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_1249 = 8'h4 == _T_116 ? _GEN_515 : _GEN_1197; // @[Core.scala 736:52]
  wire [2:0] _GEN_1250 = 8'h4 == _T_116 ? _GEN_516 : _GEN_1142; // @[Core.scala 736:52]
  wire [15:0] _GEN_1251 = 8'h4 == _T_116 ? _GEN_517 : _GEN_1144; // @[Core.scala 736:52]
  wire [7:0] _GEN_1252 = 8'h4 == _T_116 ? _GEN_518 : _GEN_1143; // @[Core.scala 736:52]
  wire [2:0] _GEN_1253 = 8'h4 == _T_116 ? _GEN_519 : _GEN_1226; // @[Core.scala 736:52]
  wire [7:0] _GEN_1254 = 8'h4 == _T_116 ? _GEN_520 : _GEN_1153; // @[Core.scala 736:52]
  wire  _GEN_1257 = 8'h4 == _T_116 & _GEN_523; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1261 = 8'h4 == _T_116 & _GEN_527; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1267 = 8'h4 == _T_116 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_1268 = 8'h4 == _T_116 ? _PC_next_T_1 : _GEN_1145; // @[Core.scala 736:52 Core.scala 803:19]
  wire  _GEN_1271 = 8'h4 == _T_116 ? 1'h0 : _GEN_1148; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1274 = 8'h4 == _T_116 ? 1'h0 : _GEN_1151; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1278 = 8'h4 == _T_116 ? 1'h0 : _GEN_1156; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1281 = 8'h4 == _T_116 ? 1'h0 : _GEN_1159; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1284 = 8'h4 == _T_116 ? 1'h0 : _GEN_1162; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_1288 = 8'h4 == _T_116 ? 1'h0 : _GEN_1166; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_1294 = 8'h4 == _T_116 ? 1'h0 : _GEN_1172; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_1299 = 8'h4 == _T_116 ? 1'h0 : _GEN_1177; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1302 = 8'h4 == _T_116 ? 1'h0 : _GEN_1180; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1305 = 8'h4 == _T_116 ? 1'h0 : _GEN_1183; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1308 = 8'h4 == _T_116 ? 1'h0 : _GEN_1186; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1314 = 8'h4 == _T_116 ? 1'h0 : _GEN_1192; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1317 = 8'h4 == _T_116 ? 1'h0 : _GEN_1195; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1322 = 8'h4 == _T_116 ? 1'h0 : _GEN_1204; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_1325 = 8'h4 == _T_116 ? F : _GEN_1207; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_1328 = 8'h4 == _T_116 ? 1'h0 : _GEN_1210; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1331 = 8'h4 == _T_116 ? 1'h0 : _GEN_1213; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1334 = 8'h4 == _T_116 ? 1'h0 : _GEN_1216; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1339 = 8'h4 == _T_116 ? 1'h0 : _GEN_1221; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1343 = 8'h4 == _T_116 ? 1'h0 : _GEN_1225; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_1347 = 8'h4 == _T_116 ? 1'h0 : _GEN_1230; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_1348 = 8'h4 == _T_116 ? $signed(8'sh0) : $signed(_GEN_1231); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_1351 = 8'h4 == _T_116 ? 1'h0 : _GEN_1234; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_1356 = 8'h4 == _T_116 ? 1'h0 : _GEN_1239; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_1366 = 8'h3 == _T_95 ? input_ : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_1367 = 8'h3 == _T_95 ? $signed({{6{_alu16_io_offset_T_2[1]}},_alu16_io_offset_T_2}) : $signed(
    _GEN_1348); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_1368 = 8'h3 == _T_95 ? _GEN_443 : _GEN_1250; // @[Core.scala 735:52]
  wire [2:0] _GEN_1369 = 8'h3 == _T_95 ? _GEN_445 : _GEN_1253; // @[Core.scala 735:52]
  wire  _GEN_1372 = 8'h3 == _T_95 & _GEN_448; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_1379 = 8'h3 == _T_95 & _GEN_455; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_1386 = 8'h3 == _T_95 & _GEN_462; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_1391 = 8'h3 == _T_95 ? _GEN_467 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_1392 = 8'h3 == _T_95 ? _GEN_468 : _GEN_1252; // @[Core.scala 735:52]
  wire  _GEN_1395 = 8'h3 == _T_95 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_1398 = 8'h3 == _T_95 ? 1'h0 : _T_117; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_1399 = 8'h3 == _T_95 ? 8'h0 : _GEN_1243; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_1400 = 8'h3 == _T_95 ? 1'h0 : _GEN_1244; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_1401 = 8'h3 == _T_95 ? 8'h0 : _GEN_1245; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_1404 = 8'h3 == _T_95 ? 1'h0 : _GEN_1248; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_1405 = 8'h3 == _T_95 ? 8'h0 : _GEN_1249; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_1406 = 8'h3 == _T_95 ? mem_refer_addr : _GEN_1251; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_1407 = 8'h3 == _T_95 ? 8'h0 : _GEN_1254; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_1410 = 8'h3 == _T_95 ? 1'h0 : _GEN_1257; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1414 = 8'h3 == _T_95 ? 1'h0 : _GEN_1261; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1420 = 8'h3 == _T_95 ? 1'h0 : _GEN_1267; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_1421 = 8'h3 == _T_95 ? _PC_next_T_1 : _GEN_1268; // @[Core.scala 735:52 Core.scala 803:19]
  wire  _GEN_1424 = 8'h3 == _T_95 ? 1'h0 : _GEN_1271; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1427 = 8'h3 == _T_95 ? 1'h0 : _GEN_1274; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1431 = 8'h3 == _T_95 ? 1'h0 : _GEN_1278; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1434 = 8'h3 == _T_95 ? 1'h0 : _GEN_1281; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1437 = 8'h3 == _T_95 ? 1'h0 : _GEN_1284; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_1441 = 8'h3 == _T_95 ? 1'h0 : _GEN_1288; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_1447 = 8'h3 == _T_95 ? 1'h0 : _GEN_1294; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_1452 = 8'h3 == _T_95 ? 1'h0 : _GEN_1299; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1455 = 8'h3 == _T_95 ? 1'h0 : _GEN_1302; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1458 = 8'h3 == _T_95 ? 1'h0 : _GEN_1305; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1461 = 8'h3 == _T_95 ? 1'h0 : _GEN_1308; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1467 = 8'h3 == _T_95 ? 1'h0 : _GEN_1314; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1470 = 8'h3 == _T_95 ? 1'h0 : _GEN_1317; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1475 = 8'h3 == _T_95 ? 1'h0 : _GEN_1322; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_1478 = 8'h3 == _T_95 ? F : _GEN_1325; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_1481 = 8'h3 == _T_95 ? 1'h0 : _GEN_1328; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1484 = 8'h3 == _T_95 ? 1'h0 : _GEN_1331; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1487 = 8'h3 == _T_95 ? 1'h0 : _GEN_1334; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1492 = 8'h3 == _T_95 ? 1'h0 : _GEN_1339; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1496 = 8'h3 == _T_95 ? 1'h0 : _GEN_1343; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1499 = 8'h3 == _T_95 ? 1'h0 : _GEN_1347; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_1502 = 8'h3 == _T_95 ? 1'h0 : _GEN_1351; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_1507 = 8'h3 == _T_95 ? 1'h0 : _GEN_1356; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_1511 = 8'hc0 == _T_83 ? _GEN_333 : _GEN_1368; // @[Core.scala 734:52]
  wire [2:0] _GEN_1512 = 8'hc0 == _T_83 ? _GEN_334 : _GEN_1369; // @[Core.scala 734:52]
  wire [15:0] _GEN_1513 = 8'hc0 == _T_83 ? _GEN_335 : _GEN_1406; // @[Core.scala 734:52]
  wire [7:0] _GEN_1514 = 8'hc0 == _T_83 ? _GEN_336 : _GEN_1392; // @[Core.scala 734:52]
  wire [15:0] _GEN_1515 = 8'hc0 == _T_83 ? _GEN_337 : _GEN_1391; // @[Core.scala 734:52]
  wire  _GEN_1518 = 8'hc0 == _T_83 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_1519 = 8'hc0 == _T_83 ? _GEN_341 : _GEN_1421; // @[Core.scala 734:52]
  wire  _GEN_1522 = 8'hc0 == _T_83 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_1525 = 8'hc0 == _T_83 ? 1'h0 : _T_96; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_1532 = 8'hc0 == _T_83 ? 16'h0 : _GEN_1366; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_1533 = 8'hc0 == _T_83 ? $signed(8'sh0) : $signed(_GEN_1367); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_1536 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1372; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1543 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1379; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1550 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1386; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1557 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1395; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1560 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1398; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_1561 = 8'hc0 == _T_83 ? 8'h0 : _GEN_1399; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_1562 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1400; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_1563 = 8'hc0 == _T_83 ? 8'h0 : _GEN_1401; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_1566 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1404; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_1567 = 8'hc0 == _T_83 ? 8'h0 : _GEN_1405; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_1568 = 8'hc0 == _T_83 ? 8'h0 : _GEN_1407; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_1571 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1410; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1575 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1414; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1581 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1420; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1584 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1424; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1587 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1427; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1591 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1431; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1594 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1434; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1597 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1437; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1601 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1441; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1607 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1447; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1612 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1452; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1615 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1455; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1618 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1458; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1621 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1461; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1627 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1467; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1630 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1470; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1635 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1475; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_1638 = 8'hc0 == _T_83 ? F : _GEN_1478; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_1641 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1481; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1644 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1484; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1647 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1487; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1652 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1492; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1656 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1496; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1659 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1499; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_1662 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1502; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_1667 = 8'hc0 == _T_83 ? 1'h0 : _GEN_1507; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_1671 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_283 : _GEN_1519; // @[Core.scala 733:90]
  wire [2:0] _GEN_1672 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_284 : _GEN_1511; // @[Core.scala 733:90]
  wire [15:0] _GEN_1673 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_285 : _GEN_1513; // @[Core.scala 733:90]
  wire [7:0] _GEN_1674 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_286 : _GEN_1514; // @[Core.scala 733:90]
  wire [2:0] _GEN_1675 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_287 : _GEN_1512; // @[Core.scala 733:90]
  wire [15:0] _GEN_1676 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_288 : _GEN_1532; // @[Core.scala 733:90]
  wire [7:0] _GEN_1677 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? $signed({8{_GEN_289}}) : $signed(_GEN_1533); // @[Core.scala 733:90]
  wire [7:0] _GEN_1678 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_290 : _GEN_1568; // @[Core.scala 733:90]
  wire [15:0] _GEN_1679 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? _GEN_291 : _GEN_1515; // @[Core.scala 733:90]
  wire  _GEN_1682 = (8'hcd == _T_60 | 8'hc4 == _T_62) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1686 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_1689 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _T_84; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1692 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1518; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1695 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1522; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1698 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1525; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1707 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1536; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1714 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1543; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1721 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1550; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1728 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1557; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1731 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1560; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_1732 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 8'h0 : _GEN_1561; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_1733 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1562; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_1734 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 8'h0 : _GEN_1563; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_1737 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1566; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_1738 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 8'h0 : _GEN_1567; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_1741 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1571; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1745 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1575; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1751 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1581; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1754 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1584; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1757 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1587; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1761 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1591; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1764 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1594; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1767 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1597; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1771 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1601; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1777 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1607; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1782 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1612; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1785 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1615; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1788 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1618; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1791 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1621; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1797 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1627; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1800 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1630; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1805 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1635; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_1808 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? F : _GEN_1638; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_1811 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1641; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1814 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1644; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1817 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1647; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1822 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1652; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1826 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1656; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1829 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1659; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1832 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1662; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_1837 = 8'hcd == _T_60 | 8'hc4 == _T_62 ? 1'h0 : _GEN_1667; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_1841 = 8'hf3 == _T_56 ? opcodes_IFF_MPORT_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_1844 = 8'hf3 == _T_56 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_1847 = 8'hf3 == _T_56 ? 1'h0 : _T_64; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_1848 = 8'hf3 == _T_56 ? _PC_next_T_1 : _GEN_1671; // @[Core.scala 732:52 Core.scala 803:19]
  wire [2:0] _GEN_1849 = 8'hf3 == _T_56 ? machine_state_next : _GEN_1672; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_1850 = 8'hf3 == _T_56 ? mem_refer_addr : _GEN_1673; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_1851 = 8'hf3 == _T_56 ? opcode_index : _GEN_1674; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_1852 = 8'hf3 == _T_56 ? dummy_cycle : _GEN_1675; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_1853 = 8'hf3 == _T_56 ? 16'h0 : _GEN_1676; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_1854 = 8'hf3 == _T_56 ? $signed(8'sh0) : $signed(_GEN_1677); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_1855 = 8'hf3 == _T_56 ? 8'h0 : _GEN_1678; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_1856 = 8'hf3 == _T_56 ? SP : _GEN_1679; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_1859 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1682; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1863 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1686; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1866 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1689; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1869 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1692; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1872 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1695; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1875 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1698; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1884 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1707; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_1891 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1714; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_1898 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1721; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_1905 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1728; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1908 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1731; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_1909 = 8'hf3 == _T_56 ? 8'h0 : _GEN_1732; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_1910 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1733; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_1911 = 8'hf3 == _T_56 ? 8'h0 : _GEN_1734; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_1914 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1737; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_1915 = 8'hf3 == _T_56 ? 8'h0 : _GEN_1738; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_1918 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1741; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1922 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1745; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1928 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1751; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1931 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1754; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1934 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1757; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1938 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1761; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1941 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1764; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1944 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1767; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_1948 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1771; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_1954 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1777; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_1959 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1782; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1962 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1785; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1965 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1788; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1968 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1791; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1974 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1797; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1977 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1800; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1982 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1805; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_1985 = 8'hf3 == _T_56 ? F : _GEN_1808; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_1988 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1811; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1991 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1814; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1994 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1817; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_1999 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1822; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_2003 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1826; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_2006 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1829; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_2009 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1832; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_2014 = 8'hf3 == _T_56 ? 1'h0 : _GEN_1837; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_2015 = 8'hd3 == _T_19 ? _GEN_163 : _GEN_1849; // @[Core.scala 731:52]
  wire [15:0] _GEN_2016 = 8'hd3 == _T_19 ? _GEN_164 : _GEN_1850; // @[Core.scala 731:52]
  wire [7:0] _GEN_2017 = 8'hd3 == _T_19 ? _GEN_165 : _GEN_1851; // @[Core.scala 731:52]
  wire  _GEN_2020 = 8'hd3 == _T_19 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_2021 = 8'hd3 == _T_19 ? _GEN_169 : _GEN_1848; // @[Core.scala 731:52]
  wire [15:0] _GEN_2022 = 8'hd3 == _T_19 ? _GEN_170 : PC_next; // @[Core.scala 731:52 Core.scala 802:23]
  wire  _GEN_2025 = 8'hd3 == _T_19 & _GEN_173; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_2026 = 8'hd3 == _T_19 ? _GEN_174 : _GEN_1855; // @[Core.scala 731:52]
  wire  _GEN_2029 = 8'hd3 == _T_19 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2033 = 8'hd3 == _T_19 & _GEN_181; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2034 = 8'hd3 == _T_19 & _GEN_182; // @[Core.scala 731:52 Core.scala 807:22]
  wire  _GEN_2035 = 8'hd3 == _T_19 ? _GEN_183 : 1'h1; // @[Core.scala 731:52 Core.scala 758:14]
  wire  _GEN_2038 = 8'hd3 == _T_19 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2041 = 8'hd3 == _T_19 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2044 = 8'hd3 == _T_19 & _GEN_192; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2047 = 8'hd3 == _T_19 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_2050 = 8'hd3 == _T_19 ? 1'h0 : _T_57; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2051 = 8'hd3 == _T_19 ? IFF : _GEN_1841; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_2054 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1844; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2057 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1847; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_2058 = 8'hd3 == _T_19 ? dummy_cycle : _GEN_1852; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_2059 = 8'hd3 == _T_19 ? 16'h0 : _GEN_1853; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_2060 = 8'hd3 == _T_19 ? $signed(8'sh0) : $signed(_GEN_1854); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_2061 = 8'hd3 == _T_19 ? SP : _GEN_1856; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_2064 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1859; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2068 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1863; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2071 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1866; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2074 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1869; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2077 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1872; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2080 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1875; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2089 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1884; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2096 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1891; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2103 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1898; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2110 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1905; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2113 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1908; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_2114 = 8'hd3 == _T_19 ? 8'h0 : _GEN_1909; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_2115 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1910; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_2116 = 8'hd3 == _T_19 ? 8'h0 : _GEN_1911; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_2119 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1914; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_2120 = 8'hd3 == _T_19 ? 8'h0 : _GEN_1915; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_2123 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1918; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2127 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1922; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2133 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1928; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2136 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1931; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2139 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1934; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2143 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1938; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2146 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1941; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2149 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1944; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2153 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1948; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2159 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1954; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2164 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1959; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2167 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1962; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2170 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1965; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2173 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1968; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2179 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1974; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2182 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1977; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2187 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1982; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_2190 = 8'hd3 == _T_19 ? F : _GEN_1985; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_2193 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1988; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2196 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1991; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2199 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1994; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2204 = 8'hd3 == _T_19 ? 1'h0 : _GEN_1999; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2208 = 8'hd3 == _T_19 ? 1'h0 : _GEN_2003; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2211 = 8'hd3 == _T_19 ? 1'h0 : _GEN_2006; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_2214 = 8'hd3 == _T_19 ? 1'h0 : _GEN_2009; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_2219 = 8'hd3 == _T_19 ? 1'h0 : _GEN_2014; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_2220 = 8'h0 == _T_15 ? 3'h1 : _GEN_2015; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_2221 = 8'h0 == _T_15 ? 8'h0 : _GEN_2017; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_2224 = 8'h0 == _T_15 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_2225 = 8'h0 == _T_15 ? mem_refer_addr : _GEN_2016; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_2228 = 8'h0 == _T_15 ? 1'h0 : _GEN_2020; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_2229 = 8'h0 == _T_15 ? _PC_next_T_1 : _GEN_2021; // @[Core.scala 730:47 Core.scala 803:19]
  wire [15:0] _GEN_2230 = 8'h0 == _T_15 ? PC_next : _GEN_2022; // @[Core.scala 730:47 Core.scala 802:23]
  wire  _GEN_2233 = 8'h0 == _T_15 ? 1'h0 : _GEN_2025; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_2234 = 8'h0 == _T_15 ? 8'h0 : _GEN_2026; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_2237 = 8'h0 == _T_15 ? 1'h0 : _GEN_2029; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2241 = 8'h0 == _T_15 ? 1'h0 : _GEN_2033; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2242 = 8'h0 == _T_15 ? 1'h0 : _GEN_2034; // @[Core.scala 730:47 Core.scala 807:22]
  wire  _GEN_2243 = 8'h0 == _T_15 | _GEN_2035; // @[Core.scala 730:47 Core.scala 758:14]
  wire  _GEN_2246 = 8'h0 == _T_15 ? 1'h0 : _GEN_2038; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2249 = 8'h0 == _T_15 ? 1'h0 : _GEN_2041; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2252 = 8'h0 == _T_15 ? 1'h0 : _GEN_2044; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2255 = 8'h0 == _T_15 ? 1'h0 : _GEN_2047; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2258 = 8'h0 == _T_15 ? 1'h0 : _GEN_2050; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2259 = 8'h0 == _T_15 ? IFF : _GEN_2051; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_2262 = 8'h0 == _T_15 ? 1'h0 : _GEN_2054; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2265 = 8'h0 == _T_15 ? 1'h0 : _GEN_2057; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_2266 = 8'h0 == _T_15 ? dummy_cycle : _GEN_2058; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_2267 = 8'h0 == _T_15 ? 16'h0 : _GEN_2059; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_2268 = 8'h0 == _T_15 ? $signed(8'sh0) : $signed(_GEN_2060); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_2269 = 8'h0 == _T_15 ? SP : _GEN_2061; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_2272 = 8'h0 == _T_15 ? 1'h0 : _GEN_2064; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2276 = 8'h0 == _T_15 ? 1'h0 : _GEN_2068; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2279 = 8'h0 == _T_15 ? 1'h0 : _GEN_2071; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2282 = 8'h0 == _T_15 ? 1'h0 : _GEN_2074; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2285 = 8'h0 == _T_15 ? 1'h0 : _GEN_2077; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2288 = 8'h0 == _T_15 ? 1'h0 : _GEN_2080; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2297 = 8'h0 == _T_15 ? 1'h0 : _GEN_2089; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2304 = 8'h0 == _T_15 ? 1'h0 : _GEN_2096; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2311 = 8'h0 == _T_15 ? 1'h0 : _GEN_2103; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2318 = 8'h0 == _T_15 ? 1'h0 : _GEN_2110; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2321 = 8'h0 == _T_15 ? 1'h0 : _GEN_2113; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_2322 = 8'h0 == _T_15 ? 8'h0 : _GEN_2114; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_2323 = 8'h0 == _T_15 ? 1'h0 : _GEN_2115; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_2324 = 8'h0 == _T_15 ? 8'h0 : _GEN_2116; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_2327 = 8'h0 == _T_15 ? 1'h0 : _GEN_2119; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_2328 = 8'h0 == _T_15 ? 8'h0 : _GEN_2120; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_2331 = 8'h0 == _T_15 ? 1'h0 : _GEN_2123; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2335 = 8'h0 == _T_15 ? 1'h0 : _GEN_2127; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2341 = 8'h0 == _T_15 ? 1'h0 : _GEN_2133; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2344 = 8'h0 == _T_15 ? 1'h0 : _GEN_2136; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2347 = 8'h0 == _T_15 ? 1'h0 : _GEN_2139; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2351 = 8'h0 == _T_15 ? 1'h0 : _GEN_2143; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2354 = 8'h0 == _T_15 ? 1'h0 : _GEN_2146; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2357 = 8'h0 == _T_15 ? 1'h0 : _GEN_2149; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2361 = 8'h0 == _T_15 ? 1'h0 : _GEN_2153; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2367 = 8'h0 == _T_15 ? 1'h0 : _GEN_2159; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2372 = 8'h0 == _T_15 ? 1'h0 : _GEN_2164; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2375 = 8'h0 == _T_15 ? 1'h0 : _GEN_2167; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2378 = 8'h0 == _T_15 ? 1'h0 : _GEN_2170; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2381 = 8'h0 == _T_15 ? 1'h0 : _GEN_2173; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2387 = 8'h0 == _T_15 ? 1'h0 : _GEN_2179; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2390 = 8'h0 == _T_15 ? 1'h0 : _GEN_2182; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2395 = 8'h0 == _T_15 ? 1'h0 : _GEN_2187; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_2398 = 8'h0 == _T_15 ? F : _GEN_2190; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_2401 = 8'h0 == _T_15 ? 1'h0 : _GEN_2193; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2404 = 8'h0 == _T_15 ? 1'h0 : _GEN_2196; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2407 = 8'h0 == _T_15 ? 1'h0 : _GEN_2199; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2412 = 8'h0 == _T_15 ? 1'h0 : _GEN_2204; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2416 = 8'h0 == _T_15 ? 1'h0 : _GEN_2208; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2419 = 8'h0 == _T_15 ? 1'h0 : _GEN_2211; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_2422 = 8'h0 == _T_15 ? 1'h0 : _GEN_2214; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_2427 = 8'h0 == _T_15 ? 1'h0 : _GEN_2219; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] io_bus_addr_lo = R & 8'h7f; // @[Core.scala 811:34]
  wire [15:0] _io_bus_addr_T = {8'h0,io_bus_addr_lo}; // @[Cat.scala 30:58]
  reg  REG_5; // @[Core.scala 772:43]
  wire  _T_220 = ~clock & REG_5; // @[Core.scala 772:33]
  wire  _GEN_2428 = _T_220 ? 1'h0 : 1'h1; // @[Core.scala 815:43 Core.scala 816:26 Core.scala 812:24]
  wire [7:0] _T_223 = opcodes_MPORT_59_data; // @[Core.scala 730:22]
  wire  _T_224 = 8'h0 == _T_223; // @[Core.scala 730:22]
  wire [7:0] _T_227 = opcodes_MPORT_61_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_228 = 8'hd3 == _T_227; // @[Core.scala 731:27]
  wire [15:0] _mem_refer_addr_T_19 = {A,opcodes_mem_refer_addr_lo_2_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_2436 = _T_12 ? _mem_refer_addr_T_19 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  wire [15:0] _GEN_2437 = _T_12 ? _PC_next_T_1 : PC_next; // @[Core.scala 558:32 Core.scala 561:19 Core.scala 58:24]
  reg  REG_6; // @[Core.scala 772:43]
  wire  _T_240 = ~clock & REG_6; // @[Core.scala 772:33]
  wire [7:0] _GEN_2438 = ~opcodes_MPORT_63_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_2442 = _T_240 ? _GEN_2438 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire [7:0] _GEN_2443 = ~opcodes_MPORT_64_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_7; // @[Core.scala 772:43]
  wire  _T_249 = ~clock & REG_7; // @[Core.scala 772:33]
  wire  _GEN_2444 = opcodes_MPORT_65_data[3] ? 1'h0 : 1'h1; // @[Core.scala 585:41 Core.scala 586:28 Core.scala 757:14]
  wire  _GEN_2450 = _T_249 ? _GEN_2444 : 1'h1; // @[Core.scala 583:47 Core.scala 757:14]
  wire  _GEN_2451 = _T_249 ? opcodes_MPORT_65_data[3] : 1'h1; // @[Core.scala 583:47 Core.scala 758:14]
  wire [7:0] _GEN_2452 = ~opcodes_MPORT_66_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire [7:0] _GEN_2453 = ~opcodes_MPORT_67_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_8; // @[Core.scala 772:43]
  wire  _T_261 = ~clock & REG_8; // @[Core.scala 772:33]
  wire [7:0] _GEN_2463 = _T_47 ? _GEN_2453 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_2473 = _T_44 ? _GEN_2452 : _GEN_2463; // @[Conditional.scala 39:67]
  wire  _GEN_2481 = _T_44 ? 1'h0 : _T_47 & _T_261; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_2487 = _T_35 ? _GEN_2443 : _GEN_2473; // @[Conditional.scala 39:67]
  wire  _GEN_2491 = _T_35 & _T_249; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_2492 = _T_35 ? _GEN_2450 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_2493 = _T_35 ? _GEN_2451 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_2503 = _T_35 ? 1'h0 : _GEN_2481; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_2507 = _T_28 & _T_240; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_2508 = _T_28 ? _GEN_2442 : _GEN_2487; // @[Conditional.scala 40:58]
  wire  _GEN_2515 = _T_28 ? 1'h0 : _GEN_2491; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_2516 = _T_28 | _GEN_2492; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_2517 = _T_28 | _GEN_2493; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_2527 = _T_28 ? 1'h0 : _GEN_2503; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_2529 = _T_27 ? mem_refer_addr : _io_bus_addr_T; // @[Conditional.scala 39:67 Core.scala 565:21 Core.scala 811:23]
  wire [7:0] _GEN_2533 = _T_27 ? _GEN_2508 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_2541 = _T_27 ? _GEN_2516 : 1'h1; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_2542 = _T_27 ? _GEN_2517 : 1'h1; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire [15:0] _GEN_2558 = _T_25 ? _GEN_2436 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [15:0] _GEN_2559 = _T_25 ? _GEN_2437 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_2560 = _T_25 ? _io_bus_addr_T : _GEN_2529; // @[Conditional.scala 39:67 Core.scala 811:23]
  wire  _GEN_2563 = _T_25 ? 1'h0 : _T_27 & _GEN_2507; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_2564 = _T_25 ? 8'h0 : _GEN_2533; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_2571 = _T_25 ? 1'h0 : _T_27 & _GEN_2515; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_2572 = _T_25 | _GEN_2541; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_2573 = _T_25 | _GEN_2542; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire  _GEN_2582 = _T_25 ? 1'h0 : _T_27 & _GEN_2527; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_2585 = _T_4 ? _GEN_5 : _GEN_2558; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_2590 = _T_4 ? PC_next : _GEN_2559; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_2591 = _T_4 ? _io_bus_addr_T : _GEN_2560; // @[Conditional.scala 40:58 Core.scala 811:23]
  wire  _GEN_2594 = _T_4 ? 1'h0 : _GEN_2563; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_2595 = _T_4 ? 8'h0 : _GEN_2564; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_2602 = _T_4 ? 1'h0 : _GEN_2571; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_2603 = _T_4 | _GEN_2572; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_2604 = _T_4 | _GEN_2573; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_2613 = _T_4 ? 1'h0 : _GEN_2582; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_264 = opcodes_MPORT_69_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_265 = 8'hf3 == _T_264; // @[Core.scala 732:27]
  wire [7:0] _T_268 = opcodes_MPORT_71_data; // @[Core.scala 733:27]
  wire [7:0] _T_270 = opcodes_MPORT_72_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_272 = 8'hcd == _T_268 | 8'hc4 == _T_270; // @[Core.scala 733:51]
  wire  op_hi_3 = opcodes_op_MPORT_6_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo_3 = opcodes_op_MPORT_7_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op_4 = {op_hi_3,op_lo_3}; // @[Cat.scala 30:58]
  wire  _cond_T_99 = op_4 == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_102 = op_4 == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_105 = op_4 == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_108 = op_4 == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_111 = op_4 == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_114 = op_4 == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_117 = op_4 == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_120 = op_4 == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_123 = op_4 == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond_3 = _cond_T_99 | (_cond_T_102 | (_cond_T_105 | (_cond_T_108 | (_cond_T_111 | (_cond_T_114 | (_cond_T_117 |
    (_cond_T_120 | _cond_T_123))))))); // @[Mux.scala 98:16]
  wire [15:0] _GEN_2617 = _T_28 ? _PC_next_T_1 : PC_next; // @[Conditional.scala 40:58 Core.scala 642:19 Core.scala 58:24]
  wire [2:0] _GEN_2621 = cond_3 ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_2622 = cond_3 ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_2623 = opcode_index == 8'h2 ? _GEN_2621 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_2624 = opcode_index == 8'h2 ? _GEN_2622 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [15:0] _GEN_2627 = _T_35 ? _PC_next_T_1 : PC_next; // @[Conditional.scala 40:58 Core.scala 667:23 Core.scala 58:24]
  wire [7:0] _GEN_2628 = _T_35 ? _GEN_2624 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_2629 = _T_35 ? _GEN_2623 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _PC_next_T_25 = {opcodes_PC_next_hi_3_data,opcodes_PC_next_lo_2_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_2642 = _T_82 ? _PC_next_T_25 : PC_next; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 58:24]
  wire [15:0] _GEN_2654 = _T_81 ? PC_next : _GEN_2642; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_2666 = _T_12 ? _GEN_2654 : PC_next; // @[Core.scala 698:30 Core.scala 58:24]
  wire [15:0] _GEN_2678 = _T_79 ? _GEN_2666 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_2690 = _T_77 ? PC_next : _GEN_2678; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_2692 = _T_25 ? _GEN_2627 : _GEN_2690; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_2693 = _T_25 ? _GEN_2628 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_2694 = _T_25 ? _GEN_2629 : _GEN_259; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_2704 = _T_4 ? _GEN_2617 : _GEN_2692; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_2705 = _T_4 ? _GEN_197 : _GEN_2694; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_2707 = _T_4 ? _GEN_199 : _GEN_2693; // @[Conditional.scala 40:58]
  wire [7:0] _T_291 = opcodes_MPORT_74_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_292 = 8'hc0 == _T_291; // @[Core.scala 734:27]
  wire  op_hi_4 = opcodes_op_MPORT_8_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_4 = opcodes_op_MPORT_9_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_5 = {op_hi_4,op_lo_4}; // @[Cat.scala 30:58]
  wire  _cond_T_132 = op_5 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_135 = op_5 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_138 = op_5 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_141 = op_5 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_144 = op_5 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_147 = op_5 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_150 = op_5 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_153 = op_5 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_156 = op_5 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_4 = _cond_T_132 | (_cond_T_135 | (_cond_T_138 | (_cond_T_141 | (_cond_T_144 | (_cond_T_147 | (_cond_T_150
     | (_cond_T_153 | _cond_T_156))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_2717 = _cond_T_132 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_2718 = _T_35 ? _GEN_2717 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_2722 = cond_4 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_2723 = cond_4 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _PC_next_T_26 = {opcodes_PC_next_hi_4_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_2727 = _T_75 ? _PC_next_T_26 : PC_next; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 58:24]
  wire [15:0] _GEN_2736 = _T_35 ? _GEN_2727 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_2744 = _T_25 ? _GEN_2736 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_2746 = _T_77 ? _GEN_2722 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_2747 = _T_77 ? _GEN_2723 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_2753 = _T_77 ? PC_next : _GEN_2744; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_2754 = _T_4 ? _GEN_2718 : _GEN_2746; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_2757 = _T_4 ? _GEN_195 : _GEN_2747; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_2762 = _T_4 ? PC_next : _GEN_2753; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_303 = opcodes_MPORT_76_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_304 = 8'h3 == _T_303; // @[Core.scala 735:27]
  wire  _register_T_18 = opcodes_MPORT_77_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_19 = {regfiles_front_register_hi_3_data,regfiles_front_register_lo_3_data}; // @[Cat.scala 30:58]
  wire  _register_T_21 = opcodes_MPORT_77_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_22 = {regfiles_front_register_hi_4_data,regfiles_front_register_lo_4_data}; // @[Cat.scala 30:58]
  wire  _register_T_24 = opcodes_MPORT_77_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_25 = {regfiles_front_register_hi_5_data,regfiles_front_register_lo_5_data}; // @[Cat.scala 30:58]
  wire  _register_T_27 = opcodes_MPORT_77_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_28 = _register_T_27 ? SP : {{14'd0}, opcodes_MPORT_77_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_29 = _register_T_24 ? _register_T_25 : _register_T_28; // @[Mux.scala 98:16]
  wire [15:0] _register_T_30 = _register_T_21 ? _register_T_22 : _register_T_29; // @[Mux.scala 98:16]
  wire [15:0] register_1 = _register_T_18 ? _register_T_19 : _register_T_30; // @[Mux.scala 98:16]
  reg [15:0] input_1; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_7 = ~opcodes_MPORT_77_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_313 = 2'h0 == opcodes_MPORT_77_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_316 = 2'h1 == opcodes_MPORT_77_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_319 = 2'h2 == opcodes_MPORT_77_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_322 = 2'h3 == opcodes_MPORT_77_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_2765 = _T_322 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_2773 = _T_319 ? SP : _GEN_2765; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_2783 = _T_316 ? 1'h0 : _T_319; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_2788 = _T_316 ? SP : _GEN_2773; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_2798 = _T_313 ? 1'h0 : _T_316; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_2805 = _T_313 ? 1'h0 : _GEN_2783; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_2810 = _T_313 ? SP : _GEN_2788; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_2815 = _T_35 & _T_313; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_2822 = _T_35 & _GEN_2798; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_2829 = _T_35 & _GEN_2805; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_2834 = _T_35 ? _GEN_2810 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_2840 = _T_77 & _GEN_2815; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_2847 = _T_77 & _GEN_2822; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_2854 = _T_77 & _GEN_2829; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_2859 = _T_77 ? _GEN_2834 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_2869 = _T_4 ? 1'h0 : _GEN_2840; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_2876 = _T_4 ? 1'h0 : _GEN_2847; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_2883 = _T_4 ? 1'h0 : _GEN_2854; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_2888 = _T_4 ? SP : _GEN_2859; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _T_324 = opcodes_MPORT_84_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_325 = 8'h4 == _T_324; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_4 = opcodes_alu_io_calc_type_MPORT_1_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_328 = opcodes_MPORT_85_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_329 = 8'h34 == _T_328; // @[Core.scala 244:22]
  reg [7:0] temp_1; // @[Core.scala 245:25]
  wire [7:0] _GEN_2893 = _T_12 ? temp_1 : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [7:0] _GEN_2897 = _T_79 ? _GEN_2893 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_2901 = _T_77 ? 8'h0 : _GEN_2897; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_2907 = _T_25 ? 8'h0 : _GEN_2901; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_2915 = _T_4 ? 8'h0 : _GEN_2907; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_337 = opcodes_MPORT_85_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_338 = 8'h4 == _T_337; // @[Core.scala 282:29]
  wire [7:0] _GEN_2926 = 8'h4 == _T_337 ? regfiles_front_alu_io_input_A_MPORT_6_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_2929 = 8'h4 == _T_337 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_2936 = 8'h34 == _T_328 ? opcodes_alu_io_input_A_MPORT_4_data : _GEN_2926; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_2937 = 8'h34 == _T_328 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_2938 = 8'h34 == _T_328 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_2939 = 8'h34 == _T_328 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_2940 = 8'h34 == _T_328 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_2941 = 8'h34 == _T_328 ? _GEN_2915 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_2944 = 8'h34 == _T_328 ? 1'h0 : _T_338; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_2948 = 8'h34 == _T_328 ? 1'h0 : _GEN_2929; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_341 = opcodes_MPORT_88_data; // @[Core.scala 737:27]
  wire  _T_342 = 8'h76 == _T_341; // @[Core.scala 737:27]
  wire [7:0] _T_345 = opcodes_MPORT_90_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_346 = 8'h70 == _T_345; // @[Core.scala 738:27]
  wire [7:0] _GEN_2959 = _T_79 ? regfiles_front_io_bus_data1_MPORT_3_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_2969 = _T_4 ? 8'h0 : _GEN_2959; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_352 = opcodes_MPORT_92_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_353 = 8'h40 == _T_352; // @[Core.scala 739:27]
  wire [2:0] src_reg_1 = opcodes_MPORT_93_data[2:0]; // @[Core.scala 298:27]
  wire  _T_357 = src_reg_1 == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_28 = {regfiles_front_mem_refer_addr_hi_1_data,regfiles_front_mem_refer_addr_lo_3_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_2970 = src_reg_1 == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_2975 = src_reg_1 == 3'h6 ? _mem_refer_addr_T_28 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_2978 = src_reg_1 == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_2996 = _T_4 ? _GEN_2970 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_2999 = _T_4 & _T_357; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_3001 = _T_4 ? _GEN_2975 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_3002 = _T_4 ? {{7'd0}, _T_357} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_3005 = _T_4 & _GEN_2978; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_361 = opcodes_MPORT_97_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_362 = 8'h6 == _T_361; // @[Core.scala 740:27]
  wire [15:0] _GEN_3014 = ~opcodes_MPORT_99_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [15:0] _GEN_3020 = _T_101 ? _GEN_3014 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [15:0] _GEN_3026 = _T_12 ? mem_refer_addr : _GEN_3020; // @[Core.scala 329:34 Core.scala 73:31]
  wire [15:0] _GEN_3035 = _T_25 ? _PC_next_T_1 : PC_next; // @[Conditional.scala 39:67 Core.scala 345:17 Core.scala 58:24]
  wire [15:0] _GEN_3041 = _T_4 ? _GEN_3026 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [15:0] _GEN_3048 = _T_4 ? PC_next : _GEN_3035; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_374 = opcodes_MPORT_103_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_375 = 8'h80 == _T_374; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_5 = opcodes_MPORT_104_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _T_393 = opcodes_MPORT_106_data; // @[Core.scala 742:27]
  wire [7:0] _T_395 = opcodes_MPORT_107_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_397 = 8'hc3 == _T_393 | 8'hc2 == _T_395; // @[Core.scala 742:51]
  wire  op_hi_5 = opcodes_op_MPORT_10_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_5 = opcodes_op_MPORT_11_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_7 = {op_hi_5,op_lo_5}; // @[Cat.scala 30:58]
  wire  _cond_T_165 = op_7 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_168 = op_7 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_171 = op_7 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_174 = op_7 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_177 = op_7 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_180 = op_7 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_183 = op_7 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_186 = op_7 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_189 = op_7 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_5 = _cond_T_165 | (_cond_T_168 | (_cond_T_171 | (_cond_T_174 | (_cond_T_177 | (_cond_T_180 | (_cond_T_183
     | (_cond_T_186 | _cond_T_189))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_33 = {opcodes_PC_next_hi_5_data,opcodes_PC_next_lo_3_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_3064 = ~cond_5 ? _PC_next_T_1 : _PC_next_T_33; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_3067 = ~cond_5 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [15:0] _GEN_3071 = _T_198 ? _GEN_3064 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_3074 = _T_198 & _GEN_3067; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_3077 = _T_197 ? _PC_next_T_1 : _GEN_3071; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire  _GEN_3081 = _T_197 ? 1'h0 : _GEN_3074; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_3085 = _T_12 ? _GEN_3077 : PC_next; // @[Core.scala 428:34 Core.scala 58:24]
  wire  _GEN_3089 = _T_12 & _GEN_3081; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_3098 = _T_25 ? _GEN_3085 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_3102 = _T_25 & _GEN_3089; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_3112 = _T_4 ? PC_next : _GEN_3098; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire  _GEN_3115 = _T_4 ? 1'h0 : _GEN_3102; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_408 = opcodes_MPORT_110_data; // @[Core.scala 743:27]
  wire [7:0] _GEN_3139 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_2_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [15:0] _GEN_3151 = _T_198 ? _GEN_2437 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _GEN_3157 = _T_198 ? $signed(8'sh0) : $signed(_GEN_3139); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_3168 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_3_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [7:0] _GEN_3175 = _T_77 ? $signed(_GEN_3168) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [15:0] _GEN_3180 = _T_25 ? _GEN_3151 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [7:0] _GEN_3186 = _T_25 ? $signed(_GEN_3157) : $signed(_GEN_3175); // @[Conditional.scala 39:67]
  wire [15:0] _GEN_3199 = _T_4 ? PC_next : _GEN_3180; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _GEN_3204 = _T_4 ? $signed(8'sh0) : $signed(_GEN_3186); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_3213 = 8'hdd == _T_408 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_3214 = 8'hdd == _T_408 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_3215 = 8'hdd == _T_408 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_3216 = 8'hdd == _T_408 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_3217 = 8'hdd == _T_408 ? _GEN_3199 : PC_next; // @[Core.scala 743:52 Core.scala 58:24]
  wire  _GEN_3221 = 8'hdd == _T_408 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_3222 = 8'hdd == _T_408 ? $signed(_GEN_3204) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_3225 = 8'hdd == _T_408 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_3230 = 8'hdd == _T_408 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_3234 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? _GEN_683 : _GEN_3214; // @[Core.scala 742:90]
  wire [7:0] _GEN_3235 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? _GEN_684 : _GEN_3213; // @[Core.scala 742:90]
  wire [15:0] _GEN_3236 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? _GEN_685 : _GEN_3215; // @[Core.scala 742:90]
  wire  _GEN_3239 = (8'hc3 == _T_393 | 8'hc2 == _T_395) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_3242 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? _GEN_3112 : _GEN_3217; // @[Core.scala 742:90]
  wire  _GEN_3245 = (8'hc3 == _T_393 | 8'hc2 == _T_395) & _GEN_3115; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_3249 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_3250 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? dummy_cycle : _GEN_3216; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_3254 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? 1'h0 : _GEN_3221; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_3255 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? $signed(8'sh0) : $signed(_GEN_3222); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_3258 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? 1'h0 : _GEN_3225; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_3263 = 8'hc3 == _T_393 | 8'hc2 == _T_395 ? 1'h0 : _GEN_3230; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_3268 = 8'h80 == _T_374 ? regfiles_front_alu_io_input_A_MPORT_7_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_3270 = 8'h80 == _T_374 ? regfiles_front_alu_io_input_B_MPORT_3_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_3271 = 8'h80 == _T_374 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_3272 = 8'h80 == _T_374 ? _alu_io_calc_type_T_5 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_3275 = 8'h80 == _T_374 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_3278 = 8'h80 == _T_374 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_3281 = 8'h80 == _T_374 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_3284 = 8'h80 == _T_374 ? 1'h0 : _T_397; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_3285 = 8'h80 == _T_374 ? machine_state_next : _GEN_3234; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_3286 = 8'h80 == _T_374 ? opcode_index : _GEN_3235; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_3287 = 8'h80 == _T_374 ? mem_refer_addr : _GEN_3236; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_3290 = 8'h80 == _T_374 ? 1'h0 : _GEN_3239; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_3293 = 8'h80 == _T_374 ? PC_next : _GEN_3242; // @[Core.scala 741:52 Core.scala 58:24]
  wire  _GEN_3296 = 8'h80 == _T_374 ? 1'h0 : _GEN_3245; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_3300 = 8'h80 == _T_374 ? 1'h0 : _GEN_3249; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_3301 = 8'h80 == _T_374 ? dummy_cycle : _GEN_3250; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_3305 = 8'h80 == _T_374 ? 1'h0 : _GEN_3254; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_3306 = 8'h80 == _T_374 ? $signed(8'sh0) : $signed(_GEN_3255); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_3309 = 8'h80 == _T_374 ? 1'h0 : _GEN_3258; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_3314 = 8'h80 == _T_374 ? 1'h0 : _GEN_3263; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_3318 = 8'h6 == _T_361 ? _GEN_615 : _GEN_3286; // @[Core.scala 740:52]
  wire [2:0] _GEN_3319 = 8'h6 == _T_361 ? _GEN_616 : _GEN_3285; // @[Core.scala 740:52]
  wire  _GEN_3322 = 8'h6 == _T_361 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_3323 = 8'h6 == _T_361 ? _GEN_3041 : _GEN_3287; // @[Core.scala 740:52]
  wire  _GEN_3326 = 8'h6 == _T_361 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_3330 = 8'h6 == _T_361 ? _GEN_3048 : _GEN_3293; // @[Core.scala 740:52]
  wire  _GEN_3333 = 8'h6 == _T_361 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_3336 = 8'h6 == _T_361 ? 1'h0 : _T_375; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_3338 = 8'h6 == _T_361 ? 8'h0 : _GEN_3268; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_3340 = 8'h6 == _T_361 ? 8'h0 : _GEN_3270; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_3341 = 8'h6 == _T_361 ? 1'h0 : _GEN_3271; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_3342 = 8'h6 == _T_361 ? 8'h0 : _GEN_3272; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_3345 = 8'h6 == _T_361 ? 1'h0 : _GEN_3275; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_3348 = 8'h6 == _T_361 ? F : _GEN_3278; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_3351 = 8'h6 == _T_361 ? 1'h0 : _GEN_3281; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_3354 = 8'h6 == _T_361 ? 1'h0 : _GEN_3284; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_3357 = 8'h6 == _T_361 ? 1'h0 : _GEN_3290; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_3362 = 8'h6 == _T_361 ? 1'h0 : _GEN_3296; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_3366 = 8'h6 == _T_361 ? 1'h0 : _GEN_3300; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_3367 = 8'h6 == _T_361 ? dummy_cycle : _GEN_3301; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_3371 = 8'h6 == _T_361 ? 1'h0 : _GEN_3305; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_3372 = 8'h6 == _T_361 ? $signed(8'sh0) : $signed(_GEN_3306); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_3375 = 8'h6 == _T_361 ? 1'h0 : _GEN_3309; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_3380 = 8'h6 == _T_361 ? 1'h0 : _GEN_3314; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_3384 = 8'h40 == _T_352 ? _GEN_2996 : _GEN_3319; // @[Core.scala 739:52]
  wire  _GEN_3387 = 8'h40 == _T_352 & _GEN_2999; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_3389 = 8'h40 == _T_352 ? _GEN_3001 : _GEN_3323; // @[Core.scala 739:52]
  wire [7:0] _GEN_3390 = 8'h40 == _T_352 ? _GEN_3002 : _GEN_3318; // @[Core.scala 739:52]
  wire  _GEN_3393 = 8'h40 == _T_352 & _GEN_3005; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_3399 = 8'h40 == _T_352 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_3404 = 8'h40 == _T_352 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_3407 = 8'h40 == _T_352 ? 1'h0 : _T_362; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3410 = 8'h40 == _T_352 ? 1'h0 : _GEN_3322; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3413 = 8'h40 == _T_352 ? 1'h0 : _GEN_3326; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_3417 = 8'h40 == _T_352 ? PC_next : _GEN_3330; // @[Core.scala 739:52 Core.scala 58:24]
  wire  _GEN_3420 = 8'h40 == _T_352 ? 1'h0 : _GEN_3333; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3423 = 8'h40 == _T_352 ? 1'h0 : _GEN_3336; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_3425 = 8'h40 == _T_352 ? 8'h0 : _GEN_3338; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_3427 = 8'h40 == _T_352 ? 8'h0 : _GEN_3340; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_3428 = 8'h40 == _T_352 ? 1'h0 : _GEN_3341; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_3429 = 8'h40 == _T_352 ? 8'h0 : _GEN_3342; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_3432 = 8'h40 == _T_352 ? 1'h0 : _GEN_3345; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_3435 = 8'h40 == _T_352 ? F : _GEN_3348; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_3438 = 8'h40 == _T_352 ? 1'h0 : _GEN_3351; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3441 = 8'h40 == _T_352 ? 1'h0 : _GEN_3354; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3444 = 8'h40 == _T_352 ? 1'h0 : _GEN_3357; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3449 = 8'h40 == _T_352 ? 1'h0 : _GEN_3362; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_3453 = 8'h40 == _T_352 ? 1'h0 : _GEN_3366; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_3454 = 8'h40 == _T_352 ? dummy_cycle : _GEN_3367; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_3458 = 8'h40 == _T_352 ? 1'h0 : _GEN_3371; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_3459 = 8'h40 == _T_352 ? $signed(8'sh0) : $signed(_GEN_3372); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_3462 = 8'h40 == _T_352 ? 1'h0 : _GEN_3375; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_3467 = 8'h40 == _T_352 ? 1'h0 : _GEN_3380; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_3468 = 8'h70 == _T_345 ? _GEN_541 : _GEN_3384; // @[Core.scala 738:52]
  wire [7:0] _GEN_3469 = 8'h70 == _T_345 ? _GEN_542 : _GEN_3390; // @[Core.scala 738:52]
  wire [15:0] _GEN_3470 = 8'h70 == _T_345 ? _GEN_543 : _GEN_3389; // @[Core.scala 738:52]
  wire  _GEN_3473 = 8'h70 == _T_345 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_3475 = 8'h70 == _T_345 ? _GEN_2969 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_3478 = 8'h70 == _T_345 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_3481 = 8'h70 == _T_345 ? 1'h0 : _T_353; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3484 = 8'h70 == _T_345 ? 1'h0 : _GEN_3387; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_3488 = 8'h70 == _T_345 ? 1'h0 : _GEN_3393; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_3494 = 8'h70 == _T_345 ? 1'h0 : _GEN_3399; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_3499 = 8'h70 == _T_345 ? 1'h0 : _GEN_3404; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3502 = 8'h70 == _T_345 ? 1'h0 : _GEN_3407; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3505 = 8'h70 == _T_345 ? 1'h0 : _GEN_3410; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3508 = 8'h70 == _T_345 ? 1'h0 : _GEN_3413; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_3512 = 8'h70 == _T_345 ? PC_next : _GEN_3417; // @[Core.scala 738:52 Core.scala 58:24]
  wire  _GEN_3515 = 8'h70 == _T_345 ? 1'h0 : _GEN_3420; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3518 = 8'h70 == _T_345 ? 1'h0 : _GEN_3423; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_3520 = 8'h70 == _T_345 ? 8'h0 : _GEN_3425; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_3522 = 8'h70 == _T_345 ? 8'h0 : _GEN_3427; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_3523 = 8'h70 == _T_345 ? 1'h0 : _GEN_3428; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_3524 = 8'h70 == _T_345 ? 8'h0 : _GEN_3429; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_3527 = 8'h70 == _T_345 ? 1'h0 : _GEN_3432; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_3530 = 8'h70 == _T_345 ? F : _GEN_3435; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_3533 = 8'h70 == _T_345 ? 1'h0 : _GEN_3438; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3536 = 8'h70 == _T_345 ? 1'h0 : _GEN_3441; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3539 = 8'h70 == _T_345 ? 1'h0 : _GEN_3444; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3544 = 8'h70 == _T_345 ? 1'h0 : _GEN_3449; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_3548 = 8'h70 == _T_345 ? 1'h0 : _GEN_3453; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_3549 = 8'h70 == _T_345 ? dummy_cycle : _GEN_3454; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_3553 = 8'h70 == _T_345 ? 1'h0 : _GEN_3458; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_3554 = 8'h70 == _T_345 ? $signed(8'sh0) : $signed(_GEN_3459); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_3557 = 8'h70 == _T_345 ? 1'h0 : _GEN_3462; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_3562 = 8'h70 == _T_345 ? 1'h0 : _GEN_3467; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_3563 = 8'h76 == _T_341 ? 3'h1 : _GEN_3468; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_3564 = 8'h76 == _T_341 ? 8'h0 : _GEN_3469; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_3565 = 8'h76 == _T_341 ? PC : _GEN_3470; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_3566 = 8'h76 == _T_341 ? PC_next : _GEN_3512; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_3569 = 8'h76 == _T_341 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_3572 = 8'h76 == _T_341 ? 1'h0 : _GEN_3473; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_3574 = 8'h76 == _T_341 ? 8'h0 : _GEN_3475; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_3577 = 8'h76 == _T_341 ? 1'h0 : _GEN_3478; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3580 = 8'h76 == _T_341 ? 1'h0 : _GEN_3481; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3583 = 8'h76 == _T_341 ? 1'h0 : _GEN_3484; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_3587 = 8'h76 == _T_341 ? 1'h0 : _GEN_3488; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_3593 = 8'h76 == _T_341 ? 1'h0 : _GEN_3494; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_3598 = 8'h76 == _T_341 ? 1'h0 : _GEN_3499; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3601 = 8'h76 == _T_341 ? 1'h0 : _GEN_3502; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3604 = 8'h76 == _T_341 ? 1'h0 : _GEN_3505; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3607 = 8'h76 == _T_341 ? 1'h0 : _GEN_3508; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3613 = 8'h76 == _T_341 ? 1'h0 : _GEN_3515; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3616 = 8'h76 == _T_341 ? 1'h0 : _GEN_3518; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_3618 = 8'h76 == _T_341 ? 8'h0 : _GEN_3520; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_3620 = 8'h76 == _T_341 ? 8'h0 : _GEN_3522; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_3621 = 8'h76 == _T_341 ? 1'h0 : _GEN_3523; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_3622 = 8'h76 == _T_341 ? 8'h0 : _GEN_3524; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_3625 = 8'h76 == _T_341 ? 1'h0 : _GEN_3527; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_3628 = 8'h76 == _T_341 ? F : _GEN_3530; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_3631 = 8'h76 == _T_341 ? 1'h0 : _GEN_3533; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3634 = 8'h76 == _T_341 ? 1'h0 : _GEN_3536; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3637 = 8'h76 == _T_341 ? 1'h0 : _GEN_3539; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3642 = 8'h76 == _T_341 ? 1'h0 : _GEN_3544; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_3646 = 8'h76 == _T_341 ? 1'h0 : _GEN_3548; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_3647 = 8'h76 == _T_341 ? dummy_cycle : _GEN_3549; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_3651 = 8'h76 == _T_341 ? 1'h0 : _GEN_3553; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_3652 = 8'h76 == _T_341 ? $signed(8'sh0) : $signed(_GEN_3554); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_3655 = 8'h76 == _T_341 ? 1'h0 : _GEN_3557; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_3660 = 8'h76 == _T_341 ? 1'h0 : _GEN_3562; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_3664 = 8'h4 == _T_324 ? 8'h1 : _GEN_3620; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_3665 = 8'h4 == _T_324 ? 1'h0 : _GEN_3621; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_3666 = 8'h4 == _T_324 ? _alu_io_calc_type_T_4 : _GEN_3622; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_3669 = 8'h4 == _T_324 & _T_329; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_3670 = 8'h4 == _T_324 ? _GEN_2936 : _GEN_3618; // @[Core.scala 736:52]
  wire [2:0] _GEN_3671 = 8'h4 == _T_324 ? _GEN_2937 : _GEN_3563; // @[Core.scala 736:52]
  wire [15:0] _GEN_3672 = 8'h4 == _T_324 ? _GEN_2938 : _GEN_3565; // @[Core.scala 736:52]
  wire [7:0] _GEN_3673 = 8'h4 == _T_324 ? _GEN_2939 : _GEN_3564; // @[Core.scala 736:52]
  wire [2:0] _GEN_3674 = 8'h4 == _T_324 ? _GEN_2940 : _GEN_3647; // @[Core.scala 736:52]
  wire [7:0] _GEN_3675 = 8'h4 == _T_324 ? _GEN_2941 : _GEN_3574; // @[Core.scala 736:52]
  wire  _GEN_3678 = 8'h4 == _T_324 & _GEN_2944; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3682 = 8'h4 == _T_324 & _GEN_2948; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3688 = 8'h4 == _T_324 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_3689 = 8'h4 == _T_324 ? PC_next : _GEN_3566; // @[Core.scala 736:52 Core.scala 58:24]
  wire  _GEN_3692 = 8'h4 == _T_324 ? 1'h0 : _GEN_3569; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3695 = 8'h4 == _T_324 ? 1'h0 : _GEN_3572; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3699 = 8'h4 == _T_324 ? 1'h0 : _GEN_3577; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3702 = 8'h4 == _T_324 ? 1'h0 : _GEN_3580; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3705 = 8'h4 == _T_324 ? 1'h0 : _GEN_3583; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_3709 = 8'h4 == _T_324 ? 1'h0 : _GEN_3587; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_3715 = 8'h4 == _T_324 ? 1'h0 : _GEN_3593; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_3720 = 8'h4 == _T_324 ? 1'h0 : _GEN_3598; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3723 = 8'h4 == _T_324 ? 1'h0 : _GEN_3601; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3726 = 8'h4 == _T_324 ? 1'h0 : _GEN_3604; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3729 = 8'h4 == _T_324 ? 1'h0 : _GEN_3607; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3735 = 8'h4 == _T_324 ? 1'h0 : _GEN_3613; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3738 = 8'h4 == _T_324 ? 1'h0 : _GEN_3616; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3743 = 8'h4 == _T_324 ? 1'h0 : _GEN_3625; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_3746 = 8'h4 == _T_324 ? F : _GEN_3628; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_3749 = 8'h4 == _T_324 ? 1'h0 : _GEN_3631; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3752 = 8'h4 == _T_324 ? 1'h0 : _GEN_3634; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3755 = 8'h4 == _T_324 ? 1'h0 : _GEN_3637; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3760 = 8'h4 == _T_324 ? 1'h0 : _GEN_3642; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3764 = 8'h4 == _T_324 ? 1'h0 : _GEN_3646; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_3768 = 8'h4 == _T_324 ? 1'h0 : _GEN_3651; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_3769 = 8'h4 == _T_324 ? $signed(8'sh0) : $signed(_GEN_3652); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_3772 = 8'h4 == _T_324 ? 1'h0 : _GEN_3655; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_3777 = 8'h4 == _T_324 ? 1'h0 : _GEN_3660; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_3787 = 8'h3 == _T_303 ? input_1 : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_3788 = 8'h3 == _T_303 ? $signed({{6{_alu16_io_offset_T_7[1]}},_alu16_io_offset_T_7}) : $signed(
    _GEN_3769); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_3789 = 8'h3 == _T_303 ? _GEN_443 : _GEN_3671; // @[Core.scala 735:52]
  wire [2:0] _GEN_3790 = 8'h3 == _T_303 ? _GEN_445 : _GEN_3674; // @[Core.scala 735:52]
  wire  _GEN_3793 = 8'h3 == _T_303 & _GEN_2869; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_3800 = 8'h3 == _T_303 & _GEN_2876; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_3807 = 8'h3 == _T_303 & _GEN_2883; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_3812 = 8'h3 == _T_303 ? _GEN_2888 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_3813 = 8'h3 == _T_303 ? _GEN_468 : _GEN_3673; // @[Core.scala 735:52]
  wire  _GEN_3816 = 8'h3 == _T_303 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_3819 = 8'h3 == _T_303 ? 1'h0 : _T_325; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_3820 = 8'h3 == _T_303 ? 8'h0 : _GEN_3664; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_3821 = 8'h3 == _T_303 ? 1'h0 : _GEN_3665; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_3822 = 8'h3 == _T_303 ? 8'h0 : _GEN_3666; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_3825 = 8'h3 == _T_303 ? 1'h0 : _GEN_3669; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_3826 = 8'h3 == _T_303 ? 8'h0 : _GEN_3670; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_3827 = 8'h3 == _T_303 ? mem_refer_addr : _GEN_3672; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_3828 = 8'h3 == _T_303 ? 8'h0 : _GEN_3675; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_3831 = 8'h3 == _T_303 ? 1'h0 : _GEN_3678; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3835 = 8'h3 == _T_303 ? 1'h0 : _GEN_3682; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3841 = 8'h3 == _T_303 ? 1'h0 : _GEN_3688; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_3842 = 8'h3 == _T_303 ? PC_next : _GEN_3689; // @[Core.scala 735:52 Core.scala 58:24]
  wire  _GEN_3845 = 8'h3 == _T_303 ? 1'h0 : _GEN_3692; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3848 = 8'h3 == _T_303 ? 1'h0 : _GEN_3695; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3852 = 8'h3 == _T_303 ? 1'h0 : _GEN_3699; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3855 = 8'h3 == _T_303 ? 1'h0 : _GEN_3702; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3858 = 8'h3 == _T_303 ? 1'h0 : _GEN_3705; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_3862 = 8'h3 == _T_303 ? 1'h0 : _GEN_3709; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_3868 = 8'h3 == _T_303 ? 1'h0 : _GEN_3715; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_3873 = 8'h3 == _T_303 ? 1'h0 : _GEN_3720; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3876 = 8'h3 == _T_303 ? 1'h0 : _GEN_3723; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3879 = 8'h3 == _T_303 ? 1'h0 : _GEN_3726; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3882 = 8'h3 == _T_303 ? 1'h0 : _GEN_3729; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3888 = 8'h3 == _T_303 ? 1'h0 : _GEN_3735; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3891 = 8'h3 == _T_303 ? 1'h0 : _GEN_3738; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3896 = 8'h3 == _T_303 ? 1'h0 : _GEN_3743; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_3899 = 8'h3 == _T_303 ? F : _GEN_3746; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_3902 = 8'h3 == _T_303 ? 1'h0 : _GEN_3749; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3905 = 8'h3 == _T_303 ? 1'h0 : _GEN_3752; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3908 = 8'h3 == _T_303 ? 1'h0 : _GEN_3755; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3913 = 8'h3 == _T_303 ? 1'h0 : _GEN_3760; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3917 = 8'h3 == _T_303 ? 1'h0 : _GEN_3764; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3920 = 8'h3 == _T_303 ? 1'h0 : _GEN_3768; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_3923 = 8'h3 == _T_303 ? 1'h0 : _GEN_3772; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_3928 = 8'h3 == _T_303 ? 1'h0 : _GEN_3777; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_3932 = 8'hc0 == _T_291 ? _GEN_2754 : _GEN_3789; // @[Core.scala 734:52]
  wire [2:0] _GEN_3933 = 8'hc0 == _T_291 ? _GEN_334 : _GEN_3790; // @[Core.scala 734:52]
  wire [15:0] _GEN_3934 = 8'hc0 == _T_291 ? _GEN_335 : _GEN_3827; // @[Core.scala 734:52]
  wire [7:0] _GEN_3935 = 8'hc0 == _T_291 ? _GEN_2757 : _GEN_3813; // @[Core.scala 734:52]
  wire [15:0] _GEN_3936 = 8'hc0 == _T_291 ? _GEN_337 : _GEN_3812; // @[Core.scala 734:52]
  wire  _GEN_3939 = 8'hc0 == _T_291 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_3940 = 8'hc0 == _T_291 ? _GEN_2762 : _GEN_3842; // @[Core.scala 734:52]
  wire  _GEN_3943 = 8'hc0 == _T_291 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_3946 = 8'hc0 == _T_291 ? 1'h0 : _T_304; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_3953 = 8'hc0 == _T_291 ? 16'h0 : _GEN_3787; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_3954 = 8'hc0 == _T_291 ? $signed(8'sh0) : $signed(_GEN_3788); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_3957 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3793; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_3964 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3800; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_3971 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3807; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_3978 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3816; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_3981 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3819; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_3982 = 8'hc0 == _T_291 ? 8'h0 : _GEN_3820; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_3983 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3821; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_3984 = 8'hc0 == _T_291 ? 8'h0 : _GEN_3822; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_3987 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3825; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_3988 = 8'hc0 == _T_291 ? 8'h0 : _GEN_3826; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_3989 = 8'hc0 == _T_291 ? 8'h0 : _GEN_3828; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_3992 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3831; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_3996 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3835; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4002 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3841; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4005 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3845; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4008 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3848; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4012 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3852; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4015 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3855; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4018 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3858; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_4022 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3862; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_4028 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3868; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_4033 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3873; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4036 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3876; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4039 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3879; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4042 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3882; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4048 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3888; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4051 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3891; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4056 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3896; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_4059 = 8'hc0 == _T_291 ? F : _GEN_3899; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_4062 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3902; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4065 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3905; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4068 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3908; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4073 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3913; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4077 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3917; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4080 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3920; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_4083 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3923; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_4088 = 8'hc0 == _T_291 ? 1'h0 : _GEN_3928; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_4092 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_2704 : _GEN_3940; // @[Core.scala 733:90]
  wire [2:0] _GEN_4093 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_2705 : _GEN_3932; // @[Core.scala 733:90]
  wire [15:0] _GEN_4094 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_285 : _GEN_3934; // @[Core.scala 733:90]
  wire [7:0] _GEN_4095 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_2707 : _GEN_3935; // @[Core.scala 733:90]
  wire [2:0] _GEN_4096 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_287 : _GEN_3933; // @[Core.scala 733:90]
  wire [15:0] _GEN_4097 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_288 : _GEN_3953; // @[Core.scala 733:90]
  wire [7:0] _GEN_4098 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? $signed({8{_GEN_289}}) : $signed(_GEN_3954); // @[Core.scala 733:90]
  wire [7:0] _GEN_4099 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_290 : _GEN_3989; // @[Core.scala 733:90]
  wire [15:0] _GEN_4100 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? _GEN_291 : _GEN_3936; // @[Core.scala 733:90]
  wire  _GEN_4103 = (8'hcd == _T_268 | 8'hc4 == _T_270) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4107 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_4110 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _T_292; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4113 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3939; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4116 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3943; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4119 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3946; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4128 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3957; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4135 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3964; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4142 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3971; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4149 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3978; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4152 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3981; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_4153 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 8'h0 : _GEN_3982; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_4154 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3983; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_4155 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 8'h0 : _GEN_3984; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_4158 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3987; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_4159 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 8'h0 : _GEN_3988; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_4162 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3992; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4166 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_3996; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4172 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4002; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4175 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4005; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4178 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4008; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4182 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4012; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4185 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4015; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4188 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4018; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4192 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4022; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4198 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4028; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4203 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4033; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4206 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4036; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4209 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4039; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4212 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4042; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4218 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4048; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4221 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4051; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4226 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4056; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_4229 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? F : _GEN_4059; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_4232 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4062; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4235 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4065; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4238 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4068; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4243 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4073; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4247 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4077; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4250 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4080; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4253 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4083; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_4258 = 8'hcd == _T_268 | 8'hc4 == _T_270 ? 1'h0 : _GEN_4088; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_4262 = 8'hf3 == _T_264 ? opcodes_IFF_MPORT_1_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_4265 = 8'hf3 == _T_264 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_4268 = 8'hf3 == _T_264 ? 1'h0 : _T_272; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_4269 = 8'hf3 == _T_264 ? PC_next : _GEN_4092; // @[Core.scala 732:52 Core.scala 58:24]
  wire [2:0] _GEN_4270 = 8'hf3 == _T_264 ? machine_state_next : _GEN_4093; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_4271 = 8'hf3 == _T_264 ? mem_refer_addr : _GEN_4094; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_4272 = 8'hf3 == _T_264 ? opcode_index : _GEN_4095; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_4273 = 8'hf3 == _T_264 ? dummy_cycle : _GEN_4096; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_4274 = 8'hf3 == _T_264 ? 16'h0 : _GEN_4097; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_4275 = 8'hf3 == _T_264 ? $signed(8'sh0) : $signed(_GEN_4098); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_4276 = 8'hf3 == _T_264 ? 8'h0 : _GEN_4099; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_4277 = 8'hf3 == _T_264 ? SP : _GEN_4100; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_4280 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4103; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4284 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4107; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4287 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4110; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4290 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4113; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4293 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4116; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4296 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4119; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4305 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4128; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4312 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4135; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4319 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4142; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4326 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4149; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4329 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4152; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_4330 = 8'hf3 == _T_264 ? 8'h0 : _GEN_4153; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_4331 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4154; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_4332 = 8'hf3 == _T_264 ? 8'h0 : _GEN_4155; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_4335 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4158; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_4336 = 8'hf3 == _T_264 ? 8'h0 : _GEN_4159; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_4339 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4162; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4343 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4166; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4349 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4172; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4352 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4175; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4355 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4178; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4359 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4182; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4362 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4185; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4365 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4188; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4369 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4192; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4375 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4198; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4380 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4203; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4383 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4206; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4386 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4209; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4389 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4212; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4395 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4218; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4398 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4221; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4403 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4226; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_4406 = 8'hf3 == _T_264 ? F : _GEN_4229; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_4409 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4232; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4412 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4235; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4415 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4238; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4420 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4243; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4424 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4247; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4427 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4250; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_4430 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4253; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_4435 = 8'hf3 == _T_264 ? 1'h0 : _GEN_4258; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_4436 = 8'hd3 == _T_227 ? _GEN_163 : _GEN_4270; // @[Core.scala 731:52]
  wire [15:0] _GEN_4437 = 8'hd3 == _T_227 ? _GEN_2585 : _GEN_4271; // @[Core.scala 731:52]
  wire [7:0] _GEN_4438 = 8'hd3 == _T_227 ? _GEN_165 : _GEN_4272; // @[Core.scala 731:52]
  wire  _GEN_4441 = 8'hd3 == _T_227 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_4442 = 8'hd3 == _T_227 ? _GEN_2590 : _GEN_4269; // @[Core.scala 731:52]
  wire [15:0] _GEN_4443 = 8'hd3 == _T_227 ? _GEN_2591 : _io_bus_addr_T; // @[Core.scala 731:52 Core.scala 811:23]
  wire  _GEN_4446 = 8'hd3 == _T_227 & _GEN_2594; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_4447 = 8'hd3 == _T_227 ? _GEN_2595 : _GEN_4276; // @[Core.scala 731:52]
  wire  _GEN_4450 = 8'hd3 == _T_227 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4454 = 8'hd3 == _T_227 & _GEN_2602; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4455 = 8'hd3 == _T_227 ? _GEN_2603 : 1'h1; // @[Core.scala 731:52 Core.scala 757:14]
  wire  _GEN_4456 = 8'hd3 == _T_227 ? _GEN_2604 : 1'h1; // @[Core.scala 731:52 Core.scala 758:14]
  wire  _GEN_4459 = 8'hd3 == _T_227 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4462 = 8'hd3 == _T_227 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4465 = 8'hd3 == _T_227 & _GEN_2613; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4468 = 8'hd3 == _T_227 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_4471 = 8'hd3 == _T_227 ? 1'h0 : _T_265; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4472 = 8'hd3 == _T_227 ? IFF : _GEN_4262; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_4475 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4265; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4478 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4268; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_4479 = 8'hd3 == _T_227 ? dummy_cycle : _GEN_4273; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_4480 = 8'hd3 == _T_227 ? 16'h0 : _GEN_4274; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_4481 = 8'hd3 == _T_227 ? $signed(8'sh0) : $signed(_GEN_4275); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_4482 = 8'hd3 == _T_227 ? SP : _GEN_4277; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_4485 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4280; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4489 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4284; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4492 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4287; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4495 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4290; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4498 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4293; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4501 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4296; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4510 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4305; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4517 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4312; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4524 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4319; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4531 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4326; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4534 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4329; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_4535 = 8'hd3 == _T_227 ? 8'h0 : _GEN_4330; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_4536 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4331; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_4537 = 8'hd3 == _T_227 ? 8'h0 : _GEN_4332; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_4540 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4335; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_4541 = 8'hd3 == _T_227 ? 8'h0 : _GEN_4336; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_4544 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4339; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4548 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4343; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4554 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4349; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4557 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4352; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4560 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4355; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4564 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4359; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4567 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4362; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4570 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4365; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4574 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4369; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4580 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4375; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4585 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4380; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4588 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4383; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4591 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4386; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4594 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4389; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4600 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4395; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4603 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4398; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4608 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4403; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_4611 = 8'hd3 == _T_227 ? F : _GEN_4406; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_4614 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4409; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4617 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4412; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4620 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4415; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4625 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4420; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4629 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4424; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4632 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4427; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_4635 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4430; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_4640 = 8'hd3 == _T_227 ? 1'h0 : _GEN_4435; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_4641 = 8'h0 == _T_223 ? 3'h1 : _GEN_4436; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_4642 = 8'h0 == _T_223 ? 8'h0 : _GEN_4438; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_4645 = 8'h0 == _T_223 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_4646 = 8'h0 == _T_223 ? mem_refer_addr : _GEN_4437; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_4649 = 8'h0 == _T_223 ? 1'h0 : _GEN_4441; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_4650 = 8'h0 == _T_223 ? PC_next : _GEN_4442; // @[Core.scala 730:47 Core.scala 58:24]
  wire [15:0] _GEN_4651 = 8'h0 == _T_223 ? _io_bus_addr_T : _GEN_4443; // @[Core.scala 730:47 Core.scala 811:23]
  wire  _GEN_4654 = 8'h0 == _T_223 ? 1'h0 : _GEN_4446; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_4655 = 8'h0 == _T_223 ? 8'h0 : _GEN_4447; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_4658 = 8'h0 == _T_223 ? 1'h0 : _GEN_4450; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4662 = 8'h0 == _T_223 ? 1'h0 : _GEN_4454; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4663 = 8'h0 == _T_223 | _GEN_4455; // @[Core.scala 730:47 Core.scala 757:14]
  wire  _GEN_4664 = 8'h0 == _T_223 | _GEN_4456; // @[Core.scala 730:47 Core.scala 758:14]
  wire  _GEN_4667 = 8'h0 == _T_223 ? 1'h0 : _GEN_4459; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4670 = 8'h0 == _T_223 ? 1'h0 : _GEN_4462; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4673 = 8'h0 == _T_223 ? 1'h0 : _GEN_4465; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4676 = 8'h0 == _T_223 ? 1'h0 : _GEN_4468; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4679 = 8'h0 == _T_223 ? 1'h0 : _GEN_4471; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4680 = 8'h0 == _T_223 ? IFF : _GEN_4472; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_4683 = 8'h0 == _T_223 ? 1'h0 : _GEN_4475; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4686 = 8'h0 == _T_223 ? 1'h0 : _GEN_4478; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_4687 = 8'h0 == _T_223 ? dummy_cycle : _GEN_4479; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_4688 = 8'h0 == _T_223 ? 16'h0 : _GEN_4480; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_4689 = 8'h0 == _T_223 ? $signed(8'sh0) : $signed(_GEN_4481); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_4690 = 8'h0 == _T_223 ? SP : _GEN_4482; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_4693 = 8'h0 == _T_223 ? 1'h0 : _GEN_4485; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4697 = 8'h0 == _T_223 ? 1'h0 : _GEN_4489; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4700 = 8'h0 == _T_223 ? 1'h0 : _GEN_4492; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4703 = 8'h0 == _T_223 ? 1'h0 : _GEN_4495; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4706 = 8'h0 == _T_223 ? 1'h0 : _GEN_4498; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4709 = 8'h0 == _T_223 ? 1'h0 : _GEN_4501; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4718 = 8'h0 == _T_223 ? 1'h0 : _GEN_4510; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4725 = 8'h0 == _T_223 ? 1'h0 : _GEN_4517; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4732 = 8'h0 == _T_223 ? 1'h0 : _GEN_4524; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4739 = 8'h0 == _T_223 ? 1'h0 : _GEN_4531; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4742 = 8'h0 == _T_223 ? 1'h0 : _GEN_4534; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_4743 = 8'h0 == _T_223 ? 8'h0 : _GEN_4535; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_4744 = 8'h0 == _T_223 ? 1'h0 : _GEN_4536; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_4745 = 8'h0 == _T_223 ? 8'h0 : _GEN_4537; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_4748 = 8'h0 == _T_223 ? 1'h0 : _GEN_4540; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_4749 = 8'h0 == _T_223 ? 8'h0 : _GEN_4541; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_4752 = 8'h0 == _T_223 ? 1'h0 : _GEN_4544; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4756 = 8'h0 == _T_223 ? 1'h0 : _GEN_4548; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4762 = 8'h0 == _T_223 ? 1'h0 : _GEN_4554; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4765 = 8'h0 == _T_223 ? 1'h0 : _GEN_4557; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4768 = 8'h0 == _T_223 ? 1'h0 : _GEN_4560; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4772 = 8'h0 == _T_223 ? 1'h0 : _GEN_4564; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4775 = 8'h0 == _T_223 ? 1'h0 : _GEN_4567; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4778 = 8'h0 == _T_223 ? 1'h0 : _GEN_4570; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4782 = 8'h0 == _T_223 ? 1'h0 : _GEN_4574; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4788 = 8'h0 == _T_223 ? 1'h0 : _GEN_4580; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4793 = 8'h0 == _T_223 ? 1'h0 : _GEN_4585; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4796 = 8'h0 == _T_223 ? 1'h0 : _GEN_4588; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4799 = 8'h0 == _T_223 ? 1'h0 : _GEN_4591; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4802 = 8'h0 == _T_223 ? 1'h0 : _GEN_4594; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4808 = 8'h0 == _T_223 ? 1'h0 : _GEN_4600; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4811 = 8'h0 == _T_223 ? 1'h0 : _GEN_4603; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4816 = 8'h0 == _T_223 ? 1'h0 : _GEN_4608; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_4819 = 8'h0 == _T_223 ? F : _GEN_4611; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_4822 = 8'h0 == _T_223 ? 1'h0 : _GEN_4614; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4825 = 8'h0 == _T_223 ? 1'h0 : _GEN_4617; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4828 = 8'h0 == _T_223 ? 1'h0 : _GEN_4620; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4833 = 8'h0 == _T_223 ? 1'h0 : _GEN_4625; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4837 = 8'h0 == _T_223 ? 1'h0 : _GEN_4629; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4840 = 8'h0 == _T_223 ? 1'h0 : _GEN_4632; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_4843 = 8'h0 == _T_223 ? 1'h0 : _GEN_4635; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_4848 = 8'h0 == _T_223 ? 1'h0 : _GEN_4640; // @[Core.scala 730:47 Core.scala 724:20]
  reg  REG_9; // @[Core.scala 772:43]
  wire  _T_428 = ~clock & REG_9; // @[Core.scala 772:33]
  wire [15:0] _GEN_4850 = _T_215 ? _io_bus_addr_T : PC; // @[Core.scala 820:41 Core.scala 822:23 Core.scala 756:15]
  wire  _GEN_4851 = _T_215 ? _T_428 : 1'h1; // @[Core.scala 820:41 Core.scala 759:16]
  wire [2:0] _GEN_4854 = _T_215 ? machine_state_next : machine_state; // @[Core.scala 820:41 Core.scala 829:25 Core.scala 67:30]
  wire [15:0] _GEN_4855 = _T_101 ? _GEN_4651 : _GEN_4850; // @[Core.scala 809:41]
  wire  _GEN_4856 = _T_101 ? _GEN_2428 : _GEN_4851; // @[Core.scala 809:41]
  wire [15:0] _GEN_4859 = _T_101 ? PC_next : PC; // @[Core.scala 809:41 Core.scala 818:14 Core.scala 110:19]
  wire [2:0] _GEN_4864 = _T_101 ? _GEN_4641 : machine_state_next; // @[Core.scala 809:41 Core.scala 68:35]
  wire [7:0] _GEN_4865 = _T_101 ? _GEN_4642 : opcode_index; // @[Core.scala 809:41 Core.scala 725:29]
  wire  _GEN_4868 = _T_101 & _GEN_4645; // @[Core.scala 809:41 Core.scala 724:20]
  wire [15:0] _GEN_4869 = _T_101 ? _GEN_4646 : mem_refer_addr; // @[Core.scala 809:41 Core.scala 73:31]
  wire  _GEN_4872 = _T_101 & _GEN_4649; // @[Core.scala 809:41 Core.scala 724:20]
  wire [15:0] _GEN_4873 = _T_101 ? _GEN_4650 : PC_next; // @[Core.scala 809:41 Core.scala 58:24]
  wire  _GEN_4876 = _T_101 & _GEN_4654; // @[Core.scala 809:41 Core.scala 724:20]
  wire [7:0] _GEN_4877 = _T_101 ? _GEN_4655 : 8'h0; // @[Core.scala 809:41 Core.scala 77:16]
  wire  _GEN_4880 = _T_101 & _GEN_4658; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4884 = _T_101 & _GEN_4662; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4885 = _T_101 ? _GEN_4663 : 1'h1; // @[Core.scala 809:41 Core.scala 757:14]
  wire  _GEN_4886 = _T_101 ? _GEN_4664 : 1'h1; // @[Core.scala 809:41 Core.scala 758:14]
  wire  _GEN_4889 = _T_101 & _GEN_4667; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4892 = _T_101 & _GEN_4670; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4895 = _T_101 & _GEN_4673; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4898 = _T_101 & _GEN_4676; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4901 = _T_101 & _GEN_4679; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4902 = _T_101 ? _GEN_4680 : IFF; // @[Core.scala 809:41 Core.scala 71:20]
  wire  _GEN_4905 = _T_101 & _GEN_4683; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4908 = _T_101 & _GEN_4686; // @[Core.scala 809:41 Core.scala 724:20]
  wire [2:0] _GEN_4909 = _T_101 ? _GEN_4687 : dummy_cycle; // @[Core.scala 809:41 Core.scala 775:28]
  wire [15:0] _GEN_4910 = _T_101 ? _GEN_4688 : 16'h0; // @[Core.scala 809:41 Core.scala 55:27]
  wire [7:0] _GEN_4911 = _T_101 ? $signed(_GEN_4689) : $signed(8'sh0); // @[Core.scala 809:41 Core.scala 56:19]
  wire [15:0] _GEN_4912 = _T_101 ? _GEN_4690 : SP; // @[Core.scala 809:41 Core.scala 113:19]
  wire  _GEN_4915 = _T_101 & _GEN_4693; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4919 = _T_101 & _GEN_4697; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4922 = _T_101 & _GEN_4700; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4925 = _T_101 & _GEN_4703; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4928 = _T_101 & _GEN_4706; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4931 = _T_101 & _GEN_4709; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4940 = _T_101 & _GEN_4718; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_4947 = _T_101 & _GEN_4725; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_4954 = _T_101 & _GEN_4732; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_4961 = _T_101 & _GEN_4739; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4964 = _T_101 & _GEN_4742; // @[Core.scala 809:41 Core.scala 724:20]
  wire [7:0] _GEN_4965 = _T_101 ? _GEN_4743 : 8'h0; // @[Core.scala 809:41 Core.scala 766:18]
  wire  _GEN_4966 = _T_101 & _GEN_4744; // @[Core.scala 809:41 Core.scala 768:22]
  wire [7:0] _GEN_4967 = _T_101 ? _GEN_4745 : 8'h0; // @[Core.scala 809:41 Core.scala 767:20]
  wire  _GEN_4970 = _T_101 & _GEN_4748; // @[Core.scala 809:41 Core.scala 724:20]
  wire [7:0] _GEN_4971 = _T_101 ? _GEN_4749 : 8'h0; // @[Core.scala 809:41 Core.scala 765:18]
  wire  _GEN_4974 = _T_101 & _GEN_4752; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4978 = _T_101 & _GEN_4756; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4984 = _T_101 & _GEN_4762; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4987 = _T_101 & _GEN_4765; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4990 = _T_101 & _GEN_4768; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4994 = _T_101 & _GEN_4772; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_4997 = _T_101 & _GEN_4775; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5000 = _T_101 & _GEN_4778; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_5004 = _T_101 & _GEN_4782; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_5010 = _T_101 & _GEN_4788; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_5015 = _T_101 & _GEN_4793; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5018 = _T_101 & _GEN_4796; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5021 = _T_101 & _GEN_4799; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5024 = _T_101 & _GEN_4802; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5030 = _T_101 & _GEN_4808; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5033 = _T_101 & _GEN_4811; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5038 = _T_101 & _GEN_4816; // @[Core.scala 809:41 Core.scala 90:27]
  wire [7:0] _GEN_5041 = _T_101 ? _GEN_4819 : F; // @[Core.scala 809:41 Core.scala 41:18]
  wire  _GEN_5044 = _T_101 & _GEN_4822; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5047 = _T_101 & _GEN_4825; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5050 = _T_101 & _GEN_4828; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5055 = _T_101 & _GEN_4833; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5059 = _T_101 & _GEN_4837; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5062 = _T_101 & _GEN_4840; // @[Core.scala 809:41 Core.scala 724:20]
  wire  _GEN_5065 = _T_101 & _GEN_4843; // @[Core.scala 809:41 Core.scala 90:27]
  wire  _GEN_5070 = _T_101 & _GEN_4848; // @[Core.scala 809:41 Core.scala 724:20]
  wire [2:0] _GEN_5071 = _T_101 ? machine_state : _GEN_4854; // @[Core.scala 809:41 Core.scala 67:30]
  wire [15:0] _GEN_5072 = m1_t_cycle == 8'h2 ? _GEN_2230 : _GEN_4855; // @[Core.scala 801:41]
  wire [15:0] _GEN_5073 = m1_t_cycle == 8'h2 ? _GEN_2229 : _GEN_4873; // @[Core.scala 801:41]
  wire  _GEN_5074 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4856; // @[Core.scala 801:41 Core.scala 804:24]
  wire  _GEN_5077 = m1_t_cycle == 8'h2 ? _GEN_2242 : _GEN_4885; // @[Core.scala 801:41]
  wire [2:0] _GEN_5082 = m1_t_cycle == 8'h2 ? _GEN_2220 : _GEN_4864; // @[Core.scala 801:41]
  wire [7:0] _GEN_5083 = m1_t_cycle == 8'h2 ? _GEN_2221 : _GEN_4865; // @[Core.scala 801:41]
  wire  _GEN_5086 = m1_t_cycle == 8'h2 & _GEN_2224; // @[Core.scala 801:41 Core.scala 724:20]
  wire [15:0] _GEN_5087 = m1_t_cycle == 8'h2 ? _GEN_2225 : _GEN_4869; // @[Core.scala 801:41]
  wire  _GEN_5090 = m1_t_cycle == 8'h2 & _GEN_2228; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5093 = m1_t_cycle == 8'h2 & _GEN_2233; // @[Core.scala 801:41 Core.scala 724:20]
  wire [7:0] _GEN_5094 = m1_t_cycle == 8'h2 ? _GEN_2234 : _GEN_4877; // @[Core.scala 801:41]
  wire  _GEN_5097 = m1_t_cycle == 8'h2 & _GEN_2237; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5101 = m1_t_cycle == 8'h2 & _GEN_2241; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5102 = m1_t_cycle == 8'h2 ? _GEN_2243 : _GEN_4886; // @[Core.scala 801:41]
  wire  _GEN_5105 = m1_t_cycle == 8'h2 & _GEN_2246; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5108 = m1_t_cycle == 8'h2 & _GEN_2249; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5111 = m1_t_cycle == 8'h2 & _GEN_2252; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5114 = m1_t_cycle == 8'h2 & _GEN_2255; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5117 = m1_t_cycle == 8'h2 & _GEN_2258; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5118 = m1_t_cycle == 8'h2 ? _GEN_2259 : _GEN_4902; // @[Core.scala 801:41]
  wire  _GEN_5121 = m1_t_cycle == 8'h2 & _GEN_2262; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5124 = m1_t_cycle == 8'h2 & _GEN_2265; // @[Core.scala 801:41 Core.scala 724:20]
  wire [2:0] _GEN_5125 = m1_t_cycle == 8'h2 ? _GEN_2266 : _GEN_4909; // @[Core.scala 801:41]
  wire [15:0] _GEN_5126 = m1_t_cycle == 8'h2 ? _GEN_2267 : _GEN_4910; // @[Core.scala 801:41]
  wire [7:0] _GEN_5127 = m1_t_cycle == 8'h2 ? $signed(_GEN_2268) : $signed(_GEN_4911); // @[Core.scala 801:41]
  wire [15:0] _GEN_5128 = m1_t_cycle == 8'h2 ? _GEN_2269 : _GEN_4912; // @[Core.scala 801:41]
  wire  _GEN_5131 = m1_t_cycle == 8'h2 & _GEN_2272; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5135 = m1_t_cycle == 8'h2 & _GEN_2276; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5138 = m1_t_cycle == 8'h2 & _GEN_2279; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5141 = m1_t_cycle == 8'h2 & _GEN_2282; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5144 = m1_t_cycle == 8'h2 & _GEN_2285; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5147 = m1_t_cycle == 8'h2 & _GEN_2288; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5156 = m1_t_cycle == 8'h2 & _GEN_2297; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5163 = m1_t_cycle == 8'h2 & _GEN_2304; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5170 = m1_t_cycle == 8'h2 & _GEN_2311; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5177 = m1_t_cycle == 8'h2 & _GEN_2318; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5180 = m1_t_cycle == 8'h2 & _GEN_2321; // @[Core.scala 801:41 Core.scala 724:20]
  wire [7:0] _GEN_5181 = m1_t_cycle == 8'h2 ? _GEN_2322 : _GEN_4965; // @[Core.scala 801:41]
  wire  _GEN_5182 = m1_t_cycle == 8'h2 ? _GEN_2323 : _GEN_4966; // @[Core.scala 801:41]
  wire [7:0] _GEN_5183 = m1_t_cycle == 8'h2 ? _GEN_2324 : _GEN_4967; // @[Core.scala 801:41]
  wire  _GEN_5186 = m1_t_cycle == 8'h2 & _GEN_2327; // @[Core.scala 801:41 Core.scala 724:20]
  wire [7:0] _GEN_5187 = m1_t_cycle == 8'h2 ? _GEN_2328 : _GEN_4971; // @[Core.scala 801:41]
  wire  _GEN_5190 = m1_t_cycle == 8'h2 & _GEN_2331; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5194 = m1_t_cycle == 8'h2 & _GEN_2335; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5200 = m1_t_cycle == 8'h2 & _GEN_2341; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5203 = m1_t_cycle == 8'h2 & _GEN_2344; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5206 = m1_t_cycle == 8'h2 & _GEN_2347; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5210 = m1_t_cycle == 8'h2 & _GEN_2351; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5213 = m1_t_cycle == 8'h2 & _GEN_2354; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5216 = m1_t_cycle == 8'h2 & _GEN_2357; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5220 = m1_t_cycle == 8'h2 & _GEN_2361; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5226 = m1_t_cycle == 8'h2 & _GEN_2367; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5231 = m1_t_cycle == 8'h2 & _GEN_2372; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5234 = m1_t_cycle == 8'h2 & _GEN_2375; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5237 = m1_t_cycle == 8'h2 & _GEN_2378; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5240 = m1_t_cycle == 8'h2 & _GEN_2381; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5246 = m1_t_cycle == 8'h2 & _GEN_2387; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5249 = m1_t_cycle == 8'h2 & _GEN_2390; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5254 = m1_t_cycle == 8'h2 & _GEN_2395; // @[Core.scala 801:41 Core.scala 90:27]
  wire [7:0] _GEN_5257 = m1_t_cycle == 8'h2 ? _GEN_2398 : _GEN_5041; // @[Core.scala 801:41]
  wire  _GEN_5260 = m1_t_cycle == 8'h2 & _GEN_2401; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5263 = m1_t_cycle == 8'h2 & _GEN_2404; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5266 = m1_t_cycle == 8'h2 & _GEN_2407; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5271 = m1_t_cycle == 8'h2 & _GEN_2412; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5275 = m1_t_cycle == 8'h2 & _GEN_2416; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5278 = m1_t_cycle == 8'h2 & _GEN_2419; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5281 = m1_t_cycle == 8'h2 & _GEN_2422; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5286 = m1_t_cycle == 8'h2 & _GEN_2427; // @[Core.scala 801:41 Core.scala 724:20]
  wire [15:0] _GEN_5287 = m1_t_cycle == 8'h2 ? PC : _GEN_4859; // @[Core.scala 801:41 Core.scala 110:19]
  wire  _GEN_5294 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4868; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5297 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4872; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5300 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4876; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5303 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4880; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5306 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4884; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5309 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4889; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5312 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4892; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5315 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4895; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5318 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4898; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5321 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4901; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5324 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4905; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5327 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4908; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5330 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4915; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5334 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4919; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5337 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4922; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5340 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4925; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5343 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4928; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5346 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4931; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5355 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4940; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5362 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4947; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5369 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4954; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5376 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4961; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5379 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4964; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5382 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4970; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5385 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4974; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5389 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4978; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5395 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4984; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5398 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4987; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5401 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4990; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5405 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4994; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5408 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_4997; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5411 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5000; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5415 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5004; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5421 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5010; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5426 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5015; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5429 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5018; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5432 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5021; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5435 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5024; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5441 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5030; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5444 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5033; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5449 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5038; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5454 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5044; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5457 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5047; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5460 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5050; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5465 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5055; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5469 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5059; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5472 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5062; // @[Core.scala 801:41 Core.scala 724:20]
  wire  _GEN_5475 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5065; // @[Core.scala 801:41 Core.scala 90:27]
  wire  _GEN_5480 = m1_t_cycle == 8'h2 ? 1'h0 : _GEN_5070; // @[Core.scala 801:41 Core.scala 724:20]
  wire [2:0] _GEN_5481 = m1_t_cycle == 8'h2 ? machine_state : _GEN_5071; // @[Core.scala 801:41 Core.scala 67:30]
  wire [15:0] _GEN_5482 = m1_t_cycle == 8'h1 ? PC_next : _GEN_5072; // @[Core.scala 790:34 Core.scala 792:23]
  wire  _GEN_5483 = m1_t_cycle == 8'h1 ? _GEN_3 : _GEN_5074; // @[Core.scala 790:34]
  wire  _GEN_5486 = m1_t_cycle == 8'h1 ? _GEN_3 : _GEN_5077; // @[Core.scala 790:34]
  wire  _GEN_5495 = m1_t_cycle == 8'h1 ? 1'h0 : _T_12; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5501 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5086; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5505 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5090; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5508 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5093; // @[Core.scala 790:34 Core.scala 724:20]
  wire [7:0] _GEN_5509 = m1_t_cycle == 8'h1 ? 8'h0 : _GEN_5094; // @[Core.scala 790:34 Core.scala 77:16]
  wire  _GEN_5512 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5097; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5516 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5101; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5517 = m1_t_cycle == 8'h1 | _GEN_5102; // @[Core.scala 790:34 Core.scala 758:14]
  wire  _GEN_5520 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5105; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5523 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5108; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5526 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5111; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5529 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5114; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5532 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5117; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5536 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5121; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5539 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5124; // @[Core.scala 790:34 Core.scala 724:20]
  wire [15:0] _GEN_5541 = m1_t_cycle == 8'h1 ? 16'h0 : _GEN_5126; // @[Core.scala 790:34 Core.scala 55:27]
  wire [7:0] _GEN_5542 = m1_t_cycle == 8'h1 ? $signed(8'sh0) : $signed(_GEN_5127); // @[Core.scala 790:34 Core.scala 56:19]
  wire  _GEN_5546 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5131; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5550 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5135; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5553 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5138; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5556 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5141; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5559 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5144; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5562 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5147; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5571 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5156; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5578 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5163; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5585 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5170; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5592 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5177; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5595 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5180; // @[Core.scala 790:34 Core.scala 724:20]
  wire [7:0] _GEN_5596 = m1_t_cycle == 8'h1 ? 8'h0 : _GEN_5181; // @[Core.scala 790:34 Core.scala 766:18]
  wire  _GEN_5597 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5182; // @[Core.scala 790:34 Core.scala 768:22]
  wire [7:0] _GEN_5598 = m1_t_cycle == 8'h1 ? 8'h0 : _GEN_5183; // @[Core.scala 790:34 Core.scala 767:20]
  wire  _GEN_5601 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5186; // @[Core.scala 790:34 Core.scala 724:20]
  wire [7:0] _GEN_5602 = m1_t_cycle == 8'h1 ? 8'h0 : _GEN_5187; // @[Core.scala 790:34 Core.scala 765:18]
  wire  _GEN_5605 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5190; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5609 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5194; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5615 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5200; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5618 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5203; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5621 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5206; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5625 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5210; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5628 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5213; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5631 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5216; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5635 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5220; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5641 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5226; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5646 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5231; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5649 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5234; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5652 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5237; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5655 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5240; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5661 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5246; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5664 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5249; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5669 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5254; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5675 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5260; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5678 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5263; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5681 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5266; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5686 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5271; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5690 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5275; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5693 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5278; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5696 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5281; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5701 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5286; // @[Core.scala 790:34 Core.scala 724:20]
  wire [15:0] _GEN_5702 = m1_t_cycle == 8'h1 ? PC : _GEN_5287; // @[Core.scala 790:34 Core.scala 110:19]
  wire  _GEN_5705 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_604; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5709 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5294; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5712 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5297; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5715 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5300; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5718 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5303; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5721 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5306; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5724 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5309; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5727 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5312; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5730 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5315; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5733 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5318; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5736 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5321; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5739 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5324; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5742 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5327; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5745 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5330; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5749 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5334; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5752 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5337; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5755 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5340; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5758 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5343; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5761 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5346; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5770 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5355; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5777 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5362; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5784 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5369; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5791 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5376; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5794 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5379; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5797 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5382; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5800 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5385; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5804 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5389; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5810 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5395; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5813 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5398; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5816 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5401; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5820 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5405; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5823 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5408; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5826 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5411; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5830 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5415; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5836 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5421; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5841 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5426; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5844 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5429; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5847 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5432; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5850 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5435; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5856 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5441; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5859 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5444; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5864 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5449; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5869 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5454; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5872 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5457; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5875 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5460; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5880 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5465; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5884 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5469; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5887 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5472; // @[Core.scala 790:34 Core.scala 724:20]
  wire  _GEN_5890 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5475; // @[Core.scala 790:34 Core.scala 90:27]
  wire  _GEN_5895 = m1_t_cycle == 8'h1 ? 1'h0 : _GEN_5480; // @[Core.scala 790:34 Core.scala 724:20]
  wire [7:0] _GEN_5897 = m1_t_cycle < 8'h3 ? _m1_t_cycle_T_1 : m1_t_cycle; // @[Core.scala 835:32 Core.scala 836:22 Core.scala 770:27]
  reg  REG_10; // @[Core.scala 772:43]
  wire  _T_435 = ~clock & REG_10; // @[Core.scala 772:33]
  wire  _GEN_5898 = _T_435 ? 1'h0 : 1'h1; // @[Core.scala 842:43 Core.scala 843:26 Core.scala 841:24]
  wire [7:0] _T_440 = opcodes_MPORT_116_data; // @[Core.scala 730:22]
  wire  _T_441 = 8'h0 == _T_440; // @[Core.scala 730:22]
  wire [7:0] _T_444 = opcodes_MPORT_118_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_445 = 8'hd3 == _T_444; // @[Core.scala 731:27]
  wire [15:0] _mem_refer_addr_T_36 = {A,opcodes_mem_refer_addr_lo_4_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_5906 = _T_12 ? _mem_refer_addr_T_36 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  reg  REG_11; // @[Core.scala 772:43]
  wire  _T_457 = ~clock & REG_11; // @[Core.scala 772:33]
  wire [7:0] _GEN_5908 = ~opcodes_MPORT_120_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_5912 = _T_457 ? _GEN_5908 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire [7:0] _GEN_5913 = ~opcodes_MPORT_121_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_12; // @[Core.scala 772:43]
  wire  _T_466 = ~clock & REG_12; // @[Core.scala 772:33]
  wire  _GEN_5921 = _T_466 ? opcodes_MPORT_122_data[3] : 1'h1; // @[Core.scala 583:47 Core.scala 758:14]
  wire [7:0] _GEN_5922 = ~opcodes_MPORT_123_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire [7:0] _GEN_5923 = ~opcodes_MPORT_124_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_13; // @[Core.scala 772:43]
  wire  _T_478 = ~clock & REG_13; // @[Core.scala 772:33]
  wire  _GEN_5930 = _T_478 & opcodes_MPORT_125_data[3]; // @[Core.scala 602:48 Core.scala 848:22]
  wire [7:0] _GEN_5935 = _T_47 ? _GEN_5923 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_5946 = _T_44 ? _GEN_5922 : _GEN_5935; // @[Conditional.scala 39:67]
  wire  _GEN_5954 = _T_44 ? 1'h0 : _T_47 & _T_478; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_5955 = _T_44 ? 1'h0 : _T_47 & _GEN_5930; // @[Conditional.scala 39:67 Core.scala 848:22]
  wire [7:0] _GEN_5961 = _T_35 ? _GEN_5913 : _GEN_5946; // @[Conditional.scala 39:67]
  wire  _GEN_5965 = _T_35 & _T_466; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_5966 = _T_35 ? 1'h0 : _GEN_5955; // @[Conditional.scala 39:67]
  wire  _GEN_5967 = _T_35 ? _GEN_5921 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_5977 = _T_35 ? 1'h0 : _GEN_5954; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_5981 = _T_28 & _T_457; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_5982 = _T_28 ? _GEN_5912 : _GEN_5961; // @[Conditional.scala 40:58]
  wire  _GEN_5989 = _T_28 ? 1'h0 : _GEN_5965; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_5990 = _T_28 ? 1'h0 : _GEN_5966; // @[Conditional.scala 40:58 Core.scala 848:22]
  wire  _GEN_5991 = _T_28 | _GEN_5967; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_6001 = _T_28 ? 1'h0 : _GEN_5977; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_6007 = _T_27 ? _GEN_5982 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_6016 = _T_27 ? _GEN_5991 : 1'h1; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire [15:0] _GEN_6032 = _T_25 ? _GEN_5906 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_6037 = _T_25 ? 1'h0 : _T_27 & _GEN_5981; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_6038 = _T_25 ? 8'h0 : _GEN_6007; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_6045 = _T_25 ? 1'h0 : _T_27 & _GEN_5989; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_6046 = _T_25 ? 1'h0 : _T_27 & _GEN_5990; // @[Conditional.scala 39:67 Core.scala 848:22]
  wire  _GEN_6047 = _T_25 | _GEN_6016; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire  _GEN_6056 = _T_25 ? 1'h0 : _T_27 & _GEN_6001; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_6059 = _T_4 ? _GEN_5 : _GEN_6032; // @[Conditional.scala 40:58]
  wire  _GEN_6068 = _T_4 ? 1'h0 : _GEN_6037; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_6069 = _T_4 ? 8'h0 : _GEN_6038; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_6076 = _T_4 ? 1'h0 : _GEN_6045; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_6077 = _T_4 ? 1'h0 : _GEN_6046; // @[Conditional.scala 40:58 Core.scala 848:22]
  wire  _GEN_6078 = _T_4 | _GEN_6047; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_6087 = _T_4 ? 1'h0 : _GEN_6056; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_481 = opcodes_MPORT_126_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_482 = 8'hf3 == _T_481; // @[Core.scala 732:27]
  wire [7:0] _T_485 = opcodes_MPORT_128_data; // @[Core.scala 733:27]
  wire [7:0] _T_487 = opcodes_MPORT_129_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_489 = 8'hcd == _T_485 | 8'hc4 == _T_487; // @[Core.scala 733:51]
  wire  op_hi_6 = opcodes_op_MPORT_12_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo_6 = opcodes_op_MPORT_13_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op_8 = {op_hi_6,op_lo_6}; // @[Cat.scala 30:58]
  wire  _cond_T_198 = op_8 == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_201 = op_8 == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_204 = op_8 == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_207 = op_8 == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_210 = op_8 == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_213 = op_8 == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_216 = op_8 == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_219 = op_8 == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_222 = op_8 == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond_6 = _cond_T_198 | (_cond_T_201 | (_cond_T_204 | (_cond_T_207 | (_cond_T_210 | (_cond_T_213 | (_cond_T_216
     | (_cond_T_219 | _cond_T_222))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_6095 = cond_6 ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_6096 = cond_6 ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_6097 = opcode_index == 8'h2 ? _GEN_6095 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_6098 = opcode_index == 8'h2 ? _GEN_6096 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [7:0] _GEN_6102 = _T_35 ? _GEN_6098 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_6103 = _T_35 ? _GEN_6097 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _PC_next_T_42 = {opcodes_PC_next_hi_6_data,opcodes_PC_next_lo_4_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_6116 = _T_82 ? _PC_next_T_42 : PC_next; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 58:24]
  wire [15:0] _GEN_6128 = _T_81 ? PC_next : _GEN_6116; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_6140 = _T_12 ? _GEN_6128 : PC_next; // @[Core.scala 698:30 Core.scala 58:24]
  wire [15:0] _GEN_6152 = _T_79 ? _GEN_6140 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_6164 = _T_77 ? PC_next : _GEN_6152; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_6166 = _T_25 ? _GEN_2627 : _GEN_6164; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_6167 = _T_25 ? _GEN_6102 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_6168 = _T_25 ? _GEN_6103 : _GEN_259; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_6178 = _T_4 ? _GEN_2617 : _GEN_6166; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_6179 = _T_4 ? _GEN_197 : _GEN_6168; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_6181 = _T_4 ? _GEN_199 : _GEN_6167; // @[Conditional.scala 40:58]
  wire [7:0] _T_508 = opcodes_MPORT_131_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_509 = 8'hc0 == _T_508; // @[Core.scala 734:27]
  wire  op_hi_7 = opcodes_op_MPORT_14_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_7 = opcodes_op_MPORT_15_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_9 = {op_hi_7,op_lo_7}; // @[Cat.scala 30:58]
  wire  _cond_T_231 = op_9 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_234 = op_9 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_237 = op_9 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_240 = op_9 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_243 = op_9 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_246 = op_9 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_249 = op_9 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_252 = op_9 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_255 = op_9 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_7 = _cond_T_231 | (_cond_T_234 | (_cond_T_237 | (_cond_T_240 | (_cond_T_243 | (_cond_T_246 | (_cond_T_249
     | (_cond_T_252 | _cond_T_255))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_6191 = _cond_T_231 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_6192 = _T_35 ? _GEN_6191 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_6196 = cond_7 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_6197 = cond_7 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _PC_next_T_43 = {opcodes_PC_next_hi_7_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_6201 = _T_75 ? _PC_next_T_43 : PC_next; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 58:24]
  wire [15:0] _GEN_6210 = _T_35 ? _GEN_6201 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_6218 = _T_25 ? _GEN_6210 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_6220 = _T_77 ? _GEN_6196 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_6221 = _T_77 ? _GEN_6197 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_6227 = _T_77 ? PC_next : _GEN_6218; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_6228 = _T_4 ? _GEN_6192 : _GEN_6220; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_6231 = _T_4 ? _GEN_195 : _GEN_6221; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_6236 = _T_4 ? PC_next : _GEN_6227; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_520 = opcodes_MPORT_133_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_521 = 8'h3 == _T_520; // @[Core.scala 735:27]
  wire  _register_T_34 = opcodes_MPORT_134_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_35 = {regfiles_front_register_hi_6_data,regfiles_front_register_lo_6_data}; // @[Cat.scala 30:58]
  wire  _register_T_37 = opcodes_MPORT_134_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_38 = {regfiles_front_register_hi_7_data,regfiles_front_register_lo_7_data}; // @[Cat.scala 30:58]
  wire  _register_T_40 = opcodes_MPORT_134_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_41 = {regfiles_front_register_hi_8_data,regfiles_front_register_lo_8_data}; // @[Cat.scala 30:58]
  wire  _register_T_43 = opcodes_MPORT_134_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_44 = _register_T_43 ? SP : {{14'd0}, opcodes_MPORT_134_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_45 = _register_T_40 ? _register_T_41 : _register_T_44; // @[Mux.scala 98:16]
  wire [15:0] _register_T_46 = _register_T_37 ? _register_T_38 : _register_T_45; // @[Mux.scala 98:16]
  wire [15:0] register_2 = _register_T_34 ? _register_T_35 : _register_T_46; // @[Mux.scala 98:16]
  reg [15:0] input_2; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_12 = ~opcodes_MPORT_134_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_530 = 2'h0 == opcodes_MPORT_134_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_533 = 2'h1 == opcodes_MPORT_134_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_536 = 2'h2 == opcodes_MPORT_134_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_539 = 2'h3 == opcodes_MPORT_134_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_6239 = _T_539 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_6247 = _T_536 ? SP : _GEN_6239; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_6257 = _T_533 ? 1'h0 : _T_536; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_6262 = _T_533 ? SP : _GEN_6247; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_6272 = _T_530 ? 1'h0 : _T_533; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_6279 = _T_530 ? 1'h0 : _GEN_6257; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_6284 = _T_530 ? SP : _GEN_6262; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_6289 = _T_35 & _T_530; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_6296 = _T_35 & _GEN_6272; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_6303 = _T_35 & _GEN_6279; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_6308 = _T_35 ? _GEN_6284 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_6314 = _T_77 & _GEN_6289; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_6321 = _T_77 & _GEN_6296; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_6328 = _T_77 & _GEN_6303; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_6333 = _T_77 ? _GEN_6308 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_6343 = _T_4 ? 1'h0 : _GEN_6314; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_6350 = _T_4 ? 1'h0 : _GEN_6321; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_6357 = _T_4 ? 1'h0 : _GEN_6328; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_6362 = _T_4 ? SP : _GEN_6333; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _T_541 = opcodes_MPORT_141_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_542 = 8'h4 == _T_541; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_7 = opcodes_alu_io_calc_type_MPORT_2_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_545 = opcodes_MPORT_142_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_546 = 8'h34 == _T_545; // @[Core.scala 244:22]
  reg [7:0] temp_2; // @[Core.scala 245:25]
  wire [7:0] _GEN_6367 = _T_12 ? temp_2 : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [7:0] _GEN_6371 = _T_79 ? _GEN_6367 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_6375 = _T_77 ? 8'h0 : _GEN_6371; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_6381 = _T_25 ? 8'h0 : _GEN_6375; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_6389 = _T_4 ? 8'h0 : _GEN_6381; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_554 = opcodes_MPORT_142_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_555 = 8'h4 == _T_554; // @[Core.scala 282:29]
  wire [7:0] _GEN_6400 = 8'h4 == _T_554 ? regfiles_front_alu_io_input_A_MPORT_10_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_6403 = 8'h4 == _T_554 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_6410 = 8'h34 == _T_545 ? opcodes_alu_io_input_A_MPORT_8_data : _GEN_6400; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_6411 = 8'h34 == _T_545 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_6412 = 8'h34 == _T_545 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_6413 = 8'h34 == _T_545 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_6414 = 8'h34 == _T_545 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_6415 = 8'h34 == _T_545 ? _GEN_6389 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_6418 = 8'h34 == _T_545 ? 1'h0 : _T_555; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_6422 = 8'h34 == _T_545 ? 1'h0 : _GEN_6403; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_558 = opcodes_MPORT_145_data; // @[Core.scala 737:27]
  wire  _T_559 = 8'h76 == _T_558; // @[Core.scala 737:27]
  wire [7:0] _T_562 = opcodes_MPORT_147_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_563 = 8'h70 == _T_562; // @[Core.scala 738:27]
  wire [7:0] _GEN_6433 = _T_79 ? regfiles_front_io_bus_data1_MPORT_5_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_6443 = _T_4 ? 8'h0 : _GEN_6433; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_569 = opcodes_MPORT_149_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_570 = 8'h40 == _T_569; // @[Core.scala 739:27]
  wire [2:0] src_reg_2 = opcodes_MPORT_150_data[2:0]; // @[Core.scala 298:27]
  wire  _T_574 = src_reg_2 == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_45 = {regfiles_front_mem_refer_addr_hi_2_data,regfiles_front_mem_refer_addr_lo_5_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_6444 = src_reg_2 == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_6449 = src_reg_2 == 3'h6 ? _mem_refer_addr_T_45 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_6452 = src_reg_2 == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_6470 = _T_4 ? _GEN_6444 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_6473 = _T_4 & _T_574; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_6475 = _T_4 ? _GEN_6449 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_6476 = _T_4 ? {{7'd0}, _T_574} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_6479 = _T_4 & _GEN_6452; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_578 = opcodes_MPORT_154_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_579 = 8'h6 == _T_578; // @[Core.scala 740:27]
  wire [15:0] _GEN_6488 = ~opcodes_MPORT_156_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [15:0] _GEN_6494 = _T_101 ? _GEN_6488 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [15:0] _GEN_6500 = _T_12 ? mem_refer_addr : _GEN_6494; // @[Core.scala 329:34 Core.scala 73:31]
  wire [15:0] _GEN_6515 = _T_4 ? _GEN_6500 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _T_591 = opcodes_MPORT_160_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_592 = 8'h80 == _T_591; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_8 = opcodes_MPORT_161_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _T_610 = opcodes_MPORT_163_data; // @[Core.scala 742:27]
  wire [7:0] _T_612 = opcodes_MPORT_164_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_614 = 8'hc3 == _T_610 | 8'hc2 == _T_612; // @[Core.scala 742:51]
  wire  op_hi_8 = opcodes_op_MPORT_16_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_8 = opcodes_op_MPORT_17_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_11 = {op_hi_8,op_lo_8}; // @[Cat.scala 30:58]
  wire  _cond_T_264 = op_11 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_267 = op_11 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_270 = op_11 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_273 = op_11 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_276 = op_11 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_279 = op_11 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_282 = op_11 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_285 = op_11 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_288 = op_11 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_8 = _cond_T_264 | (_cond_T_267 | (_cond_T_270 | (_cond_T_273 | (_cond_T_276 | (_cond_T_279 | (_cond_T_282
     | (_cond_T_285 | _cond_T_288))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_50 = {opcodes_PC_next_hi_8_data,opcodes_PC_next_lo_5_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_6538 = ~cond_8 ? _PC_next_T_1 : _PC_next_T_50; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_6541 = ~cond_8 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [15:0] _GEN_6545 = _T_198 ? _GEN_6538 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_6548 = _T_198 & _GEN_6541; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_6551 = _T_197 ? _PC_next_T_1 : _GEN_6545; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire  _GEN_6555 = _T_197 ? 1'h0 : _GEN_6548; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_6559 = _T_12 ? _GEN_6551 : PC_next; // @[Core.scala 428:34 Core.scala 58:24]
  wire  _GEN_6563 = _T_12 & _GEN_6555; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_6572 = _T_25 ? _GEN_6559 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_6576 = _T_25 & _GEN_6563; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_6586 = _T_4 ? PC_next : _GEN_6572; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire  _GEN_6589 = _T_4 ? 1'h0 : _GEN_6576; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_625 = opcodes_MPORT_167_data; // @[Core.scala 743:27]
  wire [7:0] _GEN_6613 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_4_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [7:0] _GEN_6631 = _T_198 ? $signed(8'sh0) : $signed(_GEN_6613); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_6642 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_5_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [7:0] _GEN_6649 = _T_77 ? $signed(_GEN_6642) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_6660 = _T_25 ? $signed(_GEN_6631) : $signed(_GEN_6649); // @[Conditional.scala 39:67]
  wire [7:0] _GEN_6678 = _T_4 ? $signed(8'sh0) : $signed(_GEN_6660); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_6687 = 8'hdd == _T_625 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_6688 = 8'hdd == _T_625 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_6689 = 8'hdd == _T_625 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_6690 = 8'hdd == _T_625 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_6691 = 8'hdd == _T_625 ? _GEN_3199 : PC_next; // @[Core.scala 743:52 Core.scala 58:24]
  wire  _GEN_6695 = 8'hdd == _T_625 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_6696 = 8'hdd == _T_625 ? $signed(_GEN_6678) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_6699 = 8'hdd == _T_625 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_6704 = 8'hdd == _T_625 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_6708 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? _GEN_683 : _GEN_6688; // @[Core.scala 742:90]
  wire [7:0] _GEN_6709 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? _GEN_684 : _GEN_6687; // @[Core.scala 742:90]
  wire [15:0] _GEN_6710 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? _GEN_685 : _GEN_6689; // @[Core.scala 742:90]
  wire  _GEN_6713 = (8'hc3 == _T_610 | 8'hc2 == _T_612) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_6716 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? _GEN_6586 : _GEN_6691; // @[Core.scala 742:90]
  wire  _GEN_6719 = (8'hc3 == _T_610 | 8'hc2 == _T_612) & _GEN_6589; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_6723 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_6724 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? dummy_cycle : _GEN_6690; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_6728 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? 1'h0 : _GEN_6695; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_6729 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? $signed(8'sh0) : $signed(_GEN_6696); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_6732 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? 1'h0 : _GEN_6699; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_6737 = 8'hc3 == _T_610 | 8'hc2 == _T_612 ? 1'h0 : _GEN_6704; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_6742 = 8'h80 == _T_591 ? regfiles_front_alu_io_input_A_MPORT_11_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_6744 = 8'h80 == _T_591 ? regfiles_front_alu_io_input_B_MPORT_5_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_6745 = 8'h80 == _T_591 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_6746 = 8'h80 == _T_591 ? _alu_io_calc_type_T_8 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_6749 = 8'h80 == _T_591 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_6752 = 8'h80 == _T_591 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_6755 = 8'h80 == _T_591 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_6758 = 8'h80 == _T_591 ? 1'h0 : _T_614; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_6759 = 8'h80 == _T_591 ? machine_state_next : _GEN_6708; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_6760 = 8'h80 == _T_591 ? opcode_index : _GEN_6709; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_6761 = 8'h80 == _T_591 ? mem_refer_addr : _GEN_6710; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_6764 = 8'h80 == _T_591 ? 1'h0 : _GEN_6713; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_6767 = 8'h80 == _T_591 ? PC_next : _GEN_6716; // @[Core.scala 741:52 Core.scala 58:24]
  wire  _GEN_6770 = 8'h80 == _T_591 ? 1'h0 : _GEN_6719; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_6774 = 8'h80 == _T_591 ? 1'h0 : _GEN_6723; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_6775 = 8'h80 == _T_591 ? dummy_cycle : _GEN_6724; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_6779 = 8'h80 == _T_591 ? 1'h0 : _GEN_6728; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_6780 = 8'h80 == _T_591 ? $signed(8'sh0) : $signed(_GEN_6729); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_6783 = 8'h80 == _T_591 ? 1'h0 : _GEN_6732; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_6788 = 8'h80 == _T_591 ? 1'h0 : _GEN_6737; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_6792 = 8'h6 == _T_578 ? _GEN_615 : _GEN_6760; // @[Core.scala 740:52]
  wire [2:0] _GEN_6793 = 8'h6 == _T_578 ? _GEN_616 : _GEN_6759; // @[Core.scala 740:52]
  wire  _GEN_6796 = 8'h6 == _T_578 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_6797 = 8'h6 == _T_578 ? _GEN_6515 : _GEN_6761; // @[Core.scala 740:52]
  wire  _GEN_6800 = 8'h6 == _T_578 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_6804 = 8'h6 == _T_578 ? _GEN_3048 : _GEN_6767; // @[Core.scala 740:52]
  wire  _GEN_6807 = 8'h6 == _T_578 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_6810 = 8'h6 == _T_578 ? 1'h0 : _T_592; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_6812 = 8'h6 == _T_578 ? 8'h0 : _GEN_6742; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_6814 = 8'h6 == _T_578 ? 8'h0 : _GEN_6744; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_6815 = 8'h6 == _T_578 ? 1'h0 : _GEN_6745; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_6816 = 8'h6 == _T_578 ? 8'h0 : _GEN_6746; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_6819 = 8'h6 == _T_578 ? 1'h0 : _GEN_6749; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_6822 = 8'h6 == _T_578 ? F : _GEN_6752; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_6825 = 8'h6 == _T_578 ? 1'h0 : _GEN_6755; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_6828 = 8'h6 == _T_578 ? 1'h0 : _GEN_6758; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_6831 = 8'h6 == _T_578 ? 1'h0 : _GEN_6764; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_6836 = 8'h6 == _T_578 ? 1'h0 : _GEN_6770; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_6840 = 8'h6 == _T_578 ? 1'h0 : _GEN_6774; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_6841 = 8'h6 == _T_578 ? dummy_cycle : _GEN_6775; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_6845 = 8'h6 == _T_578 ? 1'h0 : _GEN_6779; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_6846 = 8'h6 == _T_578 ? $signed(8'sh0) : $signed(_GEN_6780); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_6849 = 8'h6 == _T_578 ? 1'h0 : _GEN_6783; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_6854 = 8'h6 == _T_578 ? 1'h0 : _GEN_6788; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_6858 = 8'h40 == _T_569 ? _GEN_6470 : _GEN_6793; // @[Core.scala 739:52]
  wire  _GEN_6861 = 8'h40 == _T_569 & _GEN_6473; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_6863 = 8'h40 == _T_569 ? _GEN_6475 : _GEN_6797; // @[Core.scala 739:52]
  wire [7:0] _GEN_6864 = 8'h40 == _T_569 ? _GEN_6476 : _GEN_6792; // @[Core.scala 739:52]
  wire  _GEN_6867 = 8'h40 == _T_569 & _GEN_6479; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_6873 = 8'h40 == _T_569 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_6878 = 8'h40 == _T_569 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_6881 = 8'h40 == _T_569 ? 1'h0 : _T_579; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6884 = 8'h40 == _T_569 ? 1'h0 : _GEN_6796; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6887 = 8'h40 == _T_569 ? 1'h0 : _GEN_6800; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_6891 = 8'h40 == _T_569 ? PC_next : _GEN_6804; // @[Core.scala 739:52 Core.scala 58:24]
  wire  _GEN_6894 = 8'h40 == _T_569 ? 1'h0 : _GEN_6807; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6897 = 8'h40 == _T_569 ? 1'h0 : _GEN_6810; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_6899 = 8'h40 == _T_569 ? 8'h0 : _GEN_6812; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_6901 = 8'h40 == _T_569 ? 8'h0 : _GEN_6814; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_6902 = 8'h40 == _T_569 ? 1'h0 : _GEN_6815; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_6903 = 8'h40 == _T_569 ? 8'h0 : _GEN_6816; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_6906 = 8'h40 == _T_569 ? 1'h0 : _GEN_6819; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_6909 = 8'h40 == _T_569 ? F : _GEN_6822; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_6912 = 8'h40 == _T_569 ? 1'h0 : _GEN_6825; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6915 = 8'h40 == _T_569 ? 1'h0 : _GEN_6828; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6918 = 8'h40 == _T_569 ? 1'h0 : _GEN_6831; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6923 = 8'h40 == _T_569 ? 1'h0 : _GEN_6836; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_6927 = 8'h40 == _T_569 ? 1'h0 : _GEN_6840; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_6928 = 8'h40 == _T_569 ? dummy_cycle : _GEN_6841; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_6932 = 8'h40 == _T_569 ? 1'h0 : _GEN_6845; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_6933 = 8'h40 == _T_569 ? $signed(8'sh0) : $signed(_GEN_6846); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_6936 = 8'h40 == _T_569 ? 1'h0 : _GEN_6849; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_6941 = 8'h40 == _T_569 ? 1'h0 : _GEN_6854; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_6942 = 8'h70 == _T_562 ? _GEN_541 : _GEN_6858; // @[Core.scala 738:52]
  wire [7:0] _GEN_6943 = 8'h70 == _T_562 ? _GEN_542 : _GEN_6864; // @[Core.scala 738:52]
  wire [15:0] _GEN_6944 = 8'h70 == _T_562 ? _GEN_543 : _GEN_6863; // @[Core.scala 738:52]
  wire  _GEN_6947 = 8'h70 == _T_562 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_6949 = 8'h70 == _T_562 ? _GEN_6443 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_6952 = 8'h70 == _T_562 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_6955 = 8'h70 == _T_562 ? 1'h0 : _T_570; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_6958 = 8'h70 == _T_562 ? 1'h0 : _GEN_6861; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_6962 = 8'h70 == _T_562 ? 1'h0 : _GEN_6867; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_6968 = 8'h70 == _T_562 ? 1'h0 : _GEN_6873; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_6973 = 8'h70 == _T_562 ? 1'h0 : _GEN_6878; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_6976 = 8'h70 == _T_562 ? 1'h0 : _GEN_6881; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_6979 = 8'h70 == _T_562 ? 1'h0 : _GEN_6884; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_6982 = 8'h70 == _T_562 ? 1'h0 : _GEN_6887; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_6986 = 8'h70 == _T_562 ? PC_next : _GEN_6891; // @[Core.scala 738:52 Core.scala 58:24]
  wire  _GEN_6989 = 8'h70 == _T_562 ? 1'h0 : _GEN_6894; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_6992 = 8'h70 == _T_562 ? 1'h0 : _GEN_6897; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_6994 = 8'h70 == _T_562 ? 8'h0 : _GEN_6899; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_6996 = 8'h70 == _T_562 ? 8'h0 : _GEN_6901; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_6997 = 8'h70 == _T_562 ? 1'h0 : _GEN_6902; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_6998 = 8'h70 == _T_562 ? 8'h0 : _GEN_6903; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_7001 = 8'h70 == _T_562 ? 1'h0 : _GEN_6906; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_7004 = 8'h70 == _T_562 ? F : _GEN_6909; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_7007 = 8'h70 == _T_562 ? 1'h0 : _GEN_6912; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_7010 = 8'h70 == _T_562 ? 1'h0 : _GEN_6915; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_7013 = 8'h70 == _T_562 ? 1'h0 : _GEN_6918; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_7018 = 8'h70 == _T_562 ? 1'h0 : _GEN_6923; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_7022 = 8'h70 == _T_562 ? 1'h0 : _GEN_6927; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_7023 = 8'h70 == _T_562 ? dummy_cycle : _GEN_6928; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_7027 = 8'h70 == _T_562 ? 1'h0 : _GEN_6932; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_7028 = 8'h70 == _T_562 ? $signed(8'sh0) : $signed(_GEN_6933); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_7031 = 8'h70 == _T_562 ? 1'h0 : _GEN_6936; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_7036 = 8'h70 == _T_562 ? 1'h0 : _GEN_6941; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_7037 = 8'h76 == _T_558 ? 3'h1 : _GEN_6942; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_7038 = 8'h76 == _T_558 ? 8'h0 : _GEN_6943; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_7039 = 8'h76 == _T_558 ? PC : _GEN_6944; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_7040 = 8'h76 == _T_558 ? PC_next : _GEN_6986; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_7043 = 8'h76 == _T_558 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_7046 = 8'h76 == _T_558 ? 1'h0 : _GEN_6947; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_7048 = 8'h76 == _T_558 ? 8'h0 : _GEN_6949; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_7051 = 8'h76 == _T_558 ? 1'h0 : _GEN_6952; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7054 = 8'h76 == _T_558 ? 1'h0 : _GEN_6955; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7057 = 8'h76 == _T_558 ? 1'h0 : _GEN_6958; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_7061 = 8'h76 == _T_558 ? 1'h0 : _GEN_6962; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_7067 = 8'h76 == _T_558 ? 1'h0 : _GEN_6968; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_7072 = 8'h76 == _T_558 ? 1'h0 : _GEN_6973; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7075 = 8'h76 == _T_558 ? 1'h0 : _GEN_6976; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7078 = 8'h76 == _T_558 ? 1'h0 : _GEN_6979; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7081 = 8'h76 == _T_558 ? 1'h0 : _GEN_6982; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7087 = 8'h76 == _T_558 ? 1'h0 : _GEN_6989; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7090 = 8'h76 == _T_558 ? 1'h0 : _GEN_6992; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_7092 = 8'h76 == _T_558 ? 8'h0 : _GEN_6994; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_7094 = 8'h76 == _T_558 ? 8'h0 : _GEN_6996; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_7095 = 8'h76 == _T_558 ? 1'h0 : _GEN_6997; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_7096 = 8'h76 == _T_558 ? 8'h0 : _GEN_6998; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_7099 = 8'h76 == _T_558 ? 1'h0 : _GEN_7001; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_7102 = 8'h76 == _T_558 ? F : _GEN_7004; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_7105 = 8'h76 == _T_558 ? 1'h0 : _GEN_7007; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7108 = 8'h76 == _T_558 ? 1'h0 : _GEN_7010; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7111 = 8'h76 == _T_558 ? 1'h0 : _GEN_7013; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7116 = 8'h76 == _T_558 ? 1'h0 : _GEN_7018; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_7120 = 8'h76 == _T_558 ? 1'h0 : _GEN_7022; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_7121 = 8'h76 == _T_558 ? dummy_cycle : _GEN_7023; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_7125 = 8'h76 == _T_558 ? 1'h0 : _GEN_7027; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_7126 = 8'h76 == _T_558 ? $signed(8'sh0) : $signed(_GEN_7028); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_7129 = 8'h76 == _T_558 ? 1'h0 : _GEN_7031; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_7134 = 8'h76 == _T_558 ? 1'h0 : _GEN_7036; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_7138 = 8'h4 == _T_541 ? 8'h1 : _GEN_7094; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_7139 = 8'h4 == _T_541 ? 1'h0 : _GEN_7095; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_7140 = 8'h4 == _T_541 ? _alu_io_calc_type_T_7 : _GEN_7096; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_7143 = 8'h4 == _T_541 & _T_546; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_7144 = 8'h4 == _T_541 ? _GEN_6410 : _GEN_7092; // @[Core.scala 736:52]
  wire [2:0] _GEN_7145 = 8'h4 == _T_541 ? _GEN_6411 : _GEN_7037; // @[Core.scala 736:52]
  wire [15:0] _GEN_7146 = 8'h4 == _T_541 ? _GEN_6412 : _GEN_7039; // @[Core.scala 736:52]
  wire [7:0] _GEN_7147 = 8'h4 == _T_541 ? _GEN_6413 : _GEN_7038; // @[Core.scala 736:52]
  wire [2:0] _GEN_7148 = 8'h4 == _T_541 ? _GEN_6414 : _GEN_7121; // @[Core.scala 736:52]
  wire [7:0] _GEN_7149 = 8'h4 == _T_541 ? _GEN_6415 : _GEN_7048; // @[Core.scala 736:52]
  wire  _GEN_7152 = 8'h4 == _T_541 & _GEN_6418; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7156 = 8'h4 == _T_541 & _GEN_6422; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7162 = 8'h4 == _T_541 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_7163 = 8'h4 == _T_541 ? PC_next : _GEN_7040; // @[Core.scala 736:52 Core.scala 58:24]
  wire  _GEN_7166 = 8'h4 == _T_541 ? 1'h0 : _GEN_7043; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7169 = 8'h4 == _T_541 ? 1'h0 : _GEN_7046; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7173 = 8'h4 == _T_541 ? 1'h0 : _GEN_7051; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7176 = 8'h4 == _T_541 ? 1'h0 : _GEN_7054; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7179 = 8'h4 == _T_541 ? 1'h0 : _GEN_7057; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_7183 = 8'h4 == _T_541 ? 1'h0 : _GEN_7061; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_7189 = 8'h4 == _T_541 ? 1'h0 : _GEN_7067; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_7194 = 8'h4 == _T_541 ? 1'h0 : _GEN_7072; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7197 = 8'h4 == _T_541 ? 1'h0 : _GEN_7075; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7200 = 8'h4 == _T_541 ? 1'h0 : _GEN_7078; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7203 = 8'h4 == _T_541 ? 1'h0 : _GEN_7081; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7209 = 8'h4 == _T_541 ? 1'h0 : _GEN_7087; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7212 = 8'h4 == _T_541 ? 1'h0 : _GEN_7090; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7217 = 8'h4 == _T_541 ? 1'h0 : _GEN_7099; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_7220 = 8'h4 == _T_541 ? F : _GEN_7102; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_7223 = 8'h4 == _T_541 ? 1'h0 : _GEN_7105; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7226 = 8'h4 == _T_541 ? 1'h0 : _GEN_7108; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7229 = 8'h4 == _T_541 ? 1'h0 : _GEN_7111; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7234 = 8'h4 == _T_541 ? 1'h0 : _GEN_7116; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7238 = 8'h4 == _T_541 ? 1'h0 : _GEN_7120; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_7242 = 8'h4 == _T_541 ? 1'h0 : _GEN_7125; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_7243 = 8'h4 == _T_541 ? $signed(8'sh0) : $signed(_GEN_7126); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_7246 = 8'h4 == _T_541 ? 1'h0 : _GEN_7129; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_7251 = 8'h4 == _T_541 ? 1'h0 : _GEN_7134; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_7261 = 8'h3 == _T_520 ? input_2 : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_7262 = 8'h3 == _T_520 ? $signed({{6{_alu16_io_offset_T_12[1]}},_alu16_io_offset_T_12}) : $signed(
    _GEN_7243); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_7263 = 8'h3 == _T_520 ? _GEN_443 : _GEN_7145; // @[Core.scala 735:52]
  wire [2:0] _GEN_7264 = 8'h3 == _T_520 ? _GEN_445 : _GEN_7148; // @[Core.scala 735:52]
  wire  _GEN_7267 = 8'h3 == _T_520 & _GEN_6343; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_7274 = 8'h3 == _T_520 & _GEN_6350; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_7281 = 8'h3 == _T_520 & _GEN_6357; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_7286 = 8'h3 == _T_520 ? _GEN_6362 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_7287 = 8'h3 == _T_520 ? _GEN_468 : _GEN_7147; // @[Core.scala 735:52]
  wire  _GEN_7290 = 8'h3 == _T_520 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_7293 = 8'h3 == _T_520 ? 1'h0 : _T_542; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_7294 = 8'h3 == _T_520 ? 8'h0 : _GEN_7138; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_7295 = 8'h3 == _T_520 ? 1'h0 : _GEN_7139; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_7296 = 8'h3 == _T_520 ? 8'h0 : _GEN_7140; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_7299 = 8'h3 == _T_520 ? 1'h0 : _GEN_7143; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_7300 = 8'h3 == _T_520 ? 8'h0 : _GEN_7144; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_7301 = 8'h3 == _T_520 ? mem_refer_addr : _GEN_7146; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_7302 = 8'h3 == _T_520 ? 8'h0 : _GEN_7149; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_7305 = 8'h3 == _T_520 ? 1'h0 : _GEN_7152; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7309 = 8'h3 == _T_520 ? 1'h0 : _GEN_7156; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7315 = 8'h3 == _T_520 ? 1'h0 : _GEN_7162; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_7316 = 8'h3 == _T_520 ? PC_next : _GEN_7163; // @[Core.scala 735:52 Core.scala 58:24]
  wire  _GEN_7319 = 8'h3 == _T_520 ? 1'h0 : _GEN_7166; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7322 = 8'h3 == _T_520 ? 1'h0 : _GEN_7169; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7326 = 8'h3 == _T_520 ? 1'h0 : _GEN_7173; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7329 = 8'h3 == _T_520 ? 1'h0 : _GEN_7176; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7332 = 8'h3 == _T_520 ? 1'h0 : _GEN_7179; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_7336 = 8'h3 == _T_520 ? 1'h0 : _GEN_7183; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_7342 = 8'h3 == _T_520 ? 1'h0 : _GEN_7189; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_7347 = 8'h3 == _T_520 ? 1'h0 : _GEN_7194; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7350 = 8'h3 == _T_520 ? 1'h0 : _GEN_7197; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7353 = 8'h3 == _T_520 ? 1'h0 : _GEN_7200; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7356 = 8'h3 == _T_520 ? 1'h0 : _GEN_7203; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7362 = 8'h3 == _T_520 ? 1'h0 : _GEN_7209; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7365 = 8'h3 == _T_520 ? 1'h0 : _GEN_7212; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7370 = 8'h3 == _T_520 ? 1'h0 : _GEN_7217; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_7373 = 8'h3 == _T_520 ? F : _GEN_7220; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_7376 = 8'h3 == _T_520 ? 1'h0 : _GEN_7223; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7379 = 8'h3 == _T_520 ? 1'h0 : _GEN_7226; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7382 = 8'h3 == _T_520 ? 1'h0 : _GEN_7229; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7387 = 8'h3 == _T_520 ? 1'h0 : _GEN_7234; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7391 = 8'h3 == _T_520 ? 1'h0 : _GEN_7238; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7394 = 8'h3 == _T_520 ? 1'h0 : _GEN_7242; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_7397 = 8'h3 == _T_520 ? 1'h0 : _GEN_7246; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_7402 = 8'h3 == _T_520 ? 1'h0 : _GEN_7251; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_7406 = 8'hc0 == _T_508 ? _GEN_6228 : _GEN_7263; // @[Core.scala 734:52]
  wire [2:0] _GEN_7407 = 8'hc0 == _T_508 ? _GEN_334 : _GEN_7264; // @[Core.scala 734:52]
  wire [15:0] _GEN_7408 = 8'hc0 == _T_508 ? _GEN_335 : _GEN_7301; // @[Core.scala 734:52]
  wire [7:0] _GEN_7409 = 8'hc0 == _T_508 ? _GEN_6231 : _GEN_7287; // @[Core.scala 734:52]
  wire [15:0] _GEN_7410 = 8'hc0 == _T_508 ? _GEN_337 : _GEN_7286; // @[Core.scala 734:52]
  wire  _GEN_7413 = 8'hc0 == _T_508 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_7414 = 8'hc0 == _T_508 ? _GEN_6236 : _GEN_7316; // @[Core.scala 734:52]
  wire  _GEN_7417 = 8'hc0 == _T_508 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_7420 = 8'hc0 == _T_508 ? 1'h0 : _T_521; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_7427 = 8'hc0 == _T_508 ? 16'h0 : _GEN_7261; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_7428 = 8'hc0 == _T_508 ? $signed(8'sh0) : $signed(_GEN_7262); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_7431 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7267; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7438 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7274; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7445 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7281; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7452 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7290; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7455 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7293; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_7456 = 8'hc0 == _T_508 ? 8'h0 : _GEN_7294; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_7457 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7295; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_7458 = 8'hc0 == _T_508 ? 8'h0 : _GEN_7296; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_7461 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7299; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_7462 = 8'hc0 == _T_508 ? 8'h0 : _GEN_7300; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_7463 = 8'hc0 == _T_508 ? 8'h0 : _GEN_7302; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_7466 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7305; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7470 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7309; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7476 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7315; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7479 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7319; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7482 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7322; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7486 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7326; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7489 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7329; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7492 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7332; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7496 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7336; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7502 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7342; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7507 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7347; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7510 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7350; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7513 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7353; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7516 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7356; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7522 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7362; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7525 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7365; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7530 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7370; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_7533 = 8'hc0 == _T_508 ? F : _GEN_7373; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_7536 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7376; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7539 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7379; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7542 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7382; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7547 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7387; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7551 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7391; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7554 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7394; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_7557 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7397; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_7562 = 8'hc0 == _T_508 ? 1'h0 : _GEN_7402; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_7566 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_6178 : _GEN_7414; // @[Core.scala 733:90]
  wire [2:0] _GEN_7567 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_6179 : _GEN_7406; // @[Core.scala 733:90]
  wire [15:0] _GEN_7568 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_285 : _GEN_7408; // @[Core.scala 733:90]
  wire [7:0] _GEN_7569 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_6181 : _GEN_7409; // @[Core.scala 733:90]
  wire [2:0] _GEN_7570 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_287 : _GEN_7407; // @[Core.scala 733:90]
  wire [15:0] _GEN_7571 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_288 : _GEN_7427; // @[Core.scala 733:90]
  wire [7:0] _GEN_7572 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? $signed({8{_GEN_289}}) : $signed(_GEN_7428); // @[Core.scala 733:90]
  wire [7:0] _GEN_7573 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_290 : _GEN_7463; // @[Core.scala 733:90]
  wire [15:0] _GEN_7574 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? _GEN_291 : _GEN_7410; // @[Core.scala 733:90]
  wire  _GEN_7577 = (8'hcd == _T_485 | 8'hc4 == _T_487) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7581 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_7584 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _T_509; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7587 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7413; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7590 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7417; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7593 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7420; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7602 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7431; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7609 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7438; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7616 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7445; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7623 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7452; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7626 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7455; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_7627 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 8'h0 : _GEN_7456; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_7628 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7457; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_7629 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 8'h0 : _GEN_7458; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_7632 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7461; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_7633 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 8'h0 : _GEN_7462; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_7636 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7466; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7640 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7470; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7646 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7476; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7649 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7479; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7652 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7482; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7656 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7486; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7659 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7489; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7662 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7492; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7666 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7496; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7672 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7502; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7677 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7507; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7680 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7510; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7683 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7513; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7686 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7516; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7692 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7522; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7695 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7525; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7700 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7530; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_7703 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? F : _GEN_7533; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_7706 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7536; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7709 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7539; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7712 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7542; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7717 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7547; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7721 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7551; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7724 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7554; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7727 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7557; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_7732 = 8'hcd == _T_485 | 8'hc4 == _T_487 ? 1'h0 : _GEN_7562; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_7736 = 8'hf3 == _T_481 ? opcodes_IFF_MPORT_2_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_7739 = 8'hf3 == _T_481 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_7742 = 8'hf3 == _T_481 ? 1'h0 : _T_489; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_7743 = 8'hf3 == _T_481 ? PC_next : _GEN_7566; // @[Core.scala 732:52 Core.scala 58:24]
  wire [2:0] _GEN_7744 = 8'hf3 == _T_481 ? machine_state_next : _GEN_7567; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_7745 = 8'hf3 == _T_481 ? mem_refer_addr : _GEN_7568; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_7746 = 8'hf3 == _T_481 ? opcode_index : _GEN_7569; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_7747 = 8'hf3 == _T_481 ? dummy_cycle : _GEN_7570; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_7748 = 8'hf3 == _T_481 ? 16'h0 : _GEN_7571; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_7749 = 8'hf3 == _T_481 ? $signed(8'sh0) : $signed(_GEN_7572); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_7750 = 8'hf3 == _T_481 ? 8'h0 : _GEN_7573; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_7751 = 8'hf3 == _T_481 ? SP : _GEN_7574; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_7754 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7577; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7758 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7581; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7761 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7584; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7764 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7587; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7767 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7590; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7770 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7593; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7779 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7602; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7786 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7609; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7793 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7616; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7800 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7623; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7803 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7626; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_7804 = 8'hf3 == _T_481 ? 8'h0 : _GEN_7627; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_7805 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7628; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_7806 = 8'hf3 == _T_481 ? 8'h0 : _GEN_7629; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_7809 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7632; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_7810 = 8'hf3 == _T_481 ? 8'h0 : _GEN_7633; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_7813 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7636; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7817 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7640; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7823 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7646; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7826 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7649; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7829 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7652; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7833 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7656; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7836 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7659; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7839 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7662; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7843 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7666; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7849 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7672; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7854 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7677; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7857 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7680; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7860 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7683; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7863 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7686; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7869 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7692; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7872 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7695; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7877 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7700; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_7880 = 8'hf3 == _T_481 ? F : _GEN_7703; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_7883 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7706; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7886 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7709; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7889 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7712; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7894 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7717; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7898 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7721; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7901 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7724; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_7904 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7727; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_7909 = 8'hf3 == _T_481 ? 1'h0 : _GEN_7732; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_7910 = 8'hd3 == _T_444 ? _GEN_163 : _GEN_7744; // @[Core.scala 731:52]
  wire [15:0] _GEN_7911 = 8'hd3 == _T_444 ? _GEN_6059 : _GEN_7745; // @[Core.scala 731:52]
  wire [7:0] _GEN_7912 = 8'hd3 == _T_444 ? _GEN_165 : _GEN_7746; // @[Core.scala 731:52]
  wire  _GEN_7915 = 8'hd3 == _T_444 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_7916 = 8'hd3 == _T_444 ? _GEN_2590 : _GEN_7743; // @[Core.scala 731:52]
  wire  _GEN_7920 = 8'hd3 == _T_444 & _GEN_6068; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_7921 = 8'hd3 == _T_444 ? _GEN_6069 : _GEN_7750; // @[Core.scala 731:52]
  wire  _GEN_7924 = 8'hd3 == _T_444 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7928 = 8'hd3 == _T_444 & _GEN_6076; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7929 = 8'hd3 == _T_444 & _GEN_6077; // @[Core.scala 731:52 Core.scala 848:22]
  wire  _GEN_7930 = 8'hd3 == _T_444 ? _GEN_6078 : 1'h1; // @[Core.scala 731:52 Core.scala 758:14]
  wire  _GEN_7933 = 8'hd3 == _T_444 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7936 = 8'hd3 == _T_444 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7939 = 8'hd3 == _T_444 & _GEN_6087; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7942 = 8'hd3 == _T_444 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_7945 = 8'hd3 == _T_444 ? 1'h0 : _T_482; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7946 = 8'hd3 == _T_444 ? IFF : _GEN_7736; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_7949 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7739; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7952 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7742; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_7953 = 8'hd3 == _T_444 ? dummy_cycle : _GEN_7747; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_7954 = 8'hd3 == _T_444 ? 16'h0 : _GEN_7748; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_7955 = 8'hd3 == _T_444 ? $signed(8'sh0) : $signed(_GEN_7749); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_7956 = 8'hd3 == _T_444 ? SP : _GEN_7751; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_7959 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7754; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7963 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7758; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7966 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7761; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7969 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7764; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7972 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7767; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7975 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7770; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_7984 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7779; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_7991 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7786; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_7998 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7793; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_8005 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7800; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8008 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7803; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_8009 = 8'hd3 == _T_444 ? 8'h0 : _GEN_7804; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_8010 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7805; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_8011 = 8'hd3 == _T_444 ? 8'h0 : _GEN_7806; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_8014 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7809; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_8015 = 8'hd3 == _T_444 ? 8'h0 : _GEN_7810; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_8018 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7813; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8022 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7817; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8028 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7823; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8031 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7826; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8034 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7829; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8038 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7833; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8041 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7836; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8044 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7839; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_8048 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7843; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_8054 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7849; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_8059 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7854; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8062 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7857; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8065 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7860; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8068 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7863; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8074 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7869; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8077 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7872; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8082 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7877; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_8085 = 8'hd3 == _T_444 ? F : _GEN_7880; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_8088 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7883; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8091 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7886; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8094 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7889; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8099 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7894; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8103 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7898; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8106 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7901; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_8109 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7904; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_8114 = 8'hd3 == _T_444 ? 1'h0 : _GEN_7909; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_8115 = 8'h0 == _T_440 ? 3'h1 : _GEN_7910; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_8116 = 8'h0 == _T_440 ? 8'h0 : _GEN_7912; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_8119 = 8'h0 == _T_440 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_8120 = 8'h0 == _T_440 ? mem_refer_addr : _GEN_7911; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_8123 = 8'h0 == _T_440 ? 1'h0 : _GEN_7915; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_8124 = 8'h0 == _T_440 ? PC_next : _GEN_7916; // @[Core.scala 730:47 Core.scala 58:24]
  wire  _GEN_8128 = 8'h0 == _T_440 ? 1'h0 : _GEN_7920; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_8129 = 8'h0 == _T_440 ? 8'h0 : _GEN_7921; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_8132 = 8'h0 == _T_440 ? 1'h0 : _GEN_7924; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8136 = 8'h0 == _T_440 ? 1'h0 : _GEN_7928; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8137 = 8'h0 == _T_440 ? 1'h0 : _GEN_7929; // @[Core.scala 730:47 Core.scala 848:22]
  wire  _GEN_8138 = 8'h0 == _T_440 | _GEN_7930; // @[Core.scala 730:47 Core.scala 758:14]
  wire  _GEN_8141 = 8'h0 == _T_440 ? 1'h0 : _GEN_7933; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8144 = 8'h0 == _T_440 ? 1'h0 : _GEN_7936; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8147 = 8'h0 == _T_440 ? 1'h0 : _GEN_7939; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8150 = 8'h0 == _T_440 ? 1'h0 : _GEN_7942; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8153 = 8'h0 == _T_440 ? 1'h0 : _GEN_7945; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8154 = 8'h0 == _T_440 ? IFF : _GEN_7946; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_8157 = 8'h0 == _T_440 ? 1'h0 : _GEN_7949; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8160 = 8'h0 == _T_440 ? 1'h0 : _GEN_7952; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_8161 = 8'h0 == _T_440 ? dummy_cycle : _GEN_7953; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_8162 = 8'h0 == _T_440 ? 16'h0 : _GEN_7954; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_8163 = 8'h0 == _T_440 ? $signed(8'sh0) : $signed(_GEN_7955); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_8164 = 8'h0 == _T_440 ? SP : _GEN_7956; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_8167 = 8'h0 == _T_440 ? 1'h0 : _GEN_7959; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8171 = 8'h0 == _T_440 ? 1'h0 : _GEN_7963; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8174 = 8'h0 == _T_440 ? 1'h0 : _GEN_7966; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8177 = 8'h0 == _T_440 ? 1'h0 : _GEN_7969; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8180 = 8'h0 == _T_440 ? 1'h0 : _GEN_7972; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8183 = 8'h0 == _T_440 ? 1'h0 : _GEN_7975; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8192 = 8'h0 == _T_440 ? 1'h0 : _GEN_7984; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8199 = 8'h0 == _T_440 ? 1'h0 : _GEN_7991; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8206 = 8'h0 == _T_440 ? 1'h0 : _GEN_7998; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8213 = 8'h0 == _T_440 ? 1'h0 : _GEN_8005; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8216 = 8'h0 == _T_440 ? 1'h0 : _GEN_8008; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_8217 = 8'h0 == _T_440 ? 8'h0 : _GEN_8009; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_8218 = 8'h0 == _T_440 ? 1'h0 : _GEN_8010; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_8219 = 8'h0 == _T_440 ? 8'h0 : _GEN_8011; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_8222 = 8'h0 == _T_440 ? 1'h0 : _GEN_8014; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_8223 = 8'h0 == _T_440 ? 8'h0 : _GEN_8015; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_8226 = 8'h0 == _T_440 ? 1'h0 : _GEN_8018; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8230 = 8'h0 == _T_440 ? 1'h0 : _GEN_8022; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8236 = 8'h0 == _T_440 ? 1'h0 : _GEN_8028; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8239 = 8'h0 == _T_440 ? 1'h0 : _GEN_8031; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8242 = 8'h0 == _T_440 ? 1'h0 : _GEN_8034; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8246 = 8'h0 == _T_440 ? 1'h0 : _GEN_8038; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8249 = 8'h0 == _T_440 ? 1'h0 : _GEN_8041; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8252 = 8'h0 == _T_440 ? 1'h0 : _GEN_8044; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8256 = 8'h0 == _T_440 ? 1'h0 : _GEN_8048; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8262 = 8'h0 == _T_440 ? 1'h0 : _GEN_8054; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8267 = 8'h0 == _T_440 ? 1'h0 : _GEN_8059; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8270 = 8'h0 == _T_440 ? 1'h0 : _GEN_8062; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8273 = 8'h0 == _T_440 ? 1'h0 : _GEN_8065; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8276 = 8'h0 == _T_440 ? 1'h0 : _GEN_8068; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8282 = 8'h0 == _T_440 ? 1'h0 : _GEN_8074; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8285 = 8'h0 == _T_440 ? 1'h0 : _GEN_8077; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8290 = 8'h0 == _T_440 ? 1'h0 : _GEN_8082; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_8293 = 8'h0 == _T_440 ? F : _GEN_8085; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_8296 = 8'h0 == _T_440 ? 1'h0 : _GEN_8088; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8299 = 8'h0 == _T_440 ? 1'h0 : _GEN_8091; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8302 = 8'h0 == _T_440 ? 1'h0 : _GEN_8094; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8307 = 8'h0 == _T_440 ? 1'h0 : _GEN_8099; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8311 = 8'h0 == _T_440 ? 1'h0 : _GEN_8103; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8314 = 8'h0 == _T_440 ? 1'h0 : _GEN_8106; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_8317 = 8'h0 == _T_440 ? 1'h0 : _GEN_8109; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_8322 = 8'h0 == _T_440 ? 1'h0 : _GEN_8114; // @[Core.scala 730:47 Core.scala 724:20]
  reg  REG_14; // @[Core.scala 772:43]
  wire  _T_645 = ~clock & REG_14; // @[Core.scala 772:33]
  wire  _GEN_8324 = _T_101 ? _T_645 : 1'h1; // @[Core.scala 851:41 Core.scala 759:16]
  wire [7:0] _GEN_8326 = _T_101 ? 8'h1 : _GEN_5897; // @[Core.scala 851:41 Core.scala 860:22]
  wire [2:0] _GEN_8327 = _T_101 ? machine_state_next : machine_state; // @[Core.scala 851:41 Core.scala 861:25 Core.scala 67:30]
  wire  _GEN_8328 = _T_12 ? _GEN_8137 : _GEN_8324; // @[Core.scala 847:41]
  wire  _GEN_8329 = _T_12 ? 1'h0 : _GEN_8324; // @[Core.scala 847:41 Core.scala 849:24]
  wire [2:0] _GEN_8334 = _T_12 ? _GEN_8115 : machine_state_next; // @[Core.scala 847:41 Core.scala 68:35]
  wire [7:0] _GEN_8335 = _T_12 ? _GEN_8116 : opcode_index; // @[Core.scala 847:41 Core.scala 725:29]
  wire  _GEN_8338 = _T_12 & _GEN_8119; // @[Core.scala 847:41 Core.scala 724:20]
  wire [15:0] _GEN_8339 = _T_12 ? _GEN_8120 : mem_refer_addr; // @[Core.scala 847:41 Core.scala 73:31]
  wire  _GEN_8342 = _T_12 & _GEN_8123; // @[Core.scala 847:41 Core.scala 724:20]
  wire [15:0] _GEN_8343 = _T_12 ? _GEN_8124 : PC_next; // @[Core.scala 847:41 Core.scala 58:24]
  wire  _GEN_8347 = _T_12 & _GEN_8128; // @[Core.scala 847:41 Core.scala 724:20]
  wire [7:0] _GEN_8348 = _T_12 ? _GEN_8129 : 8'h0; // @[Core.scala 847:41 Core.scala 77:16]
  wire  _GEN_8351 = _T_12 & _GEN_8132; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8355 = _T_12 & _GEN_8136; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8356 = _T_12 ? _GEN_8138 : 1'h1; // @[Core.scala 847:41 Core.scala 758:14]
  wire  _GEN_8359 = _T_12 & _GEN_8141; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8362 = _T_12 & _GEN_8144; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8365 = _T_12 & _GEN_8147; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8368 = _T_12 & _GEN_8150; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8371 = _T_12 & _GEN_8153; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8372 = _T_12 ? _GEN_8154 : IFF; // @[Core.scala 847:41 Core.scala 71:20]
  wire  _GEN_8375 = _T_12 & _GEN_8157; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8378 = _T_12 & _GEN_8160; // @[Core.scala 847:41 Core.scala 724:20]
  wire [2:0] _GEN_8379 = _T_12 ? _GEN_8161 : dummy_cycle; // @[Core.scala 847:41 Core.scala 775:28]
  wire [15:0] _GEN_8380 = _T_12 ? _GEN_8162 : 16'h0; // @[Core.scala 847:41 Core.scala 55:27]
  wire [7:0] _GEN_8381 = _T_12 ? $signed(_GEN_8163) : $signed(8'sh0); // @[Core.scala 847:41 Core.scala 56:19]
  wire [15:0] _GEN_8382 = _T_12 ? _GEN_8164 : SP; // @[Core.scala 847:41 Core.scala 113:19]
  wire  _GEN_8385 = _T_12 & _GEN_8167; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8389 = _T_12 & _GEN_8171; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8392 = _T_12 & _GEN_8174; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8395 = _T_12 & _GEN_8177; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8398 = _T_12 & _GEN_8180; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8401 = _T_12 & _GEN_8183; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8410 = _T_12 & _GEN_8192; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8417 = _T_12 & _GEN_8199; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8424 = _T_12 & _GEN_8206; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8431 = _T_12 & _GEN_8213; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8434 = _T_12 & _GEN_8216; // @[Core.scala 847:41 Core.scala 724:20]
  wire [7:0] _GEN_8435 = _T_12 ? _GEN_8217 : 8'h0; // @[Core.scala 847:41 Core.scala 766:18]
  wire  _GEN_8436 = _T_12 & _GEN_8218; // @[Core.scala 847:41 Core.scala 768:22]
  wire [7:0] _GEN_8437 = _T_12 ? _GEN_8219 : 8'h0; // @[Core.scala 847:41 Core.scala 767:20]
  wire  _GEN_8440 = _T_12 & _GEN_8222; // @[Core.scala 847:41 Core.scala 724:20]
  wire [7:0] _GEN_8441 = _T_12 ? _GEN_8223 : 8'h0; // @[Core.scala 847:41 Core.scala 765:18]
  wire  _GEN_8444 = _T_12 & _GEN_8226; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8448 = _T_12 & _GEN_8230; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8454 = _T_12 & _GEN_8236; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8457 = _T_12 & _GEN_8239; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8460 = _T_12 & _GEN_8242; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8464 = _T_12 & _GEN_8246; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8467 = _T_12 & _GEN_8249; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8470 = _T_12 & _GEN_8252; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8474 = _T_12 & _GEN_8256; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8480 = _T_12 & _GEN_8262; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8485 = _T_12 & _GEN_8267; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8488 = _T_12 & _GEN_8270; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8491 = _T_12 & _GEN_8273; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8494 = _T_12 & _GEN_8276; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8500 = _T_12 & _GEN_8282; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8503 = _T_12 & _GEN_8285; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8508 = _T_12 & _GEN_8290; // @[Core.scala 847:41 Core.scala 90:27]
  wire [7:0] _GEN_8511 = _T_12 ? _GEN_8293 : F; // @[Core.scala 847:41 Core.scala 41:18]
  wire  _GEN_8514 = _T_12 & _GEN_8296; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8517 = _T_12 & _GEN_8299; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8520 = _T_12 & _GEN_8302; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8525 = _T_12 & _GEN_8307; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8529 = _T_12 & _GEN_8311; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8532 = _T_12 & _GEN_8314; // @[Core.scala 847:41 Core.scala 724:20]
  wire  _GEN_8535 = _T_12 & _GEN_8317; // @[Core.scala 847:41 Core.scala 90:27]
  wire  _GEN_8540 = _T_12 & _GEN_8322; // @[Core.scala 847:41 Core.scala 724:20]
  wire [7:0] _GEN_8542 = _T_12 ? _GEN_5897 : _GEN_8326; // @[Core.scala 847:41]
  wire [2:0] _GEN_8543 = _T_12 ? machine_state : _GEN_8327; // @[Core.scala 847:41 Core.scala 67:30]
  wire  _GEN_8544 = _T_6 ? _GEN_5898 : _GEN_8329; // @[Core.scala 840:34]
  wire  _GEN_8545 = _T_6 ? _GEN_5898 : _GEN_8328; // @[Core.scala 840:34]
  wire [2:0] _GEN_8555 = _T_6 ? machine_state_next : _GEN_8334; // @[Core.scala 840:34 Core.scala 68:35]
  wire [7:0] _GEN_8556 = _T_6 ? opcode_index : _GEN_8335; // @[Core.scala 840:34 Core.scala 725:29]
  wire  _GEN_8559 = _T_6 ? 1'h0 : _GEN_8338; // @[Core.scala 840:34 Core.scala 724:20]
  wire [15:0] _GEN_8560 = _T_6 ? mem_refer_addr : _GEN_8339; // @[Core.scala 840:34 Core.scala 73:31]
  wire  _GEN_8563 = _T_6 ? 1'h0 : _GEN_8342; // @[Core.scala 840:34 Core.scala 724:20]
  wire [15:0] _GEN_8564 = _T_6 ? PC_next : _GEN_8343; // @[Core.scala 840:34 Core.scala 58:24]
  wire  _GEN_8568 = _T_6 ? 1'h0 : _GEN_8347; // @[Core.scala 840:34 Core.scala 724:20]
  wire [7:0] _GEN_8569 = _T_6 ? 8'h0 : _GEN_8348; // @[Core.scala 840:34 Core.scala 77:16]
  wire  _GEN_8572 = _T_6 ? 1'h0 : _GEN_8351; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8576 = _T_6 ? 1'h0 : _GEN_8355; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8577 = _T_6 | _GEN_8356; // @[Core.scala 840:34 Core.scala 758:14]
  wire  _GEN_8580 = _T_6 ? 1'h0 : _GEN_8359; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8583 = _T_6 ? 1'h0 : _GEN_8362; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8586 = _T_6 ? 1'h0 : _GEN_8365; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8589 = _T_6 ? 1'h0 : _GEN_8368; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8592 = _T_6 ? 1'h0 : _GEN_8371; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8593 = _T_6 ? IFF : _GEN_8372; // @[Core.scala 840:34 Core.scala 71:20]
  wire  _GEN_8596 = _T_6 ? 1'h0 : _GEN_8375; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8599 = _T_6 ? 1'h0 : _GEN_8378; // @[Core.scala 840:34 Core.scala 724:20]
  wire [2:0] _GEN_8600 = _T_6 ? dummy_cycle : _GEN_8379; // @[Core.scala 840:34 Core.scala 775:28]
  wire [15:0] _GEN_8601 = _T_6 ? 16'h0 : _GEN_8380; // @[Core.scala 840:34 Core.scala 55:27]
  wire [7:0] _GEN_8602 = _T_6 ? $signed(8'sh0) : $signed(_GEN_8381); // @[Core.scala 840:34 Core.scala 56:19]
  wire [15:0] _GEN_8603 = _T_6 ? SP : _GEN_8382; // @[Core.scala 840:34 Core.scala 113:19]
  wire  _GEN_8606 = _T_6 ? 1'h0 : _GEN_8385; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8610 = _T_6 ? 1'h0 : _GEN_8389; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8613 = _T_6 ? 1'h0 : _GEN_8392; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8616 = _T_6 ? 1'h0 : _GEN_8395; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8619 = _T_6 ? 1'h0 : _GEN_8398; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8622 = _T_6 ? 1'h0 : _GEN_8401; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8631 = _T_6 ? 1'h0 : _GEN_8410; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8638 = _T_6 ? 1'h0 : _GEN_8417; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8645 = _T_6 ? 1'h0 : _GEN_8424; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8652 = _T_6 ? 1'h0 : _GEN_8431; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8655 = _T_6 ? 1'h0 : _GEN_8434; // @[Core.scala 840:34 Core.scala 724:20]
  wire [7:0] _GEN_8656 = _T_6 ? 8'h0 : _GEN_8435; // @[Core.scala 840:34 Core.scala 766:18]
  wire  _GEN_8657 = _T_6 ? 1'h0 : _GEN_8436; // @[Core.scala 840:34 Core.scala 768:22]
  wire [7:0] _GEN_8658 = _T_6 ? 8'h0 : _GEN_8437; // @[Core.scala 840:34 Core.scala 767:20]
  wire  _GEN_8661 = _T_6 ? 1'h0 : _GEN_8440; // @[Core.scala 840:34 Core.scala 724:20]
  wire [7:0] _GEN_8662 = _T_6 ? 8'h0 : _GEN_8441; // @[Core.scala 840:34 Core.scala 765:18]
  wire  _GEN_8665 = _T_6 ? 1'h0 : _GEN_8444; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8669 = _T_6 ? 1'h0 : _GEN_8448; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8675 = _T_6 ? 1'h0 : _GEN_8454; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8678 = _T_6 ? 1'h0 : _GEN_8457; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8681 = _T_6 ? 1'h0 : _GEN_8460; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8685 = _T_6 ? 1'h0 : _GEN_8464; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8688 = _T_6 ? 1'h0 : _GEN_8467; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8691 = _T_6 ? 1'h0 : _GEN_8470; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8695 = _T_6 ? 1'h0 : _GEN_8474; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8701 = _T_6 ? 1'h0 : _GEN_8480; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8706 = _T_6 ? 1'h0 : _GEN_8485; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8709 = _T_6 ? 1'h0 : _GEN_8488; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8712 = _T_6 ? 1'h0 : _GEN_8491; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8715 = _T_6 ? 1'h0 : _GEN_8494; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8721 = _T_6 ? 1'h0 : _GEN_8500; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8724 = _T_6 ? 1'h0 : _GEN_8503; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8729 = _T_6 ? 1'h0 : _GEN_8508; // @[Core.scala 840:34 Core.scala 90:27]
  wire [7:0] _GEN_8732 = _T_6 ? F : _GEN_8511; // @[Core.scala 840:34 Core.scala 41:18]
  wire  _GEN_8735 = _T_6 ? 1'h0 : _GEN_8514; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8738 = _T_6 ? 1'h0 : _GEN_8517; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8741 = _T_6 ? 1'h0 : _GEN_8520; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8746 = _T_6 ? 1'h0 : _GEN_8525; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8750 = _T_6 ? 1'h0 : _GEN_8529; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8753 = _T_6 ? 1'h0 : _GEN_8532; // @[Core.scala 840:34 Core.scala 724:20]
  wire  _GEN_8756 = _T_6 ? 1'h0 : _GEN_8535; // @[Core.scala 840:34 Core.scala 90:27]
  wire  _GEN_8761 = _T_6 ? 1'h0 : _GEN_8540; // @[Core.scala 840:34 Core.scala 724:20]
  wire [7:0] _GEN_8763 = _T_6 ? _GEN_5897 : _GEN_8542; // @[Core.scala 840:34]
  wire [2:0] _GEN_8764 = _T_6 ? machine_state : _GEN_8543; // @[Core.scala 840:34 Core.scala 67:30]
  reg  REG_15; // @[Core.scala 772:43]
  wire  _T_652 = ~clock & REG_15; // @[Core.scala 772:33]
  wire  _GEN_8766 = _T_652 ? 1'h0 : 1'h1; // @[Core.scala 874:43 Core.scala 875:26 Core.scala 873:24]
  reg  REG_16; // @[Core.scala 772:43]
  wire  _T_657 = ~clock & REG_16; // @[Core.scala 772:33]
  wire  _GEN_8767 = _T_657 ? 1'h0 : 1'h1; // @[Core.scala 878:43 Core.scala 879:24 Core.scala 758:14]
  wire [7:0] _T_660 = opcodes_MPORT_172_data; // @[Core.scala 730:22]
  wire  _T_661 = 8'h0 == _T_660; // @[Core.scala 730:22]
  wire [7:0] _T_664 = opcodes_MPORT_174_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_665 = 8'hd3 == _T_664; // @[Core.scala 731:27]
  wire [15:0] _mem_refer_addr_T_53 = {A,opcodes_mem_refer_addr_lo_6_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_8775 = _T_12 ? _mem_refer_addr_T_53 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  reg  REG_17; // @[Core.scala 772:43]
  wire  _T_677 = ~clock & REG_17; // @[Core.scala 772:33]
  wire [7:0] _GEN_8777 = ~opcodes_MPORT_176_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_8781 = _T_677 ? _GEN_8777 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire [7:0] _GEN_8782 = ~opcodes_MPORT_177_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_18; // @[Core.scala 772:43]
  wire  _T_686 = ~clock & REG_18; // @[Core.scala 772:33]
  wire  _GEN_8783 = opcodes_MPORT_178_data[3] ? 1'h0 : 1'h1; // @[Core.scala 585:41 Core.scala 586:28 Core.scala 757:14]
  wire  _GEN_8784 = opcodes_MPORT_178_data[3] & _GEN_8767; // @[Core.scala 585:41 Core.scala 588:28]
  wire  _GEN_8789 = _T_686 ? _GEN_8783 : 1'h1; // @[Core.scala 583:47 Core.scala 757:14]
  wire  _GEN_8790 = _T_686 ? _GEN_8784 : _GEN_8767; // @[Core.scala 583:47]
  wire [7:0] _GEN_8791 = ~opcodes_MPORT_179_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire [7:0] _GEN_8792 = ~opcodes_MPORT_180_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_19; // @[Core.scala 772:43]
  wire  _T_698 = ~clock & REG_19; // @[Core.scala 772:33]
  wire  _GEN_8794 = opcodes_MPORT_181_data[3] ? _GEN_8767 : 1'h1; // @[Core.scala 604:41 Core.scala 607:28]
  wire  _GEN_8800 = _T_698 ? _GEN_8794 : _GEN_8767; // @[Core.scala 602:48]
  wire [7:0] _GEN_8804 = _T_47 ? _GEN_8792 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_8810 = _T_47 ? _GEN_8800 : _GEN_8767; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_8815 = _T_44 ? _GEN_8791 : _GEN_8804; // @[Conditional.scala 39:67]
  wire  _GEN_8823 = _T_44 ? 1'h0 : _T_47 & _T_698; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_8825 = _T_44 ? _GEN_8767 : _GEN_8810; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_8830 = _T_35 ? _GEN_8782 : _GEN_8815; // @[Conditional.scala 39:67]
  wire  _GEN_8834 = _T_35 & _T_686; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_8835 = _T_35 ? _GEN_8789 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_8836 = _T_35 ? _GEN_8790 : _GEN_8825; // @[Conditional.scala 39:67]
  wire  _GEN_8846 = _T_35 ? 1'h0 : _GEN_8823; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_8850 = _T_28 & _T_677; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_8851 = _T_28 ? _GEN_8781 : _GEN_8830; // @[Conditional.scala 40:58]
  wire  _GEN_8858 = _T_28 ? 1'h0 : _GEN_8834; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_8859 = _T_28 | _GEN_8835; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_8860 = _T_28 ? _GEN_8767 : _GEN_8836; // @[Conditional.scala 40:58]
  wire  _GEN_8870 = _T_28 ? 1'h0 : _GEN_8846; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_8876 = _T_27 ? _GEN_8851 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_8884 = _T_27 ? _GEN_8859 : 1'h1; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_8885 = _T_27 ? _GEN_8860 : _GEN_8767; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_8901 = _T_25 ? _GEN_8775 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_8906 = _T_25 ? 1'h0 : _T_27 & _GEN_8850; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_8907 = _T_25 ? 8'h0 : _GEN_8876; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_8914 = _T_25 ? 1'h0 : _T_27 & _GEN_8858; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_8915 = _T_25 | _GEN_8884; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_8916 = _T_25 ? _GEN_8767 : _GEN_8885; // @[Conditional.scala 39:67]
  wire  _GEN_8925 = _T_25 ? 1'h0 : _T_27 & _GEN_8870; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_8928 = _T_4 ? _GEN_5 : _GEN_8901; // @[Conditional.scala 40:58]
  wire  _GEN_8937 = _T_4 ? 1'h0 : _GEN_8906; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_8938 = _T_4 ? 8'h0 : _GEN_8907; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_8945 = _T_4 ? 1'h0 : _GEN_8914; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_8946 = _T_4 | _GEN_8915; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_8947 = _T_4 ? _GEN_8767 : _GEN_8916; // @[Conditional.scala 40:58]
  wire  _GEN_8956 = _T_4 ? 1'h0 : _GEN_8925; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_701 = opcodes_MPORT_182_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_702 = 8'hf3 == _T_701; // @[Core.scala 732:27]
  wire [7:0] _T_705 = opcodes_MPORT_184_data; // @[Core.scala 733:27]
  wire [7:0] _T_707 = opcodes_MPORT_185_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_709 = 8'hcd == _T_705 | 8'hc4 == _T_707; // @[Core.scala 733:51]
  wire  op_hi_9 = opcodes_op_MPORT_18_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo_9 = opcodes_op_MPORT_19_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op_12 = {op_hi_9,op_lo_9}; // @[Cat.scala 30:58]
  wire  _cond_T_297 = op_12 == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_300 = op_12 == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_303 = op_12 == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_306 = op_12 == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_309 = op_12 == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_312 = op_12 == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_315 = op_12 == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_318 = op_12 == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_321 = op_12 == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond_9 = _cond_T_297 | (_cond_T_300 | (_cond_T_303 | (_cond_T_306 | (_cond_T_309 | (_cond_T_312 | (_cond_T_315
     | (_cond_T_318 | _cond_T_321))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_8964 = cond_9 ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_8965 = cond_9 ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_8966 = opcode_index == 8'h2 ? _GEN_8964 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_8967 = opcode_index == 8'h2 ? _GEN_8965 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [7:0] _GEN_8971 = _T_35 ? _GEN_8967 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_8972 = _T_35 ? _GEN_8966 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _PC_next_T_59 = {opcodes_PC_next_hi_9_data,opcodes_PC_next_lo_6_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_8985 = _T_82 ? _PC_next_T_59 : PC_next; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 58:24]
  wire [15:0] _GEN_8997 = _T_81 ? PC_next : _GEN_8985; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_9009 = _T_12 ? _GEN_8997 : PC_next; // @[Core.scala 698:30 Core.scala 58:24]
  wire [15:0] _GEN_9021 = _T_79 ? _GEN_9009 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_9033 = _T_77 ? PC_next : _GEN_9021; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_9035 = _T_25 ? _GEN_2627 : _GEN_9033; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_9036 = _T_25 ? _GEN_8971 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_9037 = _T_25 ? _GEN_8972 : _GEN_259; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_9047 = _T_4 ? _GEN_2617 : _GEN_9035; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_9048 = _T_4 ? _GEN_197 : _GEN_9037; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_9050 = _T_4 ? _GEN_199 : _GEN_9036; // @[Conditional.scala 40:58]
  wire [7:0] _T_728 = opcodes_MPORT_187_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_729 = 8'hc0 == _T_728; // @[Core.scala 734:27]
  wire  op_hi_10 = opcodes_op_MPORT_20_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_10 = opcodes_op_MPORT_21_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_13 = {op_hi_10,op_lo_10}; // @[Cat.scala 30:58]
  wire  _cond_T_330 = op_13 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_333 = op_13 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_336 = op_13 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_339 = op_13 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_342 = op_13 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_345 = op_13 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_348 = op_13 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_351 = op_13 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_354 = op_13 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_10 = _cond_T_330 | (_cond_T_333 | (_cond_T_336 | (_cond_T_339 | (_cond_T_342 | (_cond_T_345 | (_cond_T_348
     | (_cond_T_351 | _cond_T_354))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_9060 = _cond_T_330 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_9061 = _T_35 ? _GEN_9060 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_9065 = cond_10 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_9066 = cond_10 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _PC_next_T_60 = {opcodes_PC_next_hi_10_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_9070 = _T_75 ? _PC_next_T_60 : PC_next; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 58:24]
  wire [15:0] _GEN_9079 = _T_35 ? _GEN_9070 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_9087 = _T_25 ? _GEN_9079 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_9089 = _T_77 ? _GEN_9065 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_9090 = _T_77 ? _GEN_9066 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_9096 = _T_77 ? PC_next : _GEN_9087; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_9097 = _T_4 ? _GEN_9061 : _GEN_9089; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_9100 = _T_4 ? _GEN_195 : _GEN_9090; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_9105 = _T_4 ? PC_next : _GEN_9096; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_740 = opcodes_MPORT_189_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_741 = 8'h3 == _T_740; // @[Core.scala 735:27]
  wire  _register_T_50 = opcodes_MPORT_190_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_51 = {regfiles_front_register_hi_9_data,regfiles_front_register_lo_9_data}; // @[Cat.scala 30:58]
  wire  _register_T_53 = opcodes_MPORT_190_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_54 = {regfiles_front_register_hi_10_data,regfiles_front_register_lo_10_data}; // @[Cat.scala 30:58]
  wire  _register_T_56 = opcodes_MPORT_190_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_57 = {regfiles_front_register_hi_11_data,regfiles_front_register_lo_11_data}; // @[Cat.scala 30:58]
  wire  _register_T_59 = opcodes_MPORT_190_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_60 = _register_T_59 ? SP : {{14'd0}, opcodes_MPORT_190_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_61 = _register_T_56 ? _register_T_57 : _register_T_60; // @[Mux.scala 98:16]
  wire [15:0] _register_T_62 = _register_T_53 ? _register_T_54 : _register_T_61; // @[Mux.scala 98:16]
  wire [15:0] register_3 = _register_T_50 ? _register_T_51 : _register_T_62; // @[Mux.scala 98:16]
  reg [15:0] input_3; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_17 = ~opcodes_MPORT_190_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_750 = 2'h0 == opcodes_MPORT_190_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_753 = 2'h1 == opcodes_MPORT_190_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_756 = 2'h2 == opcodes_MPORT_190_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_759 = 2'h3 == opcodes_MPORT_190_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_9108 = _T_759 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_9116 = _T_756 ? SP : _GEN_9108; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_9126 = _T_753 ? 1'h0 : _T_756; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_9131 = _T_753 ? SP : _GEN_9116; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_9141 = _T_750 ? 1'h0 : _T_753; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_9148 = _T_750 ? 1'h0 : _GEN_9126; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_9153 = _T_750 ? SP : _GEN_9131; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_9158 = _T_35 & _T_750; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_9165 = _T_35 & _GEN_9141; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_9172 = _T_35 & _GEN_9148; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_9177 = _T_35 ? _GEN_9153 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_9183 = _T_77 & _GEN_9158; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_9190 = _T_77 & _GEN_9165; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_9197 = _T_77 & _GEN_9172; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_9202 = _T_77 ? _GEN_9177 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_9212 = _T_4 ? 1'h0 : _GEN_9183; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_9219 = _T_4 ? 1'h0 : _GEN_9190; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_9226 = _T_4 ? 1'h0 : _GEN_9197; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_9231 = _T_4 ? SP : _GEN_9202; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _T_761 = opcodes_MPORT_197_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_762 = 8'h4 == _T_761; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_10 = opcodes_alu_io_calc_type_MPORT_3_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_765 = opcodes_MPORT_198_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_766 = 8'h34 == _T_765; // @[Core.scala 244:22]
  reg [7:0] temp_3; // @[Core.scala 245:25]
  wire [7:0] _GEN_9236 = _T_12 ? temp_3 : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [7:0] _GEN_9240 = _T_79 ? _GEN_9236 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_9244 = _T_77 ? 8'h0 : _GEN_9240; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_9250 = _T_25 ? 8'h0 : _GEN_9244; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_9258 = _T_4 ? 8'h0 : _GEN_9250; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_774 = opcodes_MPORT_198_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_775 = 8'h4 == _T_774; // @[Core.scala 282:29]
  wire [7:0] _GEN_9269 = 8'h4 == _T_774 ? regfiles_front_alu_io_input_A_MPORT_14_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_9272 = 8'h4 == _T_774 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_9279 = 8'h34 == _T_765 ? opcodes_alu_io_input_A_MPORT_12_data : _GEN_9269; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_9280 = 8'h34 == _T_765 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_9281 = 8'h34 == _T_765 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_9282 = 8'h34 == _T_765 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_9283 = 8'h34 == _T_765 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_9284 = 8'h34 == _T_765 ? _GEN_9258 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_9287 = 8'h34 == _T_765 ? 1'h0 : _T_775; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_9291 = 8'h34 == _T_765 ? 1'h0 : _GEN_9272; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_778 = opcodes_MPORT_201_data; // @[Core.scala 737:27]
  wire  _T_779 = 8'h76 == _T_778; // @[Core.scala 737:27]
  wire [7:0] _T_782 = opcodes_MPORT_203_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_783 = 8'h70 == _T_782; // @[Core.scala 738:27]
  wire [7:0] _GEN_9302 = _T_79 ? regfiles_front_io_bus_data1_MPORT_7_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_9312 = _T_4 ? 8'h0 : _GEN_9302; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_789 = opcodes_MPORT_205_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_790 = 8'h40 == _T_789; // @[Core.scala 739:27]
  wire [2:0] src_reg_3 = opcodes_MPORT_206_data[2:0]; // @[Core.scala 298:27]
  wire  _T_794 = src_reg_3 == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_62 = {regfiles_front_mem_refer_addr_hi_3_data,regfiles_front_mem_refer_addr_lo_7_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_9313 = src_reg_3 == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_9318 = src_reg_3 == 3'h6 ? _mem_refer_addr_T_62 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_9321 = src_reg_3 == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_9339 = _T_4 ? _GEN_9313 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_9342 = _T_4 & _T_794; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_9344 = _T_4 ? _GEN_9318 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_9345 = _T_4 ? {{7'd0}, _T_794} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_9348 = _T_4 & _GEN_9321; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_798 = opcodes_MPORT_210_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_799 = 8'h6 == _T_798; // @[Core.scala 740:27]
  wire [15:0] _GEN_9357 = ~opcodes_MPORT_212_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [15:0] _GEN_9363 = _T_101 ? _GEN_9357 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [15:0] _GEN_9369 = _T_12 ? mem_refer_addr : _GEN_9363; // @[Core.scala 329:34 Core.scala 73:31]
  wire [15:0] _GEN_9384 = _T_4 ? _GEN_9369 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _T_811 = opcodes_MPORT_216_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_812 = 8'h80 == _T_811; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_11 = opcodes_MPORT_217_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _T_830 = opcodes_MPORT_219_data; // @[Core.scala 742:27]
  wire [7:0] _T_832 = opcodes_MPORT_220_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_834 = 8'hc3 == _T_830 | 8'hc2 == _T_832; // @[Core.scala 742:51]
  wire  op_hi_11 = opcodes_op_MPORT_22_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_11 = opcodes_op_MPORT_23_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_15 = {op_hi_11,op_lo_11}; // @[Cat.scala 30:58]
  wire  _cond_T_363 = op_15 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_366 = op_15 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_369 = op_15 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_372 = op_15 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_375 = op_15 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_378 = op_15 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_381 = op_15 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_384 = op_15 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_387 = op_15 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_11 = _cond_T_363 | (_cond_T_366 | (_cond_T_369 | (_cond_T_372 | (_cond_T_375 | (_cond_T_378 | (_cond_T_381
     | (_cond_T_384 | _cond_T_387))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_67 = {opcodes_PC_next_hi_11_data,opcodes_PC_next_lo_7_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_9407 = ~cond_11 ? _PC_next_T_1 : _PC_next_T_67; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_9410 = ~cond_11 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [15:0] _GEN_9414 = _T_198 ? _GEN_9407 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_9417 = _T_198 & _GEN_9410; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_9420 = _T_197 ? _PC_next_T_1 : _GEN_9414; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire  _GEN_9424 = _T_197 ? 1'h0 : _GEN_9417; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_9428 = _T_12 ? _GEN_9420 : PC_next; // @[Core.scala 428:34 Core.scala 58:24]
  wire  _GEN_9432 = _T_12 & _GEN_9424; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_9441 = _T_25 ? _GEN_9428 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_9445 = _T_25 & _GEN_9432; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_9455 = _T_4 ? PC_next : _GEN_9441; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire  _GEN_9458 = _T_4 ? 1'h0 : _GEN_9445; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_845 = opcodes_MPORT_223_data; // @[Core.scala 743:27]
  wire [7:0] _GEN_9482 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_6_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [7:0] _GEN_9500 = _T_198 ? $signed(8'sh0) : $signed(_GEN_9482); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_9511 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_7_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [7:0] _GEN_9518 = _T_77 ? $signed(_GEN_9511) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_9529 = _T_25 ? $signed(_GEN_9500) : $signed(_GEN_9518); // @[Conditional.scala 39:67]
  wire [7:0] _GEN_9547 = _T_4 ? $signed(8'sh0) : $signed(_GEN_9529); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_9556 = 8'hdd == _T_845 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_9557 = 8'hdd == _T_845 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_9558 = 8'hdd == _T_845 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_9559 = 8'hdd == _T_845 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_9560 = 8'hdd == _T_845 ? _GEN_3199 : PC_next; // @[Core.scala 743:52 Core.scala 58:24]
  wire  _GEN_9564 = 8'hdd == _T_845 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_9565 = 8'hdd == _T_845 ? $signed(_GEN_9547) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_9568 = 8'hdd == _T_845 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_9573 = 8'hdd == _T_845 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_9577 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? _GEN_683 : _GEN_9557; // @[Core.scala 742:90]
  wire [7:0] _GEN_9578 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? _GEN_684 : _GEN_9556; // @[Core.scala 742:90]
  wire [15:0] _GEN_9579 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? _GEN_685 : _GEN_9558; // @[Core.scala 742:90]
  wire  _GEN_9582 = (8'hc3 == _T_830 | 8'hc2 == _T_832) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_9585 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? _GEN_9455 : _GEN_9560; // @[Core.scala 742:90]
  wire  _GEN_9588 = (8'hc3 == _T_830 | 8'hc2 == _T_832) & _GEN_9458; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_9592 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_9593 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? dummy_cycle : _GEN_9559; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_9597 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? 1'h0 : _GEN_9564; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_9598 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? $signed(8'sh0) : $signed(_GEN_9565); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_9601 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? 1'h0 : _GEN_9568; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_9606 = 8'hc3 == _T_830 | 8'hc2 == _T_832 ? 1'h0 : _GEN_9573; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_9611 = 8'h80 == _T_811 ? regfiles_front_alu_io_input_A_MPORT_15_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_9613 = 8'h80 == _T_811 ? regfiles_front_alu_io_input_B_MPORT_7_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_9614 = 8'h80 == _T_811 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_9615 = 8'h80 == _T_811 ? _alu_io_calc_type_T_11 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_9618 = 8'h80 == _T_811 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_9621 = 8'h80 == _T_811 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_9624 = 8'h80 == _T_811 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_9627 = 8'h80 == _T_811 ? 1'h0 : _T_834; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_9628 = 8'h80 == _T_811 ? machine_state_next : _GEN_9577; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_9629 = 8'h80 == _T_811 ? opcode_index : _GEN_9578; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_9630 = 8'h80 == _T_811 ? mem_refer_addr : _GEN_9579; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_9633 = 8'h80 == _T_811 ? 1'h0 : _GEN_9582; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_9636 = 8'h80 == _T_811 ? PC_next : _GEN_9585; // @[Core.scala 741:52 Core.scala 58:24]
  wire  _GEN_9639 = 8'h80 == _T_811 ? 1'h0 : _GEN_9588; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_9643 = 8'h80 == _T_811 ? 1'h0 : _GEN_9592; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_9644 = 8'h80 == _T_811 ? dummy_cycle : _GEN_9593; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_9648 = 8'h80 == _T_811 ? 1'h0 : _GEN_9597; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_9649 = 8'h80 == _T_811 ? $signed(8'sh0) : $signed(_GEN_9598); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_9652 = 8'h80 == _T_811 ? 1'h0 : _GEN_9601; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_9657 = 8'h80 == _T_811 ? 1'h0 : _GEN_9606; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_9661 = 8'h6 == _T_798 ? _GEN_615 : _GEN_9629; // @[Core.scala 740:52]
  wire [2:0] _GEN_9662 = 8'h6 == _T_798 ? _GEN_616 : _GEN_9628; // @[Core.scala 740:52]
  wire  _GEN_9665 = 8'h6 == _T_798 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_9666 = 8'h6 == _T_798 ? _GEN_9384 : _GEN_9630; // @[Core.scala 740:52]
  wire  _GEN_9669 = 8'h6 == _T_798 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_9673 = 8'h6 == _T_798 ? _GEN_3048 : _GEN_9636; // @[Core.scala 740:52]
  wire  _GEN_9676 = 8'h6 == _T_798 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_9679 = 8'h6 == _T_798 ? 1'h0 : _T_812; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_9681 = 8'h6 == _T_798 ? 8'h0 : _GEN_9611; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_9683 = 8'h6 == _T_798 ? 8'h0 : _GEN_9613; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_9684 = 8'h6 == _T_798 ? 1'h0 : _GEN_9614; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_9685 = 8'h6 == _T_798 ? 8'h0 : _GEN_9615; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_9688 = 8'h6 == _T_798 ? 1'h0 : _GEN_9618; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_9691 = 8'h6 == _T_798 ? F : _GEN_9621; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_9694 = 8'h6 == _T_798 ? 1'h0 : _GEN_9624; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_9697 = 8'h6 == _T_798 ? 1'h0 : _GEN_9627; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_9700 = 8'h6 == _T_798 ? 1'h0 : _GEN_9633; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_9705 = 8'h6 == _T_798 ? 1'h0 : _GEN_9639; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_9709 = 8'h6 == _T_798 ? 1'h0 : _GEN_9643; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_9710 = 8'h6 == _T_798 ? dummy_cycle : _GEN_9644; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_9714 = 8'h6 == _T_798 ? 1'h0 : _GEN_9648; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_9715 = 8'h6 == _T_798 ? $signed(8'sh0) : $signed(_GEN_9649); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_9718 = 8'h6 == _T_798 ? 1'h0 : _GEN_9652; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_9723 = 8'h6 == _T_798 ? 1'h0 : _GEN_9657; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_9727 = 8'h40 == _T_789 ? _GEN_9339 : _GEN_9662; // @[Core.scala 739:52]
  wire  _GEN_9730 = 8'h40 == _T_789 & _GEN_9342; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_9732 = 8'h40 == _T_789 ? _GEN_9344 : _GEN_9666; // @[Core.scala 739:52]
  wire [7:0] _GEN_9733 = 8'h40 == _T_789 ? _GEN_9345 : _GEN_9661; // @[Core.scala 739:52]
  wire  _GEN_9736 = 8'h40 == _T_789 & _GEN_9348; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_9742 = 8'h40 == _T_789 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_9747 = 8'h40 == _T_789 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_9750 = 8'h40 == _T_789 ? 1'h0 : _T_799; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9753 = 8'h40 == _T_789 ? 1'h0 : _GEN_9665; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9756 = 8'h40 == _T_789 ? 1'h0 : _GEN_9669; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_9760 = 8'h40 == _T_789 ? PC_next : _GEN_9673; // @[Core.scala 739:52 Core.scala 58:24]
  wire  _GEN_9763 = 8'h40 == _T_789 ? 1'h0 : _GEN_9676; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9766 = 8'h40 == _T_789 ? 1'h0 : _GEN_9679; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_9768 = 8'h40 == _T_789 ? 8'h0 : _GEN_9681; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_9770 = 8'h40 == _T_789 ? 8'h0 : _GEN_9683; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_9771 = 8'h40 == _T_789 ? 1'h0 : _GEN_9684; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_9772 = 8'h40 == _T_789 ? 8'h0 : _GEN_9685; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_9775 = 8'h40 == _T_789 ? 1'h0 : _GEN_9688; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_9778 = 8'h40 == _T_789 ? F : _GEN_9691; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_9781 = 8'h40 == _T_789 ? 1'h0 : _GEN_9694; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9784 = 8'h40 == _T_789 ? 1'h0 : _GEN_9697; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9787 = 8'h40 == _T_789 ? 1'h0 : _GEN_9700; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9792 = 8'h40 == _T_789 ? 1'h0 : _GEN_9705; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_9796 = 8'h40 == _T_789 ? 1'h0 : _GEN_9709; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_9797 = 8'h40 == _T_789 ? dummy_cycle : _GEN_9710; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_9801 = 8'h40 == _T_789 ? 1'h0 : _GEN_9714; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_9802 = 8'h40 == _T_789 ? $signed(8'sh0) : $signed(_GEN_9715); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_9805 = 8'h40 == _T_789 ? 1'h0 : _GEN_9718; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_9810 = 8'h40 == _T_789 ? 1'h0 : _GEN_9723; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_9811 = 8'h70 == _T_782 ? _GEN_541 : _GEN_9727; // @[Core.scala 738:52]
  wire [7:0] _GEN_9812 = 8'h70 == _T_782 ? _GEN_542 : _GEN_9733; // @[Core.scala 738:52]
  wire [15:0] _GEN_9813 = 8'h70 == _T_782 ? _GEN_543 : _GEN_9732; // @[Core.scala 738:52]
  wire  _GEN_9816 = 8'h70 == _T_782 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_9818 = 8'h70 == _T_782 ? _GEN_9312 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_9821 = 8'h70 == _T_782 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_9824 = 8'h70 == _T_782 ? 1'h0 : _T_790; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9827 = 8'h70 == _T_782 ? 1'h0 : _GEN_9730; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_9831 = 8'h70 == _T_782 ? 1'h0 : _GEN_9736; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_9837 = 8'h70 == _T_782 ? 1'h0 : _GEN_9742; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_9842 = 8'h70 == _T_782 ? 1'h0 : _GEN_9747; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9845 = 8'h70 == _T_782 ? 1'h0 : _GEN_9750; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9848 = 8'h70 == _T_782 ? 1'h0 : _GEN_9753; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9851 = 8'h70 == _T_782 ? 1'h0 : _GEN_9756; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_9855 = 8'h70 == _T_782 ? PC_next : _GEN_9760; // @[Core.scala 738:52 Core.scala 58:24]
  wire  _GEN_9858 = 8'h70 == _T_782 ? 1'h0 : _GEN_9763; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9861 = 8'h70 == _T_782 ? 1'h0 : _GEN_9766; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_9863 = 8'h70 == _T_782 ? 8'h0 : _GEN_9768; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_9865 = 8'h70 == _T_782 ? 8'h0 : _GEN_9770; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_9866 = 8'h70 == _T_782 ? 1'h0 : _GEN_9771; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_9867 = 8'h70 == _T_782 ? 8'h0 : _GEN_9772; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_9870 = 8'h70 == _T_782 ? 1'h0 : _GEN_9775; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_9873 = 8'h70 == _T_782 ? F : _GEN_9778; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_9876 = 8'h70 == _T_782 ? 1'h0 : _GEN_9781; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9879 = 8'h70 == _T_782 ? 1'h0 : _GEN_9784; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9882 = 8'h70 == _T_782 ? 1'h0 : _GEN_9787; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9887 = 8'h70 == _T_782 ? 1'h0 : _GEN_9792; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_9891 = 8'h70 == _T_782 ? 1'h0 : _GEN_9796; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_9892 = 8'h70 == _T_782 ? dummy_cycle : _GEN_9797; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_9896 = 8'h70 == _T_782 ? 1'h0 : _GEN_9801; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_9897 = 8'h70 == _T_782 ? $signed(8'sh0) : $signed(_GEN_9802); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_9900 = 8'h70 == _T_782 ? 1'h0 : _GEN_9805; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_9905 = 8'h70 == _T_782 ? 1'h0 : _GEN_9810; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_9906 = 8'h76 == _T_778 ? 3'h1 : _GEN_9811; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_9907 = 8'h76 == _T_778 ? 8'h0 : _GEN_9812; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_9908 = 8'h76 == _T_778 ? PC : _GEN_9813; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_9909 = 8'h76 == _T_778 ? PC_next : _GEN_9855; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_9912 = 8'h76 == _T_778 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_9915 = 8'h76 == _T_778 ? 1'h0 : _GEN_9816; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_9917 = 8'h76 == _T_778 ? 8'h0 : _GEN_9818; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_9920 = 8'h76 == _T_778 ? 1'h0 : _GEN_9821; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9923 = 8'h76 == _T_778 ? 1'h0 : _GEN_9824; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9926 = 8'h76 == _T_778 ? 1'h0 : _GEN_9827; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_9930 = 8'h76 == _T_778 ? 1'h0 : _GEN_9831; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_9936 = 8'h76 == _T_778 ? 1'h0 : _GEN_9837; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_9941 = 8'h76 == _T_778 ? 1'h0 : _GEN_9842; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9944 = 8'h76 == _T_778 ? 1'h0 : _GEN_9845; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9947 = 8'h76 == _T_778 ? 1'h0 : _GEN_9848; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9950 = 8'h76 == _T_778 ? 1'h0 : _GEN_9851; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9956 = 8'h76 == _T_778 ? 1'h0 : _GEN_9858; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9959 = 8'h76 == _T_778 ? 1'h0 : _GEN_9861; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_9961 = 8'h76 == _T_778 ? 8'h0 : _GEN_9863; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_9963 = 8'h76 == _T_778 ? 8'h0 : _GEN_9865; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_9964 = 8'h76 == _T_778 ? 1'h0 : _GEN_9866; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_9965 = 8'h76 == _T_778 ? 8'h0 : _GEN_9867; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_9968 = 8'h76 == _T_778 ? 1'h0 : _GEN_9870; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_9971 = 8'h76 == _T_778 ? F : _GEN_9873; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_9974 = 8'h76 == _T_778 ? 1'h0 : _GEN_9876; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9977 = 8'h76 == _T_778 ? 1'h0 : _GEN_9879; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9980 = 8'h76 == _T_778 ? 1'h0 : _GEN_9882; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9985 = 8'h76 == _T_778 ? 1'h0 : _GEN_9887; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_9989 = 8'h76 == _T_778 ? 1'h0 : _GEN_9891; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_9990 = 8'h76 == _T_778 ? dummy_cycle : _GEN_9892; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_9994 = 8'h76 == _T_778 ? 1'h0 : _GEN_9896; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_9995 = 8'h76 == _T_778 ? $signed(8'sh0) : $signed(_GEN_9897); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_9998 = 8'h76 == _T_778 ? 1'h0 : _GEN_9900; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_10003 = 8'h76 == _T_778 ? 1'h0 : _GEN_9905; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_10007 = 8'h4 == _T_761 ? 8'h1 : _GEN_9963; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_10008 = 8'h4 == _T_761 ? 1'h0 : _GEN_9964; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_10009 = 8'h4 == _T_761 ? _alu_io_calc_type_T_10 : _GEN_9965; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_10012 = 8'h4 == _T_761 & _T_766; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_10013 = 8'h4 == _T_761 ? _GEN_9279 : _GEN_9961; // @[Core.scala 736:52]
  wire [2:0] _GEN_10014 = 8'h4 == _T_761 ? _GEN_9280 : _GEN_9906; // @[Core.scala 736:52]
  wire [15:0] _GEN_10015 = 8'h4 == _T_761 ? _GEN_9281 : _GEN_9908; // @[Core.scala 736:52]
  wire [7:0] _GEN_10016 = 8'h4 == _T_761 ? _GEN_9282 : _GEN_9907; // @[Core.scala 736:52]
  wire [2:0] _GEN_10017 = 8'h4 == _T_761 ? _GEN_9283 : _GEN_9990; // @[Core.scala 736:52]
  wire [7:0] _GEN_10018 = 8'h4 == _T_761 ? _GEN_9284 : _GEN_9917; // @[Core.scala 736:52]
  wire  _GEN_10021 = 8'h4 == _T_761 & _GEN_9287; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10025 = 8'h4 == _T_761 & _GEN_9291; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10031 = 8'h4 == _T_761 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_10032 = 8'h4 == _T_761 ? PC_next : _GEN_9909; // @[Core.scala 736:52 Core.scala 58:24]
  wire  _GEN_10035 = 8'h4 == _T_761 ? 1'h0 : _GEN_9912; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10038 = 8'h4 == _T_761 ? 1'h0 : _GEN_9915; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10042 = 8'h4 == _T_761 ? 1'h0 : _GEN_9920; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10045 = 8'h4 == _T_761 ? 1'h0 : _GEN_9923; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10048 = 8'h4 == _T_761 ? 1'h0 : _GEN_9926; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_10052 = 8'h4 == _T_761 ? 1'h0 : _GEN_9930; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_10058 = 8'h4 == _T_761 ? 1'h0 : _GEN_9936; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_10063 = 8'h4 == _T_761 ? 1'h0 : _GEN_9941; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10066 = 8'h4 == _T_761 ? 1'h0 : _GEN_9944; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10069 = 8'h4 == _T_761 ? 1'h0 : _GEN_9947; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10072 = 8'h4 == _T_761 ? 1'h0 : _GEN_9950; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10078 = 8'h4 == _T_761 ? 1'h0 : _GEN_9956; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10081 = 8'h4 == _T_761 ? 1'h0 : _GEN_9959; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10086 = 8'h4 == _T_761 ? 1'h0 : _GEN_9968; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_10089 = 8'h4 == _T_761 ? F : _GEN_9971; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_10092 = 8'h4 == _T_761 ? 1'h0 : _GEN_9974; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10095 = 8'h4 == _T_761 ? 1'h0 : _GEN_9977; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10098 = 8'h4 == _T_761 ? 1'h0 : _GEN_9980; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10103 = 8'h4 == _T_761 ? 1'h0 : _GEN_9985; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10107 = 8'h4 == _T_761 ? 1'h0 : _GEN_9989; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_10111 = 8'h4 == _T_761 ? 1'h0 : _GEN_9994; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_10112 = 8'h4 == _T_761 ? $signed(8'sh0) : $signed(_GEN_9995); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_10115 = 8'h4 == _T_761 ? 1'h0 : _GEN_9998; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_10120 = 8'h4 == _T_761 ? 1'h0 : _GEN_10003; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_10130 = 8'h3 == _T_740 ? input_3 : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_10131 = 8'h3 == _T_740 ? $signed({{6{_alu16_io_offset_T_17[1]}},_alu16_io_offset_T_17}) : $signed(
    _GEN_10112); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_10132 = 8'h3 == _T_740 ? _GEN_443 : _GEN_10014; // @[Core.scala 735:52]
  wire [2:0] _GEN_10133 = 8'h3 == _T_740 ? _GEN_445 : _GEN_10017; // @[Core.scala 735:52]
  wire  _GEN_10136 = 8'h3 == _T_740 & _GEN_9212; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_10143 = 8'h3 == _T_740 & _GEN_9219; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_10150 = 8'h3 == _T_740 & _GEN_9226; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_10155 = 8'h3 == _T_740 ? _GEN_9231 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_10156 = 8'h3 == _T_740 ? _GEN_468 : _GEN_10016; // @[Core.scala 735:52]
  wire  _GEN_10159 = 8'h3 == _T_740 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_10162 = 8'h3 == _T_740 ? 1'h0 : _T_762; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_10163 = 8'h3 == _T_740 ? 8'h0 : _GEN_10007; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_10164 = 8'h3 == _T_740 ? 1'h0 : _GEN_10008; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_10165 = 8'h3 == _T_740 ? 8'h0 : _GEN_10009; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_10168 = 8'h3 == _T_740 ? 1'h0 : _GEN_10012; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_10169 = 8'h3 == _T_740 ? 8'h0 : _GEN_10013; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_10170 = 8'h3 == _T_740 ? mem_refer_addr : _GEN_10015; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_10171 = 8'h3 == _T_740 ? 8'h0 : _GEN_10018; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_10174 = 8'h3 == _T_740 ? 1'h0 : _GEN_10021; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10178 = 8'h3 == _T_740 ? 1'h0 : _GEN_10025; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10184 = 8'h3 == _T_740 ? 1'h0 : _GEN_10031; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_10185 = 8'h3 == _T_740 ? PC_next : _GEN_10032; // @[Core.scala 735:52 Core.scala 58:24]
  wire  _GEN_10188 = 8'h3 == _T_740 ? 1'h0 : _GEN_10035; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10191 = 8'h3 == _T_740 ? 1'h0 : _GEN_10038; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10195 = 8'h3 == _T_740 ? 1'h0 : _GEN_10042; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10198 = 8'h3 == _T_740 ? 1'h0 : _GEN_10045; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10201 = 8'h3 == _T_740 ? 1'h0 : _GEN_10048; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_10205 = 8'h3 == _T_740 ? 1'h0 : _GEN_10052; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_10211 = 8'h3 == _T_740 ? 1'h0 : _GEN_10058; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_10216 = 8'h3 == _T_740 ? 1'h0 : _GEN_10063; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10219 = 8'h3 == _T_740 ? 1'h0 : _GEN_10066; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10222 = 8'h3 == _T_740 ? 1'h0 : _GEN_10069; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10225 = 8'h3 == _T_740 ? 1'h0 : _GEN_10072; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10231 = 8'h3 == _T_740 ? 1'h0 : _GEN_10078; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10234 = 8'h3 == _T_740 ? 1'h0 : _GEN_10081; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10239 = 8'h3 == _T_740 ? 1'h0 : _GEN_10086; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_10242 = 8'h3 == _T_740 ? F : _GEN_10089; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_10245 = 8'h3 == _T_740 ? 1'h0 : _GEN_10092; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10248 = 8'h3 == _T_740 ? 1'h0 : _GEN_10095; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10251 = 8'h3 == _T_740 ? 1'h0 : _GEN_10098; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10256 = 8'h3 == _T_740 ? 1'h0 : _GEN_10103; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10260 = 8'h3 == _T_740 ? 1'h0 : _GEN_10107; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10263 = 8'h3 == _T_740 ? 1'h0 : _GEN_10111; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_10266 = 8'h3 == _T_740 ? 1'h0 : _GEN_10115; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_10271 = 8'h3 == _T_740 ? 1'h0 : _GEN_10120; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_10275 = 8'hc0 == _T_728 ? _GEN_9097 : _GEN_10132; // @[Core.scala 734:52]
  wire [2:0] _GEN_10276 = 8'hc0 == _T_728 ? _GEN_334 : _GEN_10133; // @[Core.scala 734:52]
  wire [15:0] _GEN_10277 = 8'hc0 == _T_728 ? _GEN_335 : _GEN_10170; // @[Core.scala 734:52]
  wire [7:0] _GEN_10278 = 8'hc0 == _T_728 ? _GEN_9100 : _GEN_10156; // @[Core.scala 734:52]
  wire [15:0] _GEN_10279 = 8'hc0 == _T_728 ? _GEN_337 : _GEN_10155; // @[Core.scala 734:52]
  wire  _GEN_10282 = 8'hc0 == _T_728 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_10283 = 8'hc0 == _T_728 ? _GEN_9105 : _GEN_10185; // @[Core.scala 734:52]
  wire  _GEN_10286 = 8'hc0 == _T_728 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_10289 = 8'hc0 == _T_728 ? 1'h0 : _T_741; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_10296 = 8'hc0 == _T_728 ? 16'h0 : _GEN_10130; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_10297 = 8'hc0 == _T_728 ? $signed(8'sh0) : $signed(_GEN_10131); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_10300 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10136; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10307 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10143; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10314 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10150; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10321 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10159; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10324 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10162; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_10325 = 8'hc0 == _T_728 ? 8'h0 : _GEN_10163; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_10326 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10164; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_10327 = 8'hc0 == _T_728 ? 8'h0 : _GEN_10165; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_10330 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10168; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_10331 = 8'hc0 == _T_728 ? 8'h0 : _GEN_10169; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_10332 = 8'hc0 == _T_728 ? 8'h0 : _GEN_10171; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_10335 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10174; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10339 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10178; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10345 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10184; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10348 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10188; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10351 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10191; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10355 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10195; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10358 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10198; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10361 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10201; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10365 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10205; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10371 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10211; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10376 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10216; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10379 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10219; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10382 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10222; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10385 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10225; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10391 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10231; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10394 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10234; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10399 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10239; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_10402 = 8'hc0 == _T_728 ? F : _GEN_10242; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_10405 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10245; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10408 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10248; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10411 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10251; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10416 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10256; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10420 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10260; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10423 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10263; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_10426 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10266; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_10431 = 8'hc0 == _T_728 ? 1'h0 : _GEN_10271; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_10435 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_9047 : _GEN_10283; // @[Core.scala 733:90]
  wire [2:0] _GEN_10436 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_9048 : _GEN_10275; // @[Core.scala 733:90]
  wire [15:0] _GEN_10437 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_285 : _GEN_10277; // @[Core.scala 733:90]
  wire [7:0] _GEN_10438 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_9050 : _GEN_10278; // @[Core.scala 733:90]
  wire [2:0] _GEN_10439 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_287 : _GEN_10276; // @[Core.scala 733:90]
  wire [15:0] _GEN_10440 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_288 : _GEN_10296; // @[Core.scala 733:90]
  wire [7:0] _GEN_10441 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? $signed({8{_GEN_289}}) : $signed(_GEN_10297); // @[Core.scala 733:90]
  wire [7:0] _GEN_10442 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_290 : _GEN_10332; // @[Core.scala 733:90]
  wire [15:0] _GEN_10443 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? _GEN_291 : _GEN_10279; // @[Core.scala 733:90]
  wire  _GEN_10446 = (8'hcd == _T_705 | 8'hc4 == _T_707) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10450 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_10453 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _T_729; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10456 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10282; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10459 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10286; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10462 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10289; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10471 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10300; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10478 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10307; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10485 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10314; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10492 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10321; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10495 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10324; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_10496 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 8'h0 : _GEN_10325; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_10497 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10326; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_10498 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 8'h0 : _GEN_10327; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_10501 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10330; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_10502 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 8'h0 : _GEN_10331; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_10505 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10335; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10509 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10339; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10515 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10345; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10518 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10348; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10521 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10351; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10525 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10355; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10528 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10358; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10531 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10361; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10535 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10365; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10541 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10371; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10546 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10376; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10549 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10379; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10552 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10382; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10555 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10385; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10561 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10391; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10564 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10394; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10569 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10399; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_10572 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? F : _GEN_10402; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_10575 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10405; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10578 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10408; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10581 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10411; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10586 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10416; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10590 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10420; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10593 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10423; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10596 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10426; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_10601 = 8'hcd == _T_705 | 8'hc4 == _T_707 ? 1'h0 : _GEN_10431; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_10605 = 8'hf3 == _T_701 ? opcodes_IFF_MPORT_3_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_10608 = 8'hf3 == _T_701 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_10611 = 8'hf3 == _T_701 ? 1'h0 : _T_709; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_10612 = 8'hf3 == _T_701 ? PC_next : _GEN_10435; // @[Core.scala 732:52 Core.scala 58:24]
  wire [2:0] _GEN_10613 = 8'hf3 == _T_701 ? machine_state_next : _GEN_10436; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_10614 = 8'hf3 == _T_701 ? mem_refer_addr : _GEN_10437; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_10615 = 8'hf3 == _T_701 ? opcode_index : _GEN_10438; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_10616 = 8'hf3 == _T_701 ? dummy_cycle : _GEN_10439; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_10617 = 8'hf3 == _T_701 ? 16'h0 : _GEN_10440; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_10618 = 8'hf3 == _T_701 ? $signed(8'sh0) : $signed(_GEN_10441); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_10619 = 8'hf3 == _T_701 ? 8'h0 : _GEN_10442; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_10620 = 8'hf3 == _T_701 ? SP : _GEN_10443; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_10623 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10446; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10627 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10450; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10630 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10453; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10633 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10456; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10636 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10459; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10639 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10462; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10648 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10471; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10655 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10478; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10662 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10485; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10669 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10492; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10672 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10495; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_10673 = 8'hf3 == _T_701 ? 8'h0 : _GEN_10496; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_10674 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10497; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_10675 = 8'hf3 == _T_701 ? 8'h0 : _GEN_10498; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_10678 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10501; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_10679 = 8'hf3 == _T_701 ? 8'h0 : _GEN_10502; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_10682 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10505; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10686 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10509; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10692 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10515; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10695 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10518; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10698 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10521; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10702 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10525; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10705 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10528; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10708 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10531; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10712 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10535; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10718 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10541; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10723 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10546; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10726 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10549; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10729 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10552; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10732 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10555; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10738 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10561; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10741 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10564; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10746 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10569; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_10749 = 8'hf3 == _T_701 ? F : _GEN_10572; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_10752 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10575; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10755 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10578; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10758 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10581; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10763 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10586; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10767 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10590; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10770 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10593; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_10773 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10596; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_10778 = 8'hf3 == _T_701 ? 1'h0 : _GEN_10601; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_10779 = 8'hd3 == _T_664 ? _GEN_163 : _GEN_10613; // @[Core.scala 731:52]
  wire [15:0] _GEN_10780 = 8'hd3 == _T_664 ? _GEN_8928 : _GEN_10614; // @[Core.scala 731:52]
  wire [7:0] _GEN_10781 = 8'hd3 == _T_664 ? _GEN_165 : _GEN_10615; // @[Core.scala 731:52]
  wire  _GEN_10784 = 8'hd3 == _T_664 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_10785 = 8'hd3 == _T_664 ? _GEN_2590 : _GEN_10612; // @[Core.scala 731:52]
  wire  _GEN_10789 = 8'hd3 == _T_664 & _GEN_8937; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_10790 = 8'hd3 == _T_664 ? _GEN_8938 : _GEN_10619; // @[Core.scala 731:52]
  wire  _GEN_10793 = 8'hd3 == _T_664 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10797 = 8'hd3 == _T_664 & _GEN_8945; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10798 = 8'hd3 == _T_664 ? _GEN_8946 : 1'h1; // @[Core.scala 731:52 Core.scala 757:14]
  wire  _GEN_10799 = 8'hd3 == _T_664 ? _GEN_8947 : _GEN_8767; // @[Core.scala 731:52]
  wire  _GEN_10802 = 8'hd3 == _T_664 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10805 = 8'hd3 == _T_664 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10808 = 8'hd3 == _T_664 & _GEN_8956; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10811 = 8'hd3 == _T_664 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_10814 = 8'hd3 == _T_664 ? 1'h0 : _T_702; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10815 = 8'hd3 == _T_664 ? IFF : _GEN_10605; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_10818 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10608; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10821 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10611; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_10822 = 8'hd3 == _T_664 ? dummy_cycle : _GEN_10616; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_10823 = 8'hd3 == _T_664 ? 16'h0 : _GEN_10617; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_10824 = 8'hd3 == _T_664 ? $signed(8'sh0) : $signed(_GEN_10618); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_10825 = 8'hd3 == _T_664 ? SP : _GEN_10620; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_10828 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10623; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10832 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10627; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10835 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10630; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10838 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10633; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10841 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10636; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10844 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10639; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10853 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10648; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10860 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10655; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10867 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10662; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10874 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10669; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10877 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10672; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_10878 = 8'hd3 == _T_664 ? 8'h0 : _GEN_10673; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_10879 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10674; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_10880 = 8'hd3 == _T_664 ? 8'h0 : _GEN_10675; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_10883 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10678; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_10884 = 8'hd3 == _T_664 ? 8'h0 : _GEN_10679; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_10887 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10682; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10891 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10686; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10897 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10692; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10900 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10695; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10903 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10698; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10907 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10702; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10910 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10705; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10913 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10708; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10917 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10712; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10923 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10718; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10928 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10723; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10931 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10726; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10934 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10729; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10937 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10732; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10943 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10738; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10946 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10741; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10951 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10746; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_10954 = 8'hd3 == _T_664 ? F : _GEN_10749; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_10957 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10752; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10960 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10755; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10963 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10758; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10968 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10763; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10972 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10767; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10975 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10770; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_10978 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10773; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_10983 = 8'hd3 == _T_664 ? 1'h0 : _GEN_10778; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_10984 = 8'h0 == _T_660 ? 3'h1 : _GEN_10779; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_10985 = 8'h0 == _T_660 ? 8'h0 : _GEN_10781; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_10988 = 8'h0 == _T_660 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_10989 = 8'h0 == _T_660 ? mem_refer_addr : _GEN_10780; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_10992 = 8'h0 == _T_660 ? 1'h0 : _GEN_10784; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_10993 = 8'h0 == _T_660 ? PC_next : _GEN_10785; // @[Core.scala 730:47 Core.scala 58:24]
  wire  _GEN_10997 = 8'h0 == _T_660 ? 1'h0 : _GEN_10789; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_10998 = 8'h0 == _T_660 ? 8'h0 : _GEN_10790; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_11001 = 8'h0 == _T_660 ? 1'h0 : _GEN_10793; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11005 = 8'h0 == _T_660 ? 1'h0 : _GEN_10797; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11006 = 8'h0 == _T_660 | _GEN_10798; // @[Core.scala 730:47 Core.scala 757:14]
  wire  _GEN_11007 = 8'h0 == _T_660 ? _GEN_8767 : _GEN_10799; // @[Core.scala 730:47]
  wire  _GEN_11010 = 8'h0 == _T_660 ? 1'h0 : _GEN_10802; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11013 = 8'h0 == _T_660 ? 1'h0 : _GEN_10805; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11016 = 8'h0 == _T_660 ? 1'h0 : _GEN_10808; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11019 = 8'h0 == _T_660 ? 1'h0 : _GEN_10811; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11022 = 8'h0 == _T_660 ? 1'h0 : _GEN_10814; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11023 = 8'h0 == _T_660 ? IFF : _GEN_10815; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_11026 = 8'h0 == _T_660 ? 1'h0 : _GEN_10818; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11029 = 8'h0 == _T_660 ? 1'h0 : _GEN_10821; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_11030 = 8'h0 == _T_660 ? dummy_cycle : _GEN_10822; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_11031 = 8'h0 == _T_660 ? 16'h0 : _GEN_10823; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_11032 = 8'h0 == _T_660 ? $signed(8'sh0) : $signed(_GEN_10824); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_11033 = 8'h0 == _T_660 ? SP : _GEN_10825; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_11036 = 8'h0 == _T_660 ? 1'h0 : _GEN_10828; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11040 = 8'h0 == _T_660 ? 1'h0 : _GEN_10832; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11043 = 8'h0 == _T_660 ? 1'h0 : _GEN_10835; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11046 = 8'h0 == _T_660 ? 1'h0 : _GEN_10838; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11049 = 8'h0 == _T_660 ? 1'h0 : _GEN_10841; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11052 = 8'h0 == _T_660 ? 1'h0 : _GEN_10844; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11061 = 8'h0 == _T_660 ? 1'h0 : _GEN_10853; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11068 = 8'h0 == _T_660 ? 1'h0 : _GEN_10860; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11075 = 8'h0 == _T_660 ? 1'h0 : _GEN_10867; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11082 = 8'h0 == _T_660 ? 1'h0 : _GEN_10874; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11085 = 8'h0 == _T_660 ? 1'h0 : _GEN_10877; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_11086 = 8'h0 == _T_660 ? 8'h0 : _GEN_10878; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_11087 = 8'h0 == _T_660 ? 1'h0 : _GEN_10879; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_11088 = 8'h0 == _T_660 ? 8'h0 : _GEN_10880; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_11091 = 8'h0 == _T_660 ? 1'h0 : _GEN_10883; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_11092 = 8'h0 == _T_660 ? 8'h0 : _GEN_10884; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_11095 = 8'h0 == _T_660 ? 1'h0 : _GEN_10887; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11099 = 8'h0 == _T_660 ? 1'h0 : _GEN_10891; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11105 = 8'h0 == _T_660 ? 1'h0 : _GEN_10897; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11108 = 8'h0 == _T_660 ? 1'h0 : _GEN_10900; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11111 = 8'h0 == _T_660 ? 1'h0 : _GEN_10903; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11115 = 8'h0 == _T_660 ? 1'h0 : _GEN_10907; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11118 = 8'h0 == _T_660 ? 1'h0 : _GEN_10910; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11121 = 8'h0 == _T_660 ? 1'h0 : _GEN_10913; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11125 = 8'h0 == _T_660 ? 1'h0 : _GEN_10917; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11131 = 8'h0 == _T_660 ? 1'h0 : _GEN_10923; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11136 = 8'h0 == _T_660 ? 1'h0 : _GEN_10928; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11139 = 8'h0 == _T_660 ? 1'h0 : _GEN_10931; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11142 = 8'h0 == _T_660 ? 1'h0 : _GEN_10934; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11145 = 8'h0 == _T_660 ? 1'h0 : _GEN_10937; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11151 = 8'h0 == _T_660 ? 1'h0 : _GEN_10943; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11154 = 8'h0 == _T_660 ? 1'h0 : _GEN_10946; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11159 = 8'h0 == _T_660 ? 1'h0 : _GEN_10951; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_11162 = 8'h0 == _T_660 ? F : _GEN_10954; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_11165 = 8'h0 == _T_660 ? 1'h0 : _GEN_10957; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11168 = 8'h0 == _T_660 ? 1'h0 : _GEN_10960; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11171 = 8'h0 == _T_660 ? 1'h0 : _GEN_10963; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11176 = 8'h0 == _T_660 ? 1'h0 : _GEN_10968; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11180 = 8'h0 == _T_660 ? 1'h0 : _GEN_10972; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11183 = 8'h0 == _T_660 ? 1'h0 : _GEN_10975; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_11186 = 8'h0 == _T_660 ? 1'h0 : _GEN_10978; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_11191 = 8'h0 == _T_660 ? 1'h0 : _GEN_10983; // @[Core.scala 730:47 Core.scala 724:20]
  reg  REG_20; // @[Core.scala 772:43]
  wire  _T_865 = ~clock & REG_20; // @[Core.scala 772:33]
  wire [7:0] _T_868 = opcodes_MPORT_228_data; // @[Core.scala 730:22]
  wire  _T_869 = 8'h0 == _T_868; // @[Core.scala 730:22]
  wire [7:0] _T_872 = opcodes_MPORT_230_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_873 = 8'hd3 == _T_872; // @[Core.scala 731:27]
  wire [15:0] _mem_refer_addr_T_70 = {A,opcodes_mem_refer_addr_lo_8_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_11200 = _T_12 ? _mem_refer_addr_T_70 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  reg  REG_21; // @[Core.scala 772:43]
  wire  _T_885 = ~clock & REG_21; // @[Core.scala 772:33]
  wire [7:0] _GEN_11202 = ~opcodes_MPORT_232_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_11206 = _T_885 ? _GEN_11202 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire [7:0] _GEN_11207 = ~opcodes_MPORT_233_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_22; // @[Core.scala 772:43]
  wire  _T_894 = ~clock & REG_22; // @[Core.scala 772:33]
  wire  _GEN_11208 = opcodes_MPORT_234_data[3] ? 1'h0 : 1'h1; // @[Core.scala 585:41 Core.scala 586:28 Core.scala 757:14]
  wire  _GEN_11209 = opcodes_MPORT_234_data[3] & _T_865; // @[Core.scala 585:41 Core.scala 588:28]
  wire  _GEN_11214 = _T_894 ? _GEN_11208 : 1'h1; // @[Core.scala 583:47 Core.scala 757:14]
  wire  _GEN_11215 = _T_894 ? _GEN_11209 : _T_865; // @[Core.scala 583:47]
  wire [7:0] _GEN_11216 = ~opcodes_MPORT_235_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire [7:0] _GEN_11217 = ~opcodes_MPORT_236_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_23; // @[Core.scala 772:43]
  wire  _T_906 = ~clock & REG_23; // @[Core.scala 772:33]
  wire  _GEN_11219 = opcodes_MPORT_237_data[3] ? _T_865 : 1'h1; // @[Core.scala 604:41 Core.scala 607:28]
  wire  _GEN_11225 = _T_906 ? _GEN_11219 : _T_865; // @[Core.scala 602:48]
  wire [7:0] _GEN_11229 = _T_47 ? _GEN_11217 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_11235 = _T_47 ? _GEN_11225 : _T_865; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_11240 = _T_44 ? _GEN_11216 : _GEN_11229; // @[Conditional.scala 39:67]
  wire  _GEN_11248 = _T_44 ? 1'h0 : _T_47 & _T_906; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_11250 = _T_44 ? _T_865 : _GEN_11235; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_11255 = _T_35 ? _GEN_11207 : _GEN_11240; // @[Conditional.scala 39:67]
  wire  _GEN_11259 = _T_35 & _T_894; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_11260 = _T_35 ? _GEN_11214 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_11261 = _T_35 ? _GEN_11215 : _GEN_11250; // @[Conditional.scala 39:67]
  wire  _GEN_11271 = _T_35 ? 1'h0 : _GEN_11248; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_11275 = _T_28 & _T_885; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_11276 = _T_28 ? _GEN_11206 : _GEN_11255; // @[Conditional.scala 40:58]
  wire  _GEN_11283 = _T_28 ? 1'h0 : _GEN_11259; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_11284 = _T_28 | _GEN_11260; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_11285 = _T_28 ? _T_865 : _GEN_11261; // @[Conditional.scala 40:58]
  wire  _GEN_11295 = _T_28 ? 1'h0 : _GEN_11271; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_11301 = _T_27 ? _GEN_11276 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_11309 = _T_27 ? _GEN_11284 : 1'h1; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_11310 = _T_27 ? _GEN_11285 : _T_865; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_11326 = _T_25 ? _GEN_11200 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_11331 = _T_25 ? 1'h0 : _T_27 & _GEN_11275; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_11332 = _T_25 ? 8'h0 : _GEN_11301; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_11339 = _T_25 ? 1'h0 : _T_27 & _GEN_11283; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_11340 = _T_25 | _GEN_11309; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_11341 = _T_25 ? _T_865 : _GEN_11310; // @[Conditional.scala 39:67]
  wire  _GEN_11350 = _T_25 ? 1'h0 : _T_27 & _GEN_11295; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_11353 = _T_4 ? _GEN_5 : _GEN_11326; // @[Conditional.scala 40:58]
  wire  _GEN_11362 = _T_4 ? 1'h0 : _GEN_11331; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_11363 = _T_4 ? 8'h0 : _GEN_11332; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_11370 = _T_4 ? 1'h0 : _GEN_11339; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_11371 = _T_4 | _GEN_11340; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_11372 = _T_4 ? _T_865 : _GEN_11341; // @[Conditional.scala 40:58]
  wire  _GEN_11381 = _T_4 ? 1'h0 : _GEN_11350; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_909 = opcodes_MPORT_238_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_910 = 8'hf3 == _T_909; // @[Core.scala 732:27]
  wire [7:0] _T_913 = opcodes_MPORT_240_data; // @[Core.scala 733:27]
  wire [7:0] _T_915 = opcodes_MPORT_241_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_917 = 8'hcd == _T_913 | 8'hc4 == _T_915; // @[Core.scala 733:51]
  wire  op_hi_12 = opcodes_op_MPORT_24_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo_12 = opcodes_op_MPORT_25_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op_16 = {op_hi_12,op_lo_12}; // @[Cat.scala 30:58]
  wire  _cond_T_396 = op_16 == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_399 = op_16 == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_402 = op_16 == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_405 = op_16 == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_408 = op_16 == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_411 = op_16 == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_414 = op_16 == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_417 = op_16 == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_420 = op_16 == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond_12 = _cond_T_396 | (_cond_T_399 | (_cond_T_402 | (_cond_T_405 | (_cond_T_408 | (_cond_T_411 | (_cond_T_414
     | (_cond_T_417 | _cond_T_420))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_11389 = cond_12 ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_11390 = cond_12 ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_11391 = opcode_index == 8'h2 ? _GEN_11389 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_11392 = opcode_index == 8'h2 ? _GEN_11390 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [7:0] _GEN_11396 = _T_35 ? _GEN_11392 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_11397 = _T_35 ? _GEN_11391 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _PC_next_T_76 = {opcodes_PC_next_hi_12_data,opcodes_PC_next_lo_8_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_11410 = _T_82 ? _PC_next_T_76 : PC_next; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 58:24]
  wire [15:0] _GEN_11422 = _T_81 ? PC_next : _GEN_11410; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_11434 = _T_12 ? _GEN_11422 : PC_next; // @[Core.scala 698:30 Core.scala 58:24]
  wire [15:0] _GEN_11446 = _T_79 ? _GEN_11434 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_11458 = _T_77 ? PC_next : _GEN_11446; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_11460 = _T_25 ? _GEN_2627 : _GEN_11458; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_11461 = _T_25 ? _GEN_11396 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_11462 = _T_25 ? _GEN_11397 : _GEN_259; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_11472 = _T_4 ? _GEN_2617 : _GEN_11460; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_11473 = _T_4 ? _GEN_197 : _GEN_11462; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_11475 = _T_4 ? _GEN_199 : _GEN_11461; // @[Conditional.scala 40:58]
  wire [7:0] _T_936 = opcodes_MPORT_243_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_937 = 8'hc0 == _T_936; // @[Core.scala 734:27]
  wire  op_hi_13 = opcodes_op_MPORT_26_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_13 = opcodes_op_MPORT_27_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_17 = {op_hi_13,op_lo_13}; // @[Cat.scala 30:58]
  wire  _cond_T_429 = op_17 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_432 = op_17 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_435 = op_17 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_438 = op_17 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_441 = op_17 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_444 = op_17 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_447 = op_17 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_450 = op_17 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_453 = op_17 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_13 = _cond_T_429 | (_cond_T_432 | (_cond_T_435 | (_cond_T_438 | (_cond_T_441 | (_cond_T_444 | (_cond_T_447
     | (_cond_T_450 | _cond_T_453))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_11485 = _cond_T_429 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_11486 = _T_35 ? _GEN_11485 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_11490 = cond_13 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_11491 = cond_13 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _PC_next_T_77 = {opcodes_PC_next_hi_13_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_11495 = _T_75 ? _PC_next_T_77 : PC_next; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 58:24]
  wire [15:0] _GEN_11504 = _T_35 ? _GEN_11495 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_11512 = _T_25 ? _GEN_11504 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_11514 = _T_77 ? _GEN_11490 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_11515 = _T_77 ? _GEN_11491 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_11521 = _T_77 ? PC_next : _GEN_11512; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_11522 = _T_4 ? _GEN_11486 : _GEN_11514; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_11525 = _T_4 ? _GEN_195 : _GEN_11515; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_11530 = _T_4 ? PC_next : _GEN_11521; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_948 = opcodes_MPORT_245_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_949 = 8'h3 == _T_948; // @[Core.scala 735:27]
  wire  _register_T_66 = opcodes_MPORT_246_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_67 = {regfiles_front_register_hi_12_data,regfiles_front_register_lo_12_data}; // @[Cat.scala 30:58]
  wire  _register_T_69 = opcodes_MPORT_246_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_70 = {regfiles_front_register_hi_13_data,regfiles_front_register_lo_13_data}; // @[Cat.scala 30:58]
  wire  _register_T_72 = opcodes_MPORT_246_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_73 = {regfiles_front_register_hi_14_data,regfiles_front_register_lo_14_data}; // @[Cat.scala 30:58]
  wire  _register_T_75 = opcodes_MPORT_246_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_76 = _register_T_75 ? SP : {{14'd0}, opcodes_MPORT_246_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_77 = _register_T_72 ? _register_T_73 : _register_T_76; // @[Mux.scala 98:16]
  wire [15:0] _register_T_78 = _register_T_69 ? _register_T_70 : _register_T_77; // @[Mux.scala 98:16]
  wire [15:0] register_4 = _register_T_66 ? _register_T_67 : _register_T_78; // @[Mux.scala 98:16]
  reg [15:0] input_4; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_22 = ~opcodes_MPORT_246_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_958 = 2'h0 == opcodes_MPORT_246_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_961 = 2'h1 == opcodes_MPORT_246_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_964 = 2'h2 == opcodes_MPORT_246_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_967 = 2'h3 == opcodes_MPORT_246_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_11533 = _T_967 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_11541 = _T_964 ? SP : _GEN_11533; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_11551 = _T_961 ? 1'h0 : _T_964; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_11556 = _T_961 ? SP : _GEN_11541; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_11566 = _T_958 ? 1'h0 : _T_961; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_11573 = _T_958 ? 1'h0 : _GEN_11551; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_11578 = _T_958 ? SP : _GEN_11556; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_11583 = _T_35 & _T_958; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_11590 = _T_35 & _GEN_11566; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_11597 = _T_35 & _GEN_11573; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_11602 = _T_35 ? _GEN_11578 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_11608 = _T_77 & _GEN_11583; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_11615 = _T_77 & _GEN_11590; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_11622 = _T_77 & _GEN_11597; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_11627 = _T_77 ? _GEN_11602 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_11637 = _T_4 ? 1'h0 : _GEN_11608; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_11644 = _T_4 ? 1'h0 : _GEN_11615; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_11651 = _T_4 ? 1'h0 : _GEN_11622; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_11656 = _T_4 ? SP : _GEN_11627; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _T_969 = opcodes_MPORT_253_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_970 = 8'h4 == _T_969; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_13 = opcodes_alu_io_calc_type_MPORT_4_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_973 = opcodes_MPORT_254_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_974 = 8'h34 == _T_973; // @[Core.scala 244:22]
  reg [7:0] temp_4; // @[Core.scala 245:25]
  wire [7:0] _GEN_11661 = _T_12 ? temp_4 : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [7:0] _GEN_11665 = _T_79 ? _GEN_11661 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_11669 = _T_77 ? 8'h0 : _GEN_11665; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_11675 = _T_25 ? 8'h0 : _GEN_11669; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_11683 = _T_4 ? 8'h0 : _GEN_11675; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_982 = opcodes_MPORT_254_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_983 = 8'h4 == _T_982; // @[Core.scala 282:29]
  wire [7:0] _GEN_11694 = 8'h4 == _T_982 ? regfiles_front_alu_io_input_A_MPORT_18_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_11697 = 8'h4 == _T_982 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_11704 = 8'h34 == _T_973 ? opcodes_alu_io_input_A_MPORT_16_data : _GEN_11694; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_11705 = 8'h34 == _T_973 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_11706 = 8'h34 == _T_973 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_11707 = 8'h34 == _T_973 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_11708 = 8'h34 == _T_973 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_11709 = 8'h34 == _T_973 ? _GEN_11683 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_11712 = 8'h34 == _T_973 ? 1'h0 : _T_983; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_11716 = 8'h34 == _T_973 ? 1'h0 : _GEN_11697; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_986 = opcodes_MPORT_257_data; // @[Core.scala 737:27]
  wire  _T_987 = 8'h76 == _T_986; // @[Core.scala 737:27]
  wire [7:0] _T_990 = opcodes_MPORT_259_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_991 = 8'h70 == _T_990; // @[Core.scala 738:27]
  wire [7:0] _GEN_11727 = _T_79 ? regfiles_front_io_bus_data1_MPORT_9_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_11737 = _T_4 ? 8'h0 : _GEN_11727; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_997 = opcodes_MPORT_261_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_998 = 8'h40 == _T_997; // @[Core.scala 739:27]
  wire [2:0] src_reg_4 = opcodes_MPORT_262_data[2:0]; // @[Core.scala 298:27]
  wire  _T_1002 = src_reg_4 == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_79 = {regfiles_front_mem_refer_addr_hi_4_data,regfiles_front_mem_refer_addr_lo_9_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_11738 = src_reg_4 == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_11743 = src_reg_4 == 3'h6 ? _mem_refer_addr_T_79 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_11746 = src_reg_4 == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_11764 = _T_4 ? _GEN_11738 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_11767 = _T_4 & _T_1002; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_11769 = _T_4 ? _GEN_11743 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_11770 = _T_4 ? {{7'd0}, _T_1002} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_11773 = _T_4 & _GEN_11746; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_1006 = opcodes_MPORT_266_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_1007 = 8'h6 == _T_1006; // @[Core.scala 740:27]
  wire [15:0] _GEN_11782 = ~opcodes_MPORT_268_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [15:0] _GEN_11788 = _T_101 ? _GEN_11782 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [15:0] _GEN_11794 = _T_12 ? mem_refer_addr : _GEN_11788; // @[Core.scala 329:34 Core.scala 73:31]
  wire [15:0] _GEN_11809 = _T_4 ? _GEN_11794 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _T_1019 = opcodes_MPORT_272_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_1020 = 8'h80 == _T_1019; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_14 = opcodes_MPORT_273_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _T_1038 = opcodes_MPORT_275_data; // @[Core.scala 742:27]
  wire [7:0] _T_1040 = opcodes_MPORT_276_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_1042 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040; // @[Core.scala 742:51]
  wire  op_hi_14 = opcodes_op_MPORT_28_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_14 = opcodes_op_MPORT_29_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_19 = {op_hi_14,op_lo_14}; // @[Cat.scala 30:58]
  wire  _cond_T_462 = op_19 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_465 = op_19 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_468 = op_19 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_471 = op_19 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_474 = op_19 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_477 = op_19 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_480 = op_19 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_483 = op_19 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_486 = op_19 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_14 = _cond_T_462 | (_cond_T_465 | (_cond_T_468 | (_cond_T_471 | (_cond_T_474 | (_cond_T_477 | (_cond_T_480
     | (_cond_T_483 | _cond_T_486))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_84 = {opcodes_PC_next_hi_14_data,opcodes_PC_next_lo_9_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_11832 = ~cond_14 ? _PC_next_T_1 : _PC_next_T_84; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_11835 = ~cond_14 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [15:0] _GEN_11839 = _T_198 ? _GEN_11832 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_11842 = _T_198 & _GEN_11835; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_11845 = _T_197 ? _PC_next_T_1 : _GEN_11839; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire  _GEN_11849 = _T_197 ? 1'h0 : _GEN_11842; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_11853 = _T_12 ? _GEN_11845 : PC_next; // @[Core.scala 428:34 Core.scala 58:24]
  wire  _GEN_11857 = _T_12 & _GEN_11849; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_11866 = _T_25 ? _GEN_11853 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_11870 = _T_25 & _GEN_11857; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_11880 = _T_4 ? PC_next : _GEN_11866; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire  _GEN_11883 = _T_4 ? 1'h0 : _GEN_11870; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_1053 = opcodes_MPORT_279_data; // @[Core.scala 743:27]
  wire [7:0] _GEN_11907 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_8_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [7:0] _GEN_11925 = _T_198 ? $signed(8'sh0) : $signed(_GEN_11907); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_11936 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_9_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [7:0] _GEN_11943 = _T_77 ? $signed(_GEN_11936) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_11954 = _T_25 ? $signed(_GEN_11925) : $signed(_GEN_11943); // @[Conditional.scala 39:67]
  wire [7:0] _GEN_11972 = _T_4 ? $signed(8'sh0) : $signed(_GEN_11954); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_11981 = 8'hdd == _T_1053 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_11982 = 8'hdd == _T_1053 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_11983 = 8'hdd == _T_1053 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_11984 = 8'hdd == _T_1053 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_11985 = 8'hdd == _T_1053 ? _GEN_3199 : PC_next; // @[Core.scala 743:52 Core.scala 58:24]
  wire  _GEN_11989 = 8'hdd == _T_1053 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_11990 = 8'hdd == _T_1053 ? $signed(_GEN_11972) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_11993 = 8'hdd == _T_1053 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_11998 = 8'hdd == _T_1053 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_12002 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? _GEN_683 : _GEN_11982; // @[Core.scala 742:90]
  wire [7:0] _GEN_12003 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? _GEN_684 : _GEN_11981; // @[Core.scala 742:90]
  wire [15:0] _GEN_12004 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? _GEN_685 : _GEN_11983; // @[Core.scala 742:90]
  wire  _GEN_12007 = (8'hc3 == _T_1038 | 8'hc2 == _T_1040) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_12010 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? _GEN_11880 : _GEN_11985; // @[Core.scala 742:90]
  wire  _GEN_12013 = (8'hc3 == _T_1038 | 8'hc2 == _T_1040) & _GEN_11883; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_12017 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_12018 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? dummy_cycle : _GEN_11984; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_12022 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? 1'h0 : _GEN_11989; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_12023 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? $signed(8'sh0) : $signed(_GEN_11990); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_12026 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? 1'h0 : _GEN_11993; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_12031 = 8'hc3 == _T_1038 | 8'hc2 == _T_1040 ? 1'h0 : _GEN_11998; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_12036 = 8'h80 == _T_1019 ? regfiles_front_alu_io_input_A_MPORT_19_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_12038 = 8'h80 == _T_1019 ? regfiles_front_alu_io_input_B_MPORT_9_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_12039 = 8'h80 == _T_1019 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_12040 = 8'h80 == _T_1019 ? _alu_io_calc_type_T_14 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_12043 = 8'h80 == _T_1019 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_12046 = 8'h80 == _T_1019 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_12049 = 8'h80 == _T_1019 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_12052 = 8'h80 == _T_1019 ? 1'h0 : _T_1042; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_12053 = 8'h80 == _T_1019 ? machine_state_next : _GEN_12002; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_12054 = 8'h80 == _T_1019 ? opcode_index : _GEN_12003; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_12055 = 8'h80 == _T_1019 ? mem_refer_addr : _GEN_12004; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_12058 = 8'h80 == _T_1019 ? 1'h0 : _GEN_12007; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_12061 = 8'h80 == _T_1019 ? PC_next : _GEN_12010; // @[Core.scala 741:52 Core.scala 58:24]
  wire  _GEN_12064 = 8'h80 == _T_1019 ? 1'h0 : _GEN_12013; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_12068 = 8'h80 == _T_1019 ? 1'h0 : _GEN_12017; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_12069 = 8'h80 == _T_1019 ? dummy_cycle : _GEN_12018; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_12073 = 8'h80 == _T_1019 ? 1'h0 : _GEN_12022; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_12074 = 8'h80 == _T_1019 ? $signed(8'sh0) : $signed(_GEN_12023); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_12077 = 8'h80 == _T_1019 ? 1'h0 : _GEN_12026; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_12082 = 8'h80 == _T_1019 ? 1'h0 : _GEN_12031; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_12086 = 8'h6 == _T_1006 ? _GEN_615 : _GEN_12054; // @[Core.scala 740:52]
  wire [2:0] _GEN_12087 = 8'h6 == _T_1006 ? _GEN_616 : _GEN_12053; // @[Core.scala 740:52]
  wire  _GEN_12090 = 8'h6 == _T_1006 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_12091 = 8'h6 == _T_1006 ? _GEN_11809 : _GEN_12055; // @[Core.scala 740:52]
  wire  _GEN_12094 = 8'h6 == _T_1006 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_12098 = 8'h6 == _T_1006 ? _GEN_3048 : _GEN_12061; // @[Core.scala 740:52]
  wire  _GEN_12101 = 8'h6 == _T_1006 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_12104 = 8'h6 == _T_1006 ? 1'h0 : _T_1020; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_12106 = 8'h6 == _T_1006 ? 8'h0 : _GEN_12036; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_12108 = 8'h6 == _T_1006 ? 8'h0 : _GEN_12038; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_12109 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12039; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_12110 = 8'h6 == _T_1006 ? 8'h0 : _GEN_12040; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_12113 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12043; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_12116 = 8'h6 == _T_1006 ? F : _GEN_12046; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_12119 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12049; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_12122 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12052; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_12125 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12058; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_12130 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12064; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_12134 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12068; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_12135 = 8'h6 == _T_1006 ? dummy_cycle : _GEN_12069; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_12139 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12073; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_12140 = 8'h6 == _T_1006 ? $signed(8'sh0) : $signed(_GEN_12074); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_12143 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12077; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_12148 = 8'h6 == _T_1006 ? 1'h0 : _GEN_12082; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_12152 = 8'h40 == _T_997 ? _GEN_11764 : _GEN_12087; // @[Core.scala 739:52]
  wire  _GEN_12155 = 8'h40 == _T_997 & _GEN_11767; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_12157 = 8'h40 == _T_997 ? _GEN_11769 : _GEN_12091; // @[Core.scala 739:52]
  wire [7:0] _GEN_12158 = 8'h40 == _T_997 ? _GEN_11770 : _GEN_12086; // @[Core.scala 739:52]
  wire  _GEN_12161 = 8'h40 == _T_997 & _GEN_11773; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_12167 = 8'h40 == _T_997 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_12172 = 8'h40 == _T_997 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_12175 = 8'h40 == _T_997 ? 1'h0 : _T_1007; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12178 = 8'h40 == _T_997 ? 1'h0 : _GEN_12090; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12181 = 8'h40 == _T_997 ? 1'h0 : _GEN_12094; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_12185 = 8'h40 == _T_997 ? PC_next : _GEN_12098; // @[Core.scala 739:52 Core.scala 58:24]
  wire  _GEN_12188 = 8'h40 == _T_997 ? 1'h0 : _GEN_12101; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12191 = 8'h40 == _T_997 ? 1'h0 : _GEN_12104; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_12193 = 8'h40 == _T_997 ? 8'h0 : _GEN_12106; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_12195 = 8'h40 == _T_997 ? 8'h0 : _GEN_12108; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_12196 = 8'h40 == _T_997 ? 1'h0 : _GEN_12109; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_12197 = 8'h40 == _T_997 ? 8'h0 : _GEN_12110; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_12200 = 8'h40 == _T_997 ? 1'h0 : _GEN_12113; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_12203 = 8'h40 == _T_997 ? F : _GEN_12116; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_12206 = 8'h40 == _T_997 ? 1'h0 : _GEN_12119; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12209 = 8'h40 == _T_997 ? 1'h0 : _GEN_12122; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12212 = 8'h40 == _T_997 ? 1'h0 : _GEN_12125; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12217 = 8'h40 == _T_997 ? 1'h0 : _GEN_12130; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_12221 = 8'h40 == _T_997 ? 1'h0 : _GEN_12134; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_12222 = 8'h40 == _T_997 ? dummy_cycle : _GEN_12135; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_12226 = 8'h40 == _T_997 ? 1'h0 : _GEN_12139; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_12227 = 8'h40 == _T_997 ? $signed(8'sh0) : $signed(_GEN_12140); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_12230 = 8'h40 == _T_997 ? 1'h0 : _GEN_12143; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_12235 = 8'h40 == _T_997 ? 1'h0 : _GEN_12148; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_12236 = 8'h70 == _T_990 ? _GEN_541 : _GEN_12152; // @[Core.scala 738:52]
  wire [7:0] _GEN_12237 = 8'h70 == _T_990 ? _GEN_542 : _GEN_12158; // @[Core.scala 738:52]
  wire [15:0] _GEN_12238 = 8'h70 == _T_990 ? _GEN_543 : _GEN_12157; // @[Core.scala 738:52]
  wire  _GEN_12241 = 8'h70 == _T_990 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_12243 = 8'h70 == _T_990 ? _GEN_11737 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_12246 = 8'h70 == _T_990 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_12249 = 8'h70 == _T_990 ? 1'h0 : _T_998; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12252 = 8'h70 == _T_990 ? 1'h0 : _GEN_12155; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_12256 = 8'h70 == _T_990 ? 1'h0 : _GEN_12161; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_12262 = 8'h70 == _T_990 ? 1'h0 : _GEN_12167; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_12267 = 8'h70 == _T_990 ? 1'h0 : _GEN_12172; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12270 = 8'h70 == _T_990 ? 1'h0 : _GEN_12175; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12273 = 8'h70 == _T_990 ? 1'h0 : _GEN_12178; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12276 = 8'h70 == _T_990 ? 1'h0 : _GEN_12181; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_12280 = 8'h70 == _T_990 ? PC_next : _GEN_12185; // @[Core.scala 738:52 Core.scala 58:24]
  wire  _GEN_12283 = 8'h70 == _T_990 ? 1'h0 : _GEN_12188; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12286 = 8'h70 == _T_990 ? 1'h0 : _GEN_12191; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_12288 = 8'h70 == _T_990 ? 8'h0 : _GEN_12193; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_12290 = 8'h70 == _T_990 ? 8'h0 : _GEN_12195; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_12291 = 8'h70 == _T_990 ? 1'h0 : _GEN_12196; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_12292 = 8'h70 == _T_990 ? 8'h0 : _GEN_12197; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_12295 = 8'h70 == _T_990 ? 1'h0 : _GEN_12200; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_12298 = 8'h70 == _T_990 ? F : _GEN_12203; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_12301 = 8'h70 == _T_990 ? 1'h0 : _GEN_12206; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12304 = 8'h70 == _T_990 ? 1'h0 : _GEN_12209; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12307 = 8'h70 == _T_990 ? 1'h0 : _GEN_12212; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12312 = 8'h70 == _T_990 ? 1'h0 : _GEN_12217; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_12316 = 8'h70 == _T_990 ? 1'h0 : _GEN_12221; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_12317 = 8'h70 == _T_990 ? dummy_cycle : _GEN_12222; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_12321 = 8'h70 == _T_990 ? 1'h0 : _GEN_12226; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_12322 = 8'h70 == _T_990 ? $signed(8'sh0) : $signed(_GEN_12227); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_12325 = 8'h70 == _T_990 ? 1'h0 : _GEN_12230; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_12330 = 8'h70 == _T_990 ? 1'h0 : _GEN_12235; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_12331 = 8'h76 == _T_986 ? 3'h1 : _GEN_12236; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_12332 = 8'h76 == _T_986 ? 8'h0 : _GEN_12237; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_12333 = 8'h76 == _T_986 ? PC : _GEN_12238; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_12334 = 8'h76 == _T_986 ? PC_next : _GEN_12280; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_12337 = 8'h76 == _T_986 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_12340 = 8'h76 == _T_986 ? 1'h0 : _GEN_12241; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_12342 = 8'h76 == _T_986 ? 8'h0 : _GEN_12243; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_12345 = 8'h76 == _T_986 ? 1'h0 : _GEN_12246; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12348 = 8'h76 == _T_986 ? 1'h0 : _GEN_12249; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12351 = 8'h76 == _T_986 ? 1'h0 : _GEN_12252; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_12355 = 8'h76 == _T_986 ? 1'h0 : _GEN_12256; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_12361 = 8'h76 == _T_986 ? 1'h0 : _GEN_12262; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_12366 = 8'h76 == _T_986 ? 1'h0 : _GEN_12267; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12369 = 8'h76 == _T_986 ? 1'h0 : _GEN_12270; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12372 = 8'h76 == _T_986 ? 1'h0 : _GEN_12273; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12375 = 8'h76 == _T_986 ? 1'h0 : _GEN_12276; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12381 = 8'h76 == _T_986 ? 1'h0 : _GEN_12283; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12384 = 8'h76 == _T_986 ? 1'h0 : _GEN_12286; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_12386 = 8'h76 == _T_986 ? 8'h0 : _GEN_12288; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_12388 = 8'h76 == _T_986 ? 8'h0 : _GEN_12290; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_12389 = 8'h76 == _T_986 ? 1'h0 : _GEN_12291; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_12390 = 8'h76 == _T_986 ? 8'h0 : _GEN_12292; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_12393 = 8'h76 == _T_986 ? 1'h0 : _GEN_12295; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_12396 = 8'h76 == _T_986 ? F : _GEN_12298; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_12399 = 8'h76 == _T_986 ? 1'h0 : _GEN_12301; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12402 = 8'h76 == _T_986 ? 1'h0 : _GEN_12304; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12405 = 8'h76 == _T_986 ? 1'h0 : _GEN_12307; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12410 = 8'h76 == _T_986 ? 1'h0 : _GEN_12312; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_12414 = 8'h76 == _T_986 ? 1'h0 : _GEN_12316; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_12415 = 8'h76 == _T_986 ? dummy_cycle : _GEN_12317; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_12419 = 8'h76 == _T_986 ? 1'h0 : _GEN_12321; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_12420 = 8'h76 == _T_986 ? $signed(8'sh0) : $signed(_GEN_12322); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_12423 = 8'h76 == _T_986 ? 1'h0 : _GEN_12325; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_12428 = 8'h76 == _T_986 ? 1'h0 : _GEN_12330; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_12432 = 8'h4 == _T_969 ? 8'h1 : _GEN_12388; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_12433 = 8'h4 == _T_969 ? 1'h0 : _GEN_12389; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_12434 = 8'h4 == _T_969 ? _alu_io_calc_type_T_13 : _GEN_12390; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_12437 = 8'h4 == _T_969 & _T_974; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_12438 = 8'h4 == _T_969 ? _GEN_11704 : _GEN_12386; // @[Core.scala 736:52]
  wire [2:0] _GEN_12439 = 8'h4 == _T_969 ? _GEN_11705 : _GEN_12331; // @[Core.scala 736:52]
  wire [15:0] _GEN_12440 = 8'h4 == _T_969 ? _GEN_11706 : _GEN_12333; // @[Core.scala 736:52]
  wire [7:0] _GEN_12441 = 8'h4 == _T_969 ? _GEN_11707 : _GEN_12332; // @[Core.scala 736:52]
  wire [2:0] _GEN_12442 = 8'h4 == _T_969 ? _GEN_11708 : _GEN_12415; // @[Core.scala 736:52]
  wire [7:0] _GEN_12443 = 8'h4 == _T_969 ? _GEN_11709 : _GEN_12342; // @[Core.scala 736:52]
  wire  _GEN_12446 = 8'h4 == _T_969 & _GEN_11712; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12450 = 8'h4 == _T_969 & _GEN_11716; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12456 = 8'h4 == _T_969 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_12457 = 8'h4 == _T_969 ? PC_next : _GEN_12334; // @[Core.scala 736:52 Core.scala 58:24]
  wire  _GEN_12460 = 8'h4 == _T_969 ? 1'h0 : _GEN_12337; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12463 = 8'h4 == _T_969 ? 1'h0 : _GEN_12340; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12467 = 8'h4 == _T_969 ? 1'h0 : _GEN_12345; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12470 = 8'h4 == _T_969 ? 1'h0 : _GEN_12348; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12473 = 8'h4 == _T_969 ? 1'h0 : _GEN_12351; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_12477 = 8'h4 == _T_969 ? 1'h0 : _GEN_12355; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_12483 = 8'h4 == _T_969 ? 1'h0 : _GEN_12361; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_12488 = 8'h4 == _T_969 ? 1'h0 : _GEN_12366; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12491 = 8'h4 == _T_969 ? 1'h0 : _GEN_12369; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12494 = 8'h4 == _T_969 ? 1'h0 : _GEN_12372; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12497 = 8'h4 == _T_969 ? 1'h0 : _GEN_12375; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12503 = 8'h4 == _T_969 ? 1'h0 : _GEN_12381; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12506 = 8'h4 == _T_969 ? 1'h0 : _GEN_12384; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12511 = 8'h4 == _T_969 ? 1'h0 : _GEN_12393; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_12514 = 8'h4 == _T_969 ? F : _GEN_12396; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_12517 = 8'h4 == _T_969 ? 1'h0 : _GEN_12399; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12520 = 8'h4 == _T_969 ? 1'h0 : _GEN_12402; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12523 = 8'h4 == _T_969 ? 1'h0 : _GEN_12405; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12528 = 8'h4 == _T_969 ? 1'h0 : _GEN_12410; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12532 = 8'h4 == _T_969 ? 1'h0 : _GEN_12414; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_12536 = 8'h4 == _T_969 ? 1'h0 : _GEN_12419; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_12537 = 8'h4 == _T_969 ? $signed(8'sh0) : $signed(_GEN_12420); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_12540 = 8'h4 == _T_969 ? 1'h0 : _GEN_12423; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_12545 = 8'h4 == _T_969 ? 1'h0 : _GEN_12428; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_12555 = 8'h3 == _T_948 ? input_4 : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_12556 = 8'h3 == _T_948 ? $signed({{6{_alu16_io_offset_T_22[1]}},_alu16_io_offset_T_22}) : $signed(
    _GEN_12537); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_12557 = 8'h3 == _T_948 ? _GEN_443 : _GEN_12439; // @[Core.scala 735:52]
  wire [2:0] _GEN_12558 = 8'h3 == _T_948 ? _GEN_445 : _GEN_12442; // @[Core.scala 735:52]
  wire  _GEN_12561 = 8'h3 == _T_948 & _GEN_11637; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_12568 = 8'h3 == _T_948 & _GEN_11644; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_12575 = 8'h3 == _T_948 & _GEN_11651; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_12580 = 8'h3 == _T_948 ? _GEN_11656 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_12581 = 8'h3 == _T_948 ? _GEN_468 : _GEN_12441; // @[Core.scala 735:52]
  wire  _GEN_12584 = 8'h3 == _T_948 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_12587 = 8'h3 == _T_948 ? 1'h0 : _T_970; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_12588 = 8'h3 == _T_948 ? 8'h0 : _GEN_12432; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_12589 = 8'h3 == _T_948 ? 1'h0 : _GEN_12433; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_12590 = 8'h3 == _T_948 ? 8'h0 : _GEN_12434; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_12593 = 8'h3 == _T_948 ? 1'h0 : _GEN_12437; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_12594 = 8'h3 == _T_948 ? 8'h0 : _GEN_12438; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_12595 = 8'h3 == _T_948 ? mem_refer_addr : _GEN_12440; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_12596 = 8'h3 == _T_948 ? 8'h0 : _GEN_12443; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_12599 = 8'h3 == _T_948 ? 1'h0 : _GEN_12446; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12603 = 8'h3 == _T_948 ? 1'h0 : _GEN_12450; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12609 = 8'h3 == _T_948 ? 1'h0 : _GEN_12456; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_12610 = 8'h3 == _T_948 ? PC_next : _GEN_12457; // @[Core.scala 735:52 Core.scala 58:24]
  wire  _GEN_12613 = 8'h3 == _T_948 ? 1'h0 : _GEN_12460; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12616 = 8'h3 == _T_948 ? 1'h0 : _GEN_12463; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12620 = 8'h3 == _T_948 ? 1'h0 : _GEN_12467; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12623 = 8'h3 == _T_948 ? 1'h0 : _GEN_12470; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12626 = 8'h3 == _T_948 ? 1'h0 : _GEN_12473; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_12630 = 8'h3 == _T_948 ? 1'h0 : _GEN_12477; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_12636 = 8'h3 == _T_948 ? 1'h0 : _GEN_12483; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_12641 = 8'h3 == _T_948 ? 1'h0 : _GEN_12488; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12644 = 8'h3 == _T_948 ? 1'h0 : _GEN_12491; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12647 = 8'h3 == _T_948 ? 1'h0 : _GEN_12494; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12650 = 8'h3 == _T_948 ? 1'h0 : _GEN_12497; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12656 = 8'h3 == _T_948 ? 1'h0 : _GEN_12503; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12659 = 8'h3 == _T_948 ? 1'h0 : _GEN_12506; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12664 = 8'h3 == _T_948 ? 1'h0 : _GEN_12511; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_12667 = 8'h3 == _T_948 ? F : _GEN_12514; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_12670 = 8'h3 == _T_948 ? 1'h0 : _GEN_12517; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12673 = 8'h3 == _T_948 ? 1'h0 : _GEN_12520; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12676 = 8'h3 == _T_948 ? 1'h0 : _GEN_12523; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12681 = 8'h3 == _T_948 ? 1'h0 : _GEN_12528; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12685 = 8'h3 == _T_948 ? 1'h0 : _GEN_12532; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12688 = 8'h3 == _T_948 ? 1'h0 : _GEN_12536; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_12691 = 8'h3 == _T_948 ? 1'h0 : _GEN_12540; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_12696 = 8'h3 == _T_948 ? 1'h0 : _GEN_12545; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_12700 = 8'hc0 == _T_936 ? _GEN_11522 : _GEN_12557; // @[Core.scala 734:52]
  wire [2:0] _GEN_12701 = 8'hc0 == _T_936 ? _GEN_334 : _GEN_12558; // @[Core.scala 734:52]
  wire [15:0] _GEN_12702 = 8'hc0 == _T_936 ? _GEN_335 : _GEN_12595; // @[Core.scala 734:52]
  wire [7:0] _GEN_12703 = 8'hc0 == _T_936 ? _GEN_11525 : _GEN_12581; // @[Core.scala 734:52]
  wire [15:0] _GEN_12704 = 8'hc0 == _T_936 ? _GEN_337 : _GEN_12580; // @[Core.scala 734:52]
  wire  _GEN_12707 = 8'hc0 == _T_936 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_12708 = 8'hc0 == _T_936 ? _GEN_11530 : _GEN_12610; // @[Core.scala 734:52]
  wire  _GEN_12711 = 8'hc0 == _T_936 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_12714 = 8'hc0 == _T_936 ? 1'h0 : _T_949; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_12721 = 8'hc0 == _T_936 ? 16'h0 : _GEN_12555; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_12722 = 8'hc0 == _T_936 ? $signed(8'sh0) : $signed(_GEN_12556); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_12725 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12561; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12732 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12568; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12739 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12575; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12746 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12584; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12749 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12587; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_12750 = 8'hc0 == _T_936 ? 8'h0 : _GEN_12588; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_12751 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12589; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_12752 = 8'hc0 == _T_936 ? 8'h0 : _GEN_12590; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_12755 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12593; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_12756 = 8'hc0 == _T_936 ? 8'h0 : _GEN_12594; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_12757 = 8'hc0 == _T_936 ? 8'h0 : _GEN_12596; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_12760 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12599; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12764 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12603; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12770 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12609; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12773 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12613; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12776 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12616; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12780 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12620; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12783 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12623; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12786 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12626; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12790 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12630; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12796 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12636; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12801 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12641; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12804 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12644; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12807 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12647; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12810 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12650; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12816 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12656; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12819 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12659; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12824 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12664; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_12827 = 8'hc0 == _T_936 ? F : _GEN_12667; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_12830 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12670; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12833 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12673; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12836 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12676; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12841 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12681; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12845 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12685; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12848 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12688; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_12851 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12691; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_12856 = 8'hc0 == _T_936 ? 1'h0 : _GEN_12696; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_12860 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_11472 : _GEN_12708; // @[Core.scala 733:90]
  wire [2:0] _GEN_12861 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_11473 : _GEN_12700; // @[Core.scala 733:90]
  wire [15:0] _GEN_12862 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_285 : _GEN_12702; // @[Core.scala 733:90]
  wire [7:0] _GEN_12863 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_11475 : _GEN_12703; // @[Core.scala 733:90]
  wire [2:0] _GEN_12864 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_287 : _GEN_12701; // @[Core.scala 733:90]
  wire [15:0] _GEN_12865 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_288 : _GEN_12721; // @[Core.scala 733:90]
  wire [7:0] _GEN_12866 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? $signed({8{_GEN_289}}) : $signed(_GEN_12722); // @[Core.scala 733:90]
  wire [7:0] _GEN_12867 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_290 : _GEN_12757; // @[Core.scala 733:90]
  wire [15:0] _GEN_12868 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? _GEN_291 : _GEN_12704; // @[Core.scala 733:90]
  wire  _GEN_12871 = (8'hcd == _T_913 | 8'hc4 == _T_915) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12875 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_12878 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _T_937; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12881 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12707; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12884 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12711; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12887 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12714; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12896 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12725; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_12903 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12732; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_12910 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12739; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_12917 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12746; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12920 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12749; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_12921 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 8'h0 : _GEN_12750; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_12922 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12751; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_12923 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 8'h0 : _GEN_12752; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_12926 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12755; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_12927 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 8'h0 : _GEN_12756; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_12930 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12760; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12934 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12764; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12940 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12770; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12943 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12773; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12946 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12776; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12950 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12780; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12953 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12783; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12956 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12786; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_12960 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12790; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_12966 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12796; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_12971 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12801; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12974 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12804; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12977 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12807; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12980 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12810; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12986 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12816; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12989 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12819; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_12994 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12824; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_12997 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? F : _GEN_12827; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_13000 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12830; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13003 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12833; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13006 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12836; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13011 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12841; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13015 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12845; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13018 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12848; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13021 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12851; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_13026 = 8'hcd == _T_913 | 8'hc4 == _T_915 ? 1'h0 : _GEN_12856; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_13030 = 8'hf3 == _T_909 ? opcodes_IFF_MPORT_4_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_13033 = 8'hf3 == _T_909 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_13036 = 8'hf3 == _T_909 ? 1'h0 : _T_917; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_13037 = 8'hf3 == _T_909 ? PC_next : _GEN_12860; // @[Core.scala 732:52 Core.scala 58:24]
  wire [2:0] _GEN_13038 = 8'hf3 == _T_909 ? machine_state_next : _GEN_12861; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_13039 = 8'hf3 == _T_909 ? mem_refer_addr : _GEN_12862; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_13040 = 8'hf3 == _T_909 ? opcode_index : _GEN_12863; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_13041 = 8'hf3 == _T_909 ? dummy_cycle : _GEN_12864; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_13042 = 8'hf3 == _T_909 ? 16'h0 : _GEN_12865; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_13043 = 8'hf3 == _T_909 ? $signed(8'sh0) : $signed(_GEN_12866); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_13044 = 8'hf3 == _T_909 ? 8'h0 : _GEN_12867; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_13045 = 8'hf3 == _T_909 ? SP : _GEN_12868; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_13048 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12871; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13052 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12875; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13055 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12878; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13058 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12881; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13061 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12884; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13064 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12887; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13073 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12896; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13080 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12903; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13087 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12910; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13094 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12917; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13097 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12920; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_13098 = 8'hf3 == _T_909 ? 8'h0 : _GEN_12921; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_13099 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12922; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_13100 = 8'hf3 == _T_909 ? 8'h0 : _GEN_12923; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_13103 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12926; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_13104 = 8'hf3 == _T_909 ? 8'h0 : _GEN_12927; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_13107 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12930; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13111 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12934; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13117 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12940; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13120 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12943; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13123 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12946; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13127 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12950; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13130 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12953; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13133 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12956; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13137 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12960; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13143 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12966; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13148 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12971; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13151 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12974; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13154 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12977; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13157 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12980; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13163 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12986; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13166 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12989; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13171 = 8'hf3 == _T_909 ? 1'h0 : _GEN_12994; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_13174 = 8'hf3 == _T_909 ? F : _GEN_12997; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_13177 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13000; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13180 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13003; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13183 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13006; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13188 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13011; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13192 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13015; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13195 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13018; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_13198 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13021; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_13203 = 8'hf3 == _T_909 ? 1'h0 : _GEN_13026; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_13204 = 8'hd3 == _T_872 ? _GEN_163 : _GEN_13038; // @[Core.scala 731:52]
  wire [15:0] _GEN_13205 = 8'hd3 == _T_872 ? _GEN_11353 : _GEN_13039; // @[Core.scala 731:52]
  wire [7:0] _GEN_13206 = 8'hd3 == _T_872 ? _GEN_165 : _GEN_13040; // @[Core.scala 731:52]
  wire  _GEN_13209 = 8'hd3 == _T_872 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_13210 = 8'hd3 == _T_872 ? _GEN_2590 : _GEN_13037; // @[Core.scala 731:52]
  wire  _GEN_13214 = 8'hd3 == _T_872 & _GEN_11362; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_13215 = 8'hd3 == _T_872 ? _GEN_11363 : _GEN_13044; // @[Core.scala 731:52]
  wire  _GEN_13218 = 8'hd3 == _T_872 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13222 = 8'hd3 == _T_872 & _GEN_11370; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13223 = 8'hd3 == _T_872 ? _GEN_11371 : 1'h1; // @[Core.scala 731:52 Core.scala 757:14]
  wire  _GEN_13224 = 8'hd3 == _T_872 ? _GEN_11372 : _T_865; // @[Core.scala 731:52]
  wire  _GEN_13227 = 8'hd3 == _T_872 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13230 = 8'hd3 == _T_872 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13233 = 8'hd3 == _T_872 & _GEN_11381; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13236 = 8'hd3 == _T_872 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_13239 = 8'hd3 == _T_872 ? 1'h0 : _T_910; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13240 = 8'hd3 == _T_872 ? IFF : _GEN_13030; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_13243 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13033; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13246 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13036; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_13247 = 8'hd3 == _T_872 ? dummy_cycle : _GEN_13041; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_13248 = 8'hd3 == _T_872 ? 16'h0 : _GEN_13042; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_13249 = 8'hd3 == _T_872 ? $signed(8'sh0) : $signed(_GEN_13043); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_13250 = 8'hd3 == _T_872 ? SP : _GEN_13045; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_13253 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13048; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13257 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13052; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13260 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13055; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13263 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13058; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13266 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13061; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13269 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13064; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13278 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13073; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13285 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13080; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13292 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13087; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13299 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13094; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13302 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13097; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_13303 = 8'hd3 == _T_872 ? 8'h0 : _GEN_13098; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_13304 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13099; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_13305 = 8'hd3 == _T_872 ? 8'h0 : _GEN_13100; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_13308 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13103; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_13309 = 8'hd3 == _T_872 ? 8'h0 : _GEN_13104; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_13312 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13107; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13316 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13111; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13322 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13117; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13325 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13120; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13328 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13123; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13332 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13127; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13335 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13130; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13338 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13133; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13342 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13137; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13348 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13143; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13353 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13148; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13356 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13151; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13359 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13154; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13362 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13157; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13368 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13163; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13371 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13166; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13376 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13171; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_13379 = 8'hd3 == _T_872 ? F : _GEN_13174; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_13382 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13385 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13180; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13388 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13183; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13393 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13188; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13397 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13192; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13400 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13195; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_13403 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13198; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_13408 = 8'hd3 == _T_872 ? 1'h0 : _GEN_13203; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_13409 = 8'h0 == _T_868 ? 3'h1 : _GEN_13204; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_13410 = 8'h0 == _T_868 ? 8'h0 : _GEN_13206; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_13413 = 8'h0 == _T_868 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_13414 = 8'h0 == _T_868 ? mem_refer_addr : _GEN_13205; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_13417 = 8'h0 == _T_868 ? 1'h0 : _GEN_13209; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_13418 = 8'h0 == _T_868 ? PC_next : _GEN_13210; // @[Core.scala 730:47 Core.scala 58:24]
  wire  _GEN_13422 = 8'h0 == _T_868 ? 1'h0 : _GEN_13214; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_13423 = 8'h0 == _T_868 ? 8'h0 : _GEN_13215; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_13426 = 8'h0 == _T_868 ? 1'h0 : _GEN_13218; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13430 = 8'h0 == _T_868 ? 1'h0 : _GEN_13222; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13431 = 8'h0 == _T_868 | _GEN_13223; // @[Core.scala 730:47 Core.scala 757:14]
  wire  _GEN_13432 = 8'h0 == _T_868 ? _T_865 : _GEN_13224; // @[Core.scala 730:47]
  wire  _GEN_13435 = 8'h0 == _T_868 ? 1'h0 : _GEN_13227; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13438 = 8'h0 == _T_868 ? 1'h0 : _GEN_13230; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13441 = 8'h0 == _T_868 ? 1'h0 : _GEN_13233; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13444 = 8'h0 == _T_868 ? 1'h0 : _GEN_13236; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13447 = 8'h0 == _T_868 ? 1'h0 : _GEN_13239; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13448 = 8'h0 == _T_868 ? IFF : _GEN_13240; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_13451 = 8'h0 == _T_868 ? 1'h0 : _GEN_13243; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13454 = 8'h0 == _T_868 ? 1'h0 : _GEN_13246; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_13455 = 8'h0 == _T_868 ? dummy_cycle : _GEN_13247; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_13456 = 8'h0 == _T_868 ? 16'h0 : _GEN_13248; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_13457 = 8'h0 == _T_868 ? $signed(8'sh0) : $signed(_GEN_13249); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_13458 = 8'h0 == _T_868 ? SP : _GEN_13250; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_13461 = 8'h0 == _T_868 ? 1'h0 : _GEN_13253; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13465 = 8'h0 == _T_868 ? 1'h0 : _GEN_13257; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13468 = 8'h0 == _T_868 ? 1'h0 : _GEN_13260; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13471 = 8'h0 == _T_868 ? 1'h0 : _GEN_13263; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13474 = 8'h0 == _T_868 ? 1'h0 : _GEN_13266; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13477 = 8'h0 == _T_868 ? 1'h0 : _GEN_13269; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13486 = 8'h0 == _T_868 ? 1'h0 : _GEN_13278; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13493 = 8'h0 == _T_868 ? 1'h0 : _GEN_13285; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13500 = 8'h0 == _T_868 ? 1'h0 : _GEN_13292; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13507 = 8'h0 == _T_868 ? 1'h0 : _GEN_13299; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13510 = 8'h0 == _T_868 ? 1'h0 : _GEN_13302; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_13511 = 8'h0 == _T_868 ? 8'h0 : _GEN_13303; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_13512 = 8'h0 == _T_868 ? 1'h0 : _GEN_13304; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_13513 = 8'h0 == _T_868 ? 8'h0 : _GEN_13305; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_13516 = 8'h0 == _T_868 ? 1'h0 : _GEN_13308; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_13517 = 8'h0 == _T_868 ? 8'h0 : _GEN_13309; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_13520 = 8'h0 == _T_868 ? 1'h0 : _GEN_13312; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13524 = 8'h0 == _T_868 ? 1'h0 : _GEN_13316; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13530 = 8'h0 == _T_868 ? 1'h0 : _GEN_13322; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13533 = 8'h0 == _T_868 ? 1'h0 : _GEN_13325; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13536 = 8'h0 == _T_868 ? 1'h0 : _GEN_13328; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13540 = 8'h0 == _T_868 ? 1'h0 : _GEN_13332; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13543 = 8'h0 == _T_868 ? 1'h0 : _GEN_13335; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13546 = 8'h0 == _T_868 ? 1'h0 : _GEN_13338; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13550 = 8'h0 == _T_868 ? 1'h0 : _GEN_13342; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13556 = 8'h0 == _T_868 ? 1'h0 : _GEN_13348; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13561 = 8'h0 == _T_868 ? 1'h0 : _GEN_13353; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13564 = 8'h0 == _T_868 ? 1'h0 : _GEN_13356; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13567 = 8'h0 == _T_868 ? 1'h0 : _GEN_13359; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13570 = 8'h0 == _T_868 ? 1'h0 : _GEN_13362; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13576 = 8'h0 == _T_868 ? 1'h0 : _GEN_13368; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13579 = 8'h0 == _T_868 ? 1'h0 : _GEN_13371; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13584 = 8'h0 == _T_868 ? 1'h0 : _GEN_13376; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_13587 = 8'h0 == _T_868 ? F : _GEN_13379; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_13590 = 8'h0 == _T_868 ? 1'h0 : _GEN_13382; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13593 = 8'h0 == _T_868 ? 1'h0 : _GEN_13385; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13596 = 8'h0 == _T_868 ? 1'h0 : _GEN_13388; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13601 = 8'h0 == _T_868 ? 1'h0 : _GEN_13393; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13605 = 8'h0 == _T_868 ? 1'h0 : _GEN_13397; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13608 = 8'h0 == _T_868 ? 1'h0 : _GEN_13400; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13611 = 8'h0 == _T_868 ? 1'h0 : _GEN_13403; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_13616 = 8'h0 == _T_868 ? 1'h0 : _GEN_13408; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_13617 = _T_101 ? 1'h0 : 1'h1; // @[Core.scala 883:41 Core.scala 884:24 Core.scala 759:16]
  wire  _GEN_13618 = _T_101 ? _GEN_13432 : 1'h1; // @[Core.scala 883:41 Core.scala 758:14]
  wire [2:0] _GEN_13623 = _T_101 ? _GEN_13409 : machine_state_next; // @[Core.scala 883:41 Core.scala 68:35]
  wire [7:0] _GEN_13624 = _T_101 ? _GEN_13410 : opcode_index; // @[Core.scala 883:41 Core.scala 725:29]
  wire  _GEN_13627 = _T_101 & _GEN_13413; // @[Core.scala 883:41 Core.scala 724:20]
  wire [15:0] _GEN_13628 = _T_101 ? _GEN_13414 : mem_refer_addr; // @[Core.scala 883:41 Core.scala 73:31]
  wire  _GEN_13631 = _T_101 & _GEN_13417; // @[Core.scala 883:41 Core.scala 724:20]
  wire [15:0] _GEN_13632 = _T_101 ? _GEN_13418 : PC_next; // @[Core.scala 883:41 Core.scala 58:24]
  wire  _GEN_13636 = _T_101 & _GEN_13422; // @[Core.scala 883:41 Core.scala 724:20]
  wire [7:0] _GEN_13637 = _T_101 ? _GEN_13423 : 8'h0; // @[Core.scala 883:41 Core.scala 77:16]
  wire  _GEN_13640 = _T_101 & _GEN_13426; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13644 = _T_101 & _GEN_13430; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13645 = _T_101 ? _GEN_13431 : 1'h1; // @[Core.scala 883:41 Core.scala 757:14]
  wire  _GEN_13648 = _T_101 & _GEN_13435; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13651 = _T_101 & _GEN_13438; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13654 = _T_101 & _GEN_13441; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13657 = _T_101 & _GEN_13444; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13660 = _T_101 & _GEN_13447; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13661 = _T_101 ? _GEN_13448 : IFF; // @[Core.scala 883:41 Core.scala 71:20]
  wire  _GEN_13664 = _T_101 & _GEN_13451; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13667 = _T_101 & _GEN_13454; // @[Core.scala 883:41 Core.scala 724:20]
  wire [2:0] _GEN_13668 = _T_101 ? _GEN_13455 : dummy_cycle; // @[Core.scala 883:41 Core.scala 775:28]
  wire [15:0] _GEN_13669 = _T_101 ? _GEN_13456 : 16'h0; // @[Core.scala 883:41 Core.scala 55:27]
  wire [7:0] _GEN_13670 = _T_101 ? $signed(_GEN_13457) : $signed(8'sh0); // @[Core.scala 883:41 Core.scala 56:19]
  wire [15:0] _GEN_13671 = _T_101 ? _GEN_13458 : SP; // @[Core.scala 883:41 Core.scala 113:19]
  wire  _GEN_13674 = _T_101 & _GEN_13461; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13678 = _T_101 & _GEN_13465; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13681 = _T_101 & _GEN_13468; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13684 = _T_101 & _GEN_13471; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13687 = _T_101 & _GEN_13474; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13690 = _T_101 & _GEN_13477; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13699 = _T_101 & _GEN_13486; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13706 = _T_101 & _GEN_13493; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13713 = _T_101 & _GEN_13500; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13720 = _T_101 & _GEN_13507; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13723 = _T_101 & _GEN_13510; // @[Core.scala 883:41 Core.scala 724:20]
  wire [7:0] _GEN_13724 = _T_101 ? _GEN_13511 : 8'h0; // @[Core.scala 883:41 Core.scala 766:18]
  wire  _GEN_13725 = _T_101 & _GEN_13512; // @[Core.scala 883:41 Core.scala 768:22]
  wire [7:0] _GEN_13726 = _T_101 ? _GEN_13513 : 8'h0; // @[Core.scala 883:41 Core.scala 767:20]
  wire  _GEN_13729 = _T_101 & _GEN_13516; // @[Core.scala 883:41 Core.scala 724:20]
  wire [7:0] _GEN_13730 = _T_101 ? _GEN_13517 : 8'h0; // @[Core.scala 883:41 Core.scala 765:18]
  wire  _GEN_13733 = _T_101 & _GEN_13520; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13737 = _T_101 & _GEN_13524; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13743 = _T_101 & _GEN_13530; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13746 = _T_101 & _GEN_13533; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13749 = _T_101 & _GEN_13536; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13753 = _T_101 & _GEN_13540; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13756 = _T_101 & _GEN_13543; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13759 = _T_101 & _GEN_13546; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13763 = _T_101 & _GEN_13550; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13769 = _T_101 & _GEN_13556; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13774 = _T_101 & _GEN_13561; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13777 = _T_101 & _GEN_13564; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13780 = _T_101 & _GEN_13567; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13783 = _T_101 & _GEN_13570; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13789 = _T_101 & _GEN_13576; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13792 = _T_101 & _GEN_13579; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13797 = _T_101 & _GEN_13584; // @[Core.scala 883:41 Core.scala 90:27]
  wire [7:0] _GEN_13800 = _T_101 ? _GEN_13587 : F; // @[Core.scala 883:41 Core.scala 41:18]
  wire  _GEN_13803 = _T_101 & _GEN_13590; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13806 = _T_101 & _GEN_13593; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13809 = _T_101 & _GEN_13596; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13814 = _T_101 & _GEN_13601; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13818 = _T_101 & _GEN_13605; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13821 = _T_101 & _GEN_13608; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13824 = _T_101 & _GEN_13611; // @[Core.scala 883:41 Core.scala 90:27]
  wire  _GEN_13829 = _T_101 & _GEN_13616; // @[Core.scala 883:41 Core.scala 724:20]
  wire  _GEN_13833 = _T_12 ? _GEN_11007 : _GEN_13618; // @[Core.scala 877:41]
  wire  _GEN_13834 = _T_12 ? 1'h0 : _GEN_13617; // @[Core.scala 877:41 Core.scala 881:24]
  wire [2:0] _GEN_13839 = _T_12 ? _GEN_10984 : _GEN_13623; // @[Core.scala 877:41]
  wire [7:0] _GEN_13840 = _T_12 ? _GEN_10985 : _GEN_13624; // @[Core.scala 877:41]
  wire  _GEN_13843 = _T_12 & _GEN_10988; // @[Core.scala 877:41 Core.scala 724:20]
  wire [15:0] _GEN_13844 = _T_12 ? _GEN_10989 : _GEN_13628; // @[Core.scala 877:41]
  wire  _GEN_13847 = _T_12 & _GEN_10992; // @[Core.scala 877:41 Core.scala 724:20]
  wire [15:0] _GEN_13848 = _T_12 ? _GEN_10993 : _GEN_13632; // @[Core.scala 877:41]
  wire  _GEN_13852 = _T_12 & _GEN_10997; // @[Core.scala 877:41 Core.scala 724:20]
  wire [7:0] _GEN_13853 = _T_12 ? _GEN_10998 : _GEN_13637; // @[Core.scala 877:41]
  wire  _GEN_13856 = _T_12 & _GEN_11001; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13860 = _T_12 & _GEN_11005; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13861 = _T_12 ? _GEN_11006 : _GEN_13645; // @[Core.scala 877:41]
  wire  _GEN_13864 = _T_12 & _GEN_11010; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13867 = _T_12 & _GEN_11013; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13870 = _T_12 & _GEN_11016; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13873 = _T_12 & _GEN_11019; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13876 = _T_12 & _GEN_11022; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13877 = _T_12 ? _GEN_11023 : _GEN_13661; // @[Core.scala 877:41]
  wire  _GEN_13880 = _T_12 & _GEN_11026; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13883 = _T_12 & _GEN_11029; // @[Core.scala 877:41 Core.scala 724:20]
  wire [2:0] _GEN_13884 = _T_12 ? _GEN_11030 : _GEN_13668; // @[Core.scala 877:41]
  wire [15:0] _GEN_13885 = _T_12 ? _GEN_11031 : _GEN_13669; // @[Core.scala 877:41]
  wire [7:0] _GEN_13886 = _T_12 ? $signed(_GEN_11032) : $signed(_GEN_13670); // @[Core.scala 877:41]
  wire [15:0] _GEN_13887 = _T_12 ? _GEN_11033 : _GEN_13671; // @[Core.scala 877:41]
  wire  _GEN_13890 = _T_12 & _GEN_11036; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13894 = _T_12 & _GEN_11040; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13897 = _T_12 & _GEN_11043; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13900 = _T_12 & _GEN_11046; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13903 = _T_12 & _GEN_11049; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13906 = _T_12 & _GEN_11052; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13915 = _T_12 & _GEN_11061; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_13922 = _T_12 & _GEN_11068; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_13929 = _T_12 & _GEN_11075; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_13936 = _T_12 & _GEN_11082; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13939 = _T_12 & _GEN_11085; // @[Core.scala 877:41 Core.scala 724:20]
  wire [7:0] _GEN_13940 = _T_12 ? _GEN_11086 : _GEN_13724; // @[Core.scala 877:41]
  wire  _GEN_13941 = _T_12 ? _GEN_11087 : _GEN_13725; // @[Core.scala 877:41]
  wire [7:0] _GEN_13942 = _T_12 ? _GEN_11088 : _GEN_13726; // @[Core.scala 877:41]
  wire  _GEN_13945 = _T_12 & _GEN_11091; // @[Core.scala 877:41 Core.scala 724:20]
  wire [7:0] _GEN_13946 = _T_12 ? _GEN_11092 : _GEN_13730; // @[Core.scala 877:41]
  wire  _GEN_13949 = _T_12 & _GEN_11095; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13953 = _T_12 & _GEN_11099; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13959 = _T_12 & _GEN_11105; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13962 = _T_12 & _GEN_11108; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13965 = _T_12 & _GEN_11111; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13969 = _T_12 & _GEN_11115; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13972 = _T_12 & _GEN_11118; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13975 = _T_12 & _GEN_11121; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_13979 = _T_12 & _GEN_11125; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_13985 = _T_12 & _GEN_11131; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_13990 = _T_12 & _GEN_11136; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13993 = _T_12 & _GEN_11139; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13996 = _T_12 & _GEN_11142; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_13999 = _T_12 & _GEN_11145; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14005 = _T_12 & _GEN_11151; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14008 = _T_12 & _GEN_11154; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14013 = _T_12 & _GEN_11159; // @[Core.scala 877:41 Core.scala 90:27]
  wire [7:0] _GEN_14016 = _T_12 ? _GEN_11162 : _GEN_13800; // @[Core.scala 877:41]
  wire  _GEN_14019 = _T_12 & _GEN_11165; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14022 = _T_12 & _GEN_11168; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14025 = _T_12 & _GEN_11171; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14030 = _T_12 & _GEN_11176; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14034 = _T_12 & _GEN_11180; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14037 = _T_12 & _GEN_11183; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14040 = _T_12 & _GEN_11186; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14045 = _T_12 & _GEN_11191; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14052 = _T_12 ? 1'h0 : _GEN_13627; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14055 = _T_12 ? 1'h0 : _GEN_13631; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14058 = _T_12 ? 1'h0 : _GEN_13636; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14061 = _T_12 ? 1'h0 : _GEN_13640; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14064 = _T_12 ? 1'h0 : _GEN_13644; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14067 = _T_12 ? 1'h0 : _GEN_13648; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14070 = _T_12 ? 1'h0 : _GEN_13651; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14073 = _T_12 ? 1'h0 : _GEN_13654; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14076 = _T_12 ? 1'h0 : _GEN_13657; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14079 = _T_12 ? 1'h0 : _GEN_13660; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14082 = _T_12 ? 1'h0 : _GEN_13664; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14085 = _T_12 ? 1'h0 : _GEN_13667; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14088 = _T_12 ? 1'h0 : _GEN_13674; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14092 = _T_12 ? 1'h0 : _GEN_13678; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14095 = _T_12 ? 1'h0 : _GEN_13681; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14098 = _T_12 ? 1'h0 : _GEN_13684; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14101 = _T_12 ? 1'h0 : _GEN_13687; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14104 = _T_12 ? 1'h0 : _GEN_13690; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14113 = _T_12 ? 1'h0 : _GEN_13699; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14120 = _T_12 ? 1'h0 : _GEN_13706; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14127 = _T_12 ? 1'h0 : _GEN_13713; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14134 = _T_12 ? 1'h0 : _GEN_13720; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14137 = _T_12 ? 1'h0 : _GEN_13723; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14140 = _T_12 ? 1'h0 : _GEN_13729; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14143 = _T_12 ? 1'h0 : _GEN_13733; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14147 = _T_12 ? 1'h0 : _GEN_13737; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14153 = _T_12 ? 1'h0 : _GEN_13743; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14156 = _T_12 ? 1'h0 : _GEN_13746; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14159 = _T_12 ? 1'h0 : _GEN_13749; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14163 = _T_12 ? 1'h0 : _GEN_13753; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14166 = _T_12 ? 1'h0 : _GEN_13756; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14169 = _T_12 ? 1'h0 : _GEN_13759; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14173 = _T_12 ? 1'h0 : _GEN_13763; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14179 = _T_12 ? 1'h0 : _GEN_13769; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14184 = _T_12 ? 1'h0 : _GEN_13774; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14187 = _T_12 ? 1'h0 : _GEN_13777; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14190 = _T_12 ? 1'h0 : _GEN_13780; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14193 = _T_12 ? 1'h0 : _GEN_13783; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14199 = _T_12 ? 1'h0 : _GEN_13789; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14202 = _T_12 ? 1'h0 : _GEN_13792; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14207 = _T_12 ? 1'h0 : _GEN_13797; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14212 = _T_12 ? 1'h0 : _GEN_13803; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14215 = _T_12 ? 1'h0 : _GEN_13806; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14218 = _T_12 ? 1'h0 : _GEN_13809; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14223 = _T_12 ? 1'h0 : _GEN_13814; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14227 = _T_12 ? 1'h0 : _GEN_13818; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14230 = _T_12 ? 1'h0 : _GEN_13821; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14233 = _T_12 ? 1'h0 : _GEN_13824; // @[Core.scala 877:41 Core.scala 90:27]
  wire  _GEN_14238 = _T_12 ? 1'h0 : _GEN_13829; // @[Core.scala 877:41 Core.scala 724:20]
  wire  _GEN_14242 = _T_6 | _GEN_13833; // @[Core.scala 870:34 Core.scala 871:22]
  wire  _GEN_14243 = _T_6 ? _GEN_8766 : _GEN_13834; // @[Core.scala 870:34]
  wire [2:0] _GEN_14248 = _T_6 ? machine_state_next : _GEN_13839; // @[Core.scala 870:34 Core.scala 68:35]
  wire [7:0] _GEN_14249 = _T_6 ? opcode_index : _GEN_13840; // @[Core.scala 870:34 Core.scala 725:29]
  wire  _GEN_14252 = _T_6 ? 1'h0 : _GEN_13843; // @[Core.scala 870:34 Core.scala 724:20]
  wire [15:0] _GEN_14253 = _T_6 ? mem_refer_addr : _GEN_13844; // @[Core.scala 870:34 Core.scala 73:31]
  wire  _GEN_14256 = _T_6 ? 1'h0 : _GEN_13847; // @[Core.scala 870:34 Core.scala 724:20]
  wire [15:0] _GEN_14257 = _T_6 ? PC_next : _GEN_13848; // @[Core.scala 870:34 Core.scala 58:24]
  wire  _GEN_14261 = _T_6 ? 1'h0 : _GEN_13852; // @[Core.scala 870:34 Core.scala 724:20]
  wire [7:0] _GEN_14262 = _T_6 ? 8'h0 : _GEN_13853; // @[Core.scala 870:34 Core.scala 77:16]
  wire  _GEN_14265 = _T_6 ? 1'h0 : _GEN_13856; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14269 = _T_6 ? 1'h0 : _GEN_13860; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14270 = _T_6 | _GEN_13861; // @[Core.scala 870:34 Core.scala 757:14]
  wire  _GEN_14273 = _T_6 ? 1'h0 : _GEN_13864; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14276 = _T_6 ? 1'h0 : _GEN_13867; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14279 = _T_6 ? 1'h0 : _GEN_13870; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14282 = _T_6 ? 1'h0 : _GEN_13873; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14285 = _T_6 ? 1'h0 : _GEN_13876; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14286 = _T_6 ? IFF : _GEN_13877; // @[Core.scala 870:34 Core.scala 71:20]
  wire  _GEN_14289 = _T_6 ? 1'h0 : _GEN_13880; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14292 = _T_6 ? 1'h0 : _GEN_13883; // @[Core.scala 870:34 Core.scala 724:20]
  wire [2:0] _GEN_14293 = _T_6 ? dummy_cycle : _GEN_13884; // @[Core.scala 870:34 Core.scala 775:28]
  wire [15:0] _GEN_14294 = _T_6 ? 16'h0 : _GEN_13885; // @[Core.scala 870:34 Core.scala 55:27]
  wire [7:0] _GEN_14295 = _T_6 ? $signed(8'sh0) : $signed(_GEN_13886); // @[Core.scala 870:34 Core.scala 56:19]
  wire [15:0] _GEN_14296 = _T_6 ? SP : _GEN_13887; // @[Core.scala 870:34 Core.scala 113:19]
  wire  _GEN_14299 = _T_6 ? 1'h0 : _GEN_13890; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14303 = _T_6 ? 1'h0 : _GEN_13894; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14306 = _T_6 ? 1'h0 : _GEN_13897; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14309 = _T_6 ? 1'h0 : _GEN_13900; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14312 = _T_6 ? 1'h0 : _GEN_13903; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14315 = _T_6 ? 1'h0 : _GEN_13906; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14324 = _T_6 ? 1'h0 : _GEN_13915; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14331 = _T_6 ? 1'h0 : _GEN_13922; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14338 = _T_6 ? 1'h0 : _GEN_13929; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14345 = _T_6 ? 1'h0 : _GEN_13936; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14348 = _T_6 ? 1'h0 : _GEN_13939; // @[Core.scala 870:34 Core.scala 724:20]
  wire [7:0] _GEN_14349 = _T_6 ? 8'h0 : _GEN_13940; // @[Core.scala 870:34 Core.scala 766:18]
  wire  _GEN_14350 = _T_6 ? 1'h0 : _GEN_13941; // @[Core.scala 870:34 Core.scala 768:22]
  wire [7:0] _GEN_14351 = _T_6 ? 8'h0 : _GEN_13942; // @[Core.scala 870:34 Core.scala 767:20]
  wire  _GEN_14354 = _T_6 ? 1'h0 : _GEN_13945; // @[Core.scala 870:34 Core.scala 724:20]
  wire [7:0] _GEN_14355 = _T_6 ? 8'h0 : _GEN_13946; // @[Core.scala 870:34 Core.scala 765:18]
  wire  _GEN_14358 = _T_6 ? 1'h0 : _GEN_13949; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14362 = _T_6 ? 1'h0 : _GEN_13953; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14368 = _T_6 ? 1'h0 : _GEN_13959; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14371 = _T_6 ? 1'h0 : _GEN_13962; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14374 = _T_6 ? 1'h0 : _GEN_13965; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14378 = _T_6 ? 1'h0 : _GEN_13969; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14381 = _T_6 ? 1'h0 : _GEN_13972; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14384 = _T_6 ? 1'h0 : _GEN_13975; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14388 = _T_6 ? 1'h0 : _GEN_13979; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14394 = _T_6 ? 1'h0 : _GEN_13985; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14399 = _T_6 ? 1'h0 : _GEN_13990; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14402 = _T_6 ? 1'h0 : _GEN_13993; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14405 = _T_6 ? 1'h0 : _GEN_13996; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14408 = _T_6 ? 1'h0 : _GEN_13999; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14414 = _T_6 ? 1'h0 : _GEN_14005; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14417 = _T_6 ? 1'h0 : _GEN_14008; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14422 = _T_6 ? 1'h0 : _GEN_14013; // @[Core.scala 870:34 Core.scala 90:27]
  wire [7:0] _GEN_14425 = _T_6 ? F : _GEN_14016; // @[Core.scala 870:34 Core.scala 41:18]
  wire  _GEN_14428 = _T_6 ? 1'h0 : _GEN_14019; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14431 = _T_6 ? 1'h0 : _GEN_14022; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14434 = _T_6 ? 1'h0 : _GEN_14025; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14439 = _T_6 ? 1'h0 : _GEN_14030; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14443 = _T_6 ? 1'h0 : _GEN_14034; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14446 = _T_6 ? 1'h0 : _GEN_14037; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14449 = _T_6 ? 1'h0 : _GEN_14040; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14454 = _T_6 ? 1'h0 : _GEN_14045; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14461 = _T_6 ? 1'h0 : _GEN_14052; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14464 = _T_6 ? 1'h0 : _GEN_14055; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14467 = _T_6 ? 1'h0 : _GEN_14058; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14470 = _T_6 ? 1'h0 : _GEN_14061; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14473 = _T_6 ? 1'h0 : _GEN_14064; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14476 = _T_6 ? 1'h0 : _GEN_14067; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14479 = _T_6 ? 1'h0 : _GEN_14070; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14482 = _T_6 ? 1'h0 : _GEN_14073; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14485 = _T_6 ? 1'h0 : _GEN_14076; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14488 = _T_6 ? 1'h0 : _GEN_14079; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14491 = _T_6 ? 1'h0 : _GEN_14082; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14494 = _T_6 ? 1'h0 : _GEN_14085; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14497 = _T_6 ? 1'h0 : _GEN_14088; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14501 = _T_6 ? 1'h0 : _GEN_14092; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14504 = _T_6 ? 1'h0 : _GEN_14095; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14507 = _T_6 ? 1'h0 : _GEN_14098; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14510 = _T_6 ? 1'h0 : _GEN_14101; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14513 = _T_6 ? 1'h0 : _GEN_14104; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14522 = _T_6 ? 1'h0 : _GEN_14113; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14529 = _T_6 ? 1'h0 : _GEN_14120; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14536 = _T_6 ? 1'h0 : _GEN_14127; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14543 = _T_6 ? 1'h0 : _GEN_14134; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14546 = _T_6 ? 1'h0 : _GEN_14137; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14549 = _T_6 ? 1'h0 : _GEN_14140; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14552 = _T_6 ? 1'h0 : _GEN_14143; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14556 = _T_6 ? 1'h0 : _GEN_14147; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14562 = _T_6 ? 1'h0 : _GEN_14153; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14565 = _T_6 ? 1'h0 : _GEN_14156; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14568 = _T_6 ? 1'h0 : _GEN_14159; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14572 = _T_6 ? 1'h0 : _GEN_14163; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14575 = _T_6 ? 1'h0 : _GEN_14166; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14578 = _T_6 ? 1'h0 : _GEN_14169; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14582 = _T_6 ? 1'h0 : _GEN_14173; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14588 = _T_6 ? 1'h0 : _GEN_14179; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14593 = _T_6 ? 1'h0 : _GEN_14184; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14596 = _T_6 ? 1'h0 : _GEN_14187; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14599 = _T_6 ? 1'h0 : _GEN_14190; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14602 = _T_6 ? 1'h0 : _GEN_14193; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14608 = _T_6 ? 1'h0 : _GEN_14199; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14611 = _T_6 ? 1'h0 : _GEN_14202; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14616 = _T_6 ? 1'h0 : _GEN_14207; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14621 = _T_6 ? 1'h0 : _GEN_14212; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14624 = _T_6 ? 1'h0 : _GEN_14215; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14627 = _T_6 ? 1'h0 : _GEN_14218; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14632 = _T_6 ? 1'h0 : _GEN_14223; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14636 = _T_6 ? 1'h0 : _GEN_14227; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14639 = _T_6 ? 1'h0 : _GEN_14230; // @[Core.scala 870:34 Core.scala 724:20]
  wire  _GEN_14642 = _T_6 ? 1'h0 : _GEN_14233; // @[Core.scala 870:34 Core.scala 90:27]
  wire  _GEN_14647 = _T_6 ? 1'h0 : _GEN_14238; // @[Core.scala 870:34 Core.scala 724:20]
  wire [7:0] _GEN_24680 = {{5'd0}, dummy_cycle}; // @[Core.scala 896:25]
  wire [7:0] _GEN_14651 = m1_t_cycle < _GEN_24680 ? _m1_t_cycle_T_1 : 8'h1; // @[Core.scala 896:40 Core.scala 897:22 Core.scala 899:22]
  wire [2:0] _GEN_14652 = m1_t_cycle < _GEN_24680 ? machine_state : machine_state_next; // @[Core.scala 896:40 Core.scala 67:30 Core.scala 900:25]
  wire [7:0] _T_1073 = opcodes_MPORT_284_data; // @[Core.scala 730:22]
  wire  _T_1074 = 8'h0 == _T_1073; // @[Core.scala 730:22]
  wire [7:0] _T_1077 = opcodes_MPORT_286_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_1078 = 8'hd3 == _T_1077; // @[Core.scala 731:27]
  wire [15:0] _mem_refer_addr_T_87 = {A,opcodes_mem_refer_addr_lo_10_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_14660 = _T_12 ? _mem_refer_addr_T_87 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  reg  REG_24; // @[Core.scala 772:43]
  wire  _T_1090 = ~clock & REG_24; // @[Core.scala 772:33]
  wire [7:0] _GEN_14662 = ~opcodes_MPORT_288_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_14666 = _T_1090 ? _GEN_14662 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire [7:0] _GEN_14667 = ~opcodes_MPORT_289_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_25; // @[Core.scala 772:43]
  wire  _T_1099 = ~clock & REG_25; // @[Core.scala 772:33]
  wire  _GEN_14668 = opcodes_MPORT_290_data[3] ? 1'h0 : 1'h1; // @[Core.scala 585:41 Core.scala 586:28 Core.scala 757:14]
  wire  _GEN_14674 = _T_1099 ? _GEN_14668 : 1'h1; // @[Core.scala 583:47 Core.scala 757:14]
  wire  _GEN_14675 = _T_1099 ? opcodes_MPORT_290_data[3] : 1'h1; // @[Core.scala 583:47 Core.scala 758:14]
  wire [7:0] _GEN_14676 = ~opcodes_MPORT_291_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire [7:0] _GEN_14677 = ~opcodes_MPORT_292_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_26; // @[Core.scala 772:43]
  wire  _T_1111 = ~clock & REG_26; // @[Core.scala 772:33]
  wire [7:0] _GEN_14687 = _T_47 ? _GEN_14677 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_14697 = _T_44 ? _GEN_14676 : _GEN_14687; // @[Conditional.scala 39:67]
  wire  _GEN_14705 = _T_44 ? 1'h0 : _T_47 & _T_1111; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_14711 = _T_35 ? _GEN_14667 : _GEN_14697; // @[Conditional.scala 39:67]
  wire  _GEN_14715 = _T_35 & _T_1099; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_14716 = _T_35 ? _GEN_14674 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_14717 = _T_35 ? _GEN_14675 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_14727 = _T_35 ? 1'h0 : _GEN_14705; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_14731 = _T_28 & _T_1090; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_14732 = _T_28 ? _GEN_14666 : _GEN_14711; // @[Conditional.scala 40:58]
  wire  _GEN_14739 = _T_28 ? 1'h0 : _GEN_14715; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_14740 = _T_28 | _GEN_14716; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_14741 = _T_28 | _GEN_14717; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_14751 = _T_28 ? 1'h0 : _GEN_14727; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_14753 = _T_27 ? mem_refer_addr : PC; // @[Conditional.scala 39:67 Core.scala 565:21 Core.scala 756:15]
  wire [7:0] _GEN_14757 = _T_27 ? _GEN_14732 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_14765 = _T_27 ? _GEN_14740 : 1'h1; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_14766 = _T_27 ? _GEN_14741 : 1'h1; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire [15:0] _GEN_14782 = _T_25 ? _GEN_14660 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [15:0] _GEN_14784 = _T_25 ? PC : _GEN_14753; // @[Conditional.scala 39:67 Core.scala 756:15]
  wire  _GEN_14787 = _T_25 ? 1'h0 : _T_27 & _GEN_14731; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_14788 = _T_25 ? 8'h0 : _GEN_14757; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_14795 = _T_25 ? 1'h0 : _T_27 & _GEN_14739; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_14796 = _T_25 | _GEN_14765; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_14797 = _T_25 | _GEN_14766; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire  _GEN_14806 = _T_25 ? 1'h0 : _T_27 & _GEN_14751; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_14809 = _T_4 ? _GEN_5 : _GEN_14782; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_14815 = _T_4 ? PC : _GEN_14784; // @[Conditional.scala 40:58 Core.scala 756:15]
  wire  _GEN_14818 = _T_4 ? 1'h0 : _GEN_14787; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_14819 = _T_4 ? 8'h0 : _GEN_14788; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_14826 = _T_4 ? 1'h0 : _GEN_14795; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_14827 = _T_4 | _GEN_14796; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_14828 = _T_4 | _GEN_14797; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_14837 = _T_4 ? 1'h0 : _GEN_14806; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_1114 = opcodes_MPORT_294_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_1115 = 8'hf3 == _T_1114; // @[Core.scala 732:27]
  wire [7:0] _T_1118 = opcodes_MPORT_296_data; // @[Core.scala 733:27]
  wire [7:0] _T_1120 = opcodes_MPORT_297_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_1122 = 8'hcd == _T_1118 | 8'hc4 == _T_1120; // @[Core.scala 733:51]
  wire  op_hi_15 = opcodes_op_MPORT_30_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo_15 = opcodes_op_MPORT_31_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op_20 = {op_hi_15,op_lo_15}; // @[Cat.scala 30:58]
  wire  _cond_T_495 = op_20 == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_498 = op_20 == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_501 = op_20 == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_504 = op_20 == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_507 = op_20 == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_510 = op_20 == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_513 = op_20 == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_516 = op_20 == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_519 = op_20 == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond_15 = _cond_T_495 | (_cond_T_498 | (_cond_T_501 | (_cond_T_504 | (_cond_T_507 | (_cond_T_510 | (_cond_T_513
     | (_cond_T_516 | _cond_T_519))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_14845 = cond_15 ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_14846 = cond_15 ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_14847 = opcode_index == 8'h2 ? _GEN_14845 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_14848 = opcode_index == 8'h2 ? _GEN_14846 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [7:0] _GEN_14852 = _T_35 ? _GEN_14848 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_14853 = _T_35 ? _GEN_14847 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _PC_next_T_93 = {opcodes_PC_next_hi_15_data,opcodes_PC_next_lo_10_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_14866 = _T_82 ? _PC_next_T_93 : PC_next; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 58:24]
  wire [15:0] _GEN_14878 = _T_81 ? PC_next : _GEN_14866; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_14890 = _T_12 ? _GEN_14878 : PC_next; // @[Core.scala 698:30 Core.scala 58:24]
  wire [15:0] _GEN_14902 = _T_79 ? _GEN_14890 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_14914 = _T_77 ? PC_next : _GEN_14902; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_14916 = _T_25 ? _GEN_2627 : _GEN_14914; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_14917 = _T_25 ? _GEN_14852 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_14918 = _T_25 ? _GEN_14853 : _GEN_259; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_14928 = _T_4 ? _GEN_2617 : _GEN_14916; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_14929 = _T_4 ? _GEN_197 : _GEN_14918; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_14931 = _T_4 ? _GEN_199 : _GEN_14917; // @[Conditional.scala 40:58]
  wire [7:0] _T_1141 = opcodes_MPORT_299_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_1142 = 8'hc0 == _T_1141; // @[Core.scala 734:27]
  wire  op_hi_16 = opcodes_op_MPORT_32_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_16 = opcodes_op_MPORT_33_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_21 = {op_hi_16,op_lo_16}; // @[Cat.scala 30:58]
  wire  _cond_T_528 = op_21 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_531 = op_21 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_534 = op_21 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_537 = op_21 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_540 = op_21 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_543 = op_21 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_546 = op_21 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_549 = op_21 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_552 = op_21 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_16 = _cond_T_528 | (_cond_T_531 | (_cond_T_534 | (_cond_T_537 | (_cond_T_540 | (_cond_T_543 | (_cond_T_546
     | (_cond_T_549 | _cond_T_552))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_14941 = _cond_T_528 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_14942 = _T_35 ? _GEN_14941 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_14946 = cond_16 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_14947 = cond_16 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _PC_next_T_94 = {opcodes_PC_next_hi_16_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_14951 = _T_75 ? _PC_next_T_94 : PC_next; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 58:24]
  wire [15:0] _GEN_14960 = _T_35 ? _GEN_14951 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_14968 = _T_25 ? _GEN_14960 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_14970 = _T_77 ? _GEN_14946 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_14971 = _T_77 ? _GEN_14947 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_14977 = _T_77 ? PC_next : _GEN_14968; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_14978 = _T_4 ? _GEN_14942 : _GEN_14970; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_14981 = _T_4 ? _GEN_195 : _GEN_14971; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_14986 = _T_4 ? PC_next : _GEN_14977; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_1153 = opcodes_MPORT_301_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_1154 = 8'h3 == _T_1153; // @[Core.scala 735:27]
  wire  _register_T_82 = opcodes_MPORT_302_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_83 = {regfiles_front_register_hi_15_data,regfiles_front_register_lo_15_data}; // @[Cat.scala 30:58]
  wire  _register_T_85 = opcodes_MPORT_302_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_86 = {regfiles_front_register_hi_16_data,regfiles_front_register_lo_16_data}; // @[Cat.scala 30:58]
  wire  _register_T_88 = opcodes_MPORT_302_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_89 = {regfiles_front_register_hi_17_data,regfiles_front_register_lo_17_data}; // @[Cat.scala 30:58]
  wire  _register_T_91 = opcodes_MPORT_302_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_92 = _register_T_91 ? SP : {{14'd0}, opcodes_MPORT_302_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_93 = _register_T_88 ? _register_T_89 : _register_T_92; // @[Mux.scala 98:16]
  wire [15:0] _register_T_94 = _register_T_85 ? _register_T_86 : _register_T_93; // @[Mux.scala 98:16]
  wire [15:0] register_5 = _register_T_82 ? _register_T_83 : _register_T_94; // @[Mux.scala 98:16]
  reg [15:0] input_5; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_27 = ~opcodes_MPORT_302_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_1163 = 2'h0 == opcodes_MPORT_302_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_1166 = 2'h1 == opcodes_MPORT_302_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_1169 = 2'h2 == opcodes_MPORT_302_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_1172 = 2'h3 == opcodes_MPORT_302_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_14989 = _T_1172 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_14997 = _T_1169 ? SP : _GEN_14989; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_15007 = _T_1166 ? 1'h0 : _T_1169; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_15012 = _T_1166 ? SP : _GEN_14997; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_15022 = _T_1163 ? 1'h0 : _T_1166; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_15029 = _T_1163 ? 1'h0 : _GEN_15007; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_15034 = _T_1163 ? SP : _GEN_15012; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_15039 = _T_35 & _T_1163; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_15046 = _T_35 & _GEN_15022; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_15053 = _T_35 & _GEN_15029; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_15058 = _T_35 ? _GEN_15034 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_15064 = _T_77 & _GEN_15039; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_15071 = _T_77 & _GEN_15046; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_15078 = _T_77 & _GEN_15053; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_15083 = _T_77 ? _GEN_15058 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_15093 = _T_4 ? 1'h0 : _GEN_15064; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_15100 = _T_4 ? 1'h0 : _GEN_15071; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_15107 = _T_4 ? 1'h0 : _GEN_15078; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_15112 = _T_4 ? SP : _GEN_15083; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _T_1174 = opcodes_MPORT_309_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_1175 = 8'h4 == _T_1174; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_16 = opcodes_alu_io_calc_type_MPORT_5_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_1178 = opcodes_MPORT_310_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_1179 = 8'h34 == _T_1178; // @[Core.scala 244:22]
  reg [7:0] temp_5; // @[Core.scala 245:25]
  wire [7:0] _GEN_15117 = _T_12 ? temp_5 : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [7:0] _GEN_15121 = _T_79 ? _GEN_15117 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_15125 = _T_77 ? 8'h0 : _GEN_15121; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_15131 = _T_25 ? 8'h0 : _GEN_15125; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_15139 = _T_4 ? 8'h0 : _GEN_15131; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_1187 = opcodes_MPORT_310_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_1188 = 8'h4 == _T_1187; // @[Core.scala 282:29]
  wire [7:0] _GEN_15150 = 8'h4 == _T_1187 ? regfiles_front_alu_io_input_A_MPORT_22_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_15153 = 8'h4 == _T_1187 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_15160 = 8'h34 == _T_1178 ? opcodes_alu_io_input_A_MPORT_20_data : _GEN_15150; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_15161 = 8'h34 == _T_1178 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_15162 = 8'h34 == _T_1178 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_15163 = 8'h34 == _T_1178 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_15164 = 8'h34 == _T_1178 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_15165 = 8'h34 == _T_1178 ? _GEN_15139 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_15168 = 8'h34 == _T_1178 ? 1'h0 : _T_1188; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_15172 = 8'h34 == _T_1178 ? 1'h0 : _GEN_15153; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_1191 = opcodes_MPORT_313_data; // @[Core.scala 737:27]
  wire  _T_1192 = 8'h76 == _T_1191; // @[Core.scala 737:27]
  wire [7:0] _T_1195 = opcodes_MPORT_315_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_1196 = 8'h70 == _T_1195; // @[Core.scala 738:27]
  wire [7:0] _GEN_15183 = _T_79 ? regfiles_front_io_bus_data1_MPORT_11_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_15193 = _T_4 ? 8'h0 : _GEN_15183; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_1202 = opcodes_MPORT_317_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_1203 = 8'h40 == _T_1202; // @[Core.scala 739:27]
  wire [2:0] src_reg_5 = opcodes_MPORT_318_data[2:0]; // @[Core.scala 298:27]
  wire  _T_1207 = src_reg_5 == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_96 = {regfiles_front_mem_refer_addr_hi_5_data,regfiles_front_mem_refer_addr_lo_11_data}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_15194 = src_reg_5 == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_15199 = src_reg_5 == 3'h6 ? _mem_refer_addr_T_96 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_15202 = src_reg_5 == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_15220 = _T_4 ? _GEN_15194 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_15223 = _T_4 & _T_1207; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_15225 = _T_4 ? _GEN_15199 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_15226 = _T_4 ? {{7'd0}, _T_1207} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_15229 = _T_4 & _GEN_15202; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_1211 = opcodes_MPORT_322_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_1212 = 8'h6 == _T_1211; // @[Core.scala 740:27]
  wire [15:0] _GEN_15238 = ~opcodes_MPORT_324_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [15:0] _GEN_15244 = _T_101 ? _GEN_15238 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [15:0] _GEN_15250 = _T_12 ? mem_refer_addr : _GEN_15244; // @[Core.scala 329:34 Core.scala 73:31]
  wire [15:0] _GEN_15265 = _T_4 ? _GEN_15250 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _T_1224 = opcodes_MPORT_328_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_1225 = 8'h80 == _T_1224; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_17 = opcodes_MPORT_329_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _T_1243 = opcodes_MPORT_331_data; // @[Core.scala 742:27]
  wire [7:0] _T_1245 = opcodes_MPORT_332_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_1247 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245; // @[Core.scala 742:51]
  wire  op_hi_17 = opcodes_op_MPORT_34_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_17 = opcodes_op_MPORT_35_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_23 = {op_hi_17,op_lo_17}; // @[Cat.scala 30:58]
  wire  _cond_T_561 = op_23 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_564 = op_23 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_567 = op_23 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_570 = op_23 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_573 = op_23 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_576 = op_23 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_579 = op_23 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_582 = op_23 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_585 = op_23 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_17 = _cond_T_561 | (_cond_T_564 | (_cond_T_567 | (_cond_T_570 | (_cond_T_573 | (_cond_T_576 | (_cond_T_579
     | (_cond_T_582 | _cond_T_585))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_101 = {opcodes_PC_next_hi_17_data,opcodes_PC_next_lo_11_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_15288 = ~cond_17 ? _PC_next_T_1 : _PC_next_T_101; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_15291 = ~cond_17 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [15:0] _GEN_15295 = _T_198 ? _GEN_15288 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_15298 = _T_198 & _GEN_15291; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_15301 = _T_197 ? _PC_next_T_1 : _GEN_15295; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire  _GEN_15305 = _T_197 ? 1'h0 : _GEN_15298; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_15309 = _T_12 ? _GEN_15301 : PC_next; // @[Core.scala 428:34 Core.scala 58:24]
  wire  _GEN_15313 = _T_12 & _GEN_15305; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_15322 = _T_25 ? _GEN_15309 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_15326 = _T_25 & _GEN_15313; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_15336 = _T_4 ? PC_next : _GEN_15322; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire  _GEN_15339 = _T_4 ? 1'h0 : _GEN_15326; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_1258 = opcodes_MPORT_335_data; // @[Core.scala 743:27]
  wire [7:0] _GEN_15363 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_10_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [7:0] _GEN_15381 = _T_198 ? $signed(8'sh0) : $signed(_GEN_15363); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_15392 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_11_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [7:0] _GEN_15399 = _T_77 ? $signed(_GEN_15392) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_15410 = _T_25 ? $signed(_GEN_15381) : $signed(_GEN_15399); // @[Conditional.scala 39:67]
  wire [7:0] _GEN_15428 = _T_4 ? $signed(8'sh0) : $signed(_GEN_15410); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_15437 = 8'hdd == _T_1258 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_15438 = 8'hdd == _T_1258 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_15439 = 8'hdd == _T_1258 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_15440 = 8'hdd == _T_1258 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_15441 = 8'hdd == _T_1258 ? _GEN_3199 : PC_next; // @[Core.scala 743:52 Core.scala 58:24]
  wire  _GEN_15445 = 8'hdd == _T_1258 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_15446 = 8'hdd == _T_1258 ? $signed(_GEN_15428) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_15449 = 8'hdd == _T_1258 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_15454 = 8'hdd == _T_1258 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_15458 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? _GEN_683 : _GEN_15438; // @[Core.scala 742:90]
  wire [7:0] _GEN_15459 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? _GEN_684 : _GEN_15437; // @[Core.scala 742:90]
  wire [15:0] _GEN_15460 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? _GEN_685 : _GEN_15439; // @[Core.scala 742:90]
  wire  _GEN_15463 = (8'hc3 == _T_1243 | 8'hc2 == _T_1245) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_15466 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? _GEN_15336 : _GEN_15441; // @[Core.scala 742:90]
  wire  _GEN_15469 = (8'hc3 == _T_1243 | 8'hc2 == _T_1245) & _GEN_15339; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_15473 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_15474 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? dummy_cycle : _GEN_15440; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_15478 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? 1'h0 : _GEN_15445; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_15479 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? $signed(8'sh0) : $signed(_GEN_15446); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_15482 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? 1'h0 : _GEN_15449; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_15487 = 8'hc3 == _T_1243 | 8'hc2 == _T_1245 ? 1'h0 : _GEN_15454; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_15492 = 8'h80 == _T_1224 ? regfiles_front_alu_io_input_A_MPORT_23_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_15494 = 8'h80 == _T_1224 ? regfiles_front_alu_io_input_B_MPORT_11_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_15495 = 8'h80 == _T_1224 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_15496 = 8'h80 == _T_1224 ? _alu_io_calc_type_T_17 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_15499 = 8'h80 == _T_1224 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_15502 = 8'h80 == _T_1224 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_15505 = 8'h80 == _T_1224 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_15508 = 8'h80 == _T_1224 ? 1'h0 : _T_1247; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_15509 = 8'h80 == _T_1224 ? machine_state_next : _GEN_15458; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_15510 = 8'h80 == _T_1224 ? opcode_index : _GEN_15459; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_15511 = 8'h80 == _T_1224 ? mem_refer_addr : _GEN_15460; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_15514 = 8'h80 == _T_1224 ? 1'h0 : _GEN_15463; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_15517 = 8'h80 == _T_1224 ? PC_next : _GEN_15466; // @[Core.scala 741:52 Core.scala 58:24]
  wire  _GEN_15520 = 8'h80 == _T_1224 ? 1'h0 : _GEN_15469; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_15524 = 8'h80 == _T_1224 ? 1'h0 : _GEN_15473; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_15525 = 8'h80 == _T_1224 ? dummy_cycle : _GEN_15474; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_15529 = 8'h80 == _T_1224 ? 1'h0 : _GEN_15478; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_15530 = 8'h80 == _T_1224 ? $signed(8'sh0) : $signed(_GEN_15479); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_15533 = 8'h80 == _T_1224 ? 1'h0 : _GEN_15482; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_15538 = 8'h80 == _T_1224 ? 1'h0 : _GEN_15487; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_15542 = 8'h6 == _T_1211 ? _GEN_615 : _GEN_15510; // @[Core.scala 740:52]
  wire [2:0] _GEN_15543 = 8'h6 == _T_1211 ? _GEN_616 : _GEN_15509; // @[Core.scala 740:52]
  wire  _GEN_15546 = 8'h6 == _T_1211 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_15547 = 8'h6 == _T_1211 ? _GEN_15265 : _GEN_15511; // @[Core.scala 740:52]
  wire  _GEN_15550 = 8'h6 == _T_1211 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_15554 = 8'h6 == _T_1211 ? _GEN_3048 : _GEN_15517; // @[Core.scala 740:52]
  wire  _GEN_15557 = 8'h6 == _T_1211 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_15560 = 8'h6 == _T_1211 ? 1'h0 : _T_1225; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_15562 = 8'h6 == _T_1211 ? 8'h0 : _GEN_15492; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_15564 = 8'h6 == _T_1211 ? 8'h0 : _GEN_15494; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_15565 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15495; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_15566 = 8'h6 == _T_1211 ? 8'h0 : _GEN_15496; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_15569 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15499; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_15572 = 8'h6 == _T_1211 ? F : _GEN_15502; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_15575 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15505; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_15578 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15508; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_15581 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15514; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_15586 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15520; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_15590 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15524; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_15591 = 8'h6 == _T_1211 ? dummy_cycle : _GEN_15525; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_15595 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15529; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_15596 = 8'h6 == _T_1211 ? $signed(8'sh0) : $signed(_GEN_15530); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_15599 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15533; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_15604 = 8'h6 == _T_1211 ? 1'h0 : _GEN_15538; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_15608 = 8'h40 == _T_1202 ? _GEN_15220 : _GEN_15543; // @[Core.scala 739:52]
  wire  _GEN_15611 = 8'h40 == _T_1202 & _GEN_15223; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_15613 = 8'h40 == _T_1202 ? _GEN_15225 : _GEN_15547; // @[Core.scala 739:52]
  wire [7:0] _GEN_15614 = 8'h40 == _T_1202 ? _GEN_15226 : _GEN_15542; // @[Core.scala 739:52]
  wire  _GEN_15617 = 8'h40 == _T_1202 & _GEN_15229; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_15623 = 8'h40 == _T_1202 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_15628 = 8'h40 == _T_1202 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_15631 = 8'h40 == _T_1202 ? 1'h0 : _T_1212; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15634 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15546; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15637 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15550; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_15641 = 8'h40 == _T_1202 ? PC_next : _GEN_15554; // @[Core.scala 739:52 Core.scala 58:24]
  wire  _GEN_15644 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15557; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15647 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15560; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_15649 = 8'h40 == _T_1202 ? 8'h0 : _GEN_15562; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_15651 = 8'h40 == _T_1202 ? 8'h0 : _GEN_15564; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_15652 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15565; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_15653 = 8'h40 == _T_1202 ? 8'h0 : _GEN_15566; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_15656 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15569; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_15659 = 8'h40 == _T_1202 ? F : _GEN_15572; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_15662 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15575; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15665 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15578; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15668 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15581; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15673 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15586; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_15677 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15590; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_15678 = 8'h40 == _T_1202 ? dummy_cycle : _GEN_15591; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_15682 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15595; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_15683 = 8'h40 == _T_1202 ? $signed(8'sh0) : $signed(_GEN_15596); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_15686 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15599; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_15691 = 8'h40 == _T_1202 ? 1'h0 : _GEN_15604; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_15692 = 8'h70 == _T_1195 ? _GEN_541 : _GEN_15608; // @[Core.scala 738:52]
  wire [7:0] _GEN_15693 = 8'h70 == _T_1195 ? _GEN_542 : _GEN_15614; // @[Core.scala 738:52]
  wire [15:0] _GEN_15694 = 8'h70 == _T_1195 ? _GEN_543 : _GEN_15613; // @[Core.scala 738:52]
  wire  _GEN_15697 = 8'h70 == _T_1195 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_15699 = 8'h70 == _T_1195 ? _GEN_15193 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_15702 = 8'h70 == _T_1195 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_15705 = 8'h70 == _T_1195 ? 1'h0 : _T_1203; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15708 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15611; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_15712 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15617; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_15718 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15623; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_15723 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15628; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15726 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15631; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15729 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15634; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15732 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15637; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_15736 = 8'h70 == _T_1195 ? PC_next : _GEN_15641; // @[Core.scala 738:52 Core.scala 58:24]
  wire  _GEN_15739 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15644; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15742 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15647; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_15744 = 8'h70 == _T_1195 ? 8'h0 : _GEN_15649; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_15746 = 8'h70 == _T_1195 ? 8'h0 : _GEN_15651; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_15747 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15652; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_15748 = 8'h70 == _T_1195 ? 8'h0 : _GEN_15653; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_15751 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15656; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_15754 = 8'h70 == _T_1195 ? F : _GEN_15659; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_15757 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15662; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15760 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15665; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15763 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15668; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15768 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15673; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_15772 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15677; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_15773 = 8'h70 == _T_1195 ? dummy_cycle : _GEN_15678; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_15777 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15682; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_15778 = 8'h70 == _T_1195 ? $signed(8'sh0) : $signed(_GEN_15683); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_15781 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15686; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_15786 = 8'h70 == _T_1195 ? 1'h0 : _GEN_15691; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_15787 = 8'h76 == _T_1191 ? 3'h1 : _GEN_15692; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_15788 = 8'h76 == _T_1191 ? 8'h0 : _GEN_15693; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_15789 = 8'h76 == _T_1191 ? PC : _GEN_15694; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_15790 = 8'h76 == _T_1191 ? PC_next : _GEN_15736; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_15793 = 8'h76 == _T_1191 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_15796 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15697; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_15798 = 8'h76 == _T_1191 ? 8'h0 : _GEN_15699; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_15801 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15702; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15804 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15705; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15807 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15708; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_15811 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15712; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_15817 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15718; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_15822 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15723; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15825 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15726; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15828 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15729; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15831 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15732; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15837 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15739; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15840 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15742; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_15842 = 8'h76 == _T_1191 ? 8'h0 : _GEN_15744; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_15844 = 8'h76 == _T_1191 ? 8'h0 : _GEN_15746; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_15845 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15747; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_15846 = 8'h76 == _T_1191 ? 8'h0 : _GEN_15748; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_15849 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15751; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_15852 = 8'h76 == _T_1191 ? F : _GEN_15754; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_15855 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15757; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15858 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15760; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15861 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15763; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15866 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15768; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_15870 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15772; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_15871 = 8'h76 == _T_1191 ? dummy_cycle : _GEN_15773; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_15875 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15777; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_15876 = 8'h76 == _T_1191 ? $signed(8'sh0) : $signed(_GEN_15778); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_15879 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15781; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_15884 = 8'h76 == _T_1191 ? 1'h0 : _GEN_15786; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_15888 = 8'h4 == _T_1174 ? 8'h1 : _GEN_15844; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_15889 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15845; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_15890 = 8'h4 == _T_1174 ? _alu_io_calc_type_T_16 : _GEN_15846; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_15893 = 8'h4 == _T_1174 & _T_1179; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_15894 = 8'h4 == _T_1174 ? _GEN_15160 : _GEN_15842; // @[Core.scala 736:52]
  wire [2:0] _GEN_15895 = 8'h4 == _T_1174 ? _GEN_15161 : _GEN_15787; // @[Core.scala 736:52]
  wire [15:0] _GEN_15896 = 8'h4 == _T_1174 ? _GEN_15162 : _GEN_15789; // @[Core.scala 736:52]
  wire [7:0] _GEN_15897 = 8'h4 == _T_1174 ? _GEN_15163 : _GEN_15788; // @[Core.scala 736:52]
  wire [2:0] _GEN_15898 = 8'h4 == _T_1174 ? _GEN_15164 : _GEN_15871; // @[Core.scala 736:52]
  wire [7:0] _GEN_15899 = 8'h4 == _T_1174 ? _GEN_15165 : _GEN_15798; // @[Core.scala 736:52]
  wire  _GEN_15902 = 8'h4 == _T_1174 & _GEN_15168; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15906 = 8'h4 == _T_1174 & _GEN_15172; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15912 = 8'h4 == _T_1174 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_15913 = 8'h4 == _T_1174 ? PC_next : _GEN_15790; // @[Core.scala 736:52 Core.scala 58:24]
  wire  _GEN_15916 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15793; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15919 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15796; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15923 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15801; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15926 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15804; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15929 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15807; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_15933 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15811; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_15939 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15817; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_15944 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15822; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15947 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15825; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15950 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15828; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15953 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15831; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15959 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15837; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15962 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15840; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15967 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15849; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_15970 = 8'h4 == _T_1174 ? F : _GEN_15852; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_15973 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15855; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15976 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15858; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15979 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15861; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15984 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15866; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15988 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15870; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_15992 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15875; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_15993 = 8'h4 == _T_1174 ? $signed(8'sh0) : $signed(_GEN_15876); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_15996 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15879; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_16001 = 8'h4 == _T_1174 ? 1'h0 : _GEN_15884; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_16011 = 8'h3 == _T_1153 ? input_5 : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_16012 = 8'h3 == _T_1153 ? $signed({{6{_alu16_io_offset_T_27[1]}},_alu16_io_offset_T_27}) : $signed(
    _GEN_15993); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_16013 = 8'h3 == _T_1153 ? _GEN_443 : _GEN_15895; // @[Core.scala 735:52]
  wire [2:0] _GEN_16014 = 8'h3 == _T_1153 ? _GEN_445 : _GEN_15898; // @[Core.scala 735:52]
  wire  _GEN_16017 = 8'h3 == _T_1153 & _GEN_15093; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_16024 = 8'h3 == _T_1153 & _GEN_15100; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_16031 = 8'h3 == _T_1153 & _GEN_15107; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_16036 = 8'h3 == _T_1153 ? _GEN_15112 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_16037 = 8'h3 == _T_1153 ? _GEN_468 : _GEN_15897; // @[Core.scala 735:52]
  wire  _GEN_16040 = 8'h3 == _T_1153 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_16043 = 8'h3 == _T_1153 ? 1'h0 : _T_1175; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_16044 = 8'h3 == _T_1153 ? 8'h0 : _GEN_15888; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_16045 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15889; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_16046 = 8'h3 == _T_1153 ? 8'h0 : _GEN_15890; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_16049 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15893; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_16050 = 8'h3 == _T_1153 ? 8'h0 : _GEN_15894; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_16051 = 8'h3 == _T_1153 ? mem_refer_addr : _GEN_15896; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_16052 = 8'h3 == _T_1153 ? 8'h0 : _GEN_15899; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_16055 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15902; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16059 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15906; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16065 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15912; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_16066 = 8'h3 == _T_1153 ? PC_next : _GEN_15913; // @[Core.scala 735:52 Core.scala 58:24]
  wire  _GEN_16069 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15916; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16072 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15919; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16076 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15923; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16079 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15926; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16082 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15929; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_16086 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15933; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_16092 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15939; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_16097 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15944; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16100 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15947; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16103 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15950; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16106 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15953; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16112 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15959; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16115 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15962; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16120 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15967; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_16123 = 8'h3 == _T_1153 ? F : _GEN_15970; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_16126 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15973; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16129 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15976; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16132 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15979; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16137 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15984; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16141 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15988; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16144 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15992; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_16147 = 8'h3 == _T_1153 ? 1'h0 : _GEN_15996; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_16152 = 8'h3 == _T_1153 ? 1'h0 : _GEN_16001; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_16156 = 8'hc0 == _T_1141 ? _GEN_14978 : _GEN_16013; // @[Core.scala 734:52]
  wire [2:0] _GEN_16157 = 8'hc0 == _T_1141 ? _GEN_334 : _GEN_16014; // @[Core.scala 734:52]
  wire [15:0] _GEN_16158 = 8'hc0 == _T_1141 ? _GEN_335 : _GEN_16051; // @[Core.scala 734:52]
  wire [7:0] _GEN_16159 = 8'hc0 == _T_1141 ? _GEN_14981 : _GEN_16037; // @[Core.scala 734:52]
  wire [15:0] _GEN_16160 = 8'hc0 == _T_1141 ? _GEN_337 : _GEN_16036; // @[Core.scala 734:52]
  wire  _GEN_16163 = 8'hc0 == _T_1141 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_16164 = 8'hc0 == _T_1141 ? _GEN_14986 : _GEN_16066; // @[Core.scala 734:52]
  wire  _GEN_16167 = 8'hc0 == _T_1141 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_16170 = 8'hc0 == _T_1141 ? 1'h0 : _T_1154; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_16177 = 8'hc0 == _T_1141 ? 16'h0 : _GEN_16011; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_16178 = 8'hc0 == _T_1141 ? $signed(8'sh0) : $signed(_GEN_16012); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_16181 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16017; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16188 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16024; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16195 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16031; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16202 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16040; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16205 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16043; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_16206 = 8'hc0 == _T_1141 ? 8'h0 : _GEN_16044; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_16207 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16045; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_16208 = 8'hc0 == _T_1141 ? 8'h0 : _GEN_16046; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_16211 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16049; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_16212 = 8'hc0 == _T_1141 ? 8'h0 : _GEN_16050; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_16213 = 8'hc0 == _T_1141 ? 8'h0 : _GEN_16052; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_16216 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16055; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16220 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16059; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16226 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16065; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16229 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16069; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16232 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16072; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16236 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16076; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16239 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16079; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16242 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16082; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16246 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16086; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16252 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16092; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16257 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16097; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16260 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16100; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16263 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16103; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16266 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16106; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16272 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16112; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16275 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16115; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16280 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16120; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_16283 = 8'hc0 == _T_1141 ? F : _GEN_16123; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_16286 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16126; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16289 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16129; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16292 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16132; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16297 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16137; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16301 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16141; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16304 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16144; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_16307 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16147; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_16312 = 8'hc0 == _T_1141 ? 1'h0 : _GEN_16152; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_16316 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_14928 : _GEN_16164; // @[Core.scala 733:90]
  wire [2:0] _GEN_16317 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_14929 : _GEN_16156; // @[Core.scala 733:90]
  wire [15:0] _GEN_16318 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_285 : _GEN_16158; // @[Core.scala 733:90]
  wire [7:0] _GEN_16319 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_14931 : _GEN_16159; // @[Core.scala 733:90]
  wire [2:0] _GEN_16320 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_287 : _GEN_16157; // @[Core.scala 733:90]
  wire [15:0] _GEN_16321 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_288 : _GEN_16177; // @[Core.scala 733:90]
  wire [7:0] _GEN_16322 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? $signed({8{_GEN_289}}) : $signed(_GEN_16178); // @[Core.scala 733:90]
  wire [7:0] _GEN_16323 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_290 : _GEN_16213; // @[Core.scala 733:90]
  wire [15:0] _GEN_16324 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? _GEN_291 : _GEN_16160; // @[Core.scala 733:90]
  wire  _GEN_16327 = (8'hcd == _T_1118 | 8'hc4 == _T_1120) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16331 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_16334 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _T_1142; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16337 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16163; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16340 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16167; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16343 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16170; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16352 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16181; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16359 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16188; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16366 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16195; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16373 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16202; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16376 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16205; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_16377 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 8'h0 : _GEN_16206; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_16378 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16207; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_16379 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 8'h0 : _GEN_16208; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_16382 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16211; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_16383 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 8'h0 : _GEN_16212; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_16386 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16216; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16390 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16220; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16396 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16226; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16399 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16229; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16402 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16232; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16406 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16236; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16409 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16239; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16412 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16242; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16416 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16246; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16422 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16252; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16427 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16257; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16430 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16260; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16433 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16263; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16436 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16266; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16442 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16272; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16445 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16275; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16450 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16280; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_16453 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? F : _GEN_16283; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_16456 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16286; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16459 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16289; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16462 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16292; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16467 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16297; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16471 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16301; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16474 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16304; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16477 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16307; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_16482 = 8'hcd == _T_1118 | 8'hc4 == _T_1120 ? 1'h0 : _GEN_16312; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_16486 = 8'hf3 == _T_1114 ? opcodes_IFF_MPORT_5_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_16489 = 8'hf3 == _T_1114 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_16492 = 8'hf3 == _T_1114 ? 1'h0 : _T_1122; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_16493 = 8'hf3 == _T_1114 ? PC_next : _GEN_16316; // @[Core.scala 732:52 Core.scala 58:24]
  wire [2:0] _GEN_16494 = 8'hf3 == _T_1114 ? machine_state_next : _GEN_16317; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_16495 = 8'hf3 == _T_1114 ? mem_refer_addr : _GEN_16318; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_16496 = 8'hf3 == _T_1114 ? opcode_index : _GEN_16319; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_16497 = 8'hf3 == _T_1114 ? dummy_cycle : _GEN_16320; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_16498 = 8'hf3 == _T_1114 ? 16'h0 : _GEN_16321; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_16499 = 8'hf3 == _T_1114 ? $signed(8'sh0) : $signed(_GEN_16322); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_16500 = 8'hf3 == _T_1114 ? 8'h0 : _GEN_16323; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_16501 = 8'hf3 == _T_1114 ? SP : _GEN_16324; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_16504 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16327; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16508 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16331; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16511 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16334; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16514 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16337; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16517 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16340; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16520 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16343; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16529 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16352; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16536 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16359; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16543 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16366; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16550 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16373; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16553 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16376; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_16554 = 8'hf3 == _T_1114 ? 8'h0 : _GEN_16377; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_16555 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16378; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_16556 = 8'hf3 == _T_1114 ? 8'h0 : _GEN_16379; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_16559 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16382; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_16560 = 8'hf3 == _T_1114 ? 8'h0 : _GEN_16383; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_16563 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16386; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16567 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16390; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16573 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16396; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16576 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16399; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16579 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16402; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16583 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16406; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16586 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16409; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16589 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16412; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16593 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16416; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16599 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16422; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16604 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16427; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16607 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16430; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16610 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16433; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16613 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16436; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16619 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16442; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16622 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16445; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16627 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16450; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_16630 = 8'hf3 == _T_1114 ? F : _GEN_16453; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_16633 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16456; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16636 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16459; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16639 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16462; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16644 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16467; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16648 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16471; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16651 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16474; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_16654 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16477; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_16659 = 8'hf3 == _T_1114 ? 1'h0 : _GEN_16482; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_16660 = 8'hd3 == _T_1077 ? _GEN_163 : _GEN_16494; // @[Core.scala 731:52]
  wire [15:0] _GEN_16661 = 8'hd3 == _T_1077 ? _GEN_14809 : _GEN_16495; // @[Core.scala 731:52]
  wire [7:0] _GEN_16662 = 8'hd3 == _T_1077 ? _GEN_165 : _GEN_16496; // @[Core.scala 731:52]
  wire  _GEN_16665 = 8'hd3 == _T_1077 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_16666 = 8'hd3 == _T_1077 ? _GEN_2590 : _GEN_16493; // @[Core.scala 731:52]
  wire [15:0] _GEN_16667 = 8'hd3 == _T_1077 ? _GEN_14815 : PC; // @[Core.scala 731:52 Core.scala 756:15]
  wire  _GEN_16670 = 8'hd3 == _T_1077 & _GEN_14818; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_16671 = 8'hd3 == _T_1077 ? _GEN_14819 : _GEN_16500; // @[Core.scala 731:52]
  wire  _GEN_16674 = 8'hd3 == _T_1077 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16678 = 8'hd3 == _T_1077 & _GEN_14826; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16679 = 8'hd3 == _T_1077 ? _GEN_14827 : 1'h1; // @[Core.scala 731:52 Core.scala 757:14]
  wire  _GEN_16680 = 8'hd3 == _T_1077 ? _GEN_14828 : 1'h1; // @[Core.scala 731:52 Core.scala 758:14]
  wire  _GEN_16683 = 8'hd3 == _T_1077 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16686 = 8'hd3 == _T_1077 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16689 = 8'hd3 == _T_1077 & _GEN_14837; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16692 = 8'hd3 == _T_1077 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_16695 = 8'hd3 == _T_1077 ? 1'h0 : _T_1115; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16696 = 8'hd3 == _T_1077 ? IFF : _GEN_16486; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_16699 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16489; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16702 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16492; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_16703 = 8'hd3 == _T_1077 ? dummy_cycle : _GEN_16497; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_16704 = 8'hd3 == _T_1077 ? 16'h0 : _GEN_16498; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_16705 = 8'hd3 == _T_1077 ? $signed(8'sh0) : $signed(_GEN_16499); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_16706 = 8'hd3 == _T_1077 ? SP : _GEN_16501; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_16709 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16504; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16713 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16508; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16716 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16511; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16719 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16514; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16722 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16517; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16725 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16520; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16734 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16529; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16741 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16536; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16748 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16543; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16755 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16550; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16758 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16553; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_16759 = 8'hd3 == _T_1077 ? 8'h0 : _GEN_16554; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_16760 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16555; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_16761 = 8'hd3 == _T_1077 ? 8'h0 : _GEN_16556; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_16764 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16559; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_16765 = 8'hd3 == _T_1077 ? 8'h0 : _GEN_16560; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_16768 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16563; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16772 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16567; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16778 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16573; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16781 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16576; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16784 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16579; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16788 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16583; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16791 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16586; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16794 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16589; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16798 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16593; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16804 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16599; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16809 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16604; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16812 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16607; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16815 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16610; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16818 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16613; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16824 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16619; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16827 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16622; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16832 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16627; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_16835 = 8'hd3 == _T_1077 ? F : _GEN_16630; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_16838 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16633; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16841 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16636; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16844 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16639; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16849 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16644; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16853 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16648; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16856 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16651; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_16859 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16654; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_16864 = 8'hd3 == _T_1077 ? 1'h0 : _GEN_16659; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_16865 = 8'h0 == _T_1073 ? 3'h1 : _GEN_16660; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_16866 = 8'h0 == _T_1073 ? 8'h0 : _GEN_16662; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_16869 = 8'h0 == _T_1073 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_16870 = 8'h0 == _T_1073 ? mem_refer_addr : _GEN_16661; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_16873 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16665; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_16874 = 8'h0 == _T_1073 ? PC_next : _GEN_16666; // @[Core.scala 730:47 Core.scala 58:24]
  wire [15:0] _GEN_16875 = 8'h0 == _T_1073 ? PC : _GEN_16667; // @[Core.scala 730:47 Core.scala 756:15]
  wire  _GEN_16878 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16670; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_16879 = 8'h0 == _T_1073 ? 8'h0 : _GEN_16671; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_16882 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16674; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16886 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16678; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16887 = 8'h0 == _T_1073 | _GEN_16679; // @[Core.scala 730:47 Core.scala 757:14]
  wire  _GEN_16888 = 8'h0 == _T_1073 | _GEN_16680; // @[Core.scala 730:47 Core.scala 758:14]
  wire  _GEN_16891 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16683; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16894 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16686; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16897 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16689; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16900 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16692; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16903 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16695; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16904 = 8'h0 == _T_1073 ? IFF : _GEN_16696; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_16907 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16699; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16910 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16702; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_16911 = 8'h0 == _T_1073 ? dummy_cycle : _GEN_16703; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_16912 = 8'h0 == _T_1073 ? 16'h0 : _GEN_16704; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_16913 = 8'h0 == _T_1073 ? $signed(8'sh0) : $signed(_GEN_16705); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_16914 = 8'h0 == _T_1073 ? SP : _GEN_16706; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_16917 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16709; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16921 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16713; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16924 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16716; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16927 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16719; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16930 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16722; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16933 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16725; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16942 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16734; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_16949 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16741; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_16956 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16748; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_16963 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16755; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16966 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16758; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_16967 = 8'h0 == _T_1073 ? 8'h0 : _GEN_16759; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_16968 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16760; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_16969 = 8'h0 == _T_1073 ? 8'h0 : _GEN_16761; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_16972 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16764; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_16973 = 8'h0 == _T_1073 ? 8'h0 : _GEN_16765; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_16976 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16768; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16980 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16772; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16986 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16778; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16989 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16781; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16992 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16784; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16996 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16788; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_16999 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16791; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17002 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16794; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_17006 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16798; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_17012 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16804; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_17017 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16809; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17020 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16812; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17023 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16815; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17026 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16818; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17032 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16824; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17035 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16827; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17040 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16832; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_17043 = 8'h0 == _T_1073 ? F : _GEN_16835; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_17046 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16838; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17049 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16841; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17052 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16844; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17057 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16849; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17061 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16853; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17064 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16856; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_17067 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16859; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_17072 = 8'h0 == _T_1073 ? 1'h0 : _GEN_16864; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_17074 = _T_5 ? machine_state : machine_state_next; // @[Core.scala 906:32 Core.scala 67:30 Core.scala 910:23]
  wire [7:0] _T_1278 = opcodes_MPORT_340_data; // @[Core.scala 730:22]
  wire  _T_1279 = 8'h0 == _T_1278; // @[Core.scala 730:22]
  wire [7:0] _T_1282 = opcodes_MPORT_342_data & 8'hf7; // @[Core.scala 731:27]
  wire  _T_1283 = 8'hd3 == _T_1282; // @[Core.scala 731:27]
  wire [15:0] _mem_refer_addr_T_104 = {A,opcodes_mem_refer_addr_lo_12_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_17082 = _T_12 ? _mem_refer_addr_T_104 : mem_refer_addr; // @[Core.scala 558:32 Core.scala 560:26 Core.scala 73:31]
  reg  REG_27; // @[Core.scala 772:43]
  wire  _T_1295 = ~clock & REG_27; // @[Core.scala 772:33]
  wire [7:0] _GEN_17084 = ~opcodes_MPORT_344_data[3] ? A : 8'h0; // @[Core.scala 574:41 Core.scala 575:30 Core.scala 77:16]
  wire [7:0] _GEN_17088 = _T_1295 ? _GEN_17084 : 8'h0; // @[Core.scala 573:47 Core.scala 77:16]
  wire [7:0] _GEN_17089 = ~opcodes_MPORT_345_data[3] ? A : 8'h0; // @[Core.scala 580:39 Core.scala 581:28 Core.scala 77:16]
  reg  REG_28; // @[Core.scala 772:43]
  wire  _T_1304 = ~clock & REG_28; // @[Core.scala 772:33]
  wire  _GEN_17090 = opcodes_MPORT_346_data[3] ? 1'h0 : 1'h1; // @[Core.scala 585:41 Core.scala 586:28 Core.scala 757:14]
  wire  _GEN_17096 = _T_1304 ? _GEN_17090 : 1'h1; // @[Core.scala 583:47 Core.scala 757:14]
  wire  _GEN_17097 = _T_1304 ? opcodes_MPORT_346_data[3] : 1'h1; // @[Core.scala 583:47 Core.scala 758:14]
  wire [7:0] _GEN_17098 = ~opcodes_MPORT_347_data[3] ? A : 8'h0; // @[Core.scala 593:39 Core.scala 594:28 Core.scala 77:16]
  wire [7:0] _GEN_17099 = ~opcodes_MPORT_348_data[3] ? A : 8'h0; // @[Core.scala 599:39 Core.scala 600:28 Core.scala 77:16]
  reg  REG_29; // @[Core.scala 772:43]
  wire  _T_1316 = ~clock & REG_29; // @[Core.scala 772:33]
  wire [7:0] _GEN_17109 = _T_47 ? _GEN_17099 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_17119 = _T_44 ? _GEN_17098 : _GEN_17109; // @[Conditional.scala 39:67]
  wire  _GEN_17127 = _T_44 ? 1'h0 : _T_47 & _T_1316; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_17133 = _T_35 ? _GEN_17089 : _GEN_17119; // @[Conditional.scala 39:67]
  wire  _GEN_17137 = _T_35 & _T_1304; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_17138 = _T_35 ? _GEN_17096 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_17139 = _T_35 ? _GEN_17097 : 1'h1; // @[Conditional.scala 39:67]
  wire  _GEN_17149 = _T_35 ? 1'h0 : _GEN_17127; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_17153 = _T_28 & _T_1295; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_17154 = _T_28 ? _GEN_17088 : _GEN_17133; // @[Conditional.scala 40:58]
  wire  _GEN_17161 = _T_28 ? 1'h0 : _GEN_17137; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_17162 = _T_28 | _GEN_17138; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_17163 = _T_28 | _GEN_17139; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_17173 = _T_28 ? 1'h0 : _GEN_17149; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_17179 = _T_27 ? _GEN_17154 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_17187 = _T_27 ? _GEN_17162 : 1'h1; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_17188 = _T_27 ? _GEN_17163 : 1'h1; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire [15:0] _GEN_17204 = _T_25 ? _GEN_17082 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire  _GEN_17209 = _T_25 ? 1'h0 : _T_27 & _GEN_17153; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_17210 = _T_25 ? 8'h0 : _GEN_17179; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_17217 = _T_25 ? 1'h0 : _T_27 & _GEN_17161; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_17218 = _T_25 | _GEN_17187; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_17219 = _T_25 | _GEN_17188; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire  _GEN_17228 = _T_25 ? 1'h0 : _T_27 & _GEN_17173; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_17231 = _T_4 ? _GEN_5 : _GEN_17204; // @[Conditional.scala 40:58]
  wire  _GEN_17240 = _T_4 ? 1'h0 : _GEN_17209; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_17241 = _T_4 ? 8'h0 : _GEN_17210; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire  _GEN_17248 = _T_4 ? 1'h0 : _GEN_17217; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_17249 = _T_4 | _GEN_17218; // @[Conditional.scala 40:58 Core.scala 757:14]
  wire  _GEN_17250 = _T_4 | _GEN_17219; // @[Conditional.scala 40:58 Core.scala 758:14]
  wire  _GEN_17259 = _T_4 ? 1'h0 : _GEN_17228; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_1319 = opcodes_MPORT_350_data & 8'hf7; // @[Core.scala 732:27]
  wire  _T_1320 = 8'hf3 == _T_1319; // @[Core.scala 732:27]
  wire [7:0] _T_1323 = opcodes_MPORT_352_data; // @[Core.scala 733:27]
  wire [7:0] _T_1325 = opcodes_MPORT_353_data & 8'hc7; // @[Core.scala 733:65]
  wire  _T_1327 = 8'hcd == _T_1323 | 8'hc4 == _T_1325; // @[Core.scala 733:51]
  wire  op_hi_18 = opcodes_op_MPORT_36_data[0]; // @[Core.scala 623:38]
  wire [2:0] op_lo_18 = opcodes_op_MPORT_37_data[5:3]; // @[Core.scala 623:53]
  wire [3:0] op_24 = {op_hi_18,op_lo_18}; // @[Cat.scala 30:58]
  wire  _cond_T_594 = op_24 == 4'h9; // @[Core.scala 626:11]
  wire  _cond_T_597 = op_24 == 4'h0 & ~Z_flag; // @[Core.scala 627:25]
  wire  _cond_T_600 = op_24 == 4'h1 & Z_flag; // @[Core.scala 628:25]
  wire  _cond_T_603 = op_24 == 4'h2 & ~C_flag; // @[Core.scala 629:25]
  wire  _cond_T_606 = op_24 == 4'h3 & C_flag; // @[Core.scala 630:25]
  wire  _cond_T_609 = op_24 == 4'h4 & ~PV_flag; // @[Core.scala 631:25]
  wire  _cond_T_612 = op_24 == 4'h5 & PV_flag; // @[Core.scala 632:25]
  wire  _cond_T_615 = op_24 == 4'h6 & ~S_flag; // @[Core.scala 633:25]
  wire  _cond_T_618 = op_24 == 4'h7 & S_flag; // @[Core.scala 634:25]
  wire  cond_18 = _cond_T_594 | (_cond_T_597 | (_cond_T_600 | (_cond_T_603 | (_cond_T_606 | (_cond_T_609 | (_cond_T_612
     | (_cond_T_615 | _cond_T_618))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_17267 = cond_18 ? 3'h4 : 3'h1; // @[Core.scala 670:32 Core.scala 671:34 Core.scala 673:34]
  wire [7:0] _GEN_17268 = cond_18 ? _opcode_index_T_1 : 8'h0; // @[Core.scala 670:32 Core.scala 668:24 Core.scala 674:28]
  wire [2:0] _GEN_17269 = opcode_index == 8'h2 ? _GEN_17267 : machine_state_next; // @[Core.scala 669:36 Core.scala 68:35]
  wire [7:0] _GEN_17270 = opcode_index == 8'h2 ? _GEN_17268 : _opcode_index_T_1; // @[Core.scala 669:36 Core.scala 668:24]
  wire [7:0] _GEN_17274 = _T_35 ? _GEN_17270 : opcode_index; // @[Conditional.scala 40:58 Core.scala 725:29]
  wire [2:0] _GEN_17275 = _T_35 ? _GEN_17269 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [15:0] _PC_next_T_110 = {opcodes_PC_next_hi_18_data,opcodes_PC_next_lo_12_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_17288 = _T_82 ? _PC_next_T_110 : PC_next; // @[Conditional.scala 39:67 Core.scala 716:21 Core.scala 58:24]
  wire [15:0] _GEN_17300 = _T_81 ? PC_next : _GEN_17288; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_17312 = _T_12 ? _GEN_17300 : PC_next; // @[Core.scala 698:30 Core.scala 58:24]
  wire [15:0] _GEN_17324 = _T_79 ? _GEN_17312 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_17336 = _T_77 ? PC_next : _GEN_17324; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_17338 = _T_25 ? _GEN_2627 : _GEN_17336; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_17339 = _T_25 ? _GEN_17274 : _GEN_262; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17340 = _T_25 ? _GEN_17275 : _GEN_259; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_17350 = _T_4 ? _GEN_2617 : _GEN_17338; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_17351 = _T_4 ? _GEN_197 : _GEN_17340; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_17353 = _T_4 ? _GEN_199 : _GEN_17339; // @[Conditional.scala 40:58]
  wire [7:0] _T_1346 = opcodes_MPORT_355_data & 8'hc6; // @[Core.scala 734:27]
  wire  _T_1347 = 8'hc0 == _T_1346; // @[Core.scala 734:27]
  wire  op_hi_19 = opcodes_op_MPORT_38_data[0]; // @[Core.scala 492:40]
  wire [2:0] op_lo_19 = opcodes_op_MPORT_39_data[5:3]; // @[Core.scala 492:55]
  wire [3:0] op_25 = {op_hi_19,op_lo_19}; // @[Cat.scala 30:58]
  wire  _cond_T_627 = op_25 == 4'h9; // @[Core.scala 495:13]
  wire  _cond_T_630 = op_25 == 4'h0 & _cond_T_2; // @[Core.scala 496:27]
  wire  _cond_T_633 = op_25 == 4'h1 & Z_flag; // @[Core.scala 497:27]
  wire  _cond_T_636 = op_25 == 4'h2 & _cond_T_8; // @[Core.scala 498:27]
  wire  _cond_T_639 = op_25 == 4'h3 & C_flag; // @[Core.scala 499:27]
  wire  _cond_T_642 = op_25 == 4'h4 & _cond_T_14; // @[Core.scala 500:27]
  wire  _cond_T_645 = op_25 == 4'h5 & PV_flag; // @[Core.scala 501:27]
  wire  _cond_T_648 = op_25 == 4'h6 & _cond_T_20; // @[Core.scala 502:27]
  wire  _cond_T_651 = op_25 == 4'h7 & S_flag; // @[Core.scala 503:27]
  wire  cond_19 = _cond_T_627 | (_cond_T_630 | (_cond_T_633 | (_cond_T_636 | (_cond_T_639 | (_cond_T_642 | (_cond_T_645
     | (_cond_T_648 | _cond_T_651))))))); // @[Mux.scala 98:16]
  wire [2:0] _GEN_17363 = _cond_T_627 ? 3'h2 : 3'h4; // @[Core.scala 511:34 Core.scala 512:34 Core.scala 514:34]
  wire [2:0] _GEN_17364 = _T_35 ? _GEN_17363 : machine_state_next; // @[Conditional.scala 40:58 Core.scala 68:35]
  wire [2:0] _GEN_17368 = cond_19 ? 3'h2 : 3'h1; // @[Core.scala 523:26 Core.scala 524:30 Core.scala 526:30]
  wire [7:0] _GEN_17369 = cond_19 ? opcode_index : 8'h0; // @[Core.scala 523:26 Core.scala 725:29 Core.scala 527:24]
  wire [15:0] _PC_next_T_111 = {opcodes_PC_next_hi_19_data,io_bus_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_17373 = _T_75 ? _PC_next_T_111 : PC_next; // @[Core.scala 537:38 Core.scala 538:23 Core.scala 58:24]
  wire [15:0] _GEN_17382 = _T_35 ? _GEN_17373 : PC_next; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [15:0] _GEN_17390 = _T_25 ? _GEN_17382 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_17392 = _T_77 ? _GEN_17368 : _GEN_324; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_17393 = _T_77 ? _GEN_17369 : _GEN_318; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_17399 = _T_77 ? PC_next : _GEN_17390; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [2:0] _GEN_17400 = _T_4 ? _GEN_17364 : _GEN_17392; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_17403 = _T_4 ? _GEN_195 : _GEN_17393; // @[Conditional.scala 40:58]
  wire [15:0] _GEN_17408 = _T_4 ? PC_next : _GEN_17399; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire [7:0] _T_1358 = opcodes_MPORT_357_data & 8'hc7; // @[Core.scala 735:27]
  wire  _T_1359 = 8'h3 == _T_1358; // @[Core.scala 735:27]
  wire  _register_T_98 = opcodes_MPORT_358_data[5:4] == 2'h0; // @[Core.scala 177:25]
  wire [15:0] _register_T_99 = {regfiles_front_register_hi_18_data,regfiles_front_register_lo_18_data}; // @[Cat.scala 30:58]
  wire  _register_T_101 = opcodes_MPORT_358_data[5:4] == 2'h1; // @[Core.scala 178:25]
  wire [15:0] _register_T_102 = {regfiles_front_register_hi_19_data,regfiles_front_register_lo_19_data}; // @[Cat.scala 30:58]
  wire  _register_T_104 = opcodes_MPORT_358_data[5:4] == 2'h2; // @[Core.scala 179:25]
  wire [15:0] _register_T_105 = {regfiles_front_register_hi_20_data,regfiles_front_register_lo_20_data}; // @[Cat.scala 30:58]
  wire  _register_T_107 = opcodes_MPORT_358_data[5:4] == 2'h3; // @[Core.scala 180:25]
  wire [15:0] _register_T_108 = _register_T_107 ? SP : {{14'd0}, opcodes_MPORT_358_data[5:4]}; // @[Mux.scala 98:16]
  wire [15:0] _register_T_109 = _register_T_104 ? _register_T_105 : _register_T_108; // @[Mux.scala 98:16]
  wire [15:0] _register_T_110 = _register_T_101 ? _register_T_102 : _register_T_109; // @[Mux.scala 98:16]
  wire [15:0] register_6 = _register_T_98 ? _register_T_99 : _register_T_110; // @[Mux.scala 98:16]
  reg [15:0] input_6; // @[Core.scala 183:24]
  wire [1:0] _alu16_io_offset_T_32 = ~opcodes_MPORT_358_data[3] ? $signed(2'sh1) : $signed(-2'sh1); // @[Core.scala 189:27]
  wire  _T_1368 = 2'h0 == opcodes_MPORT_358_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_1371 = 2'h1 == opcodes_MPORT_358_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_1374 = 2'h2 == opcodes_MPORT_358_data[5:4]; // @[Conditional.scala 37:30]
  wire  _T_1377 = 2'h3 == opcodes_MPORT_358_data[5:4]; // @[Conditional.scala 37:30]
  wire [15:0] _GEN_17411 = _T_1377 ? alu16_io_output : SP; // @[Conditional.scala 39:67 Core.scala 223:20 Core.scala 113:19]
  wire [15:0] _GEN_17419 = _T_1374 ? SP : _GEN_17411; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_17429 = _T_1371 ? 1'h0 : _T_1374; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_17434 = _T_1371 ? SP : _GEN_17419; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_17444 = _T_1368 ? 1'h0 : _T_1371; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_17451 = _T_1368 ? 1'h0 : _GEN_17429; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_17456 = _T_1368 ? SP : _GEN_17434; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_17461 = _T_35 & _T_1368; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_17468 = _T_35 & _GEN_17444; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_17475 = _T_35 & _GEN_17451; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_17480 = _T_35 ? _GEN_17456 : SP; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire  _GEN_17486 = _T_77 & _GEN_17461; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_17493 = _T_77 & _GEN_17468; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_17500 = _T_77 & _GEN_17475; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire [15:0] _GEN_17505 = _T_77 ? _GEN_17480 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire  _GEN_17515 = _T_4 ? 1'h0 : _GEN_17486; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_17522 = _T_4 ? 1'h0 : _GEN_17493; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_17529 = _T_4 ? 1'h0 : _GEN_17500; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_17534 = _T_4 ? SP : _GEN_17505; // @[Conditional.scala 40:58 Core.scala 113:19]
  wire [7:0] _T_1379 = opcodes_MPORT_365_data & 8'hc6; // @[Core.scala 736:27]
  wire  _T_1380 = 8'h4 == _T_1379; // @[Core.scala 736:27]
  wire [7:0] _alu_io_calc_type_T_19 = opcodes_alu_io_calc_type_MPORT_6_data[0] ? 8'h90 : 8'h80; // @[Core.scala 243:28]
  wire [7:0] _T_1383 = opcodes_MPORT_366_data & 8'hfe; // @[Core.scala 244:22]
  wire  _T_1384 = 8'h34 == _T_1383; // @[Core.scala 244:22]
  reg [7:0] temp_6; // @[Core.scala 245:25]
  wire [7:0] _GEN_17539 = _T_12 ? temp_6 : 8'h0; // @[Core.scala 275:36 Core.scala 276:26 Core.scala 77:16]
  wire [7:0] _GEN_17543 = _T_79 ? _GEN_17539 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_17547 = _T_77 ? 8'h0 : _GEN_17543; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_17553 = _T_25 ? 8'h0 : _GEN_17547; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire [7:0] _GEN_17561 = _T_4 ? 8'h0 : _GEN_17553; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_1392 = opcodes_MPORT_366_data & 8'hc6; // @[Core.scala 282:29]
  wire  _T_1393 = 8'h4 == _T_1392; // @[Core.scala 282:29]
  wire [7:0] _GEN_17572 = 8'h4 == _T_1392 ? regfiles_front_alu_io_input_A_MPORT_26_data : 8'h0; // @[Core.scala 282:54 Core.scala 283:22 Core.scala 765:18]
  wire  _GEN_17575 = 8'h4 == _T_1392 & _T_101; // @[Core.scala 282:54 Core.scala 724:20]
  wire [7:0] _GEN_17582 = 8'h34 == _T_1383 ? opcodes_alu_io_input_A_MPORT_24_data : _GEN_17572; // @[Core.scala 244:47 Core.scala 247:22]
  wire [2:0] _GEN_17583 = 8'h34 == _T_1383 ? _GEN_489 : machine_state_next; // @[Core.scala 244:47 Core.scala 68:35]
  wire [15:0] _GEN_17584 = 8'h34 == _T_1383 ? _GEN_490 : mem_refer_addr; // @[Core.scala 244:47 Core.scala 73:31]
  wire [7:0] _GEN_17585 = 8'h34 == _T_1383 ? _GEN_491 : opcode_index; // @[Core.scala 244:47 Core.scala 725:29]
  wire [2:0] _GEN_17586 = 8'h34 == _T_1383 ? _GEN_493 : dummy_cycle; // @[Core.scala 244:47 Core.scala 775:28]
  wire [7:0] _GEN_17587 = 8'h34 == _T_1383 ? _GEN_17561 : 8'h0; // @[Core.scala 244:47 Core.scala 77:16]
  wire  _GEN_17590 = 8'h34 == _T_1383 ? 1'h0 : _T_1393; // @[Core.scala 244:47 Core.scala 724:20]
  wire  _GEN_17594 = 8'h34 == _T_1383 ? 1'h0 : _GEN_17575; // @[Core.scala 244:47 Core.scala 724:20]
  wire [7:0] _T_1396 = opcodes_MPORT_369_data; // @[Core.scala 737:27]
  wire  _T_1397 = 8'h76 == _T_1396; // @[Core.scala 737:27]
  wire [7:0] _T_1400 = opcodes_MPORT_371_data & 8'hf8; // @[Core.scala 738:27]
  wire  _T_1401 = 8'h70 == _T_1400; // @[Core.scala 738:27]
  wire [7:0] _GEN_17605 = _T_79 ? regfiles_front_io_bus_data1_MPORT_13_data : 8'h0; // @[Conditional.scala 39:67 Core.scala 404:22 Core.scala 77:16]
  wire [7:0] _GEN_17615 = _T_4 ? 8'h0 : _GEN_17605; // @[Conditional.scala 40:58 Core.scala 77:16]
  wire [7:0] _T_1407 = opcodes_MPORT_373_data & 8'hc0; // @[Core.scala 739:27]
  wire  _T_1408 = 8'h40 == _T_1407; // @[Core.scala 739:27]
  wire [2:0] src_reg_6 = opcodes_MPORT_374_data[2:0]; // @[Core.scala 298:27]
  wire  _T_1412 = src_reg_6 == 3'h6; // @[Core.scala 302:22]
  wire [15:0] _mem_refer_addr_T_113 = {regfiles_front_mem_refer_addr_hi_6_data,regfiles_front_mem_refer_addr_lo_13_data}
    ; // @[Cat.scala 30:58]
  wire [2:0] _GEN_17616 = src_reg_6 == 3'h6 ? 3'h2 : machine_state_next; // @[Core.scala 302:36 Core.scala 303:30 Core.scala 68:35]
  wire [15:0] _GEN_17621 = src_reg_6 == 3'h6 ? _mem_refer_addr_T_113 : mem_refer_addr; // @[Core.scala 302:36 Core.scala 304:26 Core.scala 73:31]
  wire  _GEN_17624 = src_reg_6 == 3'h6 ? 1'h0 : 1'h1; // @[Core.scala 302:36 Core.scala 90:27 Core.scala 307:25]
  wire [2:0] _GEN_17642 = _T_4 ? _GEN_17616 : _GEN_573; // @[Conditional.scala 40:58]
  wire  _GEN_17645 = _T_4 & _T_1412; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [15:0] _GEN_17647 = _T_4 ? _GEN_17621 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _GEN_17648 = _T_4 ? {{7'd0}, _T_1412} : _GEN_574; // @[Conditional.scala 40:58]
  wire  _GEN_17651 = _T_4 & _GEN_17624; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire [7:0] _T_1416 = opcodes_MPORT_378_data & 8'h87; // @[Core.scala 740:27]
  wire  _T_1417 = 8'h6 == _T_1416; // @[Core.scala 740:27]
  wire [15:0] _GEN_17660 = ~opcodes_MPORT_380_data[6] ? PC_next : _mem_refer_addr_T_9; // @[Core.scala 334:37 Core.scala 335:28 Core.scala 337:28]
  wire [15:0] _GEN_17666 = _T_101 ? _GEN_17660 : mem_refer_addr; // @[Core.scala 331:41 Core.scala 73:31]
  wire [15:0] _GEN_17672 = _T_12 ? mem_refer_addr : _GEN_17666; // @[Core.scala 329:34 Core.scala 73:31]
  wire [15:0] _GEN_17687 = _T_4 ? _GEN_17672 : mem_refer_addr; // @[Conditional.scala 40:58 Core.scala 73:31]
  wire [7:0] _T_1429 = opcodes_MPORT_384_data & 8'hc8; // @[Core.scala 741:27]
  wire  _T_1430 = 8'h80 == _T_1429; // @[Core.scala 741:27]
  wire [7:0] _alu_io_calc_type_T_20 = opcodes_MPORT_385_data & 8'hf8; // @[Core.scala 354:32]
  wire [7:0] _T_1448 = opcodes_MPORT_387_data; // @[Core.scala 742:27]
  wire [7:0] _T_1450 = opcodes_MPORT_388_data & 8'hc7; // @[Core.scala 742:65]
  wire  _T_1452 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450; // @[Core.scala 742:51]
  wire  op_hi_20 = opcodes_op_MPORT_40_data[0]; // @[Core.scala 413:40]
  wire [2:0] op_lo_20 = opcodes_op_MPORT_41_data[5:3]; // @[Core.scala 413:55]
  wire [3:0] op_27 = {op_hi_20,op_lo_20}; // @[Cat.scala 30:58]
  wire  _cond_T_660 = op_27 == 4'h8; // @[Core.scala 443:23]
  wire  _cond_T_663 = op_27 == 4'h0 & _cond_T_2; // @[Core.scala 444:37]
  wire  _cond_T_666 = op_27 == 4'h1 & Z_flag; // @[Core.scala 445:37]
  wire  _cond_T_669 = op_27 == 4'h2 & _cond_T_8; // @[Core.scala 446:37]
  wire  _cond_T_672 = op_27 == 4'h3 & C_flag; // @[Core.scala 447:37]
  wire  _cond_T_675 = op_27 == 4'h4 & _cond_T_14; // @[Core.scala 448:37]
  wire  _cond_T_678 = op_27 == 4'h5 & PV_flag; // @[Core.scala 449:37]
  wire  _cond_T_681 = op_27 == 4'h6 & _cond_T_20; // @[Core.scala 450:37]
  wire  _cond_T_684 = op_27 == 4'h7 & S_flag; // @[Core.scala 451:37]
  wire  cond_20 = _cond_T_660 | (_cond_T_663 | (_cond_T_666 | (_cond_T_669 | (_cond_T_672 | (_cond_T_675 | (_cond_T_678
     | (_cond_T_681 | _cond_T_684))))))); // @[Mux.scala 98:16]
  wire [15:0] _PC_next_T_118 = {opcodes_PC_next_hi_20_data,opcodes_PC_next_lo_13_data}; // @[Cat.scala 30:58]
  wire [15:0] _GEN_17710 = ~cond_20 ? _PC_next_T_1 : _PC_next_T_118; // @[Core.scala 455:34 Core.scala 456:25 Core.scala 458:25]
  wire  _GEN_17713 = ~cond_20 ? 1'h0 : 1'h1; // @[Core.scala 455:34 Core.scala 724:20 Core.scala 458:39]
  wire [15:0] _GEN_17717 = _T_198 ? _GEN_17710 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_17720 = _T_198 & _GEN_17713; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_17723 = _T_197 ? _PC_next_T_1 : _GEN_17717; // @[Conditional.scala 40:58 Core.scala 433:23]
  wire  _GEN_17727 = _T_197 ? 1'h0 : _GEN_17720; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_17731 = _T_12 ? _GEN_17723 : PC_next; // @[Core.scala 428:34 Core.scala 58:24]
  wire  _GEN_17735 = _T_12 & _GEN_17727; // @[Core.scala 428:34 Core.scala 724:20]
  wire [15:0] _GEN_17744 = _T_25 ? _GEN_17731 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire  _GEN_17748 = _T_25 & _GEN_17735; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_17758 = _T_4 ? PC_next : _GEN_17744; // @[Conditional.scala 40:58 Core.scala 58:24]
  wire  _GEN_17761 = _T_4 ? 1'h0 : _GEN_17748; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _T_1463 = opcodes_MPORT_391_data; // @[Core.scala 743:27]
  wire [7:0] _GEN_17785 = _T_81 ? $signed(opcodes_alu16_io_offset_MPORT_12_data) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 151:29 Core.scala 56:19]
  wire [7:0] _GEN_17803 = _T_198 ? $signed(8'sh0) : $signed(_GEN_17785); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_17814 = m1_t_cycle == 8'h4 ? $signed(opcodes_alu16_io_offset_MPORT_13_data) : $signed(8'sh0); // @[Core.scala 165:32 Core.scala 167:27 Core.scala 56:19]
  wire [7:0] _GEN_17821 = _T_77 ? $signed(_GEN_17814) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [7:0] _GEN_17832 = _T_25 ? $signed(_GEN_17803) : $signed(_GEN_17821); // @[Conditional.scala 39:67]
  wire [7:0] _GEN_17850 = _T_4 ? $signed(8'sh0) : $signed(_GEN_17832); // @[Conditional.scala 40:58 Core.scala 56:19]
  wire [7:0] _GEN_17859 = 8'hdd == _T_1463 ? _GEN_774 : opcode_index; // @[Core.scala 743:52 Core.scala 725:29]
  wire [2:0] _GEN_17860 = 8'hdd == _T_1463 ? _GEN_775 : machine_state_next; // @[Core.scala 743:52 Core.scala 68:35]
  wire [15:0] _GEN_17861 = 8'hdd == _T_1463 ? _GEN_776 : mem_refer_addr; // @[Core.scala 743:52 Core.scala 73:31]
  wire [2:0] _GEN_17862 = 8'hdd == _T_1463 ? _GEN_777 : dummy_cycle; // @[Core.scala 743:52 Core.scala 775:28]
  wire [15:0] _GEN_17863 = 8'hdd == _T_1463 ? _GEN_3199 : PC_next; // @[Core.scala 743:52 Core.scala 58:24]
  wire  _GEN_17867 = 8'hdd == _T_1463 & _GEN_782; // @[Core.scala 743:52 Core.scala 724:20]
  wire [7:0] _GEN_17868 = 8'hdd == _T_1463 ? $signed(_GEN_17850) : $signed(8'sh0); // @[Core.scala 743:52 Core.scala 56:19]
  wire  _GEN_17871 = 8'hdd == _T_1463 & _GEN_786; // @[Core.scala 743:52 Core.scala 90:27]
  wire  _GEN_17876 = 8'hdd == _T_1463 & _GEN_791; // @[Core.scala 743:52 Core.scala 724:20]
  wire [2:0] _GEN_17880 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? _GEN_683 : _GEN_17860; // @[Core.scala 742:90]
  wire [7:0] _GEN_17881 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? _GEN_684 : _GEN_17859; // @[Core.scala 742:90]
  wire [15:0] _GEN_17882 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? _GEN_685 : _GEN_17861; // @[Core.scala 742:90]
  wire  _GEN_17885 = (8'hc3 == _T_1448 | 8'hc2 == _T_1450) & _GEN_623; // @[Core.scala 742:90 Core.scala 724:20]
  wire [15:0] _GEN_17888 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? _GEN_17758 : _GEN_17863; // @[Core.scala 742:90]
  wire  _GEN_17891 = (8'hc3 == _T_1448 | 8'hc2 == _T_1450) & _GEN_17761; // @[Core.scala 742:90 Core.scala 724:20]
  wire  _GEN_17895 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? 1'h0 : 1'h1; // @[Core.scala 742:90 Core.scala 724:20 Core.scala 743:23]
  wire [2:0] _GEN_17896 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? dummy_cycle : _GEN_17862; // @[Core.scala 742:90 Core.scala 775:28]
  wire  _GEN_17900 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? 1'h0 : _GEN_17867; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_17901 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? $signed(8'sh0) : $signed(_GEN_17868); // @[Core.scala 742:90 Core.scala 56:19]
  wire  _GEN_17904 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? 1'h0 : _GEN_17871; // @[Core.scala 742:90 Core.scala 90:27]
  wire  _GEN_17909 = 8'hc3 == _T_1448 | 8'hc2 == _T_1450 ? 1'h0 : _GEN_17876; // @[Core.scala 742:90 Core.scala 724:20]
  wire [7:0] _GEN_17914 = 8'h80 == _T_1429 ? regfiles_front_alu_io_input_A_MPORT_27_data : 8'h0; // @[Core.scala 741:52 Core.scala 351:20 Core.scala 765:18]
  wire [7:0] _GEN_17916 = 8'h80 == _T_1429 ? regfiles_front_alu_io_input_B_MPORT_13_data : 8'h0; // @[Core.scala 741:52 Core.scala 352:20 Core.scala 766:18]
  wire  _GEN_17917 = 8'h80 == _T_1429 & C_flag; // @[Core.scala 741:52 Core.scala 353:24 Core.scala 768:22]
  wire [7:0] _GEN_17918 = 8'h80 == _T_1429 ? _alu_io_calc_type_T_20 : 8'h0; // @[Core.scala 741:52 Core.scala 354:22 Core.scala 767:20]
  wire  _GEN_17921 = 8'h80 == _T_1429 & _GEN_636; // @[Core.scala 741:52 Core.scala 90:27]
  wire [7:0] _GEN_17924 = 8'h80 == _T_1429 ? _GEN_639 : F; // @[Core.scala 741:52 Core.scala 41:18]
  wire  _GEN_17927 = 8'h80 == _T_1429 ? 1'h0 : 1'h1; // @[Core.scala 741:52 Core.scala 724:20 Core.scala 742:23]
  wire  _GEN_17930 = 8'h80 == _T_1429 ? 1'h0 : _T_1452; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_17931 = 8'h80 == _T_1429 ? machine_state_next : _GEN_17880; // @[Core.scala 741:52 Core.scala 68:35]
  wire [7:0] _GEN_17932 = 8'h80 == _T_1429 ? opcode_index : _GEN_17881; // @[Core.scala 741:52 Core.scala 725:29]
  wire [15:0] _GEN_17933 = 8'h80 == _T_1429 ? mem_refer_addr : _GEN_17882; // @[Core.scala 741:52 Core.scala 73:31]
  wire  _GEN_17936 = 8'h80 == _T_1429 ? 1'h0 : _GEN_17885; // @[Core.scala 741:52 Core.scala 724:20]
  wire [15:0] _GEN_17939 = 8'h80 == _T_1429 ? PC_next : _GEN_17888; // @[Core.scala 741:52 Core.scala 58:24]
  wire  _GEN_17942 = 8'h80 == _T_1429 ? 1'h0 : _GEN_17891; // @[Core.scala 741:52 Core.scala 724:20]
  wire  _GEN_17946 = 8'h80 == _T_1429 ? 1'h0 : _GEN_17895; // @[Core.scala 741:52 Core.scala 724:20]
  wire [2:0] _GEN_17947 = 8'h80 == _T_1429 ? dummy_cycle : _GEN_17896; // @[Core.scala 741:52 Core.scala 775:28]
  wire  _GEN_17951 = 8'h80 == _T_1429 ? 1'h0 : _GEN_17900; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_17952 = 8'h80 == _T_1429 ? $signed(8'sh0) : $signed(_GEN_17901); // @[Core.scala 741:52 Core.scala 56:19]
  wire  _GEN_17955 = 8'h80 == _T_1429 ? 1'h0 : _GEN_17904; // @[Core.scala 741:52 Core.scala 90:27]
  wire  _GEN_17960 = 8'h80 == _T_1429 ? 1'h0 : _GEN_17909; // @[Core.scala 741:52 Core.scala 724:20]
  wire [7:0] _GEN_17964 = 8'h6 == _T_1416 ? _GEN_615 : _GEN_17932; // @[Core.scala 740:52]
  wire [2:0] _GEN_17965 = 8'h6 == _T_1416 ? _GEN_616 : _GEN_17931; // @[Core.scala 740:52]
  wire  _GEN_17968 = 8'h6 == _T_1416 & _GEN_619; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_17969 = 8'h6 == _T_1416 ? _GEN_17687 : _GEN_17933; // @[Core.scala 740:52]
  wire  _GEN_17972 = 8'h6 == _T_1416 & _GEN_623; // @[Core.scala 740:52 Core.scala 724:20]
  wire [15:0] _GEN_17976 = 8'h6 == _T_1416 ? _GEN_3048 : _GEN_17939; // @[Core.scala 740:52]
  wire  _GEN_17979 = 8'h6 == _T_1416 ? 1'h0 : 1'h1; // @[Core.scala 740:52 Core.scala 724:20 Core.scala 741:23]
  wire  _GEN_17982 = 8'h6 == _T_1416 ? 1'h0 : _T_1430; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_17984 = 8'h6 == _T_1416 ? 8'h0 : _GEN_17914; // @[Core.scala 740:52 Core.scala 765:18]
  wire [7:0] _GEN_17986 = 8'h6 == _T_1416 ? 8'h0 : _GEN_17916; // @[Core.scala 740:52 Core.scala 766:18]
  wire  _GEN_17987 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17917; // @[Core.scala 740:52 Core.scala 768:22]
  wire [7:0] _GEN_17988 = 8'h6 == _T_1416 ? 8'h0 : _GEN_17918; // @[Core.scala 740:52 Core.scala 767:20]
  wire  _GEN_17991 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17921; // @[Core.scala 740:52 Core.scala 90:27]
  wire [7:0] _GEN_17994 = 8'h6 == _T_1416 ? F : _GEN_17924; // @[Core.scala 740:52 Core.scala 41:18]
  wire  _GEN_17997 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17927; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_18000 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17930; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_18003 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17936; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_18008 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17942; // @[Core.scala 740:52 Core.scala 724:20]
  wire  _GEN_18012 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17946; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_18013 = 8'h6 == _T_1416 ? dummy_cycle : _GEN_17947; // @[Core.scala 740:52 Core.scala 775:28]
  wire  _GEN_18017 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17951; // @[Core.scala 740:52 Core.scala 724:20]
  wire [7:0] _GEN_18018 = 8'h6 == _T_1416 ? $signed(8'sh0) : $signed(_GEN_17952); // @[Core.scala 740:52 Core.scala 56:19]
  wire  _GEN_18021 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17955; // @[Core.scala 740:52 Core.scala 90:27]
  wire  _GEN_18026 = 8'h6 == _T_1416 ? 1'h0 : _GEN_17960; // @[Core.scala 740:52 Core.scala 724:20]
  wire [2:0] _GEN_18030 = 8'h40 == _T_1407 ? _GEN_17642 : _GEN_17965; // @[Core.scala 739:52]
  wire  _GEN_18033 = 8'h40 == _T_1407 & _GEN_17645; // @[Core.scala 739:52 Core.scala 90:27]
  wire [15:0] _GEN_18035 = 8'h40 == _T_1407 ? _GEN_17647 : _GEN_17969; // @[Core.scala 739:52]
  wire [7:0] _GEN_18036 = 8'h40 == _T_1407 ? _GEN_17648 : _GEN_17964; // @[Core.scala 739:52]
  wire  _GEN_18039 = 8'h40 == _T_1407 & _GEN_17651; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_18045 = 8'h40 == _T_1407 & _GEN_168; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_18050 = 8'h40 == _T_1407 ? 1'h0 : 1'h1; // @[Core.scala 739:52 Core.scala 724:20 Core.scala 740:23]
  wire  _GEN_18053 = 8'h40 == _T_1407 ? 1'h0 : _T_1417; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18056 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17968; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18059 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17972; // @[Core.scala 739:52 Core.scala 724:20]
  wire [15:0] _GEN_18063 = 8'h40 == _T_1407 ? PC_next : _GEN_17976; // @[Core.scala 739:52 Core.scala 58:24]
  wire  _GEN_18066 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17979; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18069 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17982; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_18071 = 8'h40 == _T_1407 ? 8'h0 : _GEN_17984; // @[Core.scala 739:52 Core.scala 765:18]
  wire [7:0] _GEN_18073 = 8'h40 == _T_1407 ? 8'h0 : _GEN_17986; // @[Core.scala 739:52 Core.scala 766:18]
  wire  _GEN_18074 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17987; // @[Core.scala 739:52 Core.scala 768:22]
  wire [7:0] _GEN_18075 = 8'h40 == _T_1407 ? 8'h0 : _GEN_17988; // @[Core.scala 739:52 Core.scala 767:20]
  wire  _GEN_18078 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17991; // @[Core.scala 739:52 Core.scala 90:27]
  wire [7:0] _GEN_18081 = 8'h40 == _T_1407 ? F : _GEN_17994; // @[Core.scala 739:52 Core.scala 41:18]
  wire  _GEN_18084 = 8'h40 == _T_1407 ? 1'h0 : _GEN_17997; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18087 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18000; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18090 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18003; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18095 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18008; // @[Core.scala 739:52 Core.scala 724:20]
  wire  _GEN_18099 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18012; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_18100 = 8'h40 == _T_1407 ? dummy_cycle : _GEN_18013; // @[Core.scala 739:52 Core.scala 775:28]
  wire  _GEN_18104 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18017; // @[Core.scala 739:52 Core.scala 724:20]
  wire [7:0] _GEN_18105 = 8'h40 == _T_1407 ? $signed(8'sh0) : $signed(_GEN_18018); // @[Core.scala 739:52 Core.scala 56:19]
  wire  _GEN_18108 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18021; // @[Core.scala 739:52 Core.scala 90:27]
  wire  _GEN_18113 = 8'h40 == _T_1407 ? 1'h0 : _GEN_18026; // @[Core.scala 739:52 Core.scala 724:20]
  wire [2:0] _GEN_18114 = 8'h70 == _T_1400 ? _GEN_541 : _GEN_18030; // @[Core.scala 738:52]
  wire [7:0] _GEN_18115 = 8'h70 == _T_1400 ? _GEN_542 : _GEN_18036; // @[Core.scala 738:52]
  wire [15:0] _GEN_18116 = 8'h70 == _T_1400 ? _GEN_543 : _GEN_18035; // @[Core.scala 738:52]
  wire  _GEN_18119 = 8'h70 == _T_1400 & _GEN_546; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_18121 = 8'h70 == _T_1400 ? _GEN_17615 : 8'h0; // @[Core.scala 738:52 Core.scala 77:16]
  wire  _GEN_18124 = 8'h70 == _T_1400 ? 1'h0 : 1'h1; // @[Core.scala 738:52 Core.scala 724:20 Core.scala 739:23]
  wire  _GEN_18127 = 8'h70 == _T_1400 ? 1'h0 : _T_1408; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18130 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18033; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_18134 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18039; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_18140 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18045; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_18145 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18050; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18148 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18053; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18151 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18056; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18154 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18059; // @[Core.scala 738:52 Core.scala 724:20]
  wire [15:0] _GEN_18158 = 8'h70 == _T_1400 ? PC_next : _GEN_18063; // @[Core.scala 738:52 Core.scala 58:24]
  wire  _GEN_18161 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18066; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18164 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18069; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_18166 = 8'h70 == _T_1400 ? 8'h0 : _GEN_18071; // @[Core.scala 738:52 Core.scala 765:18]
  wire [7:0] _GEN_18168 = 8'h70 == _T_1400 ? 8'h0 : _GEN_18073; // @[Core.scala 738:52 Core.scala 766:18]
  wire  _GEN_18169 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18074; // @[Core.scala 738:52 Core.scala 768:22]
  wire [7:0] _GEN_18170 = 8'h70 == _T_1400 ? 8'h0 : _GEN_18075; // @[Core.scala 738:52 Core.scala 767:20]
  wire  _GEN_18173 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18078; // @[Core.scala 738:52 Core.scala 90:27]
  wire [7:0] _GEN_18176 = 8'h70 == _T_1400 ? F : _GEN_18081; // @[Core.scala 738:52 Core.scala 41:18]
  wire  _GEN_18179 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18084; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18182 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18087; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18185 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18090; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18190 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18095; // @[Core.scala 738:52 Core.scala 724:20]
  wire  _GEN_18194 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18099; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_18195 = 8'h70 == _T_1400 ? dummy_cycle : _GEN_18100; // @[Core.scala 738:52 Core.scala 775:28]
  wire  _GEN_18199 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18104; // @[Core.scala 738:52 Core.scala 724:20]
  wire [7:0] _GEN_18200 = 8'h70 == _T_1400 ? $signed(8'sh0) : $signed(_GEN_18105); // @[Core.scala 738:52 Core.scala 56:19]
  wire  _GEN_18203 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18108; // @[Core.scala 738:52 Core.scala 90:27]
  wire  _GEN_18208 = 8'h70 == _T_1400 ? 1'h0 : _GEN_18113; // @[Core.scala 738:52 Core.scala 724:20]
  wire [2:0] _GEN_18209 = 8'h76 == _T_1396 ? 3'h1 : _GEN_18114; // @[Core.scala 737:52 Core.scala 472:24]
  wire [7:0] _GEN_18210 = 8'h76 == _T_1396 ? 8'h0 : _GEN_18115; // @[Core.scala 737:52 Core.scala 473:18]
  wire [15:0] _GEN_18211 = 8'h76 == _T_1396 ? PC : _GEN_18116; // @[Core.scala 737:52 Core.scala 474:20]
  wire [15:0] _GEN_18212 = 8'h76 == _T_1396 ? PC_next : _GEN_18158; // @[Core.scala 737:52 Core.scala 475:13]
  wire  _GEN_18215 = 8'h76 == _T_1396 ? 1'h0 : 1'h1; // @[Core.scala 737:52 Core.scala 724:20 Core.scala 738:23]
  wire  _GEN_18218 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18119; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_18220 = 8'h76 == _T_1396 ? 8'h0 : _GEN_18121; // @[Core.scala 737:52 Core.scala 77:16]
  wire  _GEN_18223 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18124; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18226 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18127; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18229 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18130; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_18233 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18134; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_18239 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18140; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_18244 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18145; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18247 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18148; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18250 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18151; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18253 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18154; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18259 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18161; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18262 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18164; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_18264 = 8'h76 == _T_1396 ? 8'h0 : _GEN_18166; // @[Core.scala 737:52 Core.scala 765:18]
  wire [7:0] _GEN_18266 = 8'h76 == _T_1396 ? 8'h0 : _GEN_18168; // @[Core.scala 737:52 Core.scala 766:18]
  wire  _GEN_18267 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18169; // @[Core.scala 737:52 Core.scala 768:22]
  wire [7:0] _GEN_18268 = 8'h76 == _T_1396 ? 8'h0 : _GEN_18170; // @[Core.scala 737:52 Core.scala 767:20]
  wire  _GEN_18271 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18173; // @[Core.scala 737:52 Core.scala 90:27]
  wire [7:0] _GEN_18274 = 8'h76 == _T_1396 ? F : _GEN_18176; // @[Core.scala 737:52 Core.scala 41:18]
  wire  _GEN_18277 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18179; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18280 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18182; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18283 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18185; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18288 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18190; // @[Core.scala 737:52 Core.scala 724:20]
  wire  _GEN_18292 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18194; // @[Core.scala 737:52 Core.scala 724:20]
  wire [2:0] _GEN_18293 = 8'h76 == _T_1396 ? dummy_cycle : _GEN_18195; // @[Core.scala 737:52 Core.scala 775:28]
  wire  _GEN_18297 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18199; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_18298 = 8'h76 == _T_1396 ? $signed(8'sh0) : $signed(_GEN_18200); // @[Core.scala 737:52 Core.scala 56:19]
  wire  _GEN_18301 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18203; // @[Core.scala 737:52 Core.scala 90:27]
  wire  _GEN_18306 = 8'h76 == _T_1396 ? 1'h0 : _GEN_18208; // @[Core.scala 737:52 Core.scala 724:20]
  wire [7:0] _GEN_18310 = 8'h4 == _T_1379 ? 8'h1 : _GEN_18266; // @[Core.scala 736:52 Core.scala 241:20]
  wire  _GEN_18311 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18267; // @[Core.scala 736:52 Core.scala 242:24]
  wire [7:0] _GEN_18312 = 8'h4 == _T_1379 ? _alu_io_calc_type_T_19 : _GEN_18268; // @[Core.scala 736:52 Core.scala 243:22]
  wire  _GEN_18315 = 8'h4 == _T_1379 & _T_1384; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_18316 = 8'h4 == _T_1379 ? _GEN_17582 : _GEN_18264; // @[Core.scala 736:52]
  wire [2:0] _GEN_18317 = 8'h4 == _T_1379 ? _GEN_17583 : _GEN_18209; // @[Core.scala 736:52]
  wire [15:0] _GEN_18318 = 8'h4 == _T_1379 ? _GEN_17584 : _GEN_18211; // @[Core.scala 736:52]
  wire [7:0] _GEN_18319 = 8'h4 == _T_1379 ? _GEN_17585 : _GEN_18210; // @[Core.scala 736:52]
  wire [2:0] _GEN_18320 = 8'h4 == _T_1379 ? _GEN_17586 : _GEN_18293; // @[Core.scala 736:52]
  wire [7:0] _GEN_18321 = 8'h4 == _T_1379 ? _GEN_17587 : _GEN_18220; // @[Core.scala 736:52]
  wire  _GEN_18324 = 8'h4 == _T_1379 & _GEN_17590; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18328 = 8'h4 == _T_1379 & _GEN_17594; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18334 = 8'h4 == _T_1379 ? 1'h0 : 1'h1; // @[Core.scala 736:52 Core.scala 724:20 Core.scala 737:23]
  wire [15:0] _GEN_18335 = 8'h4 == _T_1379 ? PC_next : _GEN_18212; // @[Core.scala 736:52 Core.scala 58:24]
  wire  _GEN_18338 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18215; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18341 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18218; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18345 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18223; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18348 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18226; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18351 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18229; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_18355 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18233; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_18361 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18239; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_18366 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18244; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18369 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18247; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18372 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18250; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18375 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18253; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18381 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18259; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18384 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18262; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18389 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18271; // @[Core.scala 736:52 Core.scala 90:27]
  wire [7:0] _GEN_18392 = 8'h4 == _T_1379 ? F : _GEN_18274; // @[Core.scala 736:52 Core.scala 41:18]
  wire  _GEN_18395 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18277; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18398 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18280; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18401 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18283; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18406 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18288; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18410 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18292; // @[Core.scala 736:52 Core.scala 724:20]
  wire  _GEN_18414 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18297; // @[Core.scala 736:52 Core.scala 724:20]
  wire [7:0] _GEN_18415 = 8'h4 == _T_1379 ? $signed(8'sh0) : $signed(_GEN_18298); // @[Core.scala 736:52 Core.scala 56:19]
  wire  _GEN_18418 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18301; // @[Core.scala 736:52 Core.scala 90:27]
  wire  _GEN_18423 = 8'h4 == _T_1379 ? 1'h0 : _GEN_18306; // @[Core.scala 736:52 Core.scala 724:20]
  wire [15:0] _GEN_18433 = 8'h3 == _T_1358 ? input_6 : 16'h0; // @[Core.scala 735:52]
  wire [7:0] _GEN_18434 = 8'h3 == _T_1358 ? $signed({{6{_alu16_io_offset_T_32[1]}},_alu16_io_offset_T_32}) : $signed(
    _GEN_18415); // @[Core.scala 735:52 Core.scala 189:21]
  wire [2:0] _GEN_18435 = 8'h3 == _T_1358 ? _GEN_443 : _GEN_18317; // @[Core.scala 735:52]
  wire [2:0] _GEN_18436 = 8'h3 == _T_1358 ? _GEN_445 : _GEN_18320; // @[Core.scala 735:52]
  wire  _GEN_18439 = 8'h3 == _T_1358 & _GEN_17515; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_18446 = 8'h3 == _T_1358 & _GEN_17522; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_18453 = 8'h3 == _T_1358 & _GEN_17529; // @[Core.scala 735:52 Core.scala 90:27]
  wire [15:0] _GEN_18458 = 8'h3 == _T_1358 ? _GEN_17534 : SP; // @[Core.scala 735:52 Core.scala 113:19]
  wire [7:0] _GEN_18459 = 8'h3 == _T_1358 ? _GEN_468 : _GEN_18319; // @[Core.scala 735:52]
  wire  _GEN_18462 = 8'h3 == _T_1358 ? 1'h0 : 1'h1; // @[Core.scala 735:52 Core.scala 724:20 Core.scala 736:23]
  wire  _GEN_18465 = 8'h3 == _T_1358 ? 1'h0 : _T_1380; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_18466 = 8'h3 == _T_1358 ? 8'h0 : _GEN_18310; // @[Core.scala 735:52 Core.scala 766:18]
  wire  _GEN_18467 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18311; // @[Core.scala 735:52 Core.scala 768:22]
  wire [7:0] _GEN_18468 = 8'h3 == _T_1358 ? 8'h0 : _GEN_18312; // @[Core.scala 735:52 Core.scala 767:20]
  wire  _GEN_18471 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18315; // @[Core.scala 735:52 Core.scala 724:20]
  wire [7:0] _GEN_18472 = 8'h3 == _T_1358 ? 8'h0 : _GEN_18316; // @[Core.scala 735:52 Core.scala 765:18]
  wire [15:0] _GEN_18473 = 8'h3 == _T_1358 ? mem_refer_addr : _GEN_18318; // @[Core.scala 735:52 Core.scala 73:31]
  wire [7:0] _GEN_18474 = 8'h3 == _T_1358 ? 8'h0 : _GEN_18321; // @[Core.scala 735:52 Core.scala 77:16]
  wire  _GEN_18477 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18324; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18481 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18328; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18487 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18334; // @[Core.scala 735:52 Core.scala 724:20]
  wire [15:0] _GEN_18488 = 8'h3 == _T_1358 ? PC_next : _GEN_18335; // @[Core.scala 735:52 Core.scala 58:24]
  wire  _GEN_18491 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18338; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18494 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18341; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18498 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18345; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18501 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18348; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18504 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18351; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_18508 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18355; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_18514 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18361; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_18519 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18366; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18522 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18369; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18525 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18372; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18528 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18375; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18534 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18381; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18537 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18384; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18542 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18389; // @[Core.scala 735:52 Core.scala 90:27]
  wire [7:0] _GEN_18545 = 8'h3 == _T_1358 ? F : _GEN_18392; // @[Core.scala 735:52 Core.scala 41:18]
  wire  _GEN_18548 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18395; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18551 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18398; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18554 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18401; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18559 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18406; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18563 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18410; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18566 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18414; // @[Core.scala 735:52 Core.scala 724:20]
  wire  _GEN_18569 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18418; // @[Core.scala 735:52 Core.scala 90:27]
  wire  _GEN_18574 = 8'h3 == _T_1358 ? 1'h0 : _GEN_18423; // @[Core.scala 735:52 Core.scala 724:20]
  wire [2:0] _GEN_18578 = 8'hc0 == _T_1346 ? _GEN_17400 : _GEN_18435; // @[Core.scala 734:52]
  wire [2:0] _GEN_18579 = 8'hc0 == _T_1346 ? _GEN_334 : _GEN_18436; // @[Core.scala 734:52]
  wire [15:0] _GEN_18580 = 8'hc0 == _T_1346 ? _GEN_335 : _GEN_18473; // @[Core.scala 734:52]
  wire [7:0] _GEN_18581 = 8'hc0 == _T_1346 ? _GEN_17403 : _GEN_18459; // @[Core.scala 734:52]
  wire [15:0] _GEN_18582 = 8'hc0 == _T_1346 ? _GEN_337 : _GEN_18458; // @[Core.scala 734:52]
  wire  _GEN_18585 = 8'hc0 == _T_1346 & _GEN_340; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_18586 = 8'hc0 == _T_1346 ? _GEN_17408 : _GEN_18488; // @[Core.scala 734:52]
  wire  _GEN_18589 = 8'hc0 == _T_1346 ? 1'h0 : 1'h1; // @[Core.scala 734:52 Core.scala 724:20 Core.scala 735:23]
  wire  _GEN_18592 = 8'hc0 == _T_1346 ? 1'h0 : _T_1359; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_18599 = 8'hc0 == _T_1346 ? 16'h0 : _GEN_18433; // @[Core.scala 734:52 Core.scala 55:27]
  wire [7:0] _GEN_18600 = 8'hc0 == _T_1346 ? $signed(8'sh0) : $signed(_GEN_18434); // @[Core.scala 734:52 Core.scala 56:19]
  wire  _GEN_18603 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18439; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18610 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18446; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18617 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18453; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18624 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18462; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18627 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18465; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_18628 = 8'hc0 == _T_1346 ? 8'h0 : _GEN_18466; // @[Core.scala 734:52 Core.scala 766:18]
  wire  _GEN_18629 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18467; // @[Core.scala 734:52 Core.scala 768:22]
  wire [7:0] _GEN_18630 = 8'hc0 == _T_1346 ? 8'h0 : _GEN_18468; // @[Core.scala 734:52 Core.scala 767:20]
  wire  _GEN_18633 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18471; // @[Core.scala 734:52 Core.scala 724:20]
  wire [7:0] _GEN_18634 = 8'hc0 == _T_1346 ? 8'h0 : _GEN_18472; // @[Core.scala 734:52 Core.scala 765:18]
  wire [7:0] _GEN_18635 = 8'hc0 == _T_1346 ? 8'h0 : _GEN_18474; // @[Core.scala 734:52 Core.scala 77:16]
  wire  _GEN_18638 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18477; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18642 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18481; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18648 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18487; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18651 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18491; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18654 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18494; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18658 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18498; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18661 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18501; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18664 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18504; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18668 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18508; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18674 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18514; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18679 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18519; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18682 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18522; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18685 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18525; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18688 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18528; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18694 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18534; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18697 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18537; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18702 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18542; // @[Core.scala 734:52 Core.scala 90:27]
  wire [7:0] _GEN_18705 = 8'hc0 == _T_1346 ? F : _GEN_18545; // @[Core.scala 734:52 Core.scala 41:18]
  wire  _GEN_18708 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18548; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18711 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18551; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18714 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18554; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18719 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18559; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18723 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18563; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18726 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18566; // @[Core.scala 734:52 Core.scala 724:20]
  wire  _GEN_18729 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18569; // @[Core.scala 734:52 Core.scala 90:27]
  wire  _GEN_18734 = 8'hc0 == _T_1346 ? 1'h0 : _GEN_18574; // @[Core.scala 734:52 Core.scala 724:20]
  wire [15:0] _GEN_18738 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_17350 : _GEN_18586; // @[Core.scala 733:90]
  wire [2:0] _GEN_18739 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_17351 : _GEN_18578; // @[Core.scala 733:90]
  wire [15:0] _GEN_18740 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_285 : _GEN_18580; // @[Core.scala 733:90]
  wire [7:0] _GEN_18741 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_17353 : _GEN_18581; // @[Core.scala 733:90]
  wire [2:0] _GEN_18742 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_287 : _GEN_18579; // @[Core.scala 733:90]
  wire [15:0] _GEN_18743 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_288 : _GEN_18599; // @[Core.scala 733:90]
  wire [7:0] _GEN_18744 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? $signed({8{_GEN_289}}) : $signed(_GEN_18600); // @[Core.scala 733:90]
  wire [7:0] _GEN_18745 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_290 : _GEN_18635; // @[Core.scala 733:90]
  wire [15:0] _GEN_18746 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? _GEN_291 : _GEN_18582; // @[Core.scala 733:90]
  wire  _GEN_18749 = (8'hcd == _T_1323 | 8'hc4 == _T_1325) & _GEN_294; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18753 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : 1'h1; // @[Core.scala 733:90 Core.scala 724:20 Core.scala 734:23]
  wire  _GEN_18756 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _T_1347; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18759 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18585; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18762 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18589; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18765 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18592; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18774 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18603; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18781 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18610; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18788 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18617; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18795 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18624; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18798 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18627; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_18799 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 8'h0 : _GEN_18628; // @[Core.scala 733:90 Core.scala 766:18]
  wire  _GEN_18800 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18629; // @[Core.scala 733:90 Core.scala 768:22]
  wire [7:0] _GEN_18801 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 8'h0 : _GEN_18630; // @[Core.scala 733:90 Core.scala 767:20]
  wire  _GEN_18804 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18633; // @[Core.scala 733:90 Core.scala 724:20]
  wire [7:0] _GEN_18805 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 8'h0 : _GEN_18634; // @[Core.scala 733:90 Core.scala 765:18]
  wire  _GEN_18808 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18638; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18812 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18642; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18818 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18648; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18821 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18651; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18824 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18654; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18828 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18658; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18831 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18661; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18834 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18664; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18838 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18668; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18844 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18674; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18849 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18679; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18852 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18682; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18855 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18685; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18858 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18688; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18864 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18694; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18867 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18697; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18872 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18702; // @[Core.scala 733:90 Core.scala 90:27]
  wire [7:0] _GEN_18875 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? F : _GEN_18705; // @[Core.scala 733:90 Core.scala 41:18]
  wire  _GEN_18878 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18708; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18881 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18711; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18884 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18714; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18889 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18719; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18893 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18723; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18896 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18726; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18899 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18729; // @[Core.scala 733:90 Core.scala 90:27]
  wire  _GEN_18904 = 8'hcd == _T_1323 | 8'hc4 == _T_1325 ? 1'h0 : _GEN_18734; // @[Core.scala 733:90 Core.scala 724:20]
  wire  _GEN_18908 = 8'hf3 == _T_1319 ? opcodes_IFF_MPORT_6_data[3] : IFF; // @[Core.scala 732:52 Core.scala 484:9 Core.scala 71:20]
  wire  _GEN_18911 = 8'hf3 == _T_1319 ? 1'h0 : 1'h1; // @[Core.scala 732:52 Core.scala 724:20 Core.scala 733:23]
  wire  _GEN_18914 = 8'hf3 == _T_1319 ? 1'h0 : _T_1327; // @[Core.scala 732:52 Core.scala 724:20]
  wire [15:0] _GEN_18915 = 8'hf3 == _T_1319 ? PC_next : _GEN_18738; // @[Core.scala 732:52 Core.scala 58:24]
  wire [2:0] _GEN_18916 = 8'hf3 == _T_1319 ? machine_state_next : _GEN_18739; // @[Core.scala 732:52 Core.scala 68:35]
  wire [15:0] _GEN_18917 = 8'hf3 == _T_1319 ? mem_refer_addr : _GEN_18740; // @[Core.scala 732:52 Core.scala 73:31]
  wire [7:0] _GEN_18918 = 8'hf3 == _T_1319 ? opcode_index : _GEN_18741; // @[Core.scala 732:52 Core.scala 725:29]
  wire [2:0] _GEN_18919 = 8'hf3 == _T_1319 ? dummy_cycle : _GEN_18742; // @[Core.scala 732:52 Core.scala 775:28]
  wire [15:0] _GEN_18920 = 8'hf3 == _T_1319 ? 16'h0 : _GEN_18743; // @[Core.scala 732:52 Core.scala 55:27]
  wire [7:0] _GEN_18921 = 8'hf3 == _T_1319 ? $signed(8'sh0) : $signed(_GEN_18744); // @[Core.scala 732:52 Core.scala 56:19]
  wire [7:0] _GEN_18922 = 8'hf3 == _T_1319 ? 8'h0 : _GEN_18745; // @[Core.scala 732:52 Core.scala 77:16]
  wire [15:0] _GEN_18923 = 8'hf3 == _T_1319 ? SP : _GEN_18746; // @[Core.scala 732:52 Core.scala 113:19]
  wire  _GEN_18926 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18749; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18930 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18753; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18933 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18756; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18936 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18759; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18939 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18762; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18942 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18765; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18951 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18774; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_18958 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18781; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_18965 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18788; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_18972 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18795; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18975 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18798; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_18976 = 8'hf3 == _T_1319 ? 8'h0 : _GEN_18799; // @[Core.scala 732:52 Core.scala 766:18]
  wire  _GEN_18977 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18800; // @[Core.scala 732:52 Core.scala 768:22]
  wire [7:0] _GEN_18978 = 8'hf3 == _T_1319 ? 8'h0 : _GEN_18801; // @[Core.scala 732:52 Core.scala 767:20]
  wire  _GEN_18981 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18804; // @[Core.scala 732:52 Core.scala 724:20]
  wire [7:0] _GEN_18982 = 8'hf3 == _T_1319 ? 8'h0 : _GEN_18805; // @[Core.scala 732:52 Core.scala 765:18]
  wire  _GEN_18985 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18808; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18989 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18812; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18995 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18818; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_18998 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18821; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19001 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18824; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19005 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18828; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19008 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18831; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19011 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18834; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_19015 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18838; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_19021 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18844; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_19026 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18849; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19029 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18852; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19032 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18855; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19035 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18858; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19041 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18864; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19044 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18867; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19049 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18872; // @[Core.scala 732:52 Core.scala 90:27]
  wire [7:0] _GEN_19052 = 8'hf3 == _T_1319 ? F : _GEN_18875; // @[Core.scala 732:52 Core.scala 41:18]
  wire  _GEN_19055 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18878; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19058 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18881; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19061 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18884; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19066 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18889; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19070 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18893; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19073 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18896; // @[Core.scala 732:52 Core.scala 724:20]
  wire  _GEN_19076 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18899; // @[Core.scala 732:52 Core.scala 90:27]
  wire  _GEN_19081 = 8'hf3 == _T_1319 ? 1'h0 : _GEN_18904; // @[Core.scala 732:52 Core.scala 724:20]
  wire [2:0] _GEN_19082 = 8'hd3 == _T_1282 ? _GEN_163 : _GEN_18916; // @[Core.scala 731:52]
  wire [15:0] _GEN_19083 = 8'hd3 == _T_1282 ? _GEN_17231 : _GEN_18917; // @[Core.scala 731:52]
  wire [7:0] _GEN_19084 = 8'hd3 == _T_1282 ? _GEN_165 : _GEN_18918; // @[Core.scala 731:52]
  wire  _GEN_19087 = 8'hd3 == _T_1282 & _GEN_168; // @[Core.scala 731:52 Core.scala 724:20]
  wire [15:0] _GEN_19088 = 8'hd3 == _T_1282 ? _GEN_2590 : _GEN_18915; // @[Core.scala 731:52]
  wire [15:0] _GEN_19089 = 8'hd3 == _T_1282 ? _GEN_14815 : PC; // @[Core.scala 731:52 Core.scala 756:15]
  wire  _GEN_19092 = 8'hd3 == _T_1282 & _GEN_17240; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_19093 = 8'hd3 == _T_1282 ? _GEN_17241 : _GEN_18922; // @[Core.scala 731:52]
  wire  _GEN_19096 = 8'hd3 == _T_1282 & _GEN_177; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19100 = 8'hd3 == _T_1282 & _GEN_17248; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19101 = 8'hd3 == _T_1282 ? _GEN_17249 : 1'h1; // @[Core.scala 731:52 Core.scala 757:14]
  wire  _GEN_19102 = 8'hd3 == _T_1282 ? _GEN_17250 : 1'h1; // @[Core.scala 731:52 Core.scala 758:14]
  wire  _GEN_19105 = 8'hd3 == _T_1282 & _GEN_186; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19108 = 8'hd3 == _T_1282 & _GEN_189; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19111 = 8'hd3 == _T_1282 & _GEN_17259; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19114 = 8'hd3 == _T_1282 ? 1'h0 : 1'h1; // @[Core.scala 731:52 Core.scala 724:20 Core.scala 732:23]
  wire  _GEN_19117 = 8'hd3 == _T_1282 ? 1'h0 : _T_1320; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19118 = 8'hd3 == _T_1282 ? IFF : _GEN_18908; // @[Core.scala 731:52 Core.scala 71:20]
  wire  _GEN_19121 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18911; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19124 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18914; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_19125 = 8'hd3 == _T_1282 ? dummy_cycle : _GEN_18919; // @[Core.scala 731:52 Core.scala 775:28]
  wire [15:0] _GEN_19126 = 8'hd3 == _T_1282 ? 16'h0 : _GEN_18920; // @[Core.scala 731:52 Core.scala 55:27]
  wire [7:0] _GEN_19127 = 8'hd3 == _T_1282 ? $signed(8'sh0) : $signed(_GEN_18921); // @[Core.scala 731:52 Core.scala 56:19]
  wire [15:0] _GEN_19128 = 8'hd3 == _T_1282 ? SP : _GEN_18923; // @[Core.scala 731:52 Core.scala 113:19]
  wire  _GEN_19131 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18926; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19135 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18930; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19138 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18933; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19141 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18936; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19144 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18939; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19147 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18942; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19156 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18951; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19163 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18958; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19170 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18965; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19177 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18972; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19180 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18975; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_19181 = 8'hd3 == _T_1282 ? 8'h0 : _GEN_18976; // @[Core.scala 731:52 Core.scala 766:18]
  wire  _GEN_19182 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18977; // @[Core.scala 731:52 Core.scala 768:22]
  wire [7:0] _GEN_19183 = 8'hd3 == _T_1282 ? 8'h0 : _GEN_18978; // @[Core.scala 731:52 Core.scala 767:20]
  wire  _GEN_19186 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18981; // @[Core.scala 731:52 Core.scala 724:20]
  wire [7:0] _GEN_19187 = 8'hd3 == _T_1282 ? 8'h0 : _GEN_18982; // @[Core.scala 731:52 Core.scala 765:18]
  wire  _GEN_19190 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18985; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19194 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18989; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19200 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18995; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19203 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_18998; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19206 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19001; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19210 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19005; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19213 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19008; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19216 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19011; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19220 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19015; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19226 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19021; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19231 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19026; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19234 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19029; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19237 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19032; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19240 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19035; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19246 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19041; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19249 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19044; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19254 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19049; // @[Core.scala 731:52 Core.scala 90:27]
  wire [7:0] _GEN_19257 = 8'hd3 == _T_1282 ? F : _GEN_19052; // @[Core.scala 731:52 Core.scala 41:18]
  wire  _GEN_19260 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19055; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19263 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19058; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19266 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19061; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19271 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19066; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19275 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19070; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19278 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19073; // @[Core.scala 731:52 Core.scala 724:20]
  wire  _GEN_19281 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19076; // @[Core.scala 731:52 Core.scala 90:27]
  wire  _GEN_19286 = 8'hd3 == _T_1282 ? 1'h0 : _GEN_19081; // @[Core.scala 731:52 Core.scala 724:20]
  wire [2:0] _GEN_19287 = 8'h0 == _T_1278 ? 3'h1 : _GEN_19082; // @[Core.scala 730:47 Core.scala 479:24]
  wire [7:0] _GEN_19288 = 8'h0 == _T_1278 ? 8'h0 : _GEN_19084; // @[Core.scala 730:47 Core.scala 480:18]
  wire  _GEN_19291 = 8'h0 == _T_1278 ? 1'h0 : 1'h1; // @[Core.scala 730:47 Core.scala 724:20 Core.scala 731:23]
  wire [15:0] _GEN_19292 = 8'h0 == _T_1278 ? mem_refer_addr : _GEN_19083; // @[Core.scala 730:47 Core.scala 73:31]
  wire  _GEN_19295 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19087; // @[Core.scala 730:47 Core.scala 724:20]
  wire [15:0] _GEN_19296 = 8'h0 == _T_1278 ? PC_next : _GEN_19088; // @[Core.scala 730:47 Core.scala 58:24]
  wire [15:0] _GEN_19297 = 8'h0 == _T_1278 ? PC : _GEN_19089; // @[Core.scala 730:47 Core.scala 756:15]
  wire  _GEN_19300 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19092; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_19301 = 8'h0 == _T_1278 ? 8'h0 : _GEN_19093; // @[Core.scala 730:47 Core.scala 77:16]
  wire  _GEN_19304 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19096; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19308 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19100; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19309 = 8'h0 == _T_1278 | _GEN_19101; // @[Core.scala 730:47 Core.scala 757:14]
  wire  _GEN_19310 = 8'h0 == _T_1278 | _GEN_19102; // @[Core.scala 730:47 Core.scala 758:14]
  wire  _GEN_19313 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19105; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19316 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19108; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19319 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19111; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19322 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19114; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19325 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19117; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19326 = 8'h0 == _T_1278 ? IFF : _GEN_19118; // @[Core.scala 730:47 Core.scala 71:20]
  wire  _GEN_19329 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19121; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19332 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19124; // @[Core.scala 730:47 Core.scala 724:20]
  wire [2:0] _GEN_19333 = 8'h0 == _T_1278 ? dummy_cycle : _GEN_19125; // @[Core.scala 730:47 Core.scala 775:28]
  wire [15:0] _GEN_19334 = 8'h0 == _T_1278 ? 16'h0 : _GEN_19126; // @[Core.scala 730:47 Core.scala 55:27]
  wire [7:0] _GEN_19335 = 8'h0 == _T_1278 ? $signed(8'sh0) : $signed(_GEN_19127); // @[Core.scala 730:47 Core.scala 56:19]
  wire [15:0] _GEN_19336 = 8'h0 == _T_1278 ? SP : _GEN_19128; // @[Core.scala 730:47 Core.scala 113:19]
  wire  _GEN_19339 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19131; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19343 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19135; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19346 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19138; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19349 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19141; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19352 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19144; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19355 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19147; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19364 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19156; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19371 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19163; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19378 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19170; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19385 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19177; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19388 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19180; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_19389 = 8'h0 == _T_1278 ? 8'h0 : _GEN_19181; // @[Core.scala 730:47 Core.scala 766:18]
  wire  _GEN_19390 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19182; // @[Core.scala 730:47 Core.scala 768:22]
  wire [7:0] _GEN_19391 = 8'h0 == _T_1278 ? 8'h0 : _GEN_19183; // @[Core.scala 730:47 Core.scala 767:20]
  wire  _GEN_19394 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19186; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_19395 = 8'h0 == _T_1278 ? 8'h0 : _GEN_19187; // @[Core.scala 730:47 Core.scala 765:18]
  wire  _GEN_19398 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19190; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19402 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19194; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19408 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19200; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19411 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19203; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19414 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19206; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19418 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19210; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19421 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19213; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19424 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19216; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19428 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19220; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19434 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19226; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19439 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19231; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19442 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19234; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19445 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19237; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19448 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19240; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19454 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19246; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19457 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19249; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19462 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19254; // @[Core.scala 730:47 Core.scala 90:27]
  wire [7:0] _GEN_19465 = 8'h0 == _T_1278 ? F : _GEN_19257; // @[Core.scala 730:47 Core.scala 41:18]
  wire  _GEN_19468 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19260; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19471 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19263; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19474 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19266; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19479 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19271; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19483 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19275; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19486 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19278; // @[Core.scala 730:47 Core.scala 724:20]
  wire  _GEN_19489 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19281; // @[Core.scala 730:47 Core.scala 90:27]
  wire  _GEN_19494 = 8'h0 == _T_1278 ? 1'h0 : _GEN_19286; // @[Core.scala 730:47 Core.scala 724:20]
  wire [7:0] _GEN_19495 = _T_27 ? _GEN_1 : m1_t_cycle; // @[Conditional.scala 39:67 Core.scala 770:27]
  wire [2:0] _GEN_19496 = _T_27 ? _GEN_17074 : machine_state; // @[Conditional.scala 39:67 Core.scala 67:30]
  wire [2:0] _GEN_19501 = _T_27 ? _GEN_19287 : machine_state_next; // @[Conditional.scala 39:67 Core.scala 68:35]
  wire [7:0] _GEN_19502 = _T_27 ? _GEN_19288 : opcode_index; // @[Conditional.scala 39:67 Core.scala 725:29]
  wire [15:0] _GEN_19506 = _T_27 ? _GEN_19292 : mem_refer_addr; // @[Conditional.scala 39:67 Core.scala 73:31]
  wire [15:0] _GEN_19510 = _T_27 ? _GEN_19296 : PC_next; // @[Conditional.scala 39:67 Core.scala 58:24]
  wire [15:0] _GEN_19511 = _T_27 ? _GEN_19297 : PC; // @[Conditional.scala 39:67 Core.scala 756:15]
  wire [7:0] _GEN_19515 = _T_27 ? _GEN_19301 : 8'h0; // @[Conditional.scala 39:67 Core.scala 77:16]
  wire  _GEN_19523 = _T_27 ? _GEN_19309 : 1'h1; // @[Conditional.scala 39:67 Core.scala 757:14]
  wire  _GEN_19524 = _T_27 ? _GEN_19310 : 1'h1; // @[Conditional.scala 39:67 Core.scala 758:14]
  wire  _GEN_19540 = _T_27 ? _GEN_19326 : IFF; // @[Conditional.scala 39:67 Core.scala 71:20]
  wire [2:0] _GEN_19547 = _T_27 ? _GEN_19333 : dummy_cycle; // @[Conditional.scala 39:67 Core.scala 775:28]
  wire [15:0] _GEN_19548 = _T_27 ? _GEN_19334 : 16'h0; // @[Conditional.scala 39:67 Core.scala 55:27]
  wire [7:0] _GEN_19549 = _T_27 ? $signed(_GEN_19335) : $signed(8'sh0); // @[Conditional.scala 39:67 Core.scala 56:19]
  wire [15:0] _GEN_19550 = _T_27 ? _GEN_19336 : SP; // @[Conditional.scala 39:67 Core.scala 113:19]
  wire [7:0] _GEN_19603 = _T_27 ? _GEN_19389 : 8'h0; // @[Conditional.scala 39:67 Core.scala 766:18]
  wire  _GEN_19604 = _T_27 & _GEN_19390; // @[Conditional.scala 39:67 Core.scala 768:22]
  wire [7:0] _GEN_19605 = _T_27 ? _GEN_19391 : 8'h0; // @[Conditional.scala 39:67 Core.scala 767:20]
  wire [7:0] _GEN_19609 = _T_27 ? _GEN_19395 : 8'h0; // @[Conditional.scala 39:67 Core.scala 765:18]
  wire [7:0] _GEN_19679 = _T_27 ? _GEN_19465 : F; // @[Conditional.scala 39:67 Core.scala 41:18]
  wire [7:0] _GEN_19709 = _T_77 ? _GEN_14651 : _GEN_19495; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_19710 = _T_77 ? _GEN_14652 : _GEN_19496; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_19715 = _T_77 ? _GEN_16865 : _GEN_19501; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19716 = _T_77 ? _GEN_16866 : _GEN_19502; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_19720 = _T_77 ? _GEN_16870 : _GEN_19506; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_19724 = _T_77 ? _GEN_16874 : _GEN_19510; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_19725 = _T_77 ? _GEN_16875 : _GEN_19511; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19729 = _T_77 ? _GEN_16879 : _GEN_19515; // @[Conditional.scala 39:67]
  wire  _GEN_19737 = _T_77 ? _GEN_16887 : _GEN_19523; // @[Conditional.scala 39:67]
  wire  _GEN_19738 = _T_77 ? _GEN_16888 : _GEN_19524; // @[Conditional.scala 39:67]
  wire  _GEN_19754 = _T_77 ? _GEN_16904 : _GEN_19540; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_19761 = _T_77 ? _GEN_16911 : _GEN_19547; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_19762 = _T_77 ? _GEN_16912 : _GEN_19548; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19763 = _T_77 ? $signed(_GEN_16913) : $signed(_GEN_19549); // @[Conditional.scala 39:67]
  wire [15:0] _GEN_19764 = _T_77 ? _GEN_16914 : _GEN_19550; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19817 = _T_77 ? _GEN_16967 : _GEN_19603; // @[Conditional.scala 39:67]
  wire  _GEN_19818 = _T_77 ? _GEN_16968 : _GEN_19604; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19819 = _T_77 ? _GEN_16969 : _GEN_19605; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19823 = _T_77 ? _GEN_16973 : _GEN_19609; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_19893 = _T_77 ? _GEN_17043 : _GEN_19679; // @[Conditional.scala 39:67]
  wire  _GEN_19925 = _T_77 ? 1'h0 : _T_27; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19929 = _T_77 ? 1'h0 : _T_27 & _GEN_19291; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19932 = _T_77 ? 1'h0 : _T_27 & _GEN_19295; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19935 = _T_77 ? 1'h0 : _T_27 & _GEN_19300; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19938 = _T_77 ? 1'h0 : _T_27 & _GEN_19304; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19941 = _T_77 ? 1'h0 : _T_27 & _GEN_19308; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19944 = _T_77 ? 1'h0 : _T_27 & _GEN_19313; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19947 = _T_77 ? 1'h0 : _T_27 & _GEN_19316; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19950 = _T_77 ? 1'h0 : _T_27 & _GEN_19319; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19953 = _T_77 ? 1'h0 : _T_27 & _GEN_19322; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19956 = _T_77 ? 1'h0 : _T_27 & _GEN_19325; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19959 = _T_77 ? 1'h0 : _T_27 & _GEN_19329; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19962 = _T_77 ? 1'h0 : _T_27 & _GEN_19332; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19965 = _T_77 ? 1'h0 : _T_27 & _GEN_19339; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19969 = _T_77 ? 1'h0 : _T_27 & _GEN_19343; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19972 = _T_77 ? 1'h0 : _T_27 & _GEN_19346; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19975 = _T_77 ? 1'h0 : _T_27 & _GEN_19349; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19978 = _T_77 ? 1'h0 : _T_27 & _GEN_19352; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19981 = _T_77 ? 1'h0 : _T_27 & _GEN_19355; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_19990 = _T_77 ? 1'h0 : _T_27 & _GEN_19364; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_19997 = _T_77 ? 1'h0 : _T_27 & _GEN_19371; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20004 = _T_77 ? 1'h0 : _T_27 & _GEN_19378; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20011 = _T_77 ? 1'h0 : _T_27 & _GEN_19385; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20014 = _T_77 ? 1'h0 : _T_27 & _GEN_19388; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20017 = _T_77 ? 1'h0 : _T_27 & _GEN_19394; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20020 = _T_77 ? 1'h0 : _T_27 & _GEN_19398; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20024 = _T_77 ? 1'h0 : _T_27 & _GEN_19402; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20030 = _T_77 ? 1'h0 : _T_27 & _GEN_19408; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20033 = _T_77 ? 1'h0 : _T_27 & _GEN_19411; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20036 = _T_77 ? 1'h0 : _T_27 & _GEN_19414; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20040 = _T_77 ? 1'h0 : _T_27 & _GEN_19418; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20043 = _T_77 ? 1'h0 : _T_27 & _GEN_19421; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20046 = _T_77 ? 1'h0 : _T_27 & _GEN_19424; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20050 = _T_77 ? 1'h0 : _T_27 & _GEN_19428; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20056 = _T_77 ? 1'h0 : _T_27 & _GEN_19434; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20061 = _T_77 ? 1'h0 : _T_27 & _GEN_19439; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20064 = _T_77 ? 1'h0 : _T_27 & _GEN_19442; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20067 = _T_77 ? 1'h0 : _T_27 & _GEN_19445; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20070 = _T_77 ? 1'h0 : _T_27 & _GEN_19448; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20076 = _T_77 ? 1'h0 : _T_27 & _GEN_19454; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20079 = _T_77 ? 1'h0 : _T_27 & _GEN_19457; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20084 = _T_77 ? 1'h0 : _T_27 & _GEN_19462; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20089 = _T_77 ? 1'h0 : _T_27 & _GEN_19468; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20092 = _T_77 ? 1'h0 : _T_27 & _GEN_19471; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20095 = _T_77 ? 1'h0 : _T_27 & _GEN_19474; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20100 = _T_77 ? 1'h0 : _T_27 & _GEN_19479; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20104 = _T_77 ? 1'h0 : _T_27 & _GEN_19483; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20107 = _T_77 ? 1'h0 : _T_27 & _GEN_19486; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20110 = _T_77 ? 1'h0 : _T_27 & _GEN_19489; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20115 = _T_77 ? 1'h0 : _T_27 & _GEN_19494; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_20116 = _T_79 ? mem_refer_addr : _GEN_19725; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20117 = _T_79 ? _GEN_8763 : _GEN_19709; // @[Conditional.scala 39:67]
  wire  _GEN_20118 = _T_79 ? _GEN_14242 : _GEN_19738; // @[Conditional.scala 39:67]
  wire  _GEN_20119 = _T_79 ? _GEN_14243 : 1'h1; // @[Conditional.scala 39:67 Core.scala 759:16]
  wire [2:0] _GEN_20124 = _T_79 ? _GEN_14248 : _GEN_19715; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20125 = _T_79 ? _GEN_14249 : _GEN_19716; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_20129 = _T_79 ? _GEN_14253 : _GEN_19720; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_20133 = _T_79 ? _GEN_14257 : _GEN_19724; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20137 = _T_79 ? _GEN_14262 : _GEN_19729; // @[Conditional.scala 39:67]
  wire  _GEN_20145 = _T_79 ? _GEN_14270 : _GEN_19737; // @[Conditional.scala 39:67]
  wire  _GEN_20161 = _T_79 ? _GEN_14286 : _GEN_19754; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_20168 = _T_79 ? _GEN_14293 : _GEN_19761; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_20169 = _T_79 ? _GEN_14294 : _GEN_19762; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20170 = _T_79 ? $signed(_GEN_14295) : $signed(_GEN_19763); // @[Conditional.scala 39:67]
  wire [15:0] _GEN_20171 = _T_79 ? _GEN_14296 : _GEN_19764; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20224 = _T_79 ? _GEN_14349 : _GEN_19817; // @[Conditional.scala 39:67]
  wire  _GEN_20225 = _T_79 ? _GEN_14350 : _GEN_19818; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20226 = _T_79 ? _GEN_14351 : _GEN_19819; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20230 = _T_79 ? _GEN_14355 : _GEN_19823; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20300 = _T_79 ? _GEN_14425 : _GEN_19893; // @[Conditional.scala 39:67]
  wire [15:0] _GEN_20523 = _T_79 ? _GEN_5702 : PC; // @[Conditional.scala 39:67 Core.scala 110:19]
  wire [2:0] _GEN_20524 = _T_79 ? _GEN_8764 : _GEN_19710; // @[Conditional.scala 39:67]
  wire  _GEN_20527 = _T_79 ? 1'h0 : _T_77; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20531 = _T_79 ? 1'h0 : _T_77 & _GEN_16869; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20534 = _T_79 ? 1'h0 : _T_77 & _GEN_16873; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20537 = _T_79 ? 1'h0 : _T_77 & _GEN_16878; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20540 = _T_79 ? 1'h0 : _T_77 & _GEN_16882; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20543 = _T_79 ? 1'h0 : _T_77 & _GEN_16886; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20546 = _T_79 ? 1'h0 : _T_77 & _GEN_16891; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20549 = _T_79 ? 1'h0 : _T_77 & _GEN_16894; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20552 = _T_79 ? 1'h0 : _T_77 & _GEN_16897; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20555 = _T_79 ? 1'h0 : _T_77 & _GEN_16900; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20558 = _T_79 ? 1'h0 : _T_77 & _GEN_16903; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20561 = _T_79 ? 1'h0 : _T_77 & _GEN_16907; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20564 = _T_79 ? 1'h0 : _T_77 & _GEN_16910; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20567 = _T_79 ? 1'h0 : _T_77 & _GEN_16917; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20571 = _T_79 ? 1'h0 : _T_77 & _GEN_16921; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20574 = _T_79 ? 1'h0 : _T_77 & _GEN_16924; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20577 = _T_79 ? 1'h0 : _T_77 & _GEN_16927; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20580 = _T_79 ? 1'h0 : _T_77 & _GEN_16930; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20583 = _T_79 ? 1'h0 : _T_77 & _GEN_16933; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20592 = _T_79 ? 1'h0 : _T_77 & _GEN_16942; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20599 = _T_79 ? 1'h0 : _T_77 & _GEN_16949; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20606 = _T_79 ? 1'h0 : _T_77 & _GEN_16956; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20613 = _T_79 ? 1'h0 : _T_77 & _GEN_16963; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20616 = _T_79 ? 1'h0 : _T_77 & _GEN_16966; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20619 = _T_79 ? 1'h0 : _T_77 & _GEN_16972; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20622 = _T_79 ? 1'h0 : _T_77 & _GEN_16976; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20626 = _T_79 ? 1'h0 : _T_77 & _GEN_16980; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20632 = _T_79 ? 1'h0 : _T_77 & _GEN_16986; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20635 = _T_79 ? 1'h0 : _T_77 & _GEN_16989; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20638 = _T_79 ? 1'h0 : _T_77 & _GEN_16992; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20642 = _T_79 ? 1'h0 : _T_77 & _GEN_16996; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20645 = _T_79 ? 1'h0 : _T_77 & _GEN_16999; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20648 = _T_79 ? 1'h0 : _T_77 & _GEN_17002; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20652 = _T_79 ? 1'h0 : _T_77 & _GEN_17006; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20658 = _T_79 ? 1'h0 : _T_77 & _GEN_17012; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20663 = _T_79 ? 1'h0 : _T_77 & _GEN_17017; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20666 = _T_79 ? 1'h0 : _T_77 & _GEN_17020; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20669 = _T_79 ? 1'h0 : _T_77 & _GEN_17023; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20672 = _T_79 ? 1'h0 : _T_77 & _GEN_17026; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20678 = _T_79 ? 1'h0 : _T_77 & _GEN_17032; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20681 = _T_79 ? 1'h0 : _T_77 & _GEN_17035; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20686 = _T_79 ? 1'h0 : _T_77 & _GEN_17040; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20691 = _T_79 ? 1'h0 : _T_77 & _GEN_17046; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20694 = _T_79 ? 1'h0 : _T_77 & _GEN_17049; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20697 = _T_79 ? 1'h0 : _T_77 & _GEN_17052; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20702 = _T_79 ? 1'h0 : _T_77 & _GEN_17057; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20706 = _T_79 ? 1'h0 : _T_77 & _GEN_17061; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20709 = _T_79 ? 1'h0 : _T_77 & _GEN_17064; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20712 = _T_79 ? 1'h0 : _T_77 & _GEN_17067; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20717 = _T_79 ? 1'h0 : _T_77 & _GEN_17072; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20720 = _T_79 ? 1'h0 : _GEN_19925; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20724 = _T_79 ? 1'h0 : _GEN_19929; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20727 = _T_79 ? 1'h0 : _GEN_19932; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20730 = _T_79 ? 1'h0 : _GEN_19935; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20733 = _T_79 ? 1'h0 : _GEN_19938; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20736 = _T_79 ? 1'h0 : _GEN_19941; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20739 = _T_79 ? 1'h0 : _GEN_19944; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20742 = _T_79 ? 1'h0 : _GEN_19947; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20745 = _T_79 ? 1'h0 : _GEN_19950; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20748 = _T_79 ? 1'h0 : _GEN_19953; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20751 = _T_79 ? 1'h0 : _GEN_19956; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20754 = _T_79 ? 1'h0 : _GEN_19959; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20757 = _T_79 ? 1'h0 : _GEN_19962; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20760 = _T_79 ? 1'h0 : _GEN_19965; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20764 = _T_79 ? 1'h0 : _GEN_19969; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20767 = _T_79 ? 1'h0 : _GEN_19972; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20770 = _T_79 ? 1'h0 : _GEN_19975; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20773 = _T_79 ? 1'h0 : _GEN_19978; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20776 = _T_79 ? 1'h0 : _GEN_19981; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20785 = _T_79 ? 1'h0 : _GEN_19990; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20792 = _T_79 ? 1'h0 : _GEN_19997; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20799 = _T_79 ? 1'h0 : _GEN_20004; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20806 = _T_79 ? 1'h0 : _GEN_20011; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20809 = _T_79 ? 1'h0 : _GEN_20014; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20812 = _T_79 ? 1'h0 : _GEN_20017; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20815 = _T_79 ? 1'h0 : _GEN_20020; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20819 = _T_79 ? 1'h0 : _GEN_20024; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20825 = _T_79 ? 1'h0 : _GEN_20030; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20828 = _T_79 ? 1'h0 : _GEN_20033; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20831 = _T_79 ? 1'h0 : _GEN_20036; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20835 = _T_79 ? 1'h0 : _GEN_20040; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20838 = _T_79 ? 1'h0 : _GEN_20043; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20841 = _T_79 ? 1'h0 : _GEN_20046; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20845 = _T_79 ? 1'h0 : _GEN_20050; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20851 = _T_79 ? 1'h0 : _GEN_20056; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20856 = _T_79 ? 1'h0 : _GEN_20061; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20859 = _T_79 ? 1'h0 : _GEN_20064; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20862 = _T_79 ? 1'h0 : _GEN_20067; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20865 = _T_79 ? 1'h0 : _GEN_20070; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20871 = _T_79 ? 1'h0 : _GEN_20076; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20874 = _T_79 ? 1'h0 : _GEN_20079; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20879 = _T_79 ? 1'h0 : _GEN_20084; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20884 = _T_79 ? 1'h0 : _GEN_20089; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20887 = _T_79 ? 1'h0 : _GEN_20092; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20890 = _T_79 ? 1'h0 : _GEN_20095; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20895 = _T_79 ? 1'h0 : _GEN_20100; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20899 = _T_79 ? 1'h0 : _GEN_20104; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20902 = _T_79 ? 1'h0 : _GEN_20107; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20905 = _T_79 ? 1'h0 : _GEN_20110; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_20910 = _T_79 ? 1'h0 : _GEN_20115; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_20911 = _T_25 ? mem_refer_addr : _GEN_20116; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20912 = _T_25 ? _GEN_8763 : _GEN_20117; // @[Conditional.scala 39:67]
  wire  _GEN_20913 = _T_25 ? _GEN_8545 : _GEN_20145; // @[Conditional.scala 39:67]
  wire  _GEN_20914 = _T_25 ? _GEN_8544 : _GEN_20119; // @[Conditional.scala 39:67]
  wire  _GEN_20917 = _T_25 & _T_6; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20922 = _T_25 & _GEN_5495; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20928 = _T_25 & _GEN_8559; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20932 = _T_25 & _GEN_8563; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20936 = _T_25 & _GEN_8568; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_20937 = _T_25 ? _GEN_8569 : _GEN_20137; // @[Conditional.scala 39:67]
  wire  _GEN_20940 = _T_25 & _GEN_8572; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20944 = _T_25 & _GEN_8576; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20945 = _T_25 ? _GEN_8577 : _GEN_20118; // @[Conditional.scala 39:67]
  wire  _GEN_20948 = _T_25 & _GEN_8580; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20951 = _T_25 & _GEN_8583; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20954 = _T_25 & _GEN_8586; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20957 = _T_25 & _GEN_8589; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20960 = _T_25 & _GEN_8592; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20964 = _T_25 & _GEN_8596; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20967 = _T_25 & _GEN_8599; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_20969 = _T_25 ? _GEN_8601 : _GEN_20169; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_20970 = _T_25 ? $signed(_GEN_8602) : $signed(_GEN_20170); // @[Conditional.scala 39:67]
  wire  _GEN_20974 = _T_25 & _GEN_8606; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20978 = _T_25 & _GEN_8610; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20981 = _T_25 & _GEN_8613; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20984 = _T_25 & _GEN_8616; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20987 = _T_25 & _GEN_8619; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20990 = _T_25 & _GEN_8622; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_20999 = _T_25 & _GEN_8631; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21006 = _T_25 & _GEN_8638; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21013 = _T_25 & _GEN_8645; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21020 = _T_25 & _GEN_8652; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21023 = _T_25 & _GEN_8655; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_21024 = _T_25 ? _GEN_8656 : _GEN_20224; // @[Conditional.scala 39:67]
  wire  _GEN_21025 = _T_25 ? _GEN_8657 : _GEN_20225; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_21026 = _T_25 ? _GEN_8658 : _GEN_20226; // @[Conditional.scala 39:67]
  wire  _GEN_21029 = _T_25 & _GEN_8661; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [7:0] _GEN_21030 = _T_25 ? _GEN_8662 : _GEN_20230; // @[Conditional.scala 39:67]
  wire  _GEN_21033 = _T_25 & _GEN_8665; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21037 = _T_25 & _GEN_8669; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21043 = _T_25 & _GEN_8675; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21046 = _T_25 & _GEN_8678; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21049 = _T_25 & _GEN_8681; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21053 = _T_25 & _GEN_8685; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21056 = _T_25 & _GEN_8688; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21059 = _T_25 & _GEN_8691; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21063 = _T_25 & _GEN_8695; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21069 = _T_25 & _GEN_8701; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21074 = _T_25 & _GEN_8706; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21077 = _T_25 & _GEN_8709; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21080 = _T_25 & _GEN_8712; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21083 = _T_25 & _GEN_8715; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21089 = _T_25 & _GEN_8721; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21092 = _T_25 & _GEN_8724; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21097 = _T_25 & _GEN_8729; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21103 = _T_25 & _GEN_8735; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21106 = _T_25 & _GEN_8738; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21109 = _T_25 & _GEN_8741; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21114 = _T_25 & _GEN_8746; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21118 = _T_25 & _GEN_8750; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21121 = _T_25 & _GEN_8753; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21124 = _T_25 & _GEN_8756; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21129 = _T_25 & _GEN_8761; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_21130 = _T_25 ? _GEN_5702 : _GEN_20523; // @[Conditional.scala 39:67]
  wire  _GEN_21134 = _T_25 ? 1'h0 : _T_79 & _GEN_5495; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21138 = _T_25 ? 1'h0 : _T_79 & _GEN_14252; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21141 = _T_25 ? 1'h0 : _T_79 & _GEN_14256; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21144 = _T_25 ? 1'h0 : _T_79 & _GEN_14261; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21147 = _T_25 ? 1'h0 : _T_79 & _GEN_14265; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21150 = _T_25 ? 1'h0 : _T_79 & _GEN_14269; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21153 = _T_25 ? 1'h0 : _T_79 & _GEN_14273; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21156 = _T_25 ? 1'h0 : _T_79 & _GEN_14276; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21159 = _T_25 ? 1'h0 : _T_79 & _GEN_14279; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21162 = _T_25 ? 1'h0 : _T_79 & _GEN_14282; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21165 = _T_25 ? 1'h0 : _T_79 & _GEN_14285; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21168 = _T_25 ? 1'h0 : _T_79 & _GEN_14289; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21171 = _T_25 ? 1'h0 : _T_79 & _GEN_14292; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21174 = _T_25 ? 1'h0 : _T_79 & _GEN_14299; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21178 = _T_25 ? 1'h0 : _T_79 & _GEN_14303; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21181 = _T_25 ? 1'h0 : _T_79 & _GEN_14306; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21184 = _T_25 ? 1'h0 : _T_79 & _GEN_14309; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21187 = _T_25 ? 1'h0 : _T_79 & _GEN_14312; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21190 = _T_25 ? 1'h0 : _T_79 & _GEN_14315; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21199 = _T_25 ? 1'h0 : _T_79 & _GEN_14324; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21206 = _T_25 ? 1'h0 : _T_79 & _GEN_14331; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21213 = _T_25 ? 1'h0 : _T_79 & _GEN_14338; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21220 = _T_25 ? 1'h0 : _T_79 & _GEN_14345; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21223 = _T_25 ? 1'h0 : _T_79 & _GEN_14348; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21226 = _T_25 ? 1'h0 : _T_79 & _GEN_14354; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21229 = _T_25 ? 1'h0 : _T_79 & _GEN_14358; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21233 = _T_25 ? 1'h0 : _T_79 & _GEN_14362; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21239 = _T_25 ? 1'h0 : _T_79 & _GEN_14368; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21242 = _T_25 ? 1'h0 : _T_79 & _GEN_14371; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21245 = _T_25 ? 1'h0 : _T_79 & _GEN_14374; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21249 = _T_25 ? 1'h0 : _T_79 & _GEN_14378; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21252 = _T_25 ? 1'h0 : _T_79 & _GEN_14381; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21255 = _T_25 ? 1'h0 : _T_79 & _GEN_14384; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21259 = _T_25 ? 1'h0 : _T_79 & _GEN_14388; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21265 = _T_25 ? 1'h0 : _T_79 & _GEN_14394; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21270 = _T_25 ? 1'h0 : _T_79 & _GEN_14399; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21273 = _T_25 ? 1'h0 : _T_79 & _GEN_14402; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21276 = _T_25 ? 1'h0 : _T_79 & _GEN_14405; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21279 = _T_25 ? 1'h0 : _T_79 & _GEN_14408; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21285 = _T_25 ? 1'h0 : _T_79 & _GEN_14414; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21288 = _T_25 ? 1'h0 : _T_79 & _GEN_14417; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21293 = _T_25 ? 1'h0 : _T_79 & _GEN_14422; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21298 = _T_25 ? 1'h0 : _T_79 & _GEN_14428; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21301 = _T_25 ? 1'h0 : _T_79 & _GEN_14431; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21304 = _T_25 ? 1'h0 : _T_79 & _GEN_14434; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21309 = _T_25 ? 1'h0 : _T_79 & _GEN_14439; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21313 = _T_25 ? 1'h0 : _T_79 & _GEN_14443; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21316 = _T_25 ? 1'h0 : _T_79 & _GEN_14446; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21319 = _T_25 ? 1'h0 : _T_79 & _GEN_14449; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21324 = _T_25 ? 1'h0 : _T_79 & _GEN_14454; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21327 = _T_25 ? 1'h0 : _T_79 & _GEN_5705; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21331 = _T_25 ? 1'h0 : _T_79 & _GEN_14461; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21334 = _T_25 ? 1'h0 : _T_79 & _GEN_14464; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21337 = _T_25 ? 1'h0 : _T_79 & _GEN_14467; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21340 = _T_25 ? 1'h0 : _T_79 & _GEN_14470; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21343 = _T_25 ? 1'h0 : _T_79 & _GEN_14473; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21346 = _T_25 ? 1'h0 : _T_79 & _GEN_14476; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21349 = _T_25 ? 1'h0 : _T_79 & _GEN_14479; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21352 = _T_25 ? 1'h0 : _T_79 & _GEN_14482; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21355 = _T_25 ? 1'h0 : _T_79 & _GEN_14485; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21358 = _T_25 ? 1'h0 : _T_79 & _GEN_14488; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21361 = _T_25 ? 1'h0 : _T_79 & _GEN_14491; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21364 = _T_25 ? 1'h0 : _T_79 & _GEN_14494; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21367 = _T_25 ? 1'h0 : _T_79 & _GEN_14497; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21371 = _T_25 ? 1'h0 : _T_79 & _GEN_14501; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21374 = _T_25 ? 1'h0 : _T_79 & _GEN_14504; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21377 = _T_25 ? 1'h0 : _T_79 & _GEN_14507; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21380 = _T_25 ? 1'h0 : _T_79 & _GEN_14510; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21383 = _T_25 ? 1'h0 : _T_79 & _GEN_14513; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21392 = _T_25 ? 1'h0 : _T_79 & _GEN_14522; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21399 = _T_25 ? 1'h0 : _T_79 & _GEN_14529; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21406 = _T_25 ? 1'h0 : _T_79 & _GEN_14536; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21413 = _T_25 ? 1'h0 : _T_79 & _GEN_14543; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21416 = _T_25 ? 1'h0 : _T_79 & _GEN_14546; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21419 = _T_25 ? 1'h0 : _T_79 & _GEN_14549; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21422 = _T_25 ? 1'h0 : _T_79 & _GEN_14552; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21426 = _T_25 ? 1'h0 : _T_79 & _GEN_14556; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21432 = _T_25 ? 1'h0 : _T_79 & _GEN_14562; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21435 = _T_25 ? 1'h0 : _T_79 & _GEN_14565; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21438 = _T_25 ? 1'h0 : _T_79 & _GEN_14568; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21442 = _T_25 ? 1'h0 : _T_79 & _GEN_14572; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21445 = _T_25 ? 1'h0 : _T_79 & _GEN_14575; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21448 = _T_25 ? 1'h0 : _T_79 & _GEN_14578; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21452 = _T_25 ? 1'h0 : _T_79 & _GEN_14582; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21458 = _T_25 ? 1'h0 : _T_79 & _GEN_14588; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21463 = _T_25 ? 1'h0 : _T_79 & _GEN_14593; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21466 = _T_25 ? 1'h0 : _T_79 & _GEN_14596; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21469 = _T_25 ? 1'h0 : _T_79 & _GEN_14599; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21472 = _T_25 ? 1'h0 : _T_79 & _GEN_14602; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21478 = _T_25 ? 1'h0 : _T_79 & _GEN_14608; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21481 = _T_25 ? 1'h0 : _T_79 & _GEN_14611; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21486 = _T_25 ? 1'h0 : _T_79 & _GEN_14616; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21491 = _T_25 ? 1'h0 : _T_79 & _GEN_14621; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21494 = _T_25 ? 1'h0 : _T_79 & _GEN_14624; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21497 = _T_25 ? 1'h0 : _T_79 & _GEN_14627; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21502 = _T_25 ? 1'h0 : _T_79 & _GEN_14632; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21506 = _T_25 ? 1'h0 : _T_79 & _GEN_14636; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21509 = _T_25 ? 1'h0 : _T_79 & _GEN_14639; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21512 = _T_25 ? 1'h0 : _T_79 & _GEN_14642; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21517 = _T_25 ? 1'h0 : _T_79 & _GEN_14647; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21520 = _T_25 ? 1'h0 : _GEN_20527; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21524 = _T_25 ? 1'h0 : _GEN_20531; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21527 = _T_25 ? 1'h0 : _GEN_20534; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21530 = _T_25 ? 1'h0 : _GEN_20537; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21533 = _T_25 ? 1'h0 : _GEN_20540; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21536 = _T_25 ? 1'h0 : _GEN_20543; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21539 = _T_25 ? 1'h0 : _GEN_20546; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21542 = _T_25 ? 1'h0 : _GEN_20549; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21545 = _T_25 ? 1'h0 : _GEN_20552; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21548 = _T_25 ? 1'h0 : _GEN_20555; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21551 = _T_25 ? 1'h0 : _GEN_20558; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21554 = _T_25 ? 1'h0 : _GEN_20561; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21557 = _T_25 ? 1'h0 : _GEN_20564; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21560 = _T_25 ? 1'h0 : _GEN_20567; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21564 = _T_25 ? 1'h0 : _GEN_20571; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21567 = _T_25 ? 1'h0 : _GEN_20574; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21570 = _T_25 ? 1'h0 : _GEN_20577; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21573 = _T_25 ? 1'h0 : _GEN_20580; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21576 = _T_25 ? 1'h0 : _GEN_20583; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21585 = _T_25 ? 1'h0 : _GEN_20592; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21592 = _T_25 ? 1'h0 : _GEN_20599; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21599 = _T_25 ? 1'h0 : _GEN_20606; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21606 = _T_25 ? 1'h0 : _GEN_20613; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21609 = _T_25 ? 1'h0 : _GEN_20616; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21612 = _T_25 ? 1'h0 : _GEN_20619; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21615 = _T_25 ? 1'h0 : _GEN_20622; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21619 = _T_25 ? 1'h0 : _GEN_20626; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21625 = _T_25 ? 1'h0 : _GEN_20632; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21628 = _T_25 ? 1'h0 : _GEN_20635; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21631 = _T_25 ? 1'h0 : _GEN_20638; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21635 = _T_25 ? 1'h0 : _GEN_20642; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21638 = _T_25 ? 1'h0 : _GEN_20645; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21641 = _T_25 ? 1'h0 : _GEN_20648; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21645 = _T_25 ? 1'h0 : _GEN_20652; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21651 = _T_25 ? 1'h0 : _GEN_20658; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21656 = _T_25 ? 1'h0 : _GEN_20663; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21659 = _T_25 ? 1'h0 : _GEN_20666; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21662 = _T_25 ? 1'h0 : _GEN_20669; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21665 = _T_25 ? 1'h0 : _GEN_20672; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21671 = _T_25 ? 1'h0 : _GEN_20678; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21674 = _T_25 ? 1'h0 : _GEN_20681; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21679 = _T_25 ? 1'h0 : _GEN_20686; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21684 = _T_25 ? 1'h0 : _GEN_20691; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21687 = _T_25 ? 1'h0 : _GEN_20694; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21690 = _T_25 ? 1'h0 : _GEN_20697; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21695 = _T_25 ? 1'h0 : _GEN_20702; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21699 = _T_25 ? 1'h0 : _GEN_20706; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21702 = _T_25 ? 1'h0 : _GEN_20709; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21705 = _T_25 ? 1'h0 : _GEN_20712; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21710 = _T_25 ? 1'h0 : _GEN_20717; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21713 = _T_25 ? 1'h0 : _GEN_20720; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21717 = _T_25 ? 1'h0 : _GEN_20724; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21720 = _T_25 ? 1'h0 : _GEN_20727; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21723 = _T_25 ? 1'h0 : _GEN_20730; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21726 = _T_25 ? 1'h0 : _GEN_20733; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21729 = _T_25 ? 1'h0 : _GEN_20736; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21732 = _T_25 ? 1'h0 : _GEN_20739; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21735 = _T_25 ? 1'h0 : _GEN_20742; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21738 = _T_25 ? 1'h0 : _GEN_20745; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21741 = _T_25 ? 1'h0 : _GEN_20748; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21744 = _T_25 ? 1'h0 : _GEN_20751; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21747 = _T_25 ? 1'h0 : _GEN_20754; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21750 = _T_25 ? 1'h0 : _GEN_20757; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21753 = _T_25 ? 1'h0 : _GEN_20760; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21757 = _T_25 ? 1'h0 : _GEN_20764; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21760 = _T_25 ? 1'h0 : _GEN_20767; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21763 = _T_25 ? 1'h0 : _GEN_20770; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21766 = _T_25 ? 1'h0 : _GEN_20773; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21769 = _T_25 ? 1'h0 : _GEN_20776; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21778 = _T_25 ? 1'h0 : _GEN_20785; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21785 = _T_25 ? 1'h0 : _GEN_20792; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21792 = _T_25 ? 1'h0 : _GEN_20799; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21799 = _T_25 ? 1'h0 : _GEN_20806; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21802 = _T_25 ? 1'h0 : _GEN_20809; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21805 = _T_25 ? 1'h0 : _GEN_20812; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21808 = _T_25 ? 1'h0 : _GEN_20815; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21812 = _T_25 ? 1'h0 : _GEN_20819; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21818 = _T_25 ? 1'h0 : _GEN_20825; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21821 = _T_25 ? 1'h0 : _GEN_20828; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21824 = _T_25 ? 1'h0 : _GEN_20831; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21828 = _T_25 ? 1'h0 : _GEN_20835; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21831 = _T_25 ? 1'h0 : _GEN_20838; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21834 = _T_25 ? 1'h0 : _GEN_20841; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21838 = _T_25 ? 1'h0 : _GEN_20845; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21844 = _T_25 ? 1'h0 : _GEN_20851; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21849 = _T_25 ? 1'h0 : _GEN_20856; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21852 = _T_25 ? 1'h0 : _GEN_20859; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21855 = _T_25 ? 1'h0 : _GEN_20862; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21858 = _T_25 ? 1'h0 : _GEN_20865; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21864 = _T_25 ? 1'h0 : _GEN_20871; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21867 = _T_25 ? 1'h0 : _GEN_20874; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21872 = _T_25 ? 1'h0 : _GEN_20879; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21877 = _T_25 ? 1'h0 : _GEN_20884; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21880 = _T_25 ? 1'h0 : _GEN_20887; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21883 = _T_25 ? 1'h0 : _GEN_20890; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21888 = _T_25 ? 1'h0 : _GEN_20895; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21892 = _T_25 ? 1'h0 : _GEN_20899; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21895 = _T_25 ? 1'h0 : _GEN_20902; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire  _GEN_21898 = _T_25 ? 1'h0 : _GEN_20905; // @[Conditional.scala 39:67 Core.scala 90:27]
  wire  _GEN_21903 = _T_25 ? 1'h0 : _GEN_20910; // @[Conditional.scala 39:67 Core.scala 724:20]
  wire [15:0] _GEN_21906 = _T_4 ? _GEN_5482 : _GEN_20911; // @[Conditional.scala 40:58]
  wire  _GEN_21907 = _T_4 ? _GEN_5483 : _GEN_20914; // @[Conditional.scala 40:58]
  wire  _GEN_21910 = _T_4 ? _GEN_5486 : _GEN_20913; // @[Conditional.scala 40:58]
  wire  _GEN_21913 = _T_4 & _T_6; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21919 = _T_4 & _GEN_5495; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21925 = _T_4 & _GEN_5501; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21929 = _T_4 & _GEN_5505; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21932 = _T_4 & _GEN_5508; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_21933 = _T_4 ? _GEN_5509 : _GEN_20937; // @[Conditional.scala 40:58]
  wire  _GEN_21936 = _T_4 & _GEN_5512; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21940 = _T_4 & _GEN_5516; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21941 = _T_4 ? _GEN_5517 : _GEN_20945; // @[Conditional.scala 40:58]
  wire  _GEN_21944 = _T_4 & _GEN_5520; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21947 = _T_4 & _GEN_5523; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21950 = _T_4 & _GEN_5526; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21953 = _T_4 & _GEN_5529; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21956 = _T_4 & _GEN_5532; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21960 = _T_4 & _GEN_5536; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21963 = _T_4 & _GEN_5539; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [15:0] _GEN_21965 = _T_4 ? _GEN_5541 : _GEN_20969; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_21966 = _T_4 ? $signed(_GEN_5542) : $signed(_GEN_20970); // @[Conditional.scala 40:58]
  wire  _GEN_21970 = _T_4 & _GEN_5546; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21974 = _T_4 & _GEN_5550; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21977 = _T_4 & _GEN_5553; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21980 = _T_4 & _GEN_5556; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21983 = _T_4 & _GEN_5559; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21986 = _T_4 & _GEN_5562; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_21995 = _T_4 & _GEN_5571; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22002 = _T_4 & _GEN_5578; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22009 = _T_4 & _GEN_5585; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22016 = _T_4 & _GEN_5592; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22019 = _T_4 & _GEN_5595; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_22020 = _T_4 ? _GEN_5596 : _GEN_21024; // @[Conditional.scala 40:58]
  wire  _GEN_22021 = _T_4 ? _GEN_5597 : _GEN_21025; // @[Conditional.scala 40:58]
  wire [7:0] _GEN_22022 = _T_4 ? _GEN_5598 : _GEN_21026; // @[Conditional.scala 40:58]
  wire  _GEN_22025 = _T_4 & _GEN_5601; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire [7:0] _GEN_22026 = _T_4 ? _GEN_5602 : _GEN_21030; // @[Conditional.scala 40:58]
  wire  _GEN_22029 = _T_4 & _GEN_5605; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22033 = _T_4 & _GEN_5609; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22039 = _T_4 & _GEN_5615; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22042 = _T_4 & _GEN_5618; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22045 = _T_4 & _GEN_5621; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22049 = _T_4 & _GEN_5625; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22052 = _T_4 & _GEN_5628; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22055 = _T_4 & _GEN_5631; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22059 = _T_4 & _GEN_5635; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22065 = _T_4 & _GEN_5641; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22070 = _T_4 & _GEN_5646; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22073 = _T_4 & _GEN_5649; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22076 = _T_4 & _GEN_5652; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22079 = _T_4 & _GEN_5655; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22085 = _T_4 & _GEN_5661; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22088 = _T_4 & _GEN_5664; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22093 = _T_4 & _GEN_5669; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22099 = _T_4 & _GEN_5675; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22102 = _T_4 & _GEN_5678; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22105 = _T_4 & _GEN_5681; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22110 = _T_4 & _GEN_5686; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22114 = _T_4 & _GEN_5690; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22117 = _T_4 & _GEN_5693; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22120 = _T_4 & _GEN_5696; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22125 = _T_4 & _GEN_5701; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22129 = _T_4 & _GEN_5705; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22133 = _T_4 & _GEN_5709; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22136 = _T_4 & _GEN_5712; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22139 = _T_4 & _GEN_5715; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22142 = _T_4 & _GEN_5718; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22145 = _T_4 & _GEN_5721; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22148 = _T_4 & _GEN_5724; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22151 = _T_4 & _GEN_5727; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22154 = _T_4 & _GEN_5730; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22157 = _T_4 & _GEN_5733; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22160 = _T_4 & _GEN_5736; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22163 = _T_4 & _GEN_5739; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22166 = _T_4 & _GEN_5742; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22169 = _T_4 & _GEN_5745; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22173 = _T_4 & _GEN_5749; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22176 = _T_4 & _GEN_5752; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22179 = _T_4 & _GEN_5755; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22182 = _T_4 & _GEN_5758; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22185 = _T_4 & _GEN_5761; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22194 = _T_4 & _GEN_5770; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22201 = _T_4 & _GEN_5777; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22208 = _T_4 & _GEN_5784; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22215 = _T_4 & _GEN_5791; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22218 = _T_4 & _GEN_5794; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22221 = _T_4 & _GEN_5797; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22224 = _T_4 & _GEN_5800; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22228 = _T_4 & _GEN_5804; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22234 = _T_4 & _GEN_5810; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22237 = _T_4 & _GEN_5813; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22240 = _T_4 & _GEN_5816; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22244 = _T_4 & _GEN_5820; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22247 = _T_4 & _GEN_5823; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22250 = _T_4 & _GEN_5826; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22254 = _T_4 & _GEN_5830; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22260 = _T_4 & _GEN_5836; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22265 = _T_4 & _GEN_5841; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22268 = _T_4 & _GEN_5844; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22271 = _T_4 & _GEN_5847; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22274 = _T_4 & _GEN_5850; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22280 = _T_4 & _GEN_5856; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22283 = _T_4 & _GEN_5859; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22288 = _T_4 & _GEN_5864; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22293 = _T_4 & _GEN_5869; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22296 = _T_4 & _GEN_5872; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22299 = _T_4 & _GEN_5875; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22304 = _T_4 & _GEN_5880; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22308 = _T_4 & _GEN_5884; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22311 = _T_4 & _GEN_5887; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22314 = _T_4 & _GEN_5890; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22319 = _T_4 & _GEN_5895; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22323 = _T_4 ? 1'h0 : _GEN_20917; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22328 = _T_4 ? 1'h0 : _GEN_20922; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22332 = _T_4 ? 1'h0 : _GEN_20928; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22335 = _T_4 ? 1'h0 : _GEN_20932; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22338 = _T_4 ? 1'h0 : _GEN_20936; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22341 = _T_4 ? 1'h0 : _GEN_20940; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22344 = _T_4 ? 1'h0 : _GEN_20944; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22347 = _T_4 ? 1'h0 : _GEN_20948; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22350 = _T_4 ? 1'h0 : _GEN_20951; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22353 = _T_4 ? 1'h0 : _GEN_20954; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22356 = _T_4 ? 1'h0 : _GEN_20957; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22359 = _T_4 ? 1'h0 : _GEN_20960; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22362 = _T_4 ? 1'h0 : _GEN_20964; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22365 = _T_4 ? 1'h0 : _GEN_20967; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22368 = _T_4 ? 1'h0 : _GEN_20974; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22372 = _T_4 ? 1'h0 : _GEN_20978; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22375 = _T_4 ? 1'h0 : _GEN_20981; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22378 = _T_4 ? 1'h0 : _GEN_20984; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22381 = _T_4 ? 1'h0 : _GEN_20987; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22384 = _T_4 ? 1'h0 : _GEN_20990; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22393 = _T_4 ? 1'h0 : _GEN_20999; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22400 = _T_4 ? 1'h0 : _GEN_21006; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22407 = _T_4 ? 1'h0 : _GEN_21013; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22414 = _T_4 ? 1'h0 : _GEN_21020; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22417 = _T_4 ? 1'h0 : _GEN_21023; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22420 = _T_4 ? 1'h0 : _GEN_21029; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22423 = _T_4 ? 1'h0 : _GEN_21033; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22427 = _T_4 ? 1'h0 : _GEN_21037; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22433 = _T_4 ? 1'h0 : _GEN_21043; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22436 = _T_4 ? 1'h0 : _GEN_21046; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22439 = _T_4 ? 1'h0 : _GEN_21049; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22443 = _T_4 ? 1'h0 : _GEN_21053; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22446 = _T_4 ? 1'h0 : _GEN_21056; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22449 = _T_4 ? 1'h0 : _GEN_21059; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22453 = _T_4 ? 1'h0 : _GEN_21063; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22459 = _T_4 ? 1'h0 : _GEN_21069; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22464 = _T_4 ? 1'h0 : _GEN_21074; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22467 = _T_4 ? 1'h0 : _GEN_21077; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22470 = _T_4 ? 1'h0 : _GEN_21080; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22473 = _T_4 ? 1'h0 : _GEN_21083; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22479 = _T_4 ? 1'h0 : _GEN_21089; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22482 = _T_4 ? 1'h0 : _GEN_21092; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22487 = _T_4 ? 1'h0 : _GEN_21097; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22492 = _T_4 ? 1'h0 : _GEN_21103; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22495 = _T_4 ? 1'h0 : _GEN_21106; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22498 = _T_4 ? 1'h0 : _GEN_21109; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22503 = _T_4 ? 1'h0 : _GEN_21114; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22507 = _T_4 ? 1'h0 : _GEN_21118; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22510 = _T_4 ? 1'h0 : _GEN_21121; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22513 = _T_4 ? 1'h0 : _GEN_21124; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22518 = _T_4 ? 1'h0 : _GEN_21129; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22521 = _T_4 ? 1'h0 : _GEN_21134; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22525 = _T_4 ? 1'h0 : _GEN_21138; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22528 = _T_4 ? 1'h0 : _GEN_21141; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22531 = _T_4 ? 1'h0 : _GEN_21144; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22534 = _T_4 ? 1'h0 : _GEN_21147; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22537 = _T_4 ? 1'h0 : _GEN_21150; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22540 = _T_4 ? 1'h0 : _GEN_21153; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22543 = _T_4 ? 1'h0 : _GEN_21156; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22546 = _T_4 ? 1'h0 : _GEN_21159; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22549 = _T_4 ? 1'h0 : _GEN_21162; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22552 = _T_4 ? 1'h0 : _GEN_21165; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22555 = _T_4 ? 1'h0 : _GEN_21168; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22558 = _T_4 ? 1'h0 : _GEN_21171; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22561 = _T_4 ? 1'h0 : _GEN_21174; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22565 = _T_4 ? 1'h0 : _GEN_21178; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22568 = _T_4 ? 1'h0 : _GEN_21181; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22571 = _T_4 ? 1'h0 : _GEN_21184; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22574 = _T_4 ? 1'h0 : _GEN_21187; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22577 = _T_4 ? 1'h0 : _GEN_21190; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22586 = _T_4 ? 1'h0 : _GEN_21199; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22593 = _T_4 ? 1'h0 : _GEN_21206; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22600 = _T_4 ? 1'h0 : _GEN_21213; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22607 = _T_4 ? 1'h0 : _GEN_21220; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22610 = _T_4 ? 1'h0 : _GEN_21223; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22613 = _T_4 ? 1'h0 : _GEN_21226; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22616 = _T_4 ? 1'h0 : _GEN_21229; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22620 = _T_4 ? 1'h0 : _GEN_21233; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22626 = _T_4 ? 1'h0 : _GEN_21239; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22629 = _T_4 ? 1'h0 : _GEN_21242; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22632 = _T_4 ? 1'h0 : _GEN_21245; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22636 = _T_4 ? 1'h0 : _GEN_21249; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22639 = _T_4 ? 1'h0 : _GEN_21252; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22642 = _T_4 ? 1'h0 : _GEN_21255; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22646 = _T_4 ? 1'h0 : _GEN_21259; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22652 = _T_4 ? 1'h0 : _GEN_21265; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22657 = _T_4 ? 1'h0 : _GEN_21270; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22660 = _T_4 ? 1'h0 : _GEN_21273; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22663 = _T_4 ? 1'h0 : _GEN_21276; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22666 = _T_4 ? 1'h0 : _GEN_21279; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22672 = _T_4 ? 1'h0 : _GEN_21285; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22675 = _T_4 ? 1'h0 : _GEN_21288; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22680 = _T_4 ? 1'h0 : _GEN_21293; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22685 = _T_4 ? 1'h0 : _GEN_21298; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22688 = _T_4 ? 1'h0 : _GEN_21301; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22691 = _T_4 ? 1'h0 : _GEN_21304; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22696 = _T_4 ? 1'h0 : _GEN_21309; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22700 = _T_4 ? 1'h0 : _GEN_21313; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22703 = _T_4 ? 1'h0 : _GEN_21316; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22706 = _T_4 ? 1'h0 : _GEN_21319; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22711 = _T_4 ? 1'h0 : _GEN_21324; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22714 = _T_4 ? 1'h0 : _GEN_21327; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22718 = _T_4 ? 1'h0 : _GEN_21331; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22721 = _T_4 ? 1'h0 : _GEN_21334; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22724 = _T_4 ? 1'h0 : _GEN_21337; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22727 = _T_4 ? 1'h0 : _GEN_21340; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22730 = _T_4 ? 1'h0 : _GEN_21343; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22733 = _T_4 ? 1'h0 : _GEN_21346; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22736 = _T_4 ? 1'h0 : _GEN_21349; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22739 = _T_4 ? 1'h0 : _GEN_21352; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22742 = _T_4 ? 1'h0 : _GEN_21355; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22745 = _T_4 ? 1'h0 : _GEN_21358; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22748 = _T_4 ? 1'h0 : _GEN_21361; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22751 = _T_4 ? 1'h0 : _GEN_21364; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22754 = _T_4 ? 1'h0 : _GEN_21367; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22758 = _T_4 ? 1'h0 : _GEN_21371; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22761 = _T_4 ? 1'h0 : _GEN_21374; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22764 = _T_4 ? 1'h0 : _GEN_21377; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22767 = _T_4 ? 1'h0 : _GEN_21380; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22770 = _T_4 ? 1'h0 : _GEN_21383; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22779 = _T_4 ? 1'h0 : _GEN_21392; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22786 = _T_4 ? 1'h0 : _GEN_21399; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22793 = _T_4 ? 1'h0 : _GEN_21406; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22800 = _T_4 ? 1'h0 : _GEN_21413; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22803 = _T_4 ? 1'h0 : _GEN_21416; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22806 = _T_4 ? 1'h0 : _GEN_21419; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22809 = _T_4 ? 1'h0 : _GEN_21422; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22813 = _T_4 ? 1'h0 : _GEN_21426; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22819 = _T_4 ? 1'h0 : _GEN_21432; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22822 = _T_4 ? 1'h0 : _GEN_21435; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22825 = _T_4 ? 1'h0 : _GEN_21438; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22829 = _T_4 ? 1'h0 : _GEN_21442; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22832 = _T_4 ? 1'h0 : _GEN_21445; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22835 = _T_4 ? 1'h0 : _GEN_21448; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22839 = _T_4 ? 1'h0 : _GEN_21452; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22845 = _T_4 ? 1'h0 : _GEN_21458; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22850 = _T_4 ? 1'h0 : _GEN_21463; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22853 = _T_4 ? 1'h0 : _GEN_21466; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22856 = _T_4 ? 1'h0 : _GEN_21469; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22859 = _T_4 ? 1'h0 : _GEN_21472; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22865 = _T_4 ? 1'h0 : _GEN_21478; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22868 = _T_4 ? 1'h0 : _GEN_21481; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22873 = _T_4 ? 1'h0 : _GEN_21486; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22878 = _T_4 ? 1'h0 : _GEN_21491; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22881 = _T_4 ? 1'h0 : _GEN_21494; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22884 = _T_4 ? 1'h0 : _GEN_21497; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22889 = _T_4 ? 1'h0 : _GEN_21502; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22893 = _T_4 ? 1'h0 : _GEN_21506; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22896 = _T_4 ? 1'h0 : _GEN_21509; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22899 = _T_4 ? 1'h0 : _GEN_21512; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22904 = _T_4 ? 1'h0 : _GEN_21517; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22907 = _T_4 ? 1'h0 : _GEN_21520; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22911 = _T_4 ? 1'h0 : _GEN_21524; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22914 = _T_4 ? 1'h0 : _GEN_21527; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22917 = _T_4 ? 1'h0 : _GEN_21530; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22920 = _T_4 ? 1'h0 : _GEN_21533; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22923 = _T_4 ? 1'h0 : _GEN_21536; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22926 = _T_4 ? 1'h0 : _GEN_21539; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22929 = _T_4 ? 1'h0 : _GEN_21542; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22932 = _T_4 ? 1'h0 : _GEN_21545; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22935 = _T_4 ? 1'h0 : _GEN_21548; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22938 = _T_4 ? 1'h0 : _GEN_21551; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22941 = _T_4 ? 1'h0 : _GEN_21554; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22944 = _T_4 ? 1'h0 : _GEN_21557; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22947 = _T_4 ? 1'h0 : _GEN_21560; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22951 = _T_4 ? 1'h0 : _GEN_21564; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22954 = _T_4 ? 1'h0 : _GEN_21567; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22957 = _T_4 ? 1'h0 : _GEN_21570; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22960 = _T_4 ? 1'h0 : _GEN_21573; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22963 = _T_4 ? 1'h0 : _GEN_21576; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22972 = _T_4 ? 1'h0 : _GEN_21585; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22979 = _T_4 ? 1'h0 : _GEN_21592; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22986 = _T_4 ? 1'h0 : _GEN_21599; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_22993 = _T_4 ? 1'h0 : _GEN_21606; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22996 = _T_4 ? 1'h0 : _GEN_21609; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_22999 = _T_4 ? 1'h0 : _GEN_21612; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23002 = _T_4 ? 1'h0 : _GEN_21615; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23006 = _T_4 ? 1'h0 : _GEN_21619; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23012 = _T_4 ? 1'h0 : _GEN_21625; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23015 = _T_4 ? 1'h0 : _GEN_21628; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23018 = _T_4 ? 1'h0 : _GEN_21631; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23022 = _T_4 ? 1'h0 : _GEN_21635; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23025 = _T_4 ? 1'h0 : _GEN_21638; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23028 = _T_4 ? 1'h0 : _GEN_21641; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23032 = _T_4 ? 1'h0 : _GEN_21645; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23038 = _T_4 ? 1'h0 : _GEN_21651; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23043 = _T_4 ? 1'h0 : _GEN_21656; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23046 = _T_4 ? 1'h0 : _GEN_21659; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23049 = _T_4 ? 1'h0 : _GEN_21662; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23052 = _T_4 ? 1'h0 : _GEN_21665; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23058 = _T_4 ? 1'h0 : _GEN_21671; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23061 = _T_4 ? 1'h0 : _GEN_21674; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23066 = _T_4 ? 1'h0 : _GEN_21679; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23071 = _T_4 ? 1'h0 : _GEN_21684; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23074 = _T_4 ? 1'h0 : _GEN_21687; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23077 = _T_4 ? 1'h0 : _GEN_21690; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23082 = _T_4 ? 1'h0 : _GEN_21695; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23086 = _T_4 ? 1'h0 : _GEN_21699; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23089 = _T_4 ? 1'h0 : _GEN_21702; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23092 = _T_4 ? 1'h0 : _GEN_21705; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23097 = _T_4 ? 1'h0 : _GEN_21710; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23100 = _T_4 ? 1'h0 : _GEN_21713; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23104 = _T_4 ? 1'h0 : _GEN_21717; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23107 = _T_4 ? 1'h0 : _GEN_21720; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23110 = _T_4 ? 1'h0 : _GEN_21723; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23113 = _T_4 ? 1'h0 : _GEN_21726; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23116 = _T_4 ? 1'h0 : _GEN_21729; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23119 = _T_4 ? 1'h0 : _GEN_21732; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23122 = _T_4 ? 1'h0 : _GEN_21735; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23125 = _T_4 ? 1'h0 : _GEN_21738; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23128 = _T_4 ? 1'h0 : _GEN_21741; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23131 = _T_4 ? 1'h0 : _GEN_21744; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23134 = _T_4 ? 1'h0 : _GEN_21747; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23137 = _T_4 ? 1'h0 : _GEN_21750; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23140 = _T_4 ? 1'h0 : _GEN_21753; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23144 = _T_4 ? 1'h0 : _GEN_21757; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23147 = _T_4 ? 1'h0 : _GEN_21760; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23150 = _T_4 ? 1'h0 : _GEN_21763; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23153 = _T_4 ? 1'h0 : _GEN_21766; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23156 = _T_4 ? 1'h0 : _GEN_21769; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23165 = _T_4 ? 1'h0 : _GEN_21778; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23172 = _T_4 ? 1'h0 : _GEN_21785; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23179 = _T_4 ? 1'h0 : _GEN_21792; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23186 = _T_4 ? 1'h0 : _GEN_21799; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23189 = _T_4 ? 1'h0 : _GEN_21802; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23192 = _T_4 ? 1'h0 : _GEN_21805; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23195 = _T_4 ? 1'h0 : _GEN_21808; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23199 = _T_4 ? 1'h0 : _GEN_21812; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23205 = _T_4 ? 1'h0 : _GEN_21818; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23208 = _T_4 ? 1'h0 : _GEN_21821; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23211 = _T_4 ? 1'h0 : _GEN_21824; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23215 = _T_4 ? 1'h0 : _GEN_21828; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23218 = _T_4 ? 1'h0 : _GEN_21831; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23221 = _T_4 ? 1'h0 : _GEN_21834; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23225 = _T_4 ? 1'h0 : _GEN_21838; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23231 = _T_4 ? 1'h0 : _GEN_21844; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23236 = _T_4 ? 1'h0 : _GEN_21849; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23239 = _T_4 ? 1'h0 : _GEN_21852; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23242 = _T_4 ? 1'h0 : _GEN_21855; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23245 = _T_4 ? 1'h0 : _GEN_21858; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23251 = _T_4 ? 1'h0 : _GEN_21864; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23254 = _T_4 ? 1'h0 : _GEN_21867; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23259 = _T_4 ? 1'h0 : _GEN_21872; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23264 = _T_4 ? 1'h0 : _GEN_21877; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23267 = _T_4 ? 1'h0 : _GEN_21880; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23270 = _T_4 ? 1'h0 : _GEN_21883; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23275 = _T_4 ? 1'h0 : _GEN_21888; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23279 = _T_4 ? 1'h0 : _GEN_21892; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23282 = _T_4 ? 1'h0 : _GEN_21895; // @[Conditional.scala 40:58 Core.scala 724:20]
  wire  _GEN_23285 = _T_4 ? 1'h0 : _GEN_21898; // @[Conditional.scala 40:58 Core.scala 90:27]
  wire  _GEN_23290 = _T_4 ? 1'h0 : _GEN_21903; // @[Conditional.scala 40:58 Core.scala 724:20]
  reg  REG_30; // @[Core.scala 772:43]
  wire  _T_1481 = ~reset & REG_30; // @[Core.scala 772:33]
  wire  _GEN_24684 = _T_3 & _T_4 & ~_T_6 & _T_12; // @[Core.scala 729:11]
  wire  _GEN_24695 = _GEN_24684 & ~_T_16; // @[Core.scala 731:59]
  wire  _GEN_24704 = _GEN_24695 & ~_T_20; // @[Core.scala 732:59]
  wire  _GEN_24715 = _GEN_24704 & ~_T_57; // @[Core.scala 733:97]
  wire  _GEN_24716 = _GEN_24704 & ~_T_57 & (8'hcd == _T_60 | 8'hc4 == _T_62); // @[Core.scala 733:97]
  wire  _GEN_24739 = _GEN_24715 & ~_T_64; // @[Core.scala 734:59]
  wire  _GEN_24754 = _GEN_24739 & ~_T_84; // @[Core.scala 735:59]
  wire  _GEN_24771 = _GEN_24754 & ~_T_96; // @[Core.scala 736:59]
  wire  _GEN_24790 = _GEN_24771 & ~_T_117; // @[Core.scala 737:59]
  wire  _GEN_24811 = _GEN_24790 & ~_T_134; // @[Core.scala 738:59]
  wire  _GEN_24834 = _GEN_24811 & ~_T_138; // @[Core.scala 739:59]
  wire  _GEN_24859 = _GEN_24834 & ~_T_145; // @[Core.scala 740:59]
  wire  _GEN_24860 = _GEN_24834 & ~_T_145 & 8'h6 == _T_153; // @[Core.scala 740:59]
  wire  _GEN_24911 = _GEN_24859 & ~_T_154; // @[Core.scala 741:59]
  wire  _GEN_24940 = _GEN_24911 & ~_T_167; // @[Core.scala 742:97]
  wire  _GEN_24978 = _T_3 & _T_4 & ~_T_6 & ~_T_12 & _T_101; // @[Core.scala 729:11]
  wire  _GEN_24993 = _GEN_24978 & ~_T_224; // @[Core.scala 731:59]
  wire  _GEN_25004 = _GEN_24993 & ~_T_228; // @[Core.scala 732:59]
  wire  _GEN_25017 = _GEN_25004 & ~_T_265; // @[Core.scala 733:97]
  wire  _GEN_25018 = _GEN_25004 & ~_T_265 & (8'hcd == _T_268 | 8'hc4 == _T_270); // @[Core.scala 733:97]
  wire  _GEN_25045 = _GEN_25017 & ~_T_272; // @[Core.scala 734:59]
  wire  _GEN_25062 = _GEN_25045 & ~_T_292; // @[Core.scala 735:59]
  wire  _GEN_25081 = _GEN_25062 & ~_T_304; // @[Core.scala 736:59]
  wire  _GEN_25102 = _GEN_25081 & ~_T_325; // @[Core.scala 737:59]
  wire  _GEN_25125 = _GEN_25102 & ~_T_342; // @[Core.scala 738:59]
  wire  _GEN_25150 = _GEN_25125 & ~_T_346; // @[Core.scala 739:59]
  wire  _GEN_25177 = _GEN_25150 & ~_T_353; // @[Core.scala 740:59]
  wire  _GEN_25178 = _GEN_25150 & ~_T_353 & 8'h6 == _T_361; // @[Core.scala 740:59]
  wire  _GEN_25233 = _GEN_25177 & ~_T_362; // @[Core.scala 741:59]
  wire  _GEN_25264 = _GEN_25233 & ~_T_375; // @[Core.scala 742:97]
  wire  _GEN_25304 = _T_3 & ~_T_4 & _T_25 & ~_T_6 & _T_12; // @[Core.scala 729:11]
  wire  _GEN_25319 = _GEN_25304 & ~_T_441; // @[Core.scala 731:59]
  wire  _GEN_25330 = _GEN_25319 & ~_T_445; // @[Core.scala 732:59]
  wire  _GEN_25343 = _GEN_25330 & ~_T_482; // @[Core.scala 733:97]
  wire  _GEN_25344 = _GEN_25330 & ~_T_482 & (8'hcd == _T_485 | 8'hc4 == _T_487); // @[Core.scala 733:97]
  wire  _GEN_25371 = _GEN_25343 & ~_T_489; // @[Core.scala 734:59]
  wire  _GEN_25388 = _GEN_25371 & ~_T_509; // @[Core.scala 735:59]
  wire  _GEN_25407 = _GEN_25388 & ~_T_521; // @[Core.scala 736:59]
  wire  _GEN_25428 = _GEN_25407 & ~_T_542; // @[Core.scala 737:59]
  wire  _GEN_25451 = _GEN_25428 & ~_T_559; // @[Core.scala 738:59]
  wire  _GEN_25476 = _GEN_25451 & ~_T_563; // @[Core.scala 739:59]
  wire  _GEN_25503 = _GEN_25476 & ~_T_570; // @[Core.scala 740:59]
  wire  _GEN_25504 = _GEN_25476 & ~_T_570 & 8'h6 == _T_578; // @[Core.scala 740:59]
  wire  _GEN_25559 = _GEN_25503 & ~_T_579; // @[Core.scala 741:59]
  wire  _GEN_25590 = _GEN_25559 & ~_T_592; // @[Core.scala 742:97]
  wire  _GEN_25632 = _T_3 & ~_T_4 & ~_T_25 & _T_79 & ~_T_6 & _T_12; // @[Core.scala 729:11]
  wire  _GEN_25651 = _GEN_25632 & ~_T_661; // @[Core.scala 731:59]
  wire  _GEN_25664 = _GEN_25651 & ~_T_665; // @[Core.scala 732:59]
  wire  _GEN_25679 = _GEN_25664 & ~_T_702; // @[Core.scala 733:97]
  wire  _GEN_25680 = _GEN_25664 & ~_T_702 & (8'hcd == _T_705 | 8'hc4 == _T_707); // @[Core.scala 733:97]
  wire  _GEN_25711 = _GEN_25679 & ~_T_709; // @[Core.scala 734:59]
  wire  _GEN_25730 = _GEN_25711 & ~_T_729; // @[Core.scala 735:59]
  wire  _GEN_25751 = _GEN_25730 & ~_T_741; // @[Core.scala 736:59]
  wire  _GEN_25774 = _GEN_25751 & ~_T_762; // @[Core.scala 737:59]
  wire  _GEN_25799 = _GEN_25774 & ~_T_779; // @[Core.scala 738:59]
  wire  _GEN_25826 = _GEN_25799 & ~_T_783; // @[Core.scala 739:59]
  wire  _GEN_25855 = _GEN_25826 & ~_T_790; // @[Core.scala 740:59]
  wire  _GEN_25856 = _GEN_25826 & ~_T_790 & 8'h6 == _T_798; // @[Core.scala 740:59]
  wire  _GEN_25915 = _GEN_25855 & ~_T_799; // @[Core.scala 741:59]
  wire  _GEN_25948 = _GEN_25915 & ~_T_812; // @[Core.scala 742:97]
  wire  _GEN_25994 = _T_3 & ~_T_4 & ~_T_25 & _T_79 & ~_T_6 & ~_T_12 & _T_101; // @[Core.scala 729:11]
  wire  _GEN_26017 = _GEN_25994 & ~_T_869; // @[Core.scala 731:59]
  wire  _GEN_26032 = _GEN_26017 & ~_T_873; // @[Core.scala 732:59]
  wire  _GEN_26049 = _GEN_26032 & ~_T_910; // @[Core.scala 733:97]
  wire  _GEN_26050 = _GEN_26032 & ~_T_910 & (8'hcd == _T_913 | 8'hc4 == _T_915); // @[Core.scala 733:97]
  wire  _GEN_26085 = _GEN_26049 & ~_T_917; // @[Core.scala 734:59]
  wire  _GEN_26106 = _GEN_26085 & ~_T_937; // @[Core.scala 735:59]
  wire  _GEN_26129 = _GEN_26106 & ~_T_949; // @[Core.scala 736:59]
  wire  _GEN_26154 = _GEN_26129 & ~_T_970; // @[Core.scala 737:59]
  wire  _GEN_26181 = _GEN_26154 & ~_T_987; // @[Core.scala 738:59]
  wire  _GEN_26210 = _GEN_26181 & ~_T_991; // @[Core.scala 739:59]
  wire  _GEN_26241 = _GEN_26210 & ~_T_998; // @[Core.scala 740:59]
  wire  _GEN_26242 = _GEN_26210 & ~_T_998 & 8'h6 == _T_1006; // @[Core.scala 740:59]
  wire  _GEN_26305 = _GEN_26241 & ~_T_1007; // @[Core.scala 741:59]
  wire  _GEN_26340 = _GEN_26305 & ~_T_1020; // @[Core.scala 742:97]
  wire  _GEN_26385 = _T_3 & ~_T_4 & ~_T_25 & ~_T_79 & _T_77; // @[Core.scala 729:11]
  wire  _GEN_26402 = _GEN_26385 & ~_T_1074; // @[Core.scala 731:59]
  wire  _GEN_26414 = _GEN_26402 & ~_T_1078; // @[Core.scala 732:59]
  wire  _GEN_26428 = _GEN_26414 & ~_T_1115; // @[Core.scala 733:97]
  wire  _GEN_26429 = _GEN_26414 & ~_T_1115 & (8'hcd == _T_1118 | 8'hc4 == _T_1120); // @[Core.scala 733:97]
  wire  _GEN_26458 = _GEN_26428 & ~_T_1122; // @[Core.scala 734:59]
  wire  _GEN_26476 = _GEN_26458 & ~_T_1142; // @[Core.scala 735:59]
  wire  _GEN_26496 = _GEN_26476 & ~_T_1154; // @[Core.scala 736:59]
  wire  _GEN_26518 = _GEN_26496 & ~_T_1175; // @[Core.scala 737:59]
  wire  _GEN_26542 = _GEN_26518 & ~_T_1192; // @[Core.scala 738:59]
  wire  _GEN_26568 = _GEN_26542 & ~_T_1196; // @[Core.scala 739:59]
  wire  _GEN_26596 = _GEN_26568 & ~_T_1203; // @[Core.scala 740:59]
  wire  _GEN_26597 = _GEN_26568 & ~_T_1203 & 8'h6 == _T_1211; // @[Core.scala 740:59]
  wire  _GEN_26654 = _GEN_26596 & ~_T_1212; // @[Core.scala 741:59]
  wire  _GEN_26686 = _GEN_26654 & ~_T_1225; // @[Core.scala 742:97]
  wire  _GEN_26730 = _T_3 & ~_T_4 & ~_T_25 & ~_T_79 & ~_T_77 & _T_27; // @[Core.scala 729:11]
  wire  _GEN_26751 = _GEN_26730 & ~_T_1279; // @[Core.scala 731:59]
  wire  _GEN_26765 = _GEN_26751 & ~_T_1283; // @[Core.scala 732:59]
  wire  _GEN_26781 = _GEN_26765 & ~_T_1320; // @[Core.scala 733:97]
  wire  _GEN_26782 = _GEN_26765 & ~_T_1320 & (8'hcd == _T_1323 | 8'hc4 == _T_1325); // @[Core.scala 733:97]
  wire  _GEN_26815 = _GEN_26781 & ~_T_1327; // @[Core.scala 734:59]
  wire  _GEN_26835 = _GEN_26815 & ~_T_1347; // @[Core.scala 735:59]
  wire  _GEN_26857 = _GEN_26835 & ~_T_1359; // @[Core.scala 736:59]
  wire  _GEN_26881 = _GEN_26857 & ~_T_1380; // @[Core.scala 737:59]
  wire  _GEN_26907 = _GEN_26881 & ~_T_1397; // @[Core.scala 738:59]
  wire  _GEN_26935 = _GEN_26907 & ~_T_1401; // @[Core.scala 739:59]
  wire  _GEN_26965 = _GEN_26935 & ~_T_1408; // @[Core.scala 740:59]
  wire  _GEN_26966 = _GEN_26935 & ~_T_1408 & 8'h6 == _T_1416; // @[Core.scala 740:59]
  wire  _GEN_27027 = _GEN_26965 & ~_T_1417; // @[Core.scala 741:59]
  wire  _GEN_27061 = _GEN_27027 & ~_T_1430; // @[Core.scala 742:97]
  ALU alu ( // @[Core.scala 52:19]
    .io_input_A(alu_io_input_A),
    .io_input_B(alu_io_input_B),
    .io_input_carry(alu_io_input_carry),
    .io_calc_type(alu_io_calc_type),
    .io_output_C(alu_io_output_C),
    .io_flag(alu_io_flag)
  );
  ALU16 alu16 ( // @[Core.scala 53:21]
    .io_input_register(alu16_io_input_register),
    .io_offset(alu16_io_offset),
    .io_output(alu16_io_output)
  );
  assign regfiles_front_A_MPORT_addr = 3'h7;
  assign regfiles_front_A_MPORT_data = regfiles_front[regfiles_front_A_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_B_MPORT_addr = 3'h0;
  assign regfiles_front_B_MPORT_data = regfiles_front[regfiles_front_B_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_C_MPORT_addr = 3'h1;
  assign regfiles_front_C_MPORT_data = regfiles_front[regfiles_front_C_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_D_MPORT_addr = 3'h2;
  assign regfiles_front_D_MPORT_data = regfiles_front[regfiles_front_D_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_E_MPORT_addr = 3'h3;
  assign regfiles_front_E_MPORT_data = regfiles_front[regfiles_front_E_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_H_MPORT_addr = 3'h4;
  assign regfiles_front_H_MPORT_data = regfiles_front[regfiles_front_H_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_L_MPORT_addr = 3'h5;
  assign regfiles_front_L_MPORT_data = regfiles_front[regfiles_front_L_MPORT_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_addr = 3'h0;
  assign regfiles_front_register_hi_data = regfiles_front[regfiles_front_register_hi_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_addr = 3'h1;
  assign regfiles_front_register_lo_data = regfiles_front[regfiles_front_register_lo_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_1_addr = 3'h2;
  assign regfiles_front_register_hi_1_data = regfiles_front[regfiles_front_register_hi_1_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_1_addr = 3'h3;
  assign regfiles_front_register_lo_1_data = regfiles_front[regfiles_front_register_lo_1_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_2_addr = 3'h4;
  assign regfiles_front_register_hi_2_data = regfiles_front[regfiles_front_register_hi_2_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_2_addr = 3'h5;
  assign regfiles_front_register_lo_2_data = regfiles_front[regfiles_front_register_lo_2_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_2_addr = opcodes_alu_io_input_A_MPORT_1_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_2_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_2_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_1_addr = opcodes_io_bus_data1_MPORT_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_1_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_1_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_data = regfiles_front[regfiles_front_mem_refer_addr_hi_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_1_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_1_data = regfiles_front[regfiles_front_mem_refer_addr_lo_1_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_39_addr = opcodes_MPORT_37_data[2:0];
  assign regfiles_front_MPORT_39_data = regfiles_front[regfiles_front_MPORT_39_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_3_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_3_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_1_addr = opcodes_alu_io_input_B_MPORT_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_1_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_1_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_3_addr = 3'h0;
  assign regfiles_front_register_hi_3_data = regfiles_front[regfiles_front_register_hi_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_3_addr = 3'h1;
  assign regfiles_front_register_lo_3_data = regfiles_front[regfiles_front_register_lo_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_4_addr = 3'h2;
  assign regfiles_front_register_hi_4_data = regfiles_front[regfiles_front_register_hi_4_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_4_addr = 3'h3;
  assign regfiles_front_register_lo_4_data = regfiles_front[regfiles_front_register_lo_4_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_5_addr = 3'h4;
  assign regfiles_front_register_hi_5_data = regfiles_front[regfiles_front_register_hi_5_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_5_addr = 3'h5;
  assign regfiles_front_register_lo_5_data = regfiles_front[regfiles_front_register_lo_5_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_6_addr = opcodes_alu_io_input_A_MPORT_5_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_6_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_6_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_3_addr = opcodes_io_bus_data1_MPORT_2_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_3_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_1_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_1_data = regfiles_front[regfiles_front_mem_refer_addr_hi_1_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_3_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_3_data = regfiles_front[regfiles_front_mem_refer_addr_lo_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_95_addr = opcodes_MPORT_93_data[2:0];
  assign regfiles_front_MPORT_95_data = regfiles_front[regfiles_front_MPORT_95_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_7_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_7_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_7_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_3_addr = opcodes_alu_io_input_B_MPORT_2_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_3_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_6_addr = 3'h0;
  assign regfiles_front_register_hi_6_data = regfiles_front[regfiles_front_register_hi_6_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_6_addr = 3'h1;
  assign regfiles_front_register_lo_6_data = regfiles_front[regfiles_front_register_lo_6_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_7_addr = 3'h2;
  assign regfiles_front_register_hi_7_data = regfiles_front[regfiles_front_register_hi_7_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_7_addr = 3'h3;
  assign regfiles_front_register_lo_7_data = regfiles_front[regfiles_front_register_lo_7_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_8_addr = 3'h4;
  assign regfiles_front_register_hi_8_data = regfiles_front[regfiles_front_register_hi_8_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_8_addr = 3'h5;
  assign regfiles_front_register_lo_8_data = regfiles_front[regfiles_front_register_lo_8_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_10_addr = opcodes_alu_io_input_A_MPORT_9_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_10_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_10_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_5_addr = opcodes_io_bus_data1_MPORT_4_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_5_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_5_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_2_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_2_data = regfiles_front[regfiles_front_mem_refer_addr_hi_2_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_5_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_5_data = regfiles_front[regfiles_front_mem_refer_addr_lo_5_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_152_addr = opcodes_MPORT_150_data[2:0];
  assign regfiles_front_MPORT_152_data = regfiles_front[regfiles_front_MPORT_152_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_11_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_11_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_11_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_5_addr = opcodes_alu_io_input_B_MPORT_4_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_5_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_5_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_9_addr = 3'h0;
  assign regfiles_front_register_hi_9_data = regfiles_front[regfiles_front_register_hi_9_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_9_addr = 3'h1;
  assign regfiles_front_register_lo_9_data = regfiles_front[regfiles_front_register_lo_9_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_10_addr = 3'h2;
  assign regfiles_front_register_hi_10_data = regfiles_front[regfiles_front_register_hi_10_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_10_addr = 3'h3;
  assign regfiles_front_register_lo_10_data = regfiles_front[regfiles_front_register_lo_10_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_11_addr = 3'h4;
  assign regfiles_front_register_hi_11_data = regfiles_front[regfiles_front_register_hi_11_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_11_addr = 3'h5;
  assign regfiles_front_register_lo_11_data = regfiles_front[regfiles_front_register_lo_11_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_14_addr = opcodes_alu_io_input_A_MPORT_13_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_14_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_14_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_7_addr = opcodes_io_bus_data1_MPORT_6_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_7_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_7_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_3_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_3_data = regfiles_front[regfiles_front_mem_refer_addr_hi_3_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_7_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_7_data = regfiles_front[regfiles_front_mem_refer_addr_lo_7_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_208_addr = opcodes_MPORT_206_data[2:0];
  assign regfiles_front_MPORT_208_data = regfiles_front[regfiles_front_MPORT_208_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_15_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_15_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_15_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_7_addr = opcodes_alu_io_input_B_MPORT_6_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_7_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_7_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_12_addr = 3'h0;
  assign regfiles_front_register_hi_12_data = regfiles_front[regfiles_front_register_hi_12_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_12_addr = 3'h1;
  assign regfiles_front_register_lo_12_data = regfiles_front[regfiles_front_register_lo_12_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_13_addr = 3'h2;
  assign regfiles_front_register_hi_13_data = regfiles_front[regfiles_front_register_hi_13_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_13_addr = 3'h3;
  assign regfiles_front_register_lo_13_data = regfiles_front[regfiles_front_register_lo_13_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_14_addr = 3'h4;
  assign regfiles_front_register_hi_14_data = regfiles_front[regfiles_front_register_hi_14_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_14_addr = 3'h5;
  assign regfiles_front_register_lo_14_data = regfiles_front[regfiles_front_register_lo_14_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_18_addr = opcodes_alu_io_input_A_MPORT_17_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_18_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_18_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_9_addr = opcodes_io_bus_data1_MPORT_8_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_9_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_9_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_4_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_4_data = regfiles_front[regfiles_front_mem_refer_addr_hi_4_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_9_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_9_data = regfiles_front[regfiles_front_mem_refer_addr_lo_9_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_264_addr = opcodes_MPORT_262_data[2:0];
  assign regfiles_front_MPORT_264_data = regfiles_front[regfiles_front_MPORT_264_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_19_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_19_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_19_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_9_addr = opcodes_alu_io_input_B_MPORT_8_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_9_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_9_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_15_addr = 3'h0;
  assign regfiles_front_register_hi_15_data = regfiles_front[regfiles_front_register_hi_15_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_15_addr = 3'h1;
  assign regfiles_front_register_lo_15_data = regfiles_front[regfiles_front_register_lo_15_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_16_addr = 3'h2;
  assign regfiles_front_register_hi_16_data = regfiles_front[regfiles_front_register_hi_16_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_16_addr = 3'h3;
  assign regfiles_front_register_lo_16_data = regfiles_front[regfiles_front_register_lo_16_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_17_addr = 3'h4;
  assign regfiles_front_register_hi_17_data = regfiles_front[regfiles_front_register_hi_17_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_17_addr = 3'h5;
  assign regfiles_front_register_lo_17_data = regfiles_front[regfiles_front_register_lo_17_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_22_addr = opcodes_alu_io_input_A_MPORT_21_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_22_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_22_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_11_addr = opcodes_io_bus_data1_MPORT_10_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_11_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_11_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_5_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_5_data = regfiles_front[regfiles_front_mem_refer_addr_hi_5_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_11_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_11_data = regfiles_front[regfiles_front_mem_refer_addr_lo_11_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_320_addr = opcodes_MPORT_318_data[2:0];
  assign regfiles_front_MPORT_320_data = regfiles_front[regfiles_front_MPORT_320_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_23_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_23_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_23_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_11_addr = opcodes_alu_io_input_B_MPORT_10_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_11_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_11_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_18_addr = 3'h0;
  assign regfiles_front_register_hi_18_data = regfiles_front[regfiles_front_register_hi_18_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_18_addr = 3'h1;
  assign regfiles_front_register_lo_18_data = regfiles_front[regfiles_front_register_lo_18_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_19_addr = 3'h2;
  assign regfiles_front_register_hi_19_data = regfiles_front[regfiles_front_register_hi_19_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_19_addr = 3'h3;
  assign regfiles_front_register_lo_19_data = regfiles_front[regfiles_front_register_lo_19_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_hi_20_addr = 3'h4;
  assign regfiles_front_register_hi_20_data = regfiles_front[regfiles_front_register_hi_20_addr]; // @[Core.scala 90:27]
  assign regfiles_front_register_lo_20_addr = 3'h5;
  assign regfiles_front_register_lo_20_data = regfiles_front[regfiles_front_register_lo_20_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_26_addr = opcodes_alu_io_input_A_MPORT_25_data[5:3];
  assign regfiles_front_alu_io_input_A_MPORT_26_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_26_addr]; // @[Core.scala 90:27]
  assign regfiles_front_io_bus_data1_MPORT_13_addr = opcodes_io_bus_data1_MPORT_12_data[2:0];
  assign regfiles_front_io_bus_data1_MPORT_13_data = regfiles_front[regfiles_front_io_bus_data1_MPORT_13_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_hi_6_addr = 3'h4;
  assign regfiles_front_mem_refer_addr_hi_6_data = regfiles_front[regfiles_front_mem_refer_addr_hi_6_addr]; // @[Core.scala 90:27]
  assign regfiles_front_mem_refer_addr_lo_13_addr = 3'h5;
  assign regfiles_front_mem_refer_addr_lo_13_data = regfiles_front[regfiles_front_mem_refer_addr_lo_13_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_376_addr = opcodes_MPORT_374_data[2:0];
  assign regfiles_front_MPORT_376_data = regfiles_front[regfiles_front_MPORT_376_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_A_MPORT_27_addr = 3'h7;
  assign regfiles_front_alu_io_input_A_MPORT_27_data = regfiles_front[regfiles_front_alu_io_input_A_MPORT_27_addr]; // @[Core.scala 90:27]
  assign regfiles_front_alu_io_input_B_MPORT_13_addr = opcodes_alu_io_input_B_MPORT_12_data[2:0];
  assign regfiles_front_alu_io_input_B_MPORT_13_data = regfiles_front[regfiles_front_alu_io_input_B_MPORT_13_addr]; // @[Core.scala 90:27]
  assign regfiles_front_MPORT_22_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_22_addr = 3'h0;
  assign regfiles_front_MPORT_22_mask = 1'h1;
  assign regfiles_front_MPORT_22_en = _T_3 & _GEN_21995;
  assign regfiles_front_MPORT_23_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_23_addr = 3'h1;
  assign regfiles_front_MPORT_23_mask = 1'h1;
  assign regfiles_front_MPORT_23_en = _T_3 & _GEN_21995;
  assign regfiles_front_MPORT_24_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_24_addr = 3'h2;
  assign regfiles_front_MPORT_24_mask = 1'h1;
  assign regfiles_front_MPORT_24_en = _T_3 & _GEN_22002;
  assign regfiles_front_MPORT_25_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_25_addr = 3'h3;
  assign regfiles_front_MPORT_25_mask = 1'h1;
  assign regfiles_front_MPORT_25_en = _T_3 & _GEN_22002;
  assign regfiles_front_MPORT_26_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_26_addr = 3'h4;
  assign regfiles_front_MPORT_26_mask = 1'h1;
  assign regfiles_front_MPORT_26_en = _T_3 & _GEN_22009;
  assign regfiles_front_MPORT_27_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_27_addr = 3'h5;
  assign regfiles_front_MPORT_27_mask = 1'h1;
  assign regfiles_front_MPORT_27_en = _T_3 & _GEN_22009;
  assign regfiles_front_MPORT_31_data = alu_io_output_C;
  assign regfiles_front_MPORT_31_addr = opcodes_MPORT_30_data[5:3];
  assign regfiles_front_MPORT_31_mask = 1'h1;
  assign regfiles_front_MPORT_31_en = _T_3 & _GEN_22033;
  assign regfiles_front_MPORT_38_data = regfiles_front_MPORT_39_data;
  assign regfiles_front_MPORT_38_addr = opcodes_MPORT_37_data[5:3];
  assign regfiles_front_MPORT_38_mask = 1'h1;
  assign regfiles_front_MPORT_38_en = _T_3 & _GEN_22059;
  assign regfiles_front_MPORT_40_data = io_bus_data;
  assign regfiles_front_MPORT_40_addr = opcodes_MPORT_37_data[5:3];
  assign regfiles_front_MPORT_40_mask = 1'h1;
  assign regfiles_front_MPORT_40_en = _T_3 & _GEN_22065;
  assign regfiles_front_MPORT_45_data = opcodes_MPORT_46_data;
  assign regfiles_front_MPORT_45_addr = opcodes_MPORT_44_data[5:3];
  assign regfiles_front_MPORT_45_mask = 1'h1;
  assign regfiles_front_MPORT_45_en = _T_3 & _GEN_22079;
  assign regfiles_front_MPORT_49_data = alu_io_output_C;
  assign regfiles_front_MPORT_49_addr = 3'h7;
  assign regfiles_front_MPORT_49_mask = 1'h1;
  assign regfiles_front_MPORT_49_en = _T_3 & _GEN_22093;
  assign regfiles_front_MPORT_56_data = io_bus_data;
  assign regfiles_front_MPORT_56_addr = 3'h7;
  assign regfiles_front_MPORT_56_mask = 1'h1;
  assign regfiles_front_MPORT_56_en = _T_3 & _GEN_22120;
  assign regfiles_front_MPORT_78_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_78_addr = 3'h0;
  assign regfiles_front_MPORT_78_mask = 1'h1;
  assign regfiles_front_MPORT_78_en = _T_3 & _GEN_22194;
  assign regfiles_front_MPORT_79_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_79_addr = 3'h1;
  assign regfiles_front_MPORT_79_mask = 1'h1;
  assign regfiles_front_MPORT_79_en = _T_3 & _GEN_22194;
  assign regfiles_front_MPORT_80_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_80_addr = 3'h2;
  assign regfiles_front_MPORT_80_mask = 1'h1;
  assign regfiles_front_MPORT_80_en = _T_3 & _GEN_22201;
  assign regfiles_front_MPORT_81_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_81_addr = 3'h3;
  assign regfiles_front_MPORT_81_mask = 1'h1;
  assign regfiles_front_MPORT_81_en = _T_3 & _GEN_22201;
  assign regfiles_front_MPORT_82_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_82_addr = 3'h4;
  assign regfiles_front_MPORT_82_mask = 1'h1;
  assign regfiles_front_MPORT_82_en = _T_3 & _GEN_22208;
  assign regfiles_front_MPORT_83_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_83_addr = 3'h5;
  assign regfiles_front_MPORT_83_mask = 1'h1;
  assign regfiles_front_MPORT_83_en = _T_3 & _GEN_22208;
  assign regfiles_front_MPORT_87_data = alu_io_output_C;
  assign regfiles_front_MPORT_87_addr = opcodes_MPORT_86_data[5:3];
  assign regfiles_front_MPORT_87_mask = 1'h1;
  assign regfiles_front_MPORT_87_en = _T_3 & _GEN_22228;
  assign regfiles_front_MPORT_94_data = regfiles_front_MPORT_95_data;
  assign regfiles_front_MPORT_94_addr = opcodes_MPORT_93_data[5:3];
  assign regfiles_front_MPORT_94_mask = 1'h1;
  assign regfiles_front_MPORT_94_en = _T_3 & _GEN_22254;
  assign regfiles_front_MPORT_96_data = io_bus_data;
  assign regfiles_front_MPORT_96_addr = opcodes_MPORT_93_data[5:3];
  assign regfiles_front_MPORT_96_mask = 1'h1;
  assign regfiles_front_MPORT_96_en = _T_3 & _GEN_22260;
  assign regfiles_front_MPORT_101_data = opcodes_MPORT_102_data;
  assign regfiles_front_MPORT_101_addr = opcodes_MPORT_100_data[5:3];
  assign regfiles_front_MPORT_101_mask = 1'h1;
  assign regfiles_front_MPORT_101_en = _T_3 & _GEN_22274;
  assign regfiles_front_MPORT_105_data = alu_io_output_C;
  assign regfiles_front_MPORT_105_addr = 3'h7;
  assign regfiles_front_MPORT_105_mask = 1'h1;
  assign regfiles_front_MPORT_105_en = _T_3 & _GEN_22288;
  assign regfiles_front_MPORT_112_data = io_bus_data;
  assign regfiles_front_MPORT_112_addr = 3'h7;
  assign regfiles_front_MPORT_112_mask = 1'h1;
  assign regfiles_front_MPORT_112_en = _T_3 & _GEN_22314;
  assign regfiles_front_MPORT_135_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_135_addr = 3'h0;
  assign regfiles_front_MPORT_135_mask = 1'h1;
  assign regfiles_front_MPORT_135_en = _T_3 & _GEN_22393;
  assign regfiles_front_MPORT_136_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_136_addr = 3'h1;
  assign regfiles_front_MPORT_136_mask = 1'h1;
  assign regfiles_front_MPORT_136_en = _T_3 & _GEN_22393;
  assign regfiles_front_MPORT_137_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_137_addr = 3'h2;
  assign regfiles_front_MPORT_137_mask = 1'h1;
  assign regfiles_front_MPORT_137_en = _T_3 & _GEN_22400;
  assign regfiles_front_MPORT_138_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_138_addr = 3'h3;
  assign regfiles_front_MPORT_138_mask = 1'h1;
  assign regfiles_front_MPORT_138_en = _T_3 & _GEN_22400;
  assign regfiles_front_MPORT_139_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_139_addr = 3'h4;
  assign regfiles_front_MPORT_139_mask = 1'h1;
  assign regfiles_front_MPORT_139_en = _T_3 & _GEN_22407;
  assign regfiles_front_MPORT_140_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_140_addr = 3'h5;
  assign regfiles_front_MPORT_140_mask = 1'h1;
  assign regfiles_front_MPORT_140_en = _T_3 & _GEN_22407;
  assign regfiles_front_MPORT_144_data = alu_io_output_C;
  assign regfiles_front_MPORT_144_addr = opcodes_MPORT_143_data[5:3];
  assign regfiles_front_MPORT_144_mask = 1'h1;
  assign regfiles_front_MPORT_144_en = _T_3 & _GEN_22427;
  assign regfiles_front_MPORT_151_data = regfiles_front_MPORT_152_data;
  assign regfiles_front_MPORT_151_addr = opcodes_MPORT_150_data[5:3];
  assign regfiles_front_MPORT_151_mask = 1'h1;
  assign regfiles_front_MPORT_151_en = _T_3 & _GEN_22453;
  assign regfiles_front_MPORT_153_data = io_bus_data;
  assign regfiles_front_MPORT_153_addr = opcodes_MPORT_150_data[5:3];
  assign regfiles_front_MPORT_153_mask = 1'h1;
  assign regfiles_front_MPORT_153_en = _T_3 & _GEN_22459;
  assign regfiles_front_MPORT_158_data = opcodes_MPORT_159_data;
  assign regfiles_front_MPORT_158_addr = opcodes_MPORT_157_data[5:3];
  assign regfiles_front_MPORT_158_mask = 1'h1;
  assign regfiles_front_MPORT_158_en = _T_3 & _GEN_22473;
  assign regfiles_front_MPORT_162_data = alu_io_output_C;
  assign regfiles_front_MPORT_162_addr = 3'h7;
  assign regfiles_front_MPORT_162_mask = 1'h1;
  assign regfiles_front_MPORT_162_en = _T_3 & _GEN_22487;
  assign regfiles_front_MPORT_169_data = io_bus_data;
  assign regfiles_front_MPORT_169_addr = 3'h7;
  assign regfiles_front_MPORT_169_mask = 1'h1;
  assign regfiles_front_MPORT_169_en = _T_3 & _GEN_22513;
  assign regfiles_front_MPORT_191_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_191_addr = 3'h0;
  assign regfiles_front_MPORT_191_mask = 1'h1;
  assign regfiles_front_MPORT_191_en = _T_3 & _GEN_22586;
  assign regfiles_front_MPORT_192_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_192_addr = 3'h1;
  assign regfiles_front_MPORT_192_mask = 1'h1;
  assign regfiles_front_MPORT_192_en = _T_3 & _GEN_22586;
  assign regfiles_front_MPORT_193_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_193_addr = 3'h2;
  assign regfiles_front_MPORT_193_mask = 1'h1;
  assign regfiles_front_MPORT_193_en = _T_3 & _GEN_22593;
  assign regfiles_front_MPORT_194_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_194_addr = 3'h3;
  assign regfiles_front_MPORT_194_mask = 1'h1;
  assign regfiles_front_MPORT_194_en = _T_3 & _GEN_22593;
  assign regfiles_front_MPORT_195_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_195_addr = 3'h4;
  assign regfiles_front_MPORT_195_mask = 1'h1;
  assign regfiles_front_MPORT_195_en = _T_3 & _GEN_22600;
  assign regfiles_front_MPORT_196_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_196_addr = 3'h5;
  assign regfiles_front_MPORT_196_mask = 1'h1;
  assign regfiles_front_MPORT_196_en = _T_3 & _GEN_22600;
  assign regfiles_front_MPORT_200_data = alu_io_output_C;
  assign regfiles_front_MPORT_200_addr = opcodes_MPORT_199_data[5:3];
  assign regfiles_front_MPORT_200_mask = 1'h1;
  assign regfiles_front_MPORT_200_en = _T_3 & _GEN_22620;
  assign regfiles_front_MPORT_207_data = regfiles_front_MPORT_208_data;
  assign regfiles_front_MPORT_207_addr = opcodes_MPORT_206_data[5:3];
  assign regfiles_front_MPORT_207_mask = 1'h1;
  assign regfiles_front_MPORT_207_en = _T_3 & _GEN_22646;
  assign regfiles_front_MPORT_209_data = io_bus_data;
  assign regfiles_front_MPORT_209_addr = opcodes_MPORT_206_data[5:3];
  assign regfiles_front_MPORT_209_mask = 1'h1;
  assign regfiles_front_MPORT_209_en = _T_3 & _GEN_22652;
  assign regfiles_front_MPORT_214_data = opcodes_MPORT_215_data;
  assign regfiles_front_MPORT_214_addr = opcodes_MPORT_213_data[5:3];
  assign regfiles_front_MPORT_214_mask = 1'h1;
  assign regfiles_front_MPORT_214_en = _T_3 & _GEN_22666;
  assign regfiles_front_MPORT_218_data = alu_io_output_C;
  assign regfiles_front_MPORT_218_addr = 3'h7;
  assign regfiles_front_MPORT_218_mask = 1'h1;
  assign regfiles_front_MPORT_218_en = _T_3 & _GEN_22680;
  assign regfiles_front_MPORT_225_data = io_bus_data;
  assign regfiles_front_MPORT_225_addr = 3'h7;
  assign regfiles_front_MPORT_225_mask = 1'h1;
  assign regfiles_front_MPORT_225_en = _T_3 & _GEN_22706;
  assign regfiles_front_MPORT_247_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_247_addr = 3'h0;
  assign regfiles_front_MPORT_247_mask = 1'h1;
  assign regfiles_front_MPORT_247_en = _T_3 & _GEN_22779;
  assign regfiles_front_MPORT_248_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_248_addr = 3'h1;
  assign regfiles_front_MPORT_248_mask = 1'h1;
  assign regfiles_front_MPORT_248_en = _T_3 & _GEN_22779;
  assign regfiles_front_MPORT_249_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_249_addr = 3'h2;
  assign regfiles_front_MPORT_249_mask = 1'h1;
  assign regfiles_front_MPORT_249_en = _T_3 & _GEN_22786;
  assign regfiles_front_MPORT_250_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_250_addr = 3'h3;
  assign regfiles_front_MPORT_250_mask = 1'h1;
  assign regfiles_front_MPORT_250_en = _T_3 & _GEN_22786;
  assign regfiles_front_MPORT_251_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_251_addr = 3'h4;
  assign regfiles_front_MPORT_251_mask = 1'h1;
  assign regfiles_front_MPORT_251_en = _T_3 & _GEN_22793;
  assign regfiles_front_MPORT_252_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_252_addr = 3'h5;
  assign regfiles_front_MPORT_252_mask = 1'h1;
  assign regfiles_front_MPORT_252_en = _T_3 & _GEN_22793;
  assign regfiles_front_MPORT_256_data = alu_io_output_C;
  assign regfiles_front_MPORT_256_addr = opcodes_MPORT_255_data[5:3];
  assign regfiles_front_MPORT_256_mask = 1'h1;
  assign regfiles_front_MPORT_256_en = _T_3 & _GEN_22813;
  assign regfiles_front_MPORT_263_data = regfiles_front_MPORT_264_data;
  assign regfiles_front_MPORT_263_addr = opcodes_MPORT_262_data[5:3];
  assign regfiles_front_MPORT_263_mask = 1'h1;
  assign regfiles_front_MPORT_263_en = _T_3 & _GEN_22839;
  assign regfiles_front_MPORT_265_data = io_bus_data;
  assign regfiles_front_MPORT_265_addr = opcodes_MPORT_262_data[5:3];
  assign regfiles_front_MPORT_265_mask = 1'h1;
  assign regfiles_front_MPORT_265_en = _T_3 & _GEN_22845;
  assign regfiles_front_MPORT_270_data = opcodes_MPORT_271_data;
  assign regfiles_front_MPORT_270_addr = opcodes_MPORT_269_data[5:3];
  assign regfiles_front_MPORT_270_mask = 1'h1;
  assign regfiles_front_MPORT_270_en = _T_3 & _GEN_22859;
  assign regfiles_front_MPORT_274_data = alu_io_output_C;
  assign regfiles_front_MPORT_274_addr = 3'h7;
  assign regfiles_front_MPORT_274_mask = 1'h1;
  assign regfiles_front_MPORT_274_en = _T_3 & _GEN_22873;
  assign regfiles_front_MPORT_281_data = io_bus_data;
  assign regfiles_front_MPORT_281_addr = 3'h7;
  assign regfiles_front_MPORT_281_mask = 1'h1;
  assign regfiles_front_MPORT_281_en = _T_3 & _GEN_22899;
  assign regfiles_front_MPORT_303_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_303_addr = 3'h0;
  assign regfiles_front_MPORT_303_mask = 1'h1;
  assign regfiles_front_MPORT_303_en = _T_3 & _GEN_22972;
  assign regfiles_front_MPORT_304_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_304_addr = 3'h1;
  assign regfiles_front_MPORT_304_mask = 1'h1;
  assign regfiles_front_MPORT_304_en = _T_3 & _GEN_22972;
  assign regfiles_front_MPORT_305_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_305_addr = 3'h2;
  assign regfiles_front_MPORT_305_mask = 1'h1;
  assign regfiles_front_MPORT_305_en = _T_3 & _GEN_22979;
  assign regfiles_front_MPORT_306_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_306_addr = 3'h3;
  assign regfiles_front_MPORT_306_mask = 1'h1;
  assign regfiles_front_MPORT_306_en = _T_3 & _GEN_22979;
  assign regfiles_front_MPORT_307_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_307_addr = 3'h4;
  assign regfiles_front_MPORT_307_mask = 1'h1;
  assign regfiles_front_MPORT_307_en = _T_3 & _GEN_22986;
  assign regfiles_front_MPORT_308_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_308_addr = 3'h5;
  assign regfiles_front_MPORT_308_mask = 1'h1;
  assign regfiles_front_MPORT_308_en = _T_3 & _GEN_22986;
  assign regfiles_front_MPORT_312_data = alu_io_output_C;
  assign regfiles_front_MPORT_312_addr = opcodes_MPORT_311_data[5:3];
  assign regfiles_front_MPORT_312_mask = 1'h1;
  assign regfiles_front_MPORT_312_en = _T_3 & _GEN_23006;
  assign regfiles_front_MPORT_319_data = regfiles_front_MPORT_320_data;
  assign regfiles_front_MPORT_319_addr = opcodes_MPORT_318_data[5:3];
  assign regfiles_front_MPORT_319_mask = 1'h1;
  assign regfiles_front_MPORT_319_en = _T_3 & _GEN_23032;
  assign regfiles_front_MPORT_321_data = io_bus_data;
  assign regfiles_front_MPORT_321_addr = opcodes_MPORT_318_data[5:3];
  assign regfiles_front_MPORT_321_mask = 1'h1;
  assign regfiles_front_MPORT_321_en = _T_3 & _GEN_23038;
  assign regfiles_front_MPORT_326_data = opcodes_MPORT_327_data;
  assign regfiles_front_MPORT_326_addr = opcodes_MPORT_325_data[5:3];
  assign regfiles_front_MPORT_326_mask = 1'h1;
  assign regfiles_front_MPORT_326_en = _T_3 & _GEN_23052;
  assign regfiles_front_MPORT_330_data = alu_io_output_C;
  assign regfiles_front_MPORT_330_addr = 3'h7;
  assign regfiles_front_MPORT_330_mask = 1'h1;
  assign regfiles_front_MPORT_330_en = _T_3 & _GEN_23066;
  assign regfiles_front_MPORT_337_data = io_bus_data;
  assign regfiles_front_MPORT_337_addr = 3'h7;
  assign regfiles_front_MPORT_337_mask = 1'h1;
  assign regfiles_front_MPORT_337_en = _T_3 & _GEN_23092;
  assign regfiles_front_MPORT_359_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_359_addr = 3'h0;
  assign regfiles_front_MPORT_359_mask = 1'h1;
  assign regfiles_front_MPORT_359_en = _T_3 & _GEN_23165;
  assign regfiles_front_MPORT_360_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_360_addr = 3'h1;
  assign regfiles_front_MPORT_360_mask = 1'h1;
  assign regfiles_front_MPORT_360_en = _T_3 & _GEN_23165;
  assign regfiles_front_MPORT_361_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_361_addr = 3'h2;
  assign regfiles_front_MPORT_361_mask = 1'h1;
  assign regfiles_front_MPORT_361_en = _T_3 & _GEN_23172;
  assign regfiles_front_MPORT_362_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_362_addr = 3'h3;
  assign regfiles_front_MPORT_362_mask = 1'h1;
  assign regfiles_front_MPORT_362_en = _T_3 & _GEN_23172;
  assign regfiles_front_MPORT_363_data = alu16_io_output[15:8];
  assign regfiles_front_MPORT_363_addr = 3'h4;
  assign regfiles_front_MPORT_363_mask = 1'h1;
  assign regfiles_front_MPORT_363_en = _T_3 & _GEN_23179;
  assign regfiles_front_MPORT_364_data = alu16_io_output[7:0];
  assign regfiles_front_MPORT_364_addr = 3'h5;
  assign regfiles_front_MPORT_364_mask = 1'h1;
  assign regfiles_front_MPORT_364_en = _T_3 & _GEN_23179;
  assign regfiles_front_MPORT_368_data = alu_io_output_C;
  assign regfiles_front_MPORT_368_addr = opcodes_MPORT_367_data[5:3];
  assign regfiles_front_MPORT_368_mask = 1'h1;
  assign regfiles_front_MPORT_368_en = _T_3 & _GEN_23199;
  assign regfiles_front_MPORT_375_data = regfiles_front_MPORT_376_data;
  assign regfiles_front_MPORT_375_addr = opcodes_MPORT_374_data[5:3];
  assign regfiles_front_MPORT_375_mask = 1'h1;
  assign regfiles_front_MPORT_375_en = _T_3 & _GEN_23225;
  assign regfiles_front_MPORT_377_data = io_bus_data;
  assign regfiles_front_MPORT_377_addr = opcodes_MPORT_374_data[5:3];
  assign regfiles_front_MPORT_377_mask = 1'h1;
  assign regfiles_front_MPORT_377_en = _T_3 & _GEN_23231;
  assign regfiles_front_MPORT_382_data = opcodes_MPORT_383_data;
  assign regfiles_front_MPORT_382_addr = opcodes_MPORT_381_data[5:3];
  assign regfiles_front_MPORT_382_mask = 1'h1;
  assign regfiles_front_MPORT_382_en = _T_3 & _GEN_23245;
  assign regfiles_front_MPORT_386_data = alu_io_output_C;
  assign regfiles_front_MPORT_386_addr = 3'h7;
  assign regfiles_front_MPORT_386_mask = 1'h1;
  assign regfiles_front_MPORT_386_en = _T_3 & _GEN_23259;
  assign regfiles_front_MPORT_393_data = io_bus_data;
  assign regfiles_front_MPORT_393_addr = 3'h7;
  assign regfiles_front_MPORT_393_mask = 1'h1;
  assign regfiles_front_MPORT_393_en = _T_3 & _GEN_23285;
  assign opcodes_MPORT_1_addr = 2'h0;
  assign opcodes_MPORT_1_data = opcodes[opcodes_MPORT_1_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_2_addr = 2'h1;
  assign opcodes_MPORT_2_data = opcodes[opcodes_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_3_addr = 2'h0;
  assign opcodes_MPORT_3_data = opcodes[opcodes_MPORT_3_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_5_addr = 2'h0;
  assign opcodes_MPORT_5_data = opcodes[opcodes_MPORT_5_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_data = opcodes[opcodes_mem_refer_addr_lo_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_7_addr = 2'h0;
  assign opcodes_MPORT_7_data = opcodes[opcodes_MPORT_7_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_8_addr = 2'h0;
  assign opcodes_MPORT_8_data = opcodes[opcodes_MPORT_8_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_9_addr = 2'h0;
  assign opcodes_MPORT_9_data = opcodes[opcodes_MPORT_9_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_10_addr = 2'h0;
  assign opcodes_MPORT_10_data = opcodes[opcodes_MPORT_10_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_11_addr = 2'h0;
  assign opcodes_MPORT_11_data = opcodes[opcodes_MPORT_11_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_12_addr = 2'h0;
  assign opcodes_MPORT_12_data = opcodes[opcodes_MPORT_12_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_13_addr = 2'h0;
  assign opcodes_MPORT_13_data = opcodes[opcodes_MPORT_13_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_addr = 2'h0;
  assign opcodes_IFF_MPORT_data = opcodes[opcodes_IFF_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_15_addr = 2'h0;
  assign opcodes_MPORT_15_data = opcodes[opcodes_MPORT_15_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_16_addr = 2'h0;
  assign opcodes_MPORT_16_data = opcodes[opcodes_MPORT_16_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_addr = 2'h0;
  assign opcodes_op_MPORT_data = opcodes[opcodes_op_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_1_addr = 2'h0;
  assign opcodes_op_MPORT_1_data = opcodes[opcodes_op_MPORT_1_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_addr = 2'h2;
  assign opcodes_PC_next_hi_data = opcodes[opcodes_PC_next_hi_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_addr = 2'h1;
  assign opcodes_PC_next_lo_data = opcodes[opcodes_PC_next_lo_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_18_addr = 2'h0;
  assign opcodes_MPORT_18_data = opcodes[opcodes_MPORT_18_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_2_addr = 2'h0;
  assign opcodes_op_MPORT_2_data = opcodes[opcodes_op_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_3_addr = 2'h0;
  assign opcodes_op_MPORT_3_data = opcodes[opcodes_op_MPORT_3_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_1_addr = 2'h1;
  assign opcodes_PC_next_hi_1_data = opcodes[opcodes_PC_next_hi_1_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_20_addr = 2'h0;
  assign opcodes_MPORT_20_data = opcodes[opcodes_MPORT_20_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_21_addr = 2'h0;
  assign opcodes_MPORT_21_data = opcodes[opcodes_MPORT_21_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_28_addr = 2'h0;
  assign opcodes_MPORT_28_data = opcodes[opcodes_MPORT_28_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_29_addr = 2'h0;
  assign opcodes_MPORT_29_data = opcodes[opcodes_MPORT_29_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_data = opcodes[opcodes_alu_io_calc_type_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_data = opcodes[opcodes_alu_io_input_A_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_1_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_1_data = opcodes[opcodes_alu_io_input_A_MPORT_1_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_30_addr = 2'h0;
  assign opcodes_MPORT_30_data = opcodes[opcodes_MPORT_30_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_32_addr = 2'h0;
  assign opcodes_MPORT_32_data = opcodes[opcodes_MPORT_32_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_34_addr = 2'h0;
  assign opcodes_MPORT_34_data = opcodes[opcodes_MPORT_34_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_data = opcodes[opcodes_io_bus_data1_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_36_addr = 2'h0;
  assign opcodes_MPORT_36_data = opcodes[opcodes_MPORT_36_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_37_addr = 2'h0;
  assign opcodes_MPORT_37_data = opcodes[opcodes_MPORT_37_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_41_addr = 2'h0;
  assign opcodes_MPORT_41_data = opcodes[opcodes_MPORT_41_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_42_addr = 2'h0;
  assign opcodes_MPORT_42_data = opcodes[opcodes_MPORT_42_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_43_addr = 2'h0;
  assign opcodes_MPORT_43_data = opcodes[opcodes_MPORT_43_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_44_addr = 2'h0;
  assign opcodes_MPORT_44_data = opcodes[opcodes_MPORT_44_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_46_addr = 2'h1;
  assign opcodes_MPORT_46_data = opcodes[opcodes_MPORT_46_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_47_addr = 2'h0;
  assign opcodes_MPORT_47_data = opcodes[opcodes_MPORT_47_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_48_addr = 2'h0;
  assign opcodes_MPORT_48_data = opcodes[opcodes_MPORT_48_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_data = opcodes[opcodes_alu_io_input_B_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_50_addr = 2'h0;
  assign opcodes_MPORT_50_data = opcodes[opcodes_MPORT_50_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_51_addr = 2'h0;
  assign opcodes_MPORT_51_data = opcodes[opcodes_MPORT_51_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_4_addr = 2'h0;
  assign opcodes_op_MPORT_4_data = opcodes[opcodes_op_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_5_addr = 2'h0;
  assign opcodes_op_MPORT_5_data = opcodes[opcodes_op_MPORT_5_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_2_addr = 2'h1;
  assign opcodes_PC_next_hi_2_data = opcodes[opcodes_PC_next_hi_2_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_1_addr = 2'h2;
  assign opcodes_PC_next_lo_1_data = opcodes[opcodes_PC_next_lo_1_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_54_addr = 2'h0;
  assign opcodes_MPORT_54_data = opcodes[opcodes_MPORT_54_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_data = opcodes[opcodes_alu16_io_offset_MPORT_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_1_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_1_data = opcodes[opcodes_alu16_io_offset_MPORT_1_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_57_addr = 2'h0;
  assign opcodes_MPORT_57_data = opcodes[opcodes_MPORT_57_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_58_addr = 2'h1;
  assign opcodes_MPORT_58_data = opcodes[opcodes_MPORT_58_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_59_addr = 2'h0;
  assign opcodes_MPORT_59_data = opcodes[opcodes_MPORT_59_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_61_addr = 2'h0;
  assign opcodes_MPORT_61_data = opcodes[opcodes_MPORT_61_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_2_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_2_data = opcodes[opcodes_mem_refer_addr_lo_2_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_63_addr = 2'h0;
  assign opcodes_MPORT_63_data = opcodes[opcodes_MPORT_63_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_64_addr = 2'h0;
  assign opcodes_MPORT_64_data = opcodes[opcodes_MPORT_64_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_65_addr = 2'h0;
  assign opcodes_MPORT_65_data = opcodes[opcodes_MPORT_65_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_66_addr = 2'h0;
  assign opcodes_MPORT_66_data = opcodes[opcodes_MPORT_66_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_67_addr = 2'h0;
  assign opcodes_MPORT_67_data = opcodes[opcodes_MPORT_67_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_68_addr = 2'h0;
  assign opcodes_MPORT_68_data = opcodes[opcodes_MPORT_68_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_69_addr = 2'h0;
  assign opcodes_MPORT_69_data = opcodes[opcodes_MPORT_69_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_1_addr = 2'h0;
  assign opcodes_IFF_MPORT_1_data = opcodes[opcodes_IFF_MPORT_1_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_71_addr = 2'h0;
  assign opcodes_MPORT_71_data = opcodes[opcodes_MPORT_71_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_72_addr = 2'h0;
  assign opcodes_MPORT_72_data = opcodes[opcodes_MPORT_72_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_6_addr = 2'h0;
  assign opcodes_op_MPORT_6_data = opcodes[opcodes_op_MPORT_6_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_7_addr = 2'h0;
  assign opcodes_op_MPORT_7_data = opcodes[opcodes_op_MPORT_7_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_3_addr = 2'h2;
  assign opcodes_PC_next_hi_3_data = opcodes[opcodes_PC_next_hi_3_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_2_addr = 2'h1;
  assign opcodes_PC_next_lo_2_data = opcodes[opcodes_PC_next_lo_2_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_74_addr = 2'h0;
  assign opcodes_MPORT_74_data = opcodes[opcodes_MPORT_74_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_8_addr = 2'h0;
  assign opcodes_op_MPORT_8_data = opcodes[opcodes_op_MPORT_8_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_9_addr = 2'h0;
  assign opcodes_op_MPORT_9_data = opcodes[opcodes_op_MPORT_9_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_4_addr = 2'h1;
  assign opcodes_PC_next_hi_4_data = opcodes[opcodes_PC_next_hi_4_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_76_addr = 2'h0;
  assign opcodes_MPORT_76_data = opcodes[opcodes_MPORT_76_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_77_addr = 2'h0;
  assign opcodes_MPORT_77_data = opcodes[opcodes_MPORT_77_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_84_addr = 2'h0;
  assign opcodes_MPORT_84_data = opcodes[opcodes_MPORT_84_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_85_addr = 2'h0;
  assign opcodes_MPORT_85_data = opcodes[opcodes_MPORT_85_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_1_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_1_data = opcodes[opcodes_alu_io_calc_type_MPORT_1_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_4_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_4_data = opcodes[opcodes_alu_io_input_A_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_5_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_5_data = opcodes[opcodes_alu_io_input_A_MPORT_5_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_86_addr = 2'h0;
  assign opcodes_MPORT_86_data = opcodes[opcodes_MPORT_86_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_88_addr = 2'h0;
  assign opcodes_MPORT_88_data = opcodes[opcodes_MPORT_88_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_90_addr = 2'h0;
  assign opcodes_MPORT_90_data = opcodes[opcodes_MPORT_90_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_2_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_2_data = opcodes[opcodes_io_bus_data1_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_92_addr = 2'h0;
  assign opcodes_MPORT_92_data = opcodes[opcodes_MPORT_92_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_93_addr = 2'h0;
  assign opcodes_MPORT_93_data = opcodes[opcodes_MPORT_93_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_97_addr = 2'h0;
  assign opcodes_MPORT_97_data = opcodes[opcodes_MPORT_97_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_98_addr = 2'h0;
  assign opcodes_MPORT_98_data = opcodes[opcodes_MPORT_98_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_99_addr = 2'h0;
  assign opcodes_MPORT_99_data = opcodes[opcodes_MPORT_99_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_100_addr = 2'h0;
  assign opcodes_MPORT_100_data = opcodes[opcodes_MPORT_100_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_102_addr = 2'h1;
  assign opcodes_MPORT_102_data = opcodes[opcodes_MPORT_102_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_103_addr = 2'h0;
  assign opcodes_MPORT_103_data = opcodes[opcodes_MPORT_103_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_104_addr = 2'h0;
  assign opcodes_MPORT_104_data = opcodes[opcodes_MPORT_104_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_2_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_2_data = opcodes[opcodes_alu_io_input_B_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_106_addr = 2'h0;
  assign opcodes_MPORT_106_data = opcodes[opcodes_MPORT_106_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_107_addr = 2'h0;
  assign opcodes_MPORT_107_data = opcodes[opcodes_MPORT_107_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_10_addr = 2'h0;
  assign opcodes_op_MPORT_10_data = opcodes[opcodes_op_MPORT_10_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_11_addr = 2'h0;
  assign opcodes_op_MPORT_11_data = opcodes[opcodes_op_MPORT_11_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_5_addr = 2'h1;
  assign opcodes_PC_next_hi_5_data = opcodes[opcodes_PC_next_hi_5_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_3_addr = 2'h2;
  assign opcodes_PC_next_lo_3_data = opcodes[opcodes_PC_next_lo_3_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_110_addr = 2'h0;
  assign opcodes_MPORT_110_data = opcodes[opcodes_MPORT_110_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_2_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_2_data = opcodes[opcodes_alu16_io_offset_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_3_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_3_data = opcodes[opcodes_alu16_io_offset_MPORT_3_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_114_addr = 2'h0;
  assign opcodes_MPORT_114_data = opcodes[opcodes_MPORT_114_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_115_addr = 2'h1;
  assign opcodes_MPORT_115_data = opcodes[opcodes_MPORT_115_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_116_addr = 2'h0;
  assign opcodes_MPORT_116_data = opcodes[opcodes_MPORT_116_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_118_addr = 2'h0;
  assign opcodes_MPORT_118_data = opcodes[opcodes_MPORT_118_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_4_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_4_data = opcodes[opcodes_mem_refer_addr_lo_4_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_120_addr = 2'h0;
  assign opcodes_MPORT_120_data = opcodes[opcodes_MPORT_120_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_121_addr = 2'h0;
  assign opcodes_MPORT_121_data = opcodes[opcodes_MPORT_121_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_122_addr = 2'h0;
  assign opcodes_MPORT_122_data = opcodes[opcodes_MPORT_122_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_123_addr = 2'h0;
  assign opcodes_MPORT_123_data = opcodes[opcodes_MPORT_123_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_124_addr = 2'h0;
  assign opcodes_MPORT_124_data = opcodes[opcodes_MPORT_124_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_125_addr = 2'h0;
  assign opcodes_MPORT_125_data = opcodes[opcodes_MPORT_125_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_126_addr = 2'h0;
  assign opcodes_MPORT_126_data = opcodes[opcodes_MPORT_126_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_2_addr = 2'h0;
  assign opcodes_IFF_MPORT_2_data = opcodes[opcodes_IFF_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_128_addr = 2'h0;
  assign opcodes_MPORT_128_data = opcodes[opcodes_MPORT_128_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_129_addr = 2'h0;
  assign opcodes_MPORT_129_data = opcodes[opcodes_MPORT_129_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_12_addr = 2'h0;
  assign opcodes_op_MPORT_12_data = opcodes[opcodes_op_MPORT_12_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_13_addr = 2'h0;
  assign opcodes_op_MPORT_13_data = opcodes[opcodes_op_MPORT_13_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_6_addr = 2'h2;
  assign opcodes_PC_next_hi_6_data = opcodes[opcodes_PC_next_hi_6_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_4_addr = 2'h1;
  assign opcodes_PC_next_lo_4_data = opcodes[opcodes_PC_next_lo_4_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_131_addr = 2'h0;
  assign opcodes_MPORT_131_data = opcodes[opcodes_MPORT_131_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_14_addr = 2'h0;
  assign opcodes_op_MPORT_14_data = opcodes[opcodes_op_MPORT_14_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_15_addr = 2'h0;
  assign opcodes_op_MPORT_15_data = opcodes[opcodes_op_MPORT_15_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_7_addr = 2'h1;
  assign opcodes_PC_next_hi_7_data = opcodes[opcodes_PC_next_hi_7_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_133_addr = 2'h0;
  assign opcodes_MPORT_133_data = opcodes[opcodes_MPORT_133_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_134_addr = 2'h0;
  assign opcodes_MPORT_134_data = opcodes[opcodes_MPORT_134_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_141_addr = 2'h0;
  assign opcodes_MPORT_141_data = opcodes[opcodes_MPORT_141_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_142_addr = 2'h0;
  assign opcodes_MPORT_142_data = opcodes[opcodes_MPORT_142_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_2_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_2_data = opcodes[opcodes_alu_io_calc_type_MPORT_2_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_8_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_8_data = opcodes[opcodes_alu_io_input_A_MPORT_8_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_9_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_9_data = opcodes[opcodes_alu_io_input_A_MPORT_9_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_143_addr = 2'h0;
  assign opcodes_MPORT_143_data = opcodes[opcodes_MPORT_143_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_145_addr = 2'h0;
  assign opcodes_MPORT_145_data = opcodes[opcodes_MPORT_145_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_147_addr = 2'h0;
  assign opcodes_MPORT_147_data = opcodes[opcodes_MPORT_147_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_4_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_4_data = opcodes[opcodes_io_bus_data1_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_149_addr = 2'h0;
  assign opcodes_MPORT_149_data = opcodes[opcodes_MPORT_149_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_150_addr = 2'h0;
  assign opcodes_MPORT_150_data = opcodes[opcodes_MPORT_150_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_154_addr = 2'h0;
  assign opcodes_MPORT_154_data = opcodes[opcodes_MPORT_154_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_155_addr = 2'h0;
  assign opcodes_MPORT_155_data = opcodes[opcodes_MPORT_155_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_156_addr = 2'h0;
  assign opcodes_MPORT_156_data = opcodes[opcodes_MPORT_156_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_157_addr = 2'h0;
  assign opcodes_MPORT_157_data = opcodes[opcodes_MPORT_157_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_159_addr = 2'h1;
  assign opcodes_MPORT_159_data = opcodes[opcodes_MPORT_159_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_160_addr = 2'h0;
  assign opcodes_MPORT_160_data = opcodes[opcodes_MPORT_160_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_161_addr = 2'h0;
  assign opcodes_MPORT_161_data = opcodes[opcodes_MPORT_161_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_4_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_4_data = opcodes[opcodes_alu_io_input_B_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_163_addr = 2'h0;
  assign opcodes_MPORT_163_data = opcodes[opcodes_MPORT_163_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_164_addr = 2'h0;
  assign opcodes_MPORT_164_data = opcodes[opcodes_MPORT_164_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_16_addr = 2'h0;
  assign opcodes_op_MPORT_16_data = opcodes[opcodes_op_MPORT_16_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_17_addr = 2'h0;
  assign opcodes_op_MPORT_17_data = opcodes[opcodes_op_MPORT_17_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_8_addr = 2'h1;
  assign opcodes_PC_next_hi_8_data = opcodes[opcodes_PC_next_hi_8_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_5_addr = 2'h2;
  assign opcodes_PC_next_lo_5_data = opcodes[opcodes_PC_next_lo_5_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_167_addr = 2'h0;
  assign opcodes_MPORT_167_data = opcodes[opcodes_MPORT_167_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_4_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_4_data = opcodes[opcodes_alu16_io_offset_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_5_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_5_data = opcodes[opcodes_alu16_io_offset_MPORT_5_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_170_addr = 2'h0;
  assign opcodes_MPORT_170_data = opcodes[opcodes_MPORT_170_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_171_addr = 2'h1;
  assign opcodes_MPORT_171_data = opcodes[opcodes_MPORT_171_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_172_addr = 2'h0;
  assign opcodes_MPORT_172_data = opcodes[opcodes_MPORT_172_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_174_addr = 2'h0;
  assign opcodes_MPORT_174_data = opcodes[opcodes_MPORT_174_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_6_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_6_data = opcodes[opcodes_mem_refer_addr_lo_6_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_176_addr = 2'h0;
  assign opcodes_MPORT_176_data = opcodes[opcodes_MPORT_176_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_177_addr = 2'h0;
  assign opcodes_MPORT_177_data = opcodes[opcodes_MPORT_177_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_178_addr = 2'h0;
  assign opcodes_MPORT_178_data = opcodes[opcodes_MPORT_178_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_179_addr = 2'h0;
  assign opcodes_MPORT_179_data = opcodes[opcodes_MPORT_179_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_180_addr = 2'h0;
  assign opcodes_MPORT_180_data = opcodes[opcodes_MPORT_180_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_181_addr = 2'h0;
  assign opcodes_MPORT_181_data = opcodes[opcodes_MPORT_181_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_182_addr = 2'h0;
  assign opcodes_MPORT_182_data = opcodes[opcodes_MPORT_182_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_3_addr = 2'h0;
  assign opcodes_IFF_MPORT_3_data = opcodes[opcodes_IFF_MPORT_3_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_184_addr = 2'h0;
  assign opcodes_MPORT_184_data = opcodes[opcodes_MPORT_184_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_185_addr = 2'h0;
  assign opcodes_MPORT_185_data = opcodes[opcodes_MPORT_185_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_18_addr = 2'h0;
  assign opcodes_op_MPORT_18_data = opcodes[opcodes_op_MPORT_18_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_19_addr = 2'h0;
  assign opcodes_op_MPORT_19_data = opcodes[opcodes_op_MPORT_19_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_9_addr = 2'h2;
  assign opcodes_PC_next_hi_9_data = opcodes[opcodes_PC_next_hi_9_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_6_addr = 2'h1;
  assign opcodes_PC_next_lo_6_data = opcodes[opcodes_PC_next_lo_6_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_187_addr = 2'h0;
  assign opcodes_MPORT_187_data = opcodes[opcodes_MPORT_187_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_20_addr = 2'h0;
  assign opcodes_op_MPORT_20_data = opcodes[opcodes_op_MPORT_20_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_21_addr = 2'h0;
  assign opcodes_op_MPORT_21_data = opcodes[opcodes_op_MPORT_21_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_10_addr = 2'h1;
  assign opcodes_PC_next_hi_10_data = opcodes[opcodes_PC_next_hi_10_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_189_addr = 2'h0;
  assign opcodes_MPORT_189_data = opcodes[opcodes_MPORT_189_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_190_addr = 2'h0;
  assign opcodes_MPORT_190_data = opcodes[opcodes_MPORT_190_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_197_addr = 2'h0;
  assign opcodes_MPORT_197_data = opcodes[opcodes_MPORT_197_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_198_addr = 2'h0;
  assign opcodes_MPORT_198_data = opcodes[opcodes_MPORT_198_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_3_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_3_data = opcodes[opcodes_alu_io_calc_type_MPORT_3_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_12_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_12_data = opcodes[opcodes_alu_io_input_A_MPORT_12_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_13_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_13_data = opcodes[opcodes_alu_io_input_A_MPORT_13_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_199_addr = 2'h0;
  assign opcodes_MPORT_199_data = opcodes[opcodes_MPORT_199_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_201_addr = 2'h0;
  assign opcodes_MPORT_201_data = opcodes[opcodes_MPORT_201_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_203_addr = 2'h0;
  assign opcodes_MPORT_203_data = opcodes[opcodes_MPORT_203_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_6_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_6_data = opcodes[opcodes_io_bus_data1_MPORT_6_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_205_addr = 2'h0;
  assign opcodes_MPORT_205_data = opcodes[opcodes_MPORT_205_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_206_addr = 2'h0;
  assign opcodes_MPORT_206_data = opcodes[opcodes_MPORT_206_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_210_addr = 2'h0;
  assign opcodes_MPORT_210_data = opcodes[opcodes_MPORT_210_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_211_addr = 2'h0;
  assign opcodes_MPORT_211_data = opcodes[opcodes_MPORT_211_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_212_addr = 2'h0;
  assign opcodes_MPORT_212_data = opcodes[opcodes_MPORT_212_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_213_addr = 2'h0;
  assign opcodes_MPORT_213_data = opcodes[opcodes_MPORT_213_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_215_addr = 2'h1;
  assign opcodes_MPORT_215_data = opcodes[opcodes_MPORT_215_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_216_addr = 2'h0;
  assign opcodes_MPORT_216_data = opcodes[opcodes_MPORT_216_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_217_addr = 2'h0;
  assign opcodes_MPORT_217_data = opcodes[opcodes_MPORT_217_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_6_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_6_data = opcodes[opcodes_alu_io_input_B_MPORT_6_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_219_addr = 2'h0;
  assign opcodes_MPORT_219_data = opcodes[opcodes_MPORT_219_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_220_addr = 2'h0;
  assign opcodes_MPORT_220_data = opcodes[opcodes_MPORT_220_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_22_addr = 2'h0;
  assign opcodes_op_MPORT_22_data = opcodes[opcodes_op_MPORT_22_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_23_addr = 2'h0;
  assign opcodes_op_MPORT_23_data = opcodes[opcodes_op_MPORT_23_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_11_addr = 2'h1;
  assign opcodes_PC_next_hi_11_data = opcodes[opcodes_PC_next_hi_11_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_7_addr = 2'h2;
  assign opcodes_PC_next_lo_7_data = opcodes[opcodes_PC_next_lo_7_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_223_addr = 2'h0;
  assign opcodes_MPORT_223_data = opcodes[opcodes_MPORT_223_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_6_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_6_data = opcodes[opcodes_alu16_io_offset_MPORT_6_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_7_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_7_data = opcodes[opcodes_alu16_io_offset_MPORT_7_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_226_addr = 2'h0;
  assign opcodes_MPORT_226_data = opcodes[opcodes_MPORT_226_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_227_addr = 2'h1;
  assign opcodes_MPORT_227_data = opcodes[opcodes_MPORT_227_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_228_addr = 2'h0;
  assign opcodes_MPORT_228_data = opcodes[opcodes_MPORT_228_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_230_addr = 2'h0;
  assign opcodes_MPORT_230_data = opcodes[opcodes_MPORT_230_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_8_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_8_data = opcodes[opcodes_mem_refer_addr_lo_8_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_232_addr = 2'h0;
  assign opcodes_MPORT_232_data = opcodes[opcodes_MPORT_232_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_233_addr = 2'h0;
  assign opcodes_MPORT_233_data = opcodes[opcodes_MPORT_233_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_234_addr = 2'h0;
  assign opcodes_MPORT_234_data = opcodes[opcodes_MPORT_234_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_235_addr = 2'h0;
  assign opcodes_MPORT_235_data = opcodes[opcodes_MPORT_235_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_236_addr = 2'h0;
  assign opcodes_MPORT_236_data = opcodes[opcodes_MPORT_236_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_237_addr = 2'h0;
  assign opcodes_MPORT_237_data = opcodes[opcodes_MPORT_237_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_238_addr = 2'h0;
  assign opcodes_MPORT_238_data = opcodes[opcodes_MPORT_238_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_4_addr = 2'h0;
  assign opcodes_IFF_MPORT_4_data = opcodes[opcodes_IFF_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_240_addr = 2'h0;
  assign opcodes_MPORT_240_data = opcodes[opcodes_MPORT_240_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_241_addr = 2'h0;
  assign opcodes_MPORT_241_data = opcodes[opcodes_MPORT_241_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_24_addr = 2'h0;
  assign opcodes_op_MPORT_24_data = opcodes[opcodes_op_MPORT_24_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_25_addr = 2'h0;
  assign opcodes_op_MPORT_25_data = opcodes[opcodes_op_MPORT_25_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_12_addr = 2'h2;
  assign opcodes_PC_next_hi_12_data = opcodes[opcodes_PC_next_hi_12_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_8_addr = 2'h1;
  assign opcodes_PC_next_lo_8_data = opcodes[opcodes_PC_next_lo_8_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_243_addr = 2'h0;
  assign opcodes_MPORT_243_data = opcodes[opcodes_MPORT_243_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_26_addr = 2'h0;
  assign opcodes_op_MPORT_26_data = opcodes[opcodes_op_MPORT_26_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_27_addr = 2'h0;
  assign opcodes_op_MPORT_27_data = opcodes[opcodes_op_MPORT_27_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_13_addr = 2'h1;
  assign opcodes_PC_next_hi_13_data = opcodes[opcodes_PC_next_hi_13_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_245_addr = 2'h0;
  assign opcodes_MPORT_245_data = opcodes[opcodes_MPORT_245_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_246_addr = 2'h0;
  assign opcodes_MPORT_246_data = opcodes[opcodes_MPORT_246_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_253_addr = 2'h0;
  assign opcodes_MPORT_253_data = opcodes[opcodes_MPORT_253_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_254_addr = 2'h0;
  assign opcodes_MPORT_254_data = opcodes[opcodes_MPORT_254_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_4_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_4_data = opcodes[opcodes_alu_io_calc_type_MPORT_4_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_16_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_16_data = opcodes[opcodes_alu_io_input_A_MPORT_16_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_17_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_17_data = opcodes[opcodes_alu_io_input_A_MPORT_17_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_255_addr = 2'h0;
  assign opcodes_MPORT_255_data = opcodes[opcodes_MPORT_255_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_257_addr = 2'h0;
  assign opcodes_MPORT_257_data = opcodes[opcodes_MPORT_257_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_259_addr = 2'h0;
  assign opcodes_MPORT_259_data = opcodes[opcodes_MPORT_259_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_8_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_8_data = opcodes[opcodes_io_bus_data1_MPORT_8_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_261_addr = 2'h0;
  assign opcodes_MPORT_261_data = opcodes[opcodes_MPORT_261_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_262_addr = 2'h0;
  assign opcodes_MPORT_262_data = opcodes[opcodes_MPORT_262_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_266_addr = 2'h0;
  assign opcodes_MPORT_266_data = opcodes[opcodes_MPORT_266_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_267_addr = 2'h0;
  assign opcodes_MPORT_267_data = opcodes[opcodes_MPORT_267_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_268_addr = 2'h0;
  assign opcodes_MPORT_268_data = opcodes[opcodes_MPORT_268_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_269_addr = 2'h0;
  assign opcodes_MPORT_269_data = opcodes[opcodes_MPORT_269_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_271_addr = 2'h1;
  assign opcodes_MPORT_271_data = opcodes[opcodes_MPORT_271_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_272_addr = 2'h0;
  assign opcodes_MPORT_272_data = opcodes[opcodes_MPORT_272_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_273_addr = 2'h0;
  assign opcodes_MPORT_273_data = opcodes[opcodes_MPORT_273_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_8_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_8_data = opcodes[opcodes_alu_io_input_B_MPORT_8_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_275_addr = 2'h0;
  assign opcodes_MPORT_275_data = opcodes[opcodes_MPORT_275_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_276_addr = 2'h0;
  assign opcodes_MPORT_276_data = opcodes[opcodes_MPORT_276_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_28_addr = 2'h0;
  assign opcodes_op_MPORT_28_data = opcodes[opcodes_op_MPORT_28_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_29_addr = 2'h0;
  assign opcodes_op_MPORT_29_data = opcodes[opcodes_op_MPORT_29_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_14_addr = 2'h1;
  assign opcodes_PC_next_hi_14_data = opcodes[opcodes_PC_next_hi_14_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_9_addr = 2'h2;
  assign opcodes_PC_next_lo_9_data = opcodes[opcodes_PC_next_lo_9_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_279_addr = 2'h0;
  assign opcodes_MPORT_279_data = opcodes[opcodes_MPORT_279_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_8_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_8_data = opcodes[opcodes_alu16_io_offset_MPORT_8_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_9_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_9_data = opcodes[opcodes_alu16_io_offset_MPORT_9_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_282_addr = 2'h0;
  assign opcodes_MPORT_282_data = opcodes[opcodes_MPORT_282_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_283_addr = 2'h1;
  assign opcodes_MPORT_283_data = opcodes[opcodes_MPORT_283_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_284_addr = 2'h0;
  assign opcodes_MPORT_284_data = opcodes[opcodes_MPORT_284_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_286_addr = 2'h0;
  assign opcodes_MPORT_286_data = opcodes[opcodes_MPORT_286_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_10_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_10_data = opcodes[opcodes_mem_refer_addr_lo_10_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_288_addr = 2'h0;
  assign opcodes_MPORT_288_data = opcodes[opcodes_MPORT_288_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_289_addr = 2'h0;
  assign opcodes_MPORT_289_data = opcodes[opcodes_MPORT_289_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_290_addr = 2'h0;
  assign opcodes_MPORT_290_data = opcodes[opcodes_MPORT_290_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_291_addr = 2'h0;
  assign opcodes_MPORT_291_data = opcodes[opcodes_MPORT_291_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_292_addr = 2'h0;
  assign opcodes_MPORT_292_data = opcodes[opcodes_MPORT_292_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_293_addr = 2'h0;
  assign opcodes_MPORT_293_data = opcodes[opcodes_MPORT_293_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_294_addr = 2'h0;
  assign opcodes_MPORT_294_data = opcodes[opcodes_MPORT_294_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_5_addr = 2'h0;
  assign opcodes_IFF_MPORT_5_data = opcodes[opcodes_IFF_MPORT_5_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_296_addr = 2'h0;
  assign opcodes_MPORT_296_data = opcodes[opcodes_MPORT_296_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_297_addr = 2'h0;
  assign opcodes_MPORT_297_data = opcodes[opcodes_MPORT_297_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_30_addr = 2'h0;
  assign opcodes_op_MPORT_30_data = opcodes[opcodes_op_MPORT_30_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_31_addr = 2'h0;
  assign opcodes_op_MPORT_31_data = opcodes[opcodes_op_MPORT_31_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_15_addr = 2'h2;
  assign opcodes_PC_next_hi_15_data = opcodes[opcodes_PC_next_hi_15_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_10_addr = 2'h1;
  assign opcodes_PC_next_lo_10_data = opcodes[opcodes_PC_next_lo_10_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_299_addr = 2'h0;
  assign opcodes_MPORT_299_data = opcodes[opcodes_MPORT_299_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_32_addr = 2'h0;
  assign opcodes_op_MPORT_32_data = opcodes[opcodes_op_MPORT_32_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_33_addr = 2'h0;
  assign opcodes_op_MPORT_33_data = opcodes[opcodes_op_MPORT_33_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_16_addr = 2'h1;
  assign opcodes_PC_next_hi_16_data = opcodes[opcodes_PC_next_hi_16_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_301_addr = 2'h0;
  assign opcodes_MPORT_301_data = opcodes[opcodes_MPORT_301_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_302_addr = 2'h0;
  assign opcodes_MPORT_302_data = opcodes[opcodes_MPORT_302_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_309_addr = 2'h0;
  assign opcodes_MPORT_309_data = opcodes[opcodes_MPORT_309_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_310_addr = 2'h0;
  assign opcodes_MPORT_310_data = opcodes[opcodes_MPORT_310_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_5_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_5_data = opcodes[opcodes_alu_io_calc_type_MPORT_5_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_20_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_20_data = opcodes[opcodes_alu_io_input_A_MPORT_20_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_21_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_21_data = opcodes[opcodes_alu_io_input_A_MPORT_21_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_311_addr = 2'h0;
  assign opcodes_MPORT_311_data = opcodes[opcodes_MPORT_311_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_313_addr = 2'h0;
  assign opcodes_MPORT_313_data = opcodes[opcodes_MPORT_313_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_315_addr = 2'h0;
  assign opcodes_MPORT_315_data = opcodes[opcodes_MPORT_315_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_10_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_10_data = opcodes[opcodes_io_bus_data1_MPORT_10_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_317_addr = 2'h0;
  assign opcodes_MPORT_317_data = opcodes[opcodes_MPORT_317_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_318_addr = 2'h0;
  assign opcodes_MPORT_318_data = opcodes[opcodes_MPORT_318_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_322_addr = 2'h0;
  assign opcodes_MPORT_322_data = opcodes[opcodes_MPORT_322_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_323_addr = 2'h0;
  assign opcodes_MPORT_323_data = opcodes[opcodes_MPORT_323_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_324_addr = 2'h0;
  assign opcodes_MPORT_324_data = opcodes[opcodes_MPORT_324_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_325_addr = 2'h0;
  assign opcodes_MPORT_325_data = opcodes[opcodes_MPORT_325_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_327_addr = 2'h1;
  assign opcodes_MPORT_327_data = opcodes[opcodes_MPORT_327_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_328_addr = 2'h0;
  assign opcodes_MPORT_328_data = opcodes[opcodes_MPORT_328_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_329_addr = 2'h0;
  assign opcodes_MPORT_329_data = opcodes[opcodes_MPORT_329_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_10_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_10_data = opcodes[opcodes_alu_io_input_B_MPORT_10_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_331_addr = 2'h0;
  assign opcodes_MPORT_331_data = opcodes[opcodes_MPORT_331_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_332_addr = 2'h0;
  assign opcodes_MPORT_332_data = opcodes[opcodes_MPORT_332_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_34_addr = 2'h0;
  assign opcodes_op_MPORT_34_data = opcodes[opcodes_op_MPORT_34_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_35_addr = 2'h0;
  assign opcodes_op_MPORT_35_data = opcodes[opcodes_op_MPORT_35_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_17_addr = 2'h1;
  assign opcodes_PC_next_hi_17_data = opcodes[opcodes_PC_next_hi_17_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_11_addr = 2'h2;
  assign opcodes_PC_next_lo_11_data = opcodes[opcodes_PC_next_lo_11_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_335_addr = 2'h0;
  assign opcodes_MPORT_335_data = opcodes[opcodes_MPORT_335_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_10_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_10_data = opcodes[opcodes_alu16_io_offset_MPORT_10_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_11_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_11_data = opcodes[opcodes_alu16_io_offset_MPORT_11_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_338_addr = 2'h0;
  assign opcodes_MPORT_338_data = opcodes[opcodes_MPORT_338_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_339_addr = 2'h1;
  assign opcodes_MPORT_339_data = opcodes[opcodes_MPORT_339_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_340_addr = 2'h0;
  assign opcodes_MPORT_340_data = opcodes[opcodes_MPORT_340_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_342_addr = 2'h0;
  assign opcodes_MPORT_342_data = opcodes[opcodes_MPORT_342_addr]; // @[Core.scala 724:20]
  assign opcodes_mem_refer_addr_lo_12_addr = 2'h1;
  assign opcodes_mem_refer_addr_lo_12_data = opcodes[opcodes_mem_refer_addr_lo_12_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_344_addr = 2'h0;
  assign opcodes_MPORT_344_data = opcodes[opcodes_MPORT_344_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_345_addr = 2'h0;
  assign opcodes_MPORT_345_data = opcodes[opcodes_MPORT_345_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_346_addr = 2'h0;
  assign opcodes_MPORT_346_data = opcodes[opcodes_MPORT_346_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_347_addr = 2'h0;
  assign opcodes_MPORT_347_data = opcodes[opcodes_MPORT_347_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_348_addr = 2'h0;
  assign opcodes_MPORT_348_data = opcodes[opcodes_MPORT_348_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_349_addr = 2'h0;
  assign opcodes_MPORT_349_data = opcodes[opcodes_MPORT_349_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_350_addr = 2'h0;
  assign opcodes_MPORT_350_data = opcodes[opcodes_MPORT_350_addr]; // @[Core.scala 724:20]
  assign opcodes_IFF_MPORT_6_addr = 2'h0;
  assign opcodes_IFF_MPORT_6_data = opcodes[opcodes_IFF_MPORT_6_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_352_addr = 2'h0;
  assign opcodes_MPORT_352_data = opcodes[opcodes_MPORT_352_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_353_addr = 2'h0;
  assign opcodes_MPORT_353_data = opcodes[opcodes_MPORT_353_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_36_addr = 2'h0;
  assign opcodes_op_MPORT_36_data = opcodes[opcodes_op_MPORT_36_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_37_addr = 2'h0;
  assign opcodes_op_MPORT_37_data = opcodes[opcodes_op_MPORT_37_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_18_addr = 2'h2;
  assign opcodes_PC_next_hi_18_data = opcodes[opcodes_PC_next_hi_18_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_12_addr = 2'h1;
  assign opcodes_PC_next_lo_12_data = opcodes[opcodes_PC_next_lo_12_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_355_addr = 2'h0;
  assign opcodes_MPORT_355_data = opcodes[opcodes_MPORT_355_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_38_addr = 2'h0;
  assign opcodes_op_MPORT_38_data = opcodes[opcodes_op_MPORT_38_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_39_addr = 2'h0;
  assign opcodes_op_MPORT_39_data = opcodes[opcodes_op_MPORT_39_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_19_addr = 2'h1;
  assign opcodes_PC_next_hi_19_data = opcodes[opcodes_PC_next_hi_19_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_357_addr = 2'h0;
  assign opcodes_MPORT_357_data = opcodes[opcodes_MPORT_357_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_358_addr = 2'h0;
  assign opcodes_MPORT_358_data = opcodes[opcodes_MPORT_358_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_365_addr = 2'h0;
  assign opcodes_MPORT_365_data = opcodes[opcodes_MPORT_365_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_366_addr = 2'h0;
  assign opcodes_MPORT_366_data = opcodes[opcodes_MPORT_366_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_calc_type_MPORT_6_addr = 2'h0;
  assign opcodes_alu_io_calc_type_MPORT_6_data = opcodes[opcodes_alu_io_calc_type_MPORT_6_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_24_addr = 2'h1;
  assign opcodes_alu_io_input_A_MPORT_24_data = opcodes[opcodes_alu_io_input_A_MPORT_24_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_A_MPORT_25_addr = 2'h0;
  assign opcodes_alu_io_input_A_MPORT_25_data = opcodes[opcodes_alu_io_input_A_MPORT_25_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_367_addr = 2'h0;
  assign opcodes_MPORT_367_data = opcodes[opcodes_MPORT_367_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_369_addr = 2'h0;
  assign opcodes_MPORT_369_data = opcodes[opcodes_MPORT_369_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_371_addr = 2'h0;
  assign opcodes_MPORT_371_data = opcodes[opcodes_MPORT_371_addr]; // @[Core.scala 724:20]
  assign opcodes_io_bus_data1_MPORT_12_addr = 2'h0;
  assign opcodes_io_bus_data1_MPORT_12_data = opcodes[opcodes_io_bus_data1_MPORT_12_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_373_addr = 2'h0;
  assign opcodes_MPORT_373_data = opcodes[opcodes_MPORT_373_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_374_addr = 2'h0;
  assign opcodes_MPORT_374_data = opcodes[opcodes_MPORT_374_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_378_addr = 2'h0;
  assign opcodes_MPORT_378_data = opcodes[opcodes_MPORT_378_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_379_addr = 2'h0;
  assign opcodes_MPORT_379_data = opcodes[opcodes_MPORT_379_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_380_addr = 2'h0;
  assign opcodes_MPORT_380_data = opcodes[opcodes_MPORT_380_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_381_addr = 2'h0;
  assign opcodes_MPORT_381_data = opcodes[opcodes_MPORT_381_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_383_addr = 2'h1;
  assign opcodes_MPORT_383_data = opcodes[opcodes_MPORT_383_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_384_addr = 2'h0;
  assign opcodes_MPORT_384_data = opcodes[opcodes_MPORT_384_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_385_addr = 2'h0;
  assign opcodes_MPORT_385_data = opcodes[opcodes_MPORT_385_addr]; // @[Core.scala 724:20]
  assign opcodes_alu_io_input_B_MPORT_12_addr = 2'h0;
  assign opcodes_alu_io_input_B_MPORT_12_data = opcodes[opcodes_alu_io_input_B_MPORT_12_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_387_addr = 2'h0;
  assign opcodes_MPORT_387_data = opcodes[opcodes_MPORT_387_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_388_addr = 2'h0;
  assign opcodes_MPORT_388_data = opcodes[opcodes_MPORT_388_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_40_addr = 2'h0;
  assign opcodes_op_MPORT_40_data = opcodes[opcodes_op_MPORT_40_addr]; // @[Core.scala 724:20]
  assign opcodes_op_MPORT_41_addr = 2'h0;
  assign opcodes_op_MPORT_41_data = opcodes[opcodes_op_MPORT_41_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_hi_20_addr = 2'h1;
  assign opcodes_PC_next_hi_20_data = opcodes[opcodes_PC_next_hi_20_addr]; // @[Core.scala 724:20]
  assign opcodes_PC_next_lo_13_addr = 2'h2;
  assign opcodes_PC_next_lo_13_data = opcodes[opcodes_PC_next_lo_13_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_391_addr = 2'h0;
  assign opcodes_MPORT_391_data = opcodes[opcodes_MPORT_391_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_12_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_12_data = opcodes[opcodes_alu16_io_offset_MPORT_12_addr]; // @[Core.scala 724:20]
  assign opcodes_alu16_io_offset_MPORT_13_addr = 2'h2;
  assign opcodes_alu16_io_offset_MPORT_13_data = opcodes[opcodes_alu16_io_offset_MPORT_13_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_394_addr = 2'h0;
  assign opcodes_MPORT_394_data = opcodes[opcodes_MPORT_394_addr]; // @[Core.scala 724:20]
  assign opcodes_MPORT_data = io_bus_data;
  assign opcodes_MPORT_addr = opcode_index[1:0];
  assign opcodes_MPORT_mask = 1'h1;
  assign opcodes_MPORT_en = _T_3 & _GEN_21913;
  assign opcodes_MPORT_53_data = io_bus_data;
  assign opcodes_MPORT_53_addr = opcode_index[1:0];
  assign opcodes_MPORT_53_mask = 1'h1;
  assign opcodes_MPORT_53_en = _T_3 & _GEN_22105;
  assign opcodes_MPORT_109_data = io_bus_data;
  assign opcodes_MPORT_109_addr = opcode_index[1:0];
  assign opcodes_MPORT_109_mask = 1'h1;
  assign opcodes_MPORT_109_en = _T_3 & _GEN_22299;
  assign opcodes_MPORT_113_data = io_bus_data;
  assign opcodes_MPORT_113_addr = opcode_index[1:0];
  assign opcodes_MPORT_113_mask = 1'h1;
  assign opcodes_MPORT_113_en = _T_3 & _GEN_22323;
  assign opcodes_MPORT_166_data = io_bus_data;
  assign opcodes_MPORT_166_addr = opcode_index[1:0];
  assign opcodes_MPORT_166_mask = 1'h1;
  assign opcodes_MPORT_166_en = _T_3 & _GEN_22498;
  assign opcodes_MPORT_222_data = io_bus_data;
  assign opcodes_MPORT_222_addr = opcode_index[1:0];
  assign opcodes_MPORT_222_mask = 1'h1;
  assign opcodes_MPORT_222_en = _T_3 & _GEN_22691;
  assign opcodes_MPORT_278_data = io_bus_data;
  assign opcodes_MPORT_278_addr = opcode_index[1:0];
  assign opcodes_MPORT_278_mask = 1'h1;
  assign opcodes_MPORT_278_en = _T_3 & _GEN_22884;
  assign opcodes_MPORT_334_data = io_bus_data;
  assign opcodes_MPORT_334_addr = opcode_index[1:0];
  assign opcodes_MPORT_334_mask = 1'h1;
  assign opcodes_MPORT_334_en = _T_3 & _GEN_23077;
  assign opcodes_MPORT_390_data = io_bus_data;
  assign opcodes_MPORT_390_addr = opcode_index[1:0];
  assign opcodes_MPORT_390_mask = 1'h1;
  assign opcodes_MPORT_390_en = _T_3 & _GEN_23270;
  assign io_bus_addr = ~reset_hold ? _GEN_21906 : PC; // @[Core.scala 777:21 Core.scala 756:15]
  assign io_bus_data1 = ~reset_hold ? _GEN_21933 : 8'h0; // @[Core.scala 777:21 Core.scala 77:16]
  assign io_bus_RD_ = ~reset_hold ? _GEN_21910 : 1'h1; // @[Core.scala 777:21 Core.scala 757:14]
  assign io_bus_WR_ = ~reset_hold ? _GEN_21941 : 1'h1; // @[Core.scala 777:21 Core.scala 758:14]
  assign io_bus_MREQ_ = ~reset_hold ? _GEN_21907 : 1'h1; // @[Core.scala 777:21 Core.scala 759:16]
  assign io_exit = 8'hff == io_bus_data; // @[Core.scala 926:27]
  assign alu_io_input_A = ~reset_hold ? _GEN_22026 : 8'h0; // @[Core.scala 777:21 Core.scala 765:18]
  assign alu_io_input_B = ~reset_hold ? _GEN_22020 : 8'h0; // @[Core.scala 777:21 Core.scala 766:18]
  assign alu_io_input_carry = ~reset_hold & _GEN_22021; // @[Core.scala 777:21 Core.scala 768:22]
  assign alu_io_calc_type = ~reset_hold ? _GEN_22022 : 8'h0; // @[Core.scala 777:21 Core.scala 767:20]
  assign alu16_io_input_register = ~reset_hold ? _GEN_21965 : 16'h0; // @[Core.scala 777:21 Core.scala 55:27]
  assign alu16_io_offset = ~reset_hold ? $signed(_GEN_21966) : $signed(8'sh0); // @[Core.scala 777:21 Core.scala 56:19]
  always @(posedge clock) begin
    if(regfiles_front_MPORT_22_en & regfiles_front_MPORT_22_mask) begin
      regfiles_front[regfiles_front_MPORT_22_addr] <= regfiles_front_MPORT_22_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_23_en & regfiles_front_MPORT_23_mask) begin
      regfiles_front[regfiles_front_MPORT_23_addr] <= regfiles_front_MPORT_23_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_24_en & regfiles_front_MPORT_24_mask) begin
      regfiles_front[regfiles_front_MPORT_24_addr] <= regfiles_front_MPORT_24_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_25_en & regfiles_front_MPORT_25_mask) begin
      regfiles_front[regfiles_front_MPORT_25_addr] <= regfiles_front_MPORT_25_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_26_en & regfiles_front_MPORT_26_mask) begin
      regfiles_front[regfiles_front_MPORT_26_addr] <= regfiles_front_MPORT_26_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_27_en & regfiles_front_MPORT_27_mask) begin
      regfiles_front[regfiles_front_MPORT_27_addr] <= regfiles_front_MPORT_27_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_31_en & regfiles_front_MPORT_31_mask) begin
      regfiles_front[regfiles_front_MPORT_31_addr] <= regfiles_front_MPORT_31_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_38_en & regfiles_front_MPORT_38_mask) begin
      regfiles_front[regfiles_front_MPORT_38_addr] <= regfiles_front_MPORT_38_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_40_en & regfiles_front_MPORT_40_mask) begin
      regfiles_front[regfiles_front_MPORT_40_addr] <= regfiles_front_MPORT_40_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_45_en & regfiles_front_MPORT_45_mask) begin
      regfiles_front[regfiles_front_MPORT_45_addr] <= regfiles_front_MPORT_45_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_49_en & regfiles_front_MPORT_49_mask) begin
      regfiles_front[regfiles_front_MPORT_49_addr] <= regfiles_front_MPORT_49_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_56_en & regfiles_front_MPORT_56_mask) begin
      regfiles_front[regfiles_front_MPORT_56_addr] <= regfiles_front_MPORT_56_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_78_en & regfiles_front_MPORT_78_mask) begin
      regfiles_front[regfiles_front_MPORT_78_addr] <= regfiles_front_MPORT_78_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_79_en & regfiles_front_MPORT_79_mask) begin
      regfiles_front[regfiles_front_MPORT_79_addr] <= regfiles_front_MPORT_79_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_80_en & regfiles_front_MPORT_80_mask) begin
      regfiles_front[regfiles_front_MPORT_80_addr] <= regfiles_front_MPORT_80_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_81_en & regfiles_front_MPORT_81_mask) begin
      regfiles_front[regfiles_front_MPORT_81_addr] <= regfiles_front_MPORT_81_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_82_en & regfiles_front_MPORT_82_mask) begin
      regfiles_front[regfiles_front_MPORT_82_addr] <= regfiles_front_MPORT_82_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_83_en & regfiles_front_MPORT_83_mask) begin
      regfiles_front[regfiles_front_MPORT_83_addr] <= regfiles_front_MPORT_83_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_87_en & regfiles_front_MPORT_87_mask) begin
      regfiles_front[regfiles_front_MPORT_87_addr] <= regfiles_front_MPORT_87_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_94_en & regfiles_front_MPORT_94_mask) begin
      regfiles_front[regfiles_front_MPORT_94_addr] <= regfiles_front_MPORT_94_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_96_en & regfiles_front_MPORT_96_mask) begin
      regfiles_front[regfiles_front_MPORT_96_addr] <= regfiles_front_MPORT_96_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_101_en & regfiles_front_MPORT_101_mask) begin
      regfiles_front[regfiles_front_MPORT_101_addr] <= regfiles_front_MPORT_101_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_105_en & regfiles_front_MPORT_105_mask) begin
      regfiles_front[regfiles_front_MPORT_105_addr] <= regfiles_front_MPORT_105_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_112_en & regfiles_front_MPORT_112_mask) begin
      regfiles_front[regfiles_front_MPORT_112_addr] <= regfiles_front_MPORT_112_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_135_en & regfiles_front_MPORT_135_mask) begin
      regfiles_front[regfiles_front_MPORT_135_addr] <= regfiles_front_MPORT_135_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_136_en & regfiles_front_MPORT_136_mask) begin
      regfiles_front[regfiles_front_MPORT_136_addr] <= regfiles_front_MPORT_136_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_137_en & regfiles_front_MPORT_137_mask) begin
      regfiles_front[regfiles_front_MPORT_137_addr] <= regfiles_front_MPORT_137_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_138_en & regfiles_front_MPORT_138_mask) begin
      regfiles_front[regfiles_front_MPORT_138_addr] <= regfiles_front_MPORT_138_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_139_en & regfiles_front_MPORT_139_mask) begin
      regfiles_front[regfiles_front_MPORT_139_addr] <= regfiles_front_MPORT_139_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_140_en & regfiles_front_MPORT_140_mask) begin
      regfiles_front[regfiles_front_MPORT_140_addr] <= regfiles_front_MPORT_140_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_144_en & regfiles_front_MPORT_144_mask) begin
      regfiles_front[regfiles_front_MPORT_144_addr] <= regfiles_front_MPORT_144_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_151_en & regfiles_front_MPORT_151_mask) begin
      regfiles_front[regfiles_front_MPORT_151_addr] <= regfiles_front_MPORT_151_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_153_en & regfiles_front_MPORT_153_mask) begin
      regfiles_front[regfiles_front_MPORT_153_addr] <= regfiles_front_MPORT_153_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_158_en & regfiles_front_MPORT_158_mask) begin
      regfiles_front[regfiles_front_MPORT_158_addr] <= regfiles_front_MPORT_158_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_162_en & regfiles_front_MPORT_162_mask) begin
      regfiles_front[regfiles_front_MPORT_162_addr] <= regfiles_front_MPORT_162_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_169_en & regfiles_front_MPORT_169_mask) begin
      regfiles_front[regfiles_front_MPORT_169_addr] <= regfiles_front_MPORT_169_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_191_en & regfiles_front_MPORT_191_mask) begin
      regfiles_front[regfiles_front_MPORT_191_addr] <= regfiles_front_MPORT_191_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_192_en & regfiles_front_MPORT_192_mask) begin
      regfiles_front[regfiles_front_MPORT_192_addr] <= regfiles_front_MPORT_192_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_193_en & regfiles_front_MPORT_193_mask) begin
      regfiles_front[regfiles_front_MPORT_193_addr] <= regfiles_front_MPORT_193_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_194_en & regfiles_front_MPORT_194_mask) begin
      regfiles_front[regfiles_front_MPORT_194_addr] <= regfiles_front_MPORT_194_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_195_en & regfiles_front_MPORT_195_mask) begin
      regfiles_front[regfiles_front_MPORT_195_addr] <= regfiles_front_MPORT_195_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_196_en & regfiles_front_MPORT_196_mask) begin
      regfiles_front[regfiles_front_MPORT_196_addr] <= regfiles_front_MPORT_196_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_200_en & regfiles_front_MPORT_200_mask) begin
      regfiles_front[regfiles_front_MPORT_200_addr] <= regfiles_front_MPORT_200_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_207_en & regfiles_front_MPORT_207_mask) begin
      regfiles_front[regfiles_front_MPORT_207_addr] <= regfiles_front_MPORT_207_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_209_en & regfiles_front_MPORT_209_mask) begin
      regfiles_front[regfiles_front_MPORT_209_addr] <= regfiles_front_MPORT_209_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_214_en & regfiles_front_MPORT_214_mask) begin
      regfiles_front[regfiles_front_MPORT_214_addr] <= regfiles_front_MPORT_214_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_218_en & regfiles_front_MPORT_218_mask) begin
      regfiles_front[regfiles_front_MPORT_218_addr] <= regfiles_front_MPORT_218_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_225_en & regfiles_front_MPORT_225_mask) begin
      regfiles_front[regfiles_front_MPORT_225_addr] <= regfiles_front_MPORT_225_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_247_en & regfiles_front_MPORT_247_mask) begin
      regfiles_front[regfiles_front_MPORT_247_addr] <= regfiles_front_MPORT_247_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_248_en & regfiles_front_MPORT_248_mask) begin
      regfiles_front[regfiles_front_MPORT_248_addr] <= regfiles_front_MPORT_248_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_249_en & regfiles_front_MPORT_249_mask) begin
      regfiles_front[regfiles_front_MPORT_249_addr] <= regfiles_front_MPORT_249_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_250_en & regfiles_front_MPORT_250_mask) begin
      regfiles_front[regfiles_front_MPORT_250_addr] <= regfiles_front_MPORT_250_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_251_en & regfiles_front_MPORT_251_mask) begin
      regfiles_front[regfiles_front_MPORT_251_addr] <= regfiles_front_MPORT_251_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_252_en & regfiles_front_MPORT_252_mask) begin
      regfiles_front[regfiles_front_MPORT_252_addr] <= regfiles_front_MPORT_252_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_256_en & regfiles_front_MPORT_256_mask) begin
      regfiles_front[regfiles_front_MPORT_256_addr] <= regfiles_front_MPORT_256_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_263_en & regfiles_front_MPORT_263_mask) begin
      regfiles_front[regfiles_front_MPORT_263_addr] <= regfiles_front_MPORT_263_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_265_en & regfiles_front_MPORT_265_mask) begin
      regfiles_front[regfiles_front_MPORT_265_addr] <= regfiles_front_MPORT_265_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_270_en & regfiles_front_MPORT_270_mask) begin
      regfiles_front[regfiles_front_MPORT_270_addr] <= regfiles_front_MPORT_270_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_274_en & regfiles_front_MPORT_274_mask) begin
      regfiles_front[regfiles_front_MPORT_274_addr] <= regfiles_front_MPORT_274_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_281_en & regfiles_front_MPORT_281_mask) begin
      regfiles_front[regfiles_front_MPORT_281_addr] <= regfiles_front_MPORT_281_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_303_en & regfiles_front_MPORT_303_mask) begin
      regfiles_front[regfiles_front_MPORT_303_addr] <= regfiles_front_MPORT_303_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_304_en & regfiles_front_MPORT_304_mask) begin
      regfiles_front[regfiles_front_MPORT_304_addr] <= regfiles_front_MPORT_304_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_305_en & regfiles_front_MPORT_305_mask) begin
      regfiles_front[regfiles_front_MPORT_305_addr] <= regfiles_front_MPORT_305_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_306_en & regfiles_front_MPORT_306_mask) begin
      regfiles_front[regfiles_front_MPORT_306_addr] <= regfiles_front_MPORT_306_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_307_en & regfiles_front_MPORT_307_mask) begin
      regfiles_front[regfiles_front_MPORT_307_addr] <= regfiles_front_MPORT_307_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_308_en & regfiles_front_MPORT_308_mask) begin
      regfiles_front[regfiles_front_MPORT_308_addr] <= regfiles_front_MPORT_308_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_312_en & regfiles_front_MPORT_312_mask) begin
      regfiles_front[regfiles_front_MPORT_312_addr] <= regfiles_front_MPORT_312_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_319_en & regfiles_front_MPORT_319_mask) begin
      regfiles_front[regfiles_front_MPORT_319_addr] <= regfiles_front_MPORT_319_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_321_en & regfiles_front_MPORT_321_mask) begin
      regfiles_front[regfiles_front_MPORT_321_addr] <= regfiles_front_MPORT_321_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_326_en & regfiles_front_MPORT_326_mask) begin
      regfiles_front[regfiles_front_MPORT_326_addr] <= regfiles_front_MPORT_326_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_330_en & regfiles_front_MPORT_330_mask) begin
      regfiles_front[regfiles_front_MPORT_330_addr] <= regfiles_front_MPORT_330_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_337_en & regfiles_front_MPORT_337_mask) begin
      regfiles_front[regfiles_front_MPORT_337_addr] <= regfiles_front_MPORT_337_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_359_en & regfiles_front_MPORT_359_mask) begin
      regfiles_front[regfiles_front_MPORT_359_addr] <= regfiles_front_MPORT_359_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_360_en & regfiles_front_MPORT_360_mask) begin
      regfiles_front[regfiles_front_MPORT_360_addr] <= regfiles_front_MPORT_360_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_361_en & regfiles_front_MPORT_361_mask) begin
      regfiles_front[regfiles_front_MPORT_361_addr] <= regfiles_front_MPORT_361_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_362_en & regfiles_front_MPORT_362_mask) begin
      regfiles_front[regfiles_front_MPORT_362_addr] <= regfiles_front_MPORT_362_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_363_en & regfiles_front_MPORT_363_mask) begin
      regfiles_front[regfiles_front_MPORT_363_addr] <= regfiles_front_MPORT_363_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_364_en & regfiles_front_MPORT_364_mask) begin
      regfiles_front[regfiles_front_MPORT_364_addr] <= regfiles_front_MPORT_364_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_368_en & regfiles_front_MPORT_368_mask) begin
      regfiles_front[regfiles_front_MPORT_368_addr] <= regfiles_front_MPORT_368_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_375_en & regfiles_front_MPORT_375_mask) begin
      regfiles_front[regfiles_front_MPORT_375_addr] <= regfiles_front_MPORT_375_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_377_en & regfiles_front_MPORT_377_mask) begin
      regfiles_front[regfiles_front_MPORT_377_addr] <= regfiles_front_MPORT_377_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_382_en & regfiles_front_MPORT_382_mask) begin
      regfiles_front[regfiles_front_MPORT_382_addr] <= regfiles_front_MPORT_382_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_386_en & regfiles_front_MPORT_386_mask) begin
      regfiles_front[regfiles_front_MPORT_386_addr] <= regfiles_front_MPORT_386_data; // @[Core.scala 90:27]
    end
    if(regfiles_front_MPORT_393_en & regfiles_front_MPORT_393_mask) begin
      regfiles_front[regfiles_front_MPORT_393_addr] <= regfiles_front_MPORT_393_data; // @[Core.scala 90:27]
    end
    if(opcodes_MPORT_en & opcodes_MPORT_mask) begin
      opcodes[opcodes_MPORT_addr] <= opcodes_MPORT_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_53_en & opcodes_MPORT_53_mask) begin
      opcodes[opcodes_MPORT_53_addr] <= opcodes_MPORT_53_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_109_en & opcodes_MPORT_109_mask) begin
      opcodes[opcodes_MPORT_109_addr] <= opcodes_MPORT_109_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_113_en & opcodes_MPORT_113_mask) begin
      opcodes[opcodes_MPORT_113_addr] <= opcodes_MPORT_113_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_166_en & opcodes_MPORT_166_mask) begin
      opcodes[opcodes_MPORT_166_addr] <= opcodes_MPORT_166_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_222_en & opcodes_MPORT_222_mask) begin
      opcodes[opcodes_MPORT_222_addr] <= opcodes_MPORT_222_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_278_en & opcodes_MPORT_278_mask) begin
      opcodes[opcodes_MPORT_278_addr] <= opcodes_MPORT_278_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_334_en & opcodes_MPORT_334_mask) begin
      opcodes[opcodes_MPORT_334_addr] <= opcodes_MPORT_334_data; // @[Core.scala 724:20]
    end
    if(opcodes_MPORT_390_en & opcodes_MPORT_390_mask) begin
      opcodes[opcodes_MPORT_390_addr] <= opcodes_MPORT_390_data; // @[Core.scala 724:20]
    end
    reset_hold <= reset | _GEN_0; // @[Core.scala 34:27 Core.scala 34:27]
    REG <= reset; // @[Core.scala 36:26]
    if (reset) begin // @[Core.scala 41:18]
      F <= 8'hff; // @[Core.scala 41:18]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          F <= _GEN_5257;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        F <= _GEN_8732;
      end else begin
        F <= _GEN_20300;
      end
    end
    if (reset) begin // @[Core.scala 49:18]
      R <= 8'h28; // @[Core.scala 49:18]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle < 8'h4)) begin // @[Core.scala 783:32]
          R <= _R_T_3; // @[Core.scala 787:13]
        end
      end
    end
    if (reset) begin // @[Core.scala 58:24]
      PC_next <= 16'h0; // @[Core.scala 58:24]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          PC_next <= _GEN_5073;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        PC_next <= _GEN_8564;
      end else begin
        PC_next <= _GEN_20133;
      end
    end
    if (reset) begin // @[Core.scala 67:30]
      machine_state <= 3'h1; // @[Core.scala 67:30]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          machine_state <= _GEN_5481;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        machine_state <= _GEN_8764;
      end else begin
        machine_state <= _GEN_20524;
      end
    end
    if (reset) begin // @[Core.scala 68:35]
      machine_state_next <= 3'h1; // @[Core.scala 68:35]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          machine_state_next <= _GEN_5082;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        machine_state_next <= _GEN_8555;
      end else begin
        machine_state_next <= _GEN_20124;
      end
    end
    if (reset) begin // @[Core.scala 71:20]
      IFF <= 1'h0; // @[Core.scala 71:20]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          IFF <= _GEN_5118;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        IFF <= _GEN_8593;
      end else begin
        IFF <= _GEN_20161;
      end
    end
    if (reset) begin // @[Core.scala 73:31]
      mem_refer_addr <= 16'h0; // @[Core.scala 73:31]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          mem_refer_addr <= _GEN_5087;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        mem_refer_addr <= _GEN_8560;
      end else begin
        mem_refer_addr <= _GEN_20129;
      end
    end
    if (reset) begin // @[Core.scala 110:19]
      PC <= 16'h0; // @[Core.scala 110:19]
    end else if (_T_1481) begin // @[Core.scala 917:35]
      PC <= 16'h0; // @[Core.scala 918:8]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        PC <= _GEN_5702;
      end else begin
        PC <= _GEN_21130;
      end
    end
    if (reset) begin // @[Core.scala 113:19]
      SP <= 16'hffff; // @[Core.scala 113:19]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          SP <= _GEN_5128;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        SP <= _GEN_8603;
      end else begin
        SP <= _GEN_20171;
      end
    end
    if (reset) begin // @[Core.scala 725:29]
      opcode_index <= 8'h0; // @[Core.scala 725:29]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          opcode_index <= _GEN_5083;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        opcode_index <= _GEN_8556;
      end else begin
        opcode_index <= _GEN_20125;
      end
    end
    if (reset) begin // @[Core.scala 770:27]
      m1_t_cycle <= 8'h1; // @[Core.scala 770:27]
    end else if (_T_1481) begin // @[Core.scala 917:35]
      m1_t_cycle <= 8'h1; // @[Core.scala 919:16]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        m1_t_cycle <= _GEN_1;
      end else begin
        m1_t_cycle <= _GEN_20912;
      end
    end
    if (reset) begin // @[Core.scala 775:28]
      dummy_cycle <= 3'h0; // @[Core.scala 775:28]
    end else if (~reset_hold) begin // @[Core.scala 777:21]
      if (_T_4) begin // @[Conditional.scala 40:58]
        if (!(m1_t_cycle == 8'h1)) begin // @[Core.scala 790:34]
          dummy_cycle <= _GEN_5125;
        end
      end else if (_T_25) begin // @[Conditional.scala 39:67]
        dummy_cycle <= _GEN_8600;
      end else begin
        dummy_cycle <= _GEN_20168;
      end
    end
    REG_1 <= clock; // @[Core.scala 796:34]
    REG_2 <= clock; // @[Core.scala 573:42]
    REG_3 <= clock; // @[Core.scala 583:42]
    REG_4 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_ <= register; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_ <= register;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_5 <= clock; // @[Core.scala 815:34]
    REG_6 <= clock; // @[Core.scala 573:42]
    REG_7 <= clock; // @[Core.scala 583:42]
    REG_8 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_1 <= register_1; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_1 <= register_1;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp_1 <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp_1 <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_9 <= clock; // @[Core.scala 826:34]
    REG_10 <= clock; // @[Core.scala 842:34]
    REG_11 <= clock; // @[Core.scala 573:42]
    REG_12 <= clock; // @[Core.scala 583:42]
    REG_13 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_2 <= register_2; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_2 <= register_2;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp_2 <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp_2 <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_14 <= clock; // @[Core.scala 855:34]
    REG_15 <= clock; // @[Core.scala 874:34]
    REG_16 <= clock; // @[Core.scala 878:34]
    REG_17 <= clock; // @[Core.scala 573:42]
    REG_18 <= clock; // @[Core.scala 583:42]
    REG_19 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_3 <= register_3; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_3 <= register_3;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp_3 <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp_3 <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_20 <= clock; // @[Core.scala 886:34]
    REG_21 <= clock; // @[Core.scala 573:42]
    REG_22 <= clock; // @[Core.scala 583:42]
    REG_23 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_4 <= register_4; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_4 <= register_4;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp_4 <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp_4 <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_24 <= clock; // @[Core.scala 573:42]
    REG_25 <= clock; // @[Core.scala 583:42]
    REG_26 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_5 <= register_5; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_5 <= register_5;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp_5 <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp_5 <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_27 <= clock; // @[Core.scala 573:42]
    REG_28 <= clock; // @[Core.scala 583:42]
    REG_29 <= clock; // @[Core.scala 602:43]
    if (reset) begin // @[Core.scala 183:24]
      input_6 <= register_6; // @[Core.scala 183:24]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      input_6 <= register_6;
    end
    if (reset) begin // @[Core.scala 245:25]
      temp_6 <= 8'h0; // @[Core.scala 245:25]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_25) begin // @[Conditional.scala 39:67]
        if (_T_12) begin // @[Core.scala 262:34]
          temp_6 <= alu_io_output_C; // @[Core.scala 263:18]
        end
      end
    end
    REG_30 <= reset; // @[Core.scala 917:26]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & _T_4 & ~_T_6 & _T_12 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_1_data,opcodes_MPORT_2_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24684 & 8'h0 == _T_15 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24684 & ~_T_16 & 8'hd3 == _T_19 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24695 & ~_T_20 & 8'hf3 == _T_56 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24704 & ~_T_57 & (8'hcd == _T_60 | 8'hc4 == _T_62) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24716 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24715 & ~_T_64 & 8'hc0 == _T_83 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24739 & ~_T_84 & 8'h3 == _T_95 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24754 & ~_T_96 & 8'h4 == _T_116 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24771 & ~_T_117 & 8'h76 == _T_133 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24790 & ~_T_134 & 8'h70 == _T_137 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24811 & ~_T_138 & 8'h40 == _T_144 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24834 & ~_T_145 & 8'h6 == _T_153 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24860 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_42_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24859 & ~_T_154 & 8'h80 == _T_166 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24911 & ~_T_167 & (8'hc3 == _T_185 | 8'hc2 == _T_187) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24940 & ~_T_189 & 8'hdd == _T_200 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & _T_4 & ~_T_6 & ~_T_12 & _T_101 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_57_data,opcodes_MPORT_58_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24978 & 8'h0 == _T_223 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24978 & ~_T_224 & 8'hd3 == _T_227 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_24993 & ~_T_228 & 8'hf3 == _T_264 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25004 & ~_T_265 & (8'hcd == _T_268 | 8'hc4 == _T_270) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25018 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25017 & ~_T_272 & 8'hc0 == _T_291 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25045 & ~_T_292 & 8'h3 == _T_303 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25062 & ~_T_304 & 8'h4 == _T_324 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25081 & ~_T_325 & 8'h76 == _T_341 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25102 & ~_T_342 & 8'h70 == _T_345 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25125 & ~_T_346 & 8'h40 == _T_352 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25150 & ~_T_353 & 8'h6 == _T_361 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25178 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_98_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25177 & ~_T_362 & 8'h80 == _T_374 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25233 & ~_T_375 & (8'hc3 == _T_393 | 8'hc2 == _T_395) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25264 & ~_T_397 & 8'hdd == _T_408 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & ~_T_4 & _T_25 & ~_T_6 & _T_12 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_114_data,opcodes_MPORT_115_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25304 & 8'h0 == _T_440 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25304 & ~_T_441 & 8'hd3 == _T_444 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25319 & ~_T_445 & 8'hf3 == _T_481 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25330 & ~_T_482 & (8'hcd == _T_485 | 8'hc4 == _T_487) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25344 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25343 & ~_T_489 & 8'hc0 == _T_508 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25371 & ~_T_509 & 8'h3 == _T_520 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25388 & ~_T_521 & 8'h4 == _T_541 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25407 & ~_T_542 & 8'h76 == _T_558 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25428 & ~_T_559 & 8'h70 == _T_562 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25451 & ~_T_563 & 8'h40 == _T_569 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25476 & ~_T_570 & 8'h6 == _T_578 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25504 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_155_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25503 & ~_T_579 & 8'h80 == _T_591 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25559 & ~_T_592 & (8'hc3 == _T_610 | 8'hc2 == _T_612) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25590 & ~_T_614 & 8'hdd == _T_625 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & ~_T_4 & ~_T_25 & _T_79 & ~_T_6 & _T_12 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_170_data,opcodes_MPORT_171_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25632 & 8'h0 == _T_660 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25632 & ~_T_661 & 8'hd3 == _T_664 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25651 & ~_T_665 & 8'hf3 == _T_701 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25664 & ~_T_702 & (8'hcd == _T_705 | 8'hc4 == _T_707) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25680 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25679 & ~_T_709 & 8'hc0 == _T_728 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25711 & ~_T_729 & 8'h3 == _T_740 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25730 & ~_T_741 & 8'h4 == _T_761 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25751 & ~_T_762 & 8'h76 == _T_778 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25774 & ~_T_779 & 8'h70 == _T_782 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25799 & ~_T_783 & 8'h40 == _T_789 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25826 & ~_T_790 & 8'h6 == _T_798 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25856 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_211_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25855 & ~_T_799 & 8'h80 == _T_811 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25915 & ~_T_812 & (8'hc3 == _T_830 | 8'hc2 == _T_832) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25948 & ~_T_834 & 8'hdd == _T_845 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & ~_T_4 & ~_T_25 & _T_79 & ~_T_6 & ~_T_12 & _T_101 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_226_data,opcodes_MPORT_227_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25994 & 8'h0 == _T_868 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_25994 & ~_T_869 & 8'hd3 == _T_872 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26017 & ~_T_873 & 8'hf3 == _T_909 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26032 & ~_T_910 & (8'hcd == _T_913 | 8'hc4 == _T_915) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26050 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26049 & ~_T_917 & 8'hc0 == _T_936 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26085 & ~_T_937 & 8'h3 == _T_948 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26106 & ~_T_949 & 8'h4 == _T_969 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26129 & ~_T_970 & 8'h76 == _T_986 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26154 & ~_T_987 & 8'h70 == _T_990 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26181 & ~_T_991 & 8'h40 == _T_997 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26210 & ~_T_998 & 8'h6 == _T_1006 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26242 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_267_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26241 & ~_T_1007 & 8'h80 == _T_1019 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26305 & ~_T_1020 & (8'hc3 == _T_1038 | 8'hc2 == _T_1040) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26340 & ~_T_1042 & 8'hdd == _T_1053 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & ~_T_4 & ~_T_25 & ~_T_79 & _T_77 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_282_data,opcodes_MPORT_283_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26385 & 8'h0 == _T_1073 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26385 & ~_T_1074 & 8'hd3 == _T_1077 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26402 & ~_T_1078 & 8'hf3 == _T_1114 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26414 & ~_T_1115 & (8'hcd == _T_1118 | 8'hc4 == _T_1120) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26429 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26428 & ~_T_1122 & 8'hc0 == _T_1141 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26458 & ~_T_1142 & 8'h3 == _T_1153 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26476 & ~_T_1154 & 8'h4 == _T_1174 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26496 & ~_T_1175 & 8'h76 == _T_1191 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26518 & ~_T_1192 & 8'h70 == _T_1195 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26542 & ~_T_1196 & 8'h40 == _T_1202 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26568 & ~_T_1203 & 8'h6 == _T_1211 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26597 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_323_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26596 & ~_T_1212 & 8'h80 == _T_1224 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26654 & ~_T_1225 & (8'hc3 == _T_1243 | 8'hc2 == _T_1245) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26686 & ~_T_1247 & 8'hdd == _T_1258 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & ~_T_4 & ~_T_25 & ~_T_79 & ~_T_77 & _T_27 & _T_1) begin
          $fwrite(32'h80000002,"----decode %x %x\n",opcodes_MPORT_338_data,opcodes_MPORT_339_data); // @[Core.scala 729:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26730 & 8'h0 == _T_1278 & _T_1) begin
          $fwrite(32'h80000002,"NOP\n"); // @[Core.scala 730:54]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26730 & ~_T_1279 & 8'hd3 == _T_1282 & _T_1) begin
          $fwrite(32'h80000002,"inout\n"); // @[Core.scala 731:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26751 & ~_T_1283 & 8'hf3 == _T_1319 & _T_1) begin
          $fwrite(32'h80000002,"DI/EI\n"); // @[Core.scala 732:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26765 & ~_T_1320 & (8'hcd == _T_1323 | 8'hc4 == _T_1325) & _T_1) begin
          $fwrite(32'h80000002,"CALL\n"); // @[Core.scala 733:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26782 & _T_1) begin
          $fwrite(32'h80000002,"machine_state %d\n",machine_state); // @[Core.scala 621:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26781 & ~_T_1327 & 8'hc0 == _T_1346 & _T_1) begin
          $fwrite(32'h80000002,"RET\n"); // @[Core.scala 734:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26815 & ~_T_1347 & 8'h3 == _T_1358 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec16\n"); // @[Core.scala 735:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26835 & ~_T_1359 & 8'h4 == _T_1379 & _T_1) begin
          $fwrite(32'h80000002,"inc/dec\n"); // @[Core.scala 736:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26857 & ~_T_1380 & 8'h76 == _T_1396 & _T_1) begin
          $fwrite(32'h80000002,"HALT\n"); // @[Core.scala 737:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26881 & ~_T_1397 & 8'h70 == _T_1400 & _T_1) begin
          $fwrite(32'h80000002,"LD (HL),r\n"); // @[Core.scala 738:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26907 & ~_T_1401 & 8'h40 == _T_1407 & _T_1) begin
          $fwrite(32'h80000002,"LD r1,r2\n"); // @[Core.scala 739:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26935 & ~_T_1408 & 8'h6 == _T_1416 & _T_1) begin
          $fwrite(32'h80000002,"LD r,n_(hl)\n"); // @[Core.scala 740:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26966 & _T_1) begin
          $fwrite(32'h80000002,"ld_a_n%d\n",opcodes_MPORT_379_data); // @[Core.scala 326:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_26965 & ~_T_1417 & 8'h80 == _T_1429 & _T_1) begin
          $fwrite(32'h80000002,"ADD A,r\n"); // @[Core.scala 741:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_27027 & ~_T_1430 & (8'hc3 == _T_1448 | 8'hc2 == _T_1450) & _T_1) begin
          $fwrite(32'h80000002,"JP nn"); // @[Core.scala 742:97]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_27061 & ~_T_1452 & 8'hdd == _T_1463 & _T_1) begin
          $fwrite(32'h80000002,"DD"); // @[Core.scala 743:59]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"--------\n"); // @[Core.scala 927:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"PC: 0x%x\n",PC); // @[Core.scala 928:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"opcode: 0x%x\n",opcodes_MPORT_394_data); // @[Core.scala 929:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"m1: 0x%x\n",m1_t_cycle); // @[Core.scala 931:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"iff: 0x%x\n",IFF); // @[Core.scala 932:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    regfiles_front[initvar] = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    opcodes[initvar] = _RAND_1[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reset_hold = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  F = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  R = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  PC_next = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  machine_state = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  machine_state_next = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  IFF = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  mem_refer_addr = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  PC = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  SP = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  opcode_index = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  m1_t_cycle = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  dummy_cycle = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  REG_1 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  REG_2 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  REG_3 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_4 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  input_ = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  temp = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  REG_5 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  REG_6 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  REG_7 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_8 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  input_1 = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  temp_1 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  REG_9 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  REG_10 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  REG_11 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_12 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  REG_13 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  input_2 = _RAND_33[15:0];
  _RAND_34 = {1{`RANDOM}};
  temp_2 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  REG_14 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  REG_15 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  REG_16 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  REG_17 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  REG_18 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  REG_19 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  input_3 = _RAND_41[15:0];
  _RAND_42 = {1{`RANDOM}};
  temp_3 = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  REG_20 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  REG_21 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  REG_22 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  REG_23 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  input_4 = _RAND_47[15:0];
  _RAND_48 = {1{`RANDOM}};
  temp_4 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  REG_24 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  REG_25 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  REG_26 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  input_5 = _RAND_52[15:0];
  _RAND_53 = {1{`RANDOM}};
  temp_5 = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  REG_27 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  REG_28 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  REG_29 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  input_6 = _RAND_57[15:0];
  _RAND_58 = {1{`RANDOM}};
  temp_6 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  REG_30 = _RAND_59[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input         clock,
  input         reset,
  input  [15:0] io_imem_addr,
  output [7:0]  io_imem_data,
  input  [7:0]  io_imem_data1,
  input         io_imem_RD_,
  input         io_imem_WR_,
  input         io_imem_MREQ_
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:65535]; // @[Memory.scala 38:16]
  wire [7:0] mem_peek_data; // @[Memory.scala 38:16]
  wire [15:0] mem_peek_addr; // @[Memory.scala 38:16]
  wire [7:0] mem_io_imem_data_MPORT_data; // @[Memory.scala 38:16]
  wire [15:0] mem_io_imem_data_MPORT_addr; // @[Memory.scala 38:16]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 38:16]
  wire [15:0] mem_MPORT_addr; // @[Memory.scala 38:16]
  wire  mem_MPORT_mask; // @[Memory.scala 38:16]
  wire  mem_MPORT_en; // @[Memory.scala 38:16]
  wire  _T = ~io_imem_MREQ_; // @[Memory.scala 44:22]
  wire  _T_1 = ~io_imem_RD_; // @[Memory.scala 45:22]
  wire [7:0] _GEN_3 = ~io_imem_RD_ ? mem_io_imem_data_MPORT_data : 8'h0; // @[Memory.scala 45:31 Memory.scala 46:20 Memory.scala 42:16]
  wire  _T_2 = ~io_imem_WR_; // @[Memory.scala 48:22]
  assign mem_peek_addr = 16'h1000;
  assign mem_peek_data = mem[mem_peek_addr]; // @[Memory.scala 38:16]
  assign mem_io_imem_data_MPORT_addr = io_imem_addr;
  assign mem_io_imem_data_MPORT_data = mem[mem_io_imem_data_MPORT_addr]; // @[Memory.scala 38:16]
  assign mem_MPORT_data = io_imem_data1;
  assign mem_MPORT_addr = io_imem_addr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _T & _T_2;
  assign io_imem_data = ~io_imem_MREQ_ ? _GEN_3 : 8'h0; // @[Memory.scala 44:31 Memory.scala 42:16]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 38:16]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"%d\n",mem_peek_data); // @[Memory.scala 53:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Top(
  input   clock,
  input   reset,
  output  io_exit
);
  wire  core_clock; // @[Top.scala 11:22]
  wire  core_reset; // @[Top.scala 11:22]
  wire [15:0] core_io_bus_addr; // @[Top.scala 11:22]
  wire [7:0] core_io_bus_data; // @[Top.scala 11:22]
  wire [7:0] core_io_bus_data1; // @[Top.scala 11:22]
  wire  core_io_bus_RD_; // @[Top.scala 11:22]
  wire  core_io_bus_WR_; // @[Top.scala 11:22]
  wire  core_io_bus_MREQ_; // @[Top.scala 11:22]
  wire  core_io_exit; // @[Top.scala 11:22]
  wire  memory_clock; // @[Top.scala 12:22]
  wire  memory_reset; // @[Top.scala 12:22]
  wire [15:0] memory_io_imem_addr; // @[Top.scala 12:22]
  wire [7:0] memory_io_imem_data; // @[Top.scala 12:22]
  wire [7:0] memory_io_imem_data1; // @[Top.scala 12:22]
  wire  memory_io_imem_RD_; // @[Top.scala 12:22]
  wire  memory_io_imem_WR_; // @[Top.scala 12:22]
  wire  memory_io_imem_MREQ_; // @[Top.scala 12:22]
  Core core ( // @[Top.scala 11:22]
    .clock(core_clock),
    .reset(core_reset),
    .io_bus_addr(core_io_bus_addr),
    .io_bus_data(core_io_bus_data),
    .io_bus_data1(core_io_bus_data1),
    .io_bus_RD_(core_io_bus_RD_),
    .io_bus_WR_(core_io_bus_WR_),
    .io_bus_MREQ_(core_io_bus_MREQ_),
    .io_exit(core_io_exit)
  );
  Memory memory ( // @[Top.scala 12:22]
    .clock(memory_clock),
    .reset(memory_reset),
    .io_imem_addr(memory_io_imem_addr),
    .io_imem_data(memory_io_imem_data),
    .io_imem_data1(memory_io_imem_data1),
    .io_imem_RD_(memory_io_imem_RD_),
    .io_imem_WR_(memory_io_imem_WR_),
    .io_imem_MREQ_(memory_io_imem_MREQ_)
  );
  assign io_exit = core_io_exit; // @[Top.scala 16:11]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_bus_data = memory_io_imem_data; // @[Top.scala 14:15]
  assign memory_clock = clock;
  assign memory_reset = reset;
  assign memory_io_imem_addr = core_io_bus_addr; // @[Top.scala 14:15]
  assign memory_io_imem_data1 = core_io_bus_data1; // @[Top.scala 14:15]
  assign memory_io_imem_RD_ = core_io_bus_RD_; // @[Top.scala 14:15]
  assign memory_io_imem_WR_ = core_io_bus_WR_; // @[Top.scala 14:15]
  assign memory_io_imem_MREQ_ = core_io_bus_MREQ_; // @[Top.scala 14:15]
endmodule
