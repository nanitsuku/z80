package z80

import chisel3._
import chisel3.util._
import chisel3.experimental._
//import common.Consts._

class C8255A extends Module {
  val io = IO(new Bundle {
    val RD_ = Input(Bool())
    val WR_ = Input(Bool())
    val CS_ = Input(Bool())
    val A0 = Input(Bool())
    val A1 = Input(Bool())
//    val data = Analog(8.W)
//    val data = Analog(8.W)
    val datao = Output(UInt(8.W))
    val datai = Input(UInt(8.W))

    val PortAOutput = Output(UInt(8.W))
    val PortBOutput = Output(UInt(8.W))
    val PortCUOutput = Output(UInt(8.W))
    val PortCLOutput = Output(UInt(8.W))

    val PortAInput = Input(UInt(8.W))
    val PortBInput = Input(UInt(8.W))
    val PortCUInput = Input(UInt(8.W))
    val PortCLInput = Input(UInt(8.W))
///
//    val PAo = Output(UInt(8.W))
//    val PBo = Output(UInt(8.W))
//    val PCUo = Output(UInt(4.W))
//    val PCLo = Output(UInt(4.W))
//
//    val PAi = Input(UInt(8.W))
//    val PBi = Input(UInt(8.W))
//    val PCUi = Input(UInt(4.W))
//    val PCLi = Input(UInt(4.W))
  })
  val control = RegInit(0x9B.U(8.W))
  val mode_set_flag = control(7)
  val mode_selection_A = control(6,5)
  val port_A = control(4)
  val port_CU = control(3)
  val mode_selection_B = control(2)
  val port_B = control(1)
  val port_CL = control(0)

  val portA_datai = io.PortAInput
  val portA_datao = Reg(UInt(8.W))
  io.PortAOutput := portA_datao

  val portB_datai = io.PortBInput
  val portB_datao = Reg(UInt(8.W))
  io.PortBOutput := portB_datao

  val portC_dataUi = io.PortCUInput
  val portC_dataLi = io.PortCUInput
  val portC_dataUo = Reg(UInt(4.W))
  val portC_dataLo = Reg(UInt(4.W))

  io.PortCUOutput := portC_dataUo
  io.PortCLOutput := portC_dataLo

//  val datai = Wire(UInt(8.W))
//  val datao = Wire(UInt(8.W))

  when(reset.asBool()) {
    control := 0x9B.U
//    io.datai := 0.U
    io.datao := 8.U
  }.otherwise {
//    io.datai := 255.U
    io.datao := 128.U
  }

  when(!io.CS_) {
    when(!io.RD_) { // when read
      switch(Cat(io.A1, io.A0)) {
        is(0x0.U) {
          // port A input mode
          when(port_A === 0x1.U) {
            io.datao := portA_datai
          }
        }
        is(0x01.U) {
          // port B input mode
          when(port_B === 0x1.U) {
            io.datao := portB_datai
          }
        }
        is(0x02.U) {
          // port C input mode
          when(port_CU === 0x1.U) {
            io.datao := portC_dataUi<<4
          }
          when(port_CL === 0x1.U) {
            io.datao := portC_dataLi
          }
        }
        is(0x03.U) { // control port
          io.datao := control
        }
      }
    }.elsewhen(!io.WR_) {
      switch(Cat(io.A1, io.A0)) {
        is(0x0.U) {
          // port A output mode
          when(port_A === 0x0.U) {
            portA_datao := io.datai
          }
        }
        is(0x01.U) {
          // port B output mode
          when(port_B === 0x0.U) {
            portB_datao := io.datai
          }
        }
        is(0x02.U) {
          // port C output mode
          when(port_CU === 0x0.U) {
            portC_dataUo := io.datai(7,4)
          }
          when(port_CL === 0x0.U) {
            portC_dataLo := io.datai(3,0)
          }
        }
        is(0x03.U) { // control port
          control := io.datai
        }
      }
    }
  }.otherwise {

  }
  dontTouch(io.PortAOutput)
  dontTouch(io.PortBOutput)
  dontTouch(io.PortCUOutput)
  dontTouch(io.PortCLOutput)
  dontTouch(io.PortAInput)
  dontTouch(io.PortBInput)
  dontTouch(io.PortCUInput)
  dontTouch(io.PortCLInput)
}
