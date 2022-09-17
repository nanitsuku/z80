package z80

import chisel3._
import chisel3.util._
import chisel3.experimental.Analog

/* 1 bit tristate buffer */
class TriStateBuffer extends BlackBox with HasBlackBoxInline {
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
class TriStateBuffer8 extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val pinout = Analog(8.W)
    val inp  = Input(UInt(8.W))
    val outp = Output(UInt(8.W))
    val dir  = Input(UInt(8.W))
  })

    setInline("TriStateBuffer8.v",
    s"""
    |module TriStateBuffer8(
    |    inout   [7:0] pinout,
    |    input   [7:0] inp,
    |    output  [7:0] outp,
    |    input   dir
    |);
    |
    |generate
    | genvar i;
    | for(i=0; i<8; i=i+1)
    | begin: gen1
    |   assign pinout[i] = dir ? inp[i] : 8'bZ;
    | end
    |endgenerate
    | 
    |assign outp = pinout;
    |
    |endmodule
    """.stripMargin)
}

/* 16 bits tristate buffer */
class TriStateBuffer16 extends BlackBox with HasBlackBoxInline {
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