package z80

import chisel3._
import chisel3.util._
//import common.Consts._


class ALU extends Module {
  val io = IO(new Bundle {
    val input_A = Input(UInt(8.W))
    val input_B = Input(UInt(8.W))
    val calc_type = Input(UInt(8.W))
    val output_C = Output(UInt(8.W))
    val flag = Output(UInt(8.W))
  })

  val add_op = 0.U
  val sub_op = 1.U
  val rl_op = 2.U


//  io.output_C := RegInit(0.U(8.W))
//  val io.output_C = Wire(UInt(16.W))
  io.output_C := 0.U

  io.flag := RegInit(0.U(8.W))

//  var temp = RegInit(0.U(16.W))
//  var temph = RegInit(0.U(16.W))

/*
  var S = RegInit(0.B)
  var Z = RegInit(0.B)
  var H = RegInit(0.B)
  var PV = RegInit(0.B)
  var X = RegInit(0.B)
*/
  var S = WireDefault(1.B)
  var Z = WireDefault(1.B)
  var H = WireDefault(1.B)
  var PV = WireDefault(1.B)
  var X = WireDefault(1.B)
  var N = WireDefault(1.B)
  var C = WireDefault(1.B)
//  var N = RegInit(0.B)
//:  var C = RegInit(0.B)

//  io.output_C := UInt(0)
//  io.flag := UInt(0)
/*
  val added = Wire(UInt(16.W))
  added := io.input_A + io.input_B

  val added_s = Wire(SInt(16.W))
  added_s := 0.S(16.W) + io.input_A.asSInt + io.input_B.asSInt
*/
  val temp = WireDefault(0.U(16.W))
  val temps = WireDefault(0.S(16.W))
//  temp := 0.U(8.W)

  val temph = WireDefault(0.U(8.W))
//  temph := 0.U(8.W)
/*
  val N = Wire(Bool())
  N := 0.B

  val C = Wire(Bool())
  C := 0.B
*/
  switch(io.calc_type) {
    is(add_op)  {
        temp := Cat(0.U(1.W), io.input_A) + Cat(0.U(1.W), io.input_B)
        temph := 0.U(16.W) + io.input_A(3,0) + io.input_B(3,0)
        PV :=(io.input_A(7) | io.input_B(7))^temp(7)
        N := 0.B
    }
   is(sub_op) {
      temp := Cat(0.U(1.W), io.input_A) - Cat(0.U(1.W), io.input_B)
      temph := 0.U(16.W) + io.input_A(3,0) - io.input_B(3,0)
      PV :=(io.input_A(7) | io.input_B(7))^temp(7)
      N := 1.B
    }
    is(rl_op) {

    }
  }

  S := temp(7)
  Z := ( temp(7,0) === 0.U(8.W))
  H := temph(4)
//  PV := temp(8)
  C := temp(8)

  io.output_C := temp
  io.flag := Cat(S, Z, X, H, X, PV, N, C)
/*
  when (io.calc_type === BitPat("b00000000")) {
    temp = 0.U(16.W) + io.input_A + io.input_B
    temph = 0.U(16.W) + io.input_A(3,0) + io.input_B(3,0)
    io.output_C := temp.asUInt
//    io.output_C := io.input_A + io.input_B
    S := temp(7)
    Z := ( temp === 0.U(16.W))
    H := temph(4)
    PV := temp(8)
    N := 1.B
    C := temp(8)

    io.flag := Cat(S, Z, X, H, X, PV, N, C)
  }.otherwise {
    io.output_C := io.calc_type
   }
   */
}

