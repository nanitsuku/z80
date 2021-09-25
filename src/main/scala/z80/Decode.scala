package z80

import chisel3._
import chisel3.util._
//import common.Consts._

class Decode extends Module {
  val io = IO(new Bundle {
    val dd = new DecoderIo()
  })

// val regfile = Mem(32, UInt(WORD_LEN.W))


  //**********************************
  // Instruction Fetch (IF) Stage

 // val pc_reg = RegInit(START_ADDR)

  //**********************************
  // Debug
  printf(p"pc_reg : 0x${io.dd}\n")
  printf("---------\n")
}
