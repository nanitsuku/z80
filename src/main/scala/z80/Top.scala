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

    val keys = Input(Vec(3,UInt(8.W)))

    val key_output = Output(UInt(8.W))

    val INT_ = Input(Bool())
  })
  
  val core   = Module(new Core())
  val memory = Module(new TK80Memory(filename))
  val key_encoder = Module(new KeyEncoder())

  val c8255a = Module(new C8255A())
  val bus_connect = Module(new BusConnect(4))

  val c8228 = Module(new C8228)

  memory.io.imem.MREQ_ := core.io.bus.MREQ_
  memory.io.imem.RD_ := core.io.bus.RD_
  memory.io.imem.WR_ := core.io.bus.WR_
  memory.io.imem.addr := core.io.bus.addr

  memory.io.imem.HALT_ := 0.U
  memory.io.imem.M1_ := 0.U
  memory.io.imem.RFSH_ := 0.U
  memory.io.imem.IORQ_ := 0.U

  // core
  bus_connect.io.instruments(0).dir := !core.io.bus.WR_
  bus_connect.io.instruments(0).input := core.io.bus.data1
  core.io.bus.data := bus_connect.io.instruments(0).output

  // memory
  bus_connect.io.instruments(1).dir := (!core.io.bus.RD_ && !core.io.bus.MREQ_)
  bus_connect.io.instruments(1).input := memory.io.imem.data
  memory.io.imem.data1 := bus_connect.io.instruments(1).output

  // c8255
  bus_connect.io.instruments(2).dir := !core.io.bus.IORQ_ && !core.io.bus.RD_ && !(!core.io.INT_ && !core.io.bus.M1_)
  bus_connect.io.instruments(2).input := c8255a.io.datao
  c8255a.io.datai:= bus_connect.io.instruments(2).output

  c8255a.io.CS_ := !(((core.io.bus.addr & 0xF8.U) === 0x0F8.U) && !core.io.bus.IORQ_)
//  c8255a.io.CS_ := !((((core.io.bus.addr & 0xF8.U) === 0x0F8.U) && !core.io.bus.IORQ_) && !core.io.INT_)
  c8255a.io.A0 := core.io.bus.addr(0)
  c8255a.io.A1 := core.io.bus.addr(1)
  c8255a.io.RD_ := core.io.bus.RD_
  c8255a.io.WR_ := core.io.bus.WR_

  // c8228
  c8228.io.IORQ_ := core.io.bus.IORQ_
  c8228.io.INT_ := core.io.INT_
  c8228.io.datai := bus_connect.io.instruments(3).output
  bus_connect.io.instruments(3).input := c8228.io.datao
  bus_connect.io.instruments(3).dir := !core.io.INT_ && !core.io.bus.M1_

  key_encoder.io.selector := c8255a.io.PortCUOutput
  key_encoder.io.keys := io.keys

  io.PortAOutput := c8255a.io.PortAOutput
  io.PortBOutput := c8255a.io.PortBOutput
  io.PortCUOutput := c8255a.io.PortCUOutput
  io.PortCLOutput := c8255a.io.PortCLOutput

  c8255a.io.PortAInput := key_encoder.io.output
  c8255a.io.PortBInput := io.PortBInput 
  c8255a.io.PortCUInput := io.PortCUInput
  c8255a.io.PortCLInput := io.PortCLInput

  io.key_output := key_encoder.io.output

  io.address_ := core.io.bus.addr
  io.data_ := core.io.bus.data

  val clock2 = RegInit(0.U(1.W))
  clock2 := clock2 + 1.U(2.W)

  core.io.clock2 := clock2(0).asClock()

  core.io.INT_ := io.INT_
  dontTouch(io)
  dontTouch(c8255a.io.PortAInput)
  dontTouch(c8255a.io.PortBInput)
  dontTouch(c8255a.io.PortCUInput)
  dontTouch(c8255a.io.PortCLInput)
  dontTouch(c8255a.io.PortAOutput)
  dontTouch(c8255a.io.PortBOutput)
  dontTouch(c8255a.io.PortCUOutput)
  dontTouch(c8255a.io.PortCLOutput)
  dontTouch(key_encoder.io.keys)
  dontTouch(key_encoder.io.output)
  dontTouch(key_encoder.io.selector)

  dontTouch(core.io.bus.M1_)

  dontTouch(clock2)
  dontTouch(core.io.clock2)
  dontTouch(core.io.bus.RFSH_)
  dontTouch(core.io.INT_)
}