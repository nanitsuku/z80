package z80 

import chisel3._
import chisel3.util._

class KeyEncoder extends Module {
  val io = IO(new Bundle {
    val selector = Input(UInt(4.W))
    val keys = Input(Vec(3, UInt(8.W)))
    val output = Output(UInt((8.W)))
  })

  io.output := MuxCase(0xFF.U,
    Seq(
      (io.selector === 0xE.U) -> io.keys(0),
      (io.selector === 0xD.U) -> io.keys(1),
      (io.selector === 0xB.U) -> io.keys(2)
    )
  )
}

