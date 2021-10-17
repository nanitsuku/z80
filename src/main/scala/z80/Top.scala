package z80 

import chisel3._
import chisel3.util._

class Top(filename:String) extends Module {
  val io = IO(new Bundle {
//    val exit = Output(Bool())
//    val registers = new Registers 
//    val M1_ = Output(Bool())
//    val Halt_ = Output(Bool())
  })
  
  val core   = Module(new Core())
  val memory = Module(new Memory(filename))
//  val decoder = Module(new Decoder())
  core.io.bus <> memory.io.imem
//  core.io.dd <> decoder.io.dd
//  io.exit := core.io.exit
//  io.Halt_ := core.io.ha

//  io.registers := core.io.registers

//  io.M1_ := core.io.M1_
}