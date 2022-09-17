package z80 

import chisel3._
import chisel3.util._

class Top(filename:String) extends Module {
  val io = IO(new Bundle {
   val data_ = Output(UInt(8.W))
    val address_ = Output(UInt(8.W))

    val PortAOutput = Output(UInt(8.W))
    val PortBOutput = Output(UInt(8.W))
    val PortCUOutput = Output(UInt(8.W))
    val PortCLOutput = Output(UInt(8.W))

    val PortAInput = Input(UInt(8.W))
    val PortBInput = Input(UInt(8.W))
    val PortCUInput = Input(UInt(8.W))
    val PortCLInput = Input(UInt(8.W))

//    val HOGE = Output(UInt(8.W))
/*
    val PortAInput = Input(UInt(8.W))
    val PortBInput = Input(UInt(8.W))
    val PortCUInput = Input(UInt(8.W))
    val PortCLInput = Input(UInt(8.W))
*/
//    val clock2 = Input(Clock())
  })
  
  val core   = Module(new Core())
  val memory = Module(new Memory(filename))

  val inout = Module(new InOut81())
  val c8255a = Module(new C8255A())
//  val decoder = Module(new Decoder())
//  core.io.bus <> memory.io.imem


//  io.HOGE := memory.io.HOGE

  memory.io.imem.MREQ_ := core.io.bus.MREQ_
  memory.io.imem.RD_ := core.io.bus.RD_
  memory.io.imem.WR_ := core.io.bus.WR_
//  core.io.bus.data := memory.io.imem.data
//  memory.io.imem.data1 := core.io.bus.data1
  memory.io.imem.addr := core.io.bus.addr

  memory.io.imem.HALT_ := 0.U
  memory.io.imem.M1_ := 0.U
  memory.io.imem.RFSH_ := 0.U
  memory.io.imem.IORQ_ := 0.U

  inout.io.dir1 := !core.io.bus.WR_
  inout.io.input1 := core.io.bus.data1
  core.io.bus.data := inout.io.output1

  inout.io.dir2 := !core.io.bus.RD_
  inout.io.input2 := memory.io.imem.data
  memory.io.imem.data1 := inout.io.output2

  inout.io.dir3 := !core.io.bus.IORQ_
  inout.io.input3 := c8255a.io.datao
  c8255a.io.datai := inout.io.output3

  c8255a.io.CS_ := !(((core.io.bus.addr & 0xF8.U) === 0x0F8.U) && !core.io.bus.IORQ_)
  c8255a.io.A0 := core.io.bus.addr(0)
  c8255a.io.A1 := core.io.bus.addr(1)
  c8255a.io.RD_ := core.io.bus.RD_
  c8255a.io.WR_ := core.io.bus.WR_
/*
  c8255a.io.PortAInput := io.PortAInput 
  c8255a.io.PortBInput := io.PortBInput 
  c8255a.io.PortCUInput := io.PortCUInput 
  c8255a.io.PortCLInput := io.PortCLInput 
*/
  io.PortAOutput := c8255a.io.PortAOutput
  io.PortBOutput := c8255a.io.PortBOutput
  io.PortCUOutput := c8255a.io.PortCUOutput
  io.PortCLOutput := c8255a.io.PortCLOutput
/*
  c8255a.io.PortAInput := 0xFD.U
  c8255a.io.PortBInput := 0x33.U
  c8255a.io.PortCUInput := 0x5.U
  c8255a.io.PortCLInput := 0xA.U
*/

  c8255a.io.PortAInput := io.PortAInput 
  c8255a.io.PortBInput := io.PortBInput 
  c8255a.io.PortCUInput := io.PortCUInput
  c8255a.io.PortCLInput := io.PortCLInput


  dontTouch(io)
  dontTouch(c8255a.io.PortAInput)
  dontTouch(c8255a.io.PortBInput)
  dontTouch(c8255a.io.PortCUInput)
  dontTouch(c8255a.io.PortCLInput)
  dontTouch(c8255a.io.PortAOutput)
  dontTouch(c8255a.io.PortBOutput)
  dontTouch(c8255a.io.PortCUOutput)
  dontTouch(c8255a.io.PortCLOutput)

/*
  io.PortAInput := c8255a.io.PortAInput
  io.PortBInput := c8255a.io.PortBInput
  io.PortCUInput := c8255a.io.PortCUInput
  io.PortCLInput := c8255a.io.PortCLInput
*/
//  core.io.clock2 := clock //io.clock2
//  core.io.clock2 = Wire(Clock().asBool())

  io.address_ := core.io.bus.addr
  io.data_ := core.io.bus.data
//  core.io.dd <> decoder.io.dd
//  io.exit := core.io.exit
//  io.Halt_ := core.io.ha

//  io.registers := core.io.registers

//  io.M1_ := core.io.M1_

  dontTouch(core.io.bus.M1_)
}

class TopAA(filename:String) extends Module {
  val io = IO(new Bundle {
//    val exit = Output(Bool())
//    val registers = new Registers 
//    val M1_ = Output(Bool())
//    val Halt_ = Output(Bool())
    val data_ = Output(UInt(8.W))
    val address_ = Output(UInt(8.W))
//    val clock2 = Input(Clock())
  })
  
  val core   = Module(new Core())
  val memory = Module(new Memory(filename))
//  val decoder = Module(new Decoder())
  core.io.bus <> memory.io.imem
//  core.io.clock2 := clock //io.clock2
//  core.io.clock2 = Wire(Clock().asBool())

  io.address_ := core.io.bus.addr
  io.data_ := core.io.bus.data
//  core.io.dd <> decoder.io.dd
//  io.exit := core.io.exit
//  io.Halt_ := core.io.ha

//  io.registers := core.io.registers

//  io.M1_ := core.io.M1_
}