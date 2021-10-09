package z80 

import chisel3._
import chisel3.util._

class Top(filename:String) extends Module {
  val io = IO(new Bundle {
    val exit = Output(Bool())
//    val registers = new Registers 
    val M1 = Output(Bool())
  })
  
  val core   = Module(new Core())
  val memory = Module(new Memory(filename))
//  val decoder = Module(new Decoder())
  core.io.bus <> memory.io.imem
//  core.io.dd <> decoder.io.dd
  io.exit := core.io.exit

//  io.registers := core.io.registers

  io.M1 := core.io.M1
}