package z80

import chisel3._
import chisel3.util._
import chisel3.experimental.Analog

/* 1 bit tristate buffer */
class InOut extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val pinout = Analog(1.W)
    val inp  = Input(Bool())
    val outp = Output(Bool())
    val dir = Input(Bool())
  })

    setInline("TriStateBuffer.v",
    s"""
      |module TriStateBuffer(
      |    inout   pinout,
      |    input   inp,
      |    output  outp,
      |    input   dir
      |);
      | assign pinout = dir ? inp : 1'bZ;
      | assign outp = pinout;
      |
      |endmodule
    """.stripMargin)
}

/* 8 bits tristate buffer */
class InOut8 extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val pinout1 = Analog(8.W)
    val pinout2 = Analog(8.W)
    val pinout3 = Analog(8.W)
  })

    setInline("InOut.v",
    s"""
    |module InOut8(
    |    inout [7:0] pinout1,
    |    inout [7:0] pinout2,
    |    inout [7:0] pinout3
    |);
    |
    |assign pinout1 = pinout2;
    |
    |endmodule
    """.stripMargin)
}

/* 8 bits tristate buffer */
class InOut82(size:UInt) extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val input1 = Input(UInt(8.W))
    val output1 = Output(UInt(8.W))
    val dir1 = Input(Bool())
    val input2 = Input(UInt(8.W))
    val output2 = Output(UInt(8.W))
    val dir2 = Input(Bool())
    val input3 = Input(UInt(8.W))
    val output3 = Output(UInt(8.W))
    val dir3 = Input(Bool())
   })

    setInline("InOut81.v",
    s"""
    |module InOut81(
    |    input  [7:0] input1,
    |    output [7:0] output1,
    |    input dir1,
    |    input  [7:0] input2,
    |    output [7:0] output2,
    |    input dir2,
    |    input  [7:0] input3,
    |    output [7:0] output3,
    |    input dir3
    |);
    |
    |wire [7:0] output__;
    |
    |wire output__ = (dir1?input1:8'Z) | (dir2?input2:8'Z) | (dir3?input3:8'Z);
    |assign output1 = output__;
    |assign output2 = output__;
    |assign output3 = output__;
    |
    |endmodule
    """.stripMargin)
}


/* 8 bits tristate buffer */
class InOut81 extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val input1 = Input(UInt(8.W))
    val output1 = Output(UInt(8.W))
    val dir1 = Input(Bool())
    val input2 = Input(UInt(8.W))
    val output2 = Output(UInt(8.W))
    val dir2 = Input(Bool())
    val input3 = Input(UInt(8.W))
    val output3 = Output(UInt(8.W))
    val dir3 = Input(Bool())
   })

    setInline("InOut81.v",
    s"""
    |module InOut81(
    |    input  [7:0] input1,
    |    output [7:0] output1,
    |    input dir1,
    |    input  [7:0] input2,
    |    output [7:0] output2,
    |    input dir2,
    |    input  [7:0] input3,
    |    output [7:0] output3,
    |    input dir3
    |);
    |
    |wire [7:0] output__;
    |
    |wire output__ = (dir1?input1:8'Z) | (dir2?input2:8'Z) | (dir3?input3:8'Z);
    |assign output1 = output__;
    |assign output2 = output__;
    |assign output3 = output__;
    |
    |endmodule
    """.stripMargin)
}


/* 16 bits tristate buffer */
class InOut16 extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val pinout = Analog(16.W)
    val inp  = Input(UInt(16.W))
    val outp = Output(UInt(16.W))
    val dir  = Input(UInt(16.W))
  })

    setInline("TriStateBuffer16.v",
    s"""
    |module TriStateBuffer16(
    |    inout   [15:0] pinout,
    |    input   [15:0] inp,
    |    output  [15:0] outp,
    |    input   [15:0] dir
    |);
    |
    |generate
    | genvar i;
    | for(i=0; i<16; i=i+1)
    | begin: gen1
    |   assign pinout[i] = dir ? inp[i] : 16'bZ;
    | end
    |endgenerate
    | 
    |assign outp = pinout;
    |
    |endmodule
    """.stripMargin)
}