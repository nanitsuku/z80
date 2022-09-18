package z80 

import chisel3._
import chisel3.util._

class KeyEncoder extends Module {
  val io = IO(new Bundle {
    val selector = Input(UInt(4.W))
    val key_1 = Input(UInt(8.W))
    val key_2 = Input(UInt(8.W))
    val key_3 = Input(UInt(8.W))
    val output = Output(UInt((8.W)))
  })

  io.output := MuxCase(0xFF.U,
    Seq(
      (io.selector === 0xE.U) -> io.key_1,
      (io.selector === 0xD.U) -> io.key_2,
      (io.selector === 0xB.U) -> io.key_3
    )
  )
  /*
  io.output := 0xFE.U
  */
}

