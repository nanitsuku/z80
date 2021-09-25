package z80 

import chisel3._
import chisel3.util._

class Top extends Module {
  val io = IO(new Bundle {
    val exit = Output(Bool())
  })
  
  val core   = Module(new Core())
  val memory = Module(new Memory())
//  val decoder = Module(new Decoder())
  core.io.bus <> memory.io.imem
//  core.io.dd <> decoder.io.dd
  io.exit := core.io.exit
}