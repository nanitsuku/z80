package z80

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.experimental.Analog
//import common.Consts._
//import util

class ImemPortIo extends Bundle {
  val addr = Input(UInt(16.W))
//  val data = Analog(UInt(8.W))
//  val data = Decoupled(UInt(8.W))
  val data = Output(UInt(8.W))
  val data1 = Input(UInt(8.W))
//  val data = Analog(8.W)
  val RD_ = Input(Bool())
  val WR_ = Input(Bool())
  val MREQ_ = Input(Bool())
  val IORQ_ = Input(Bool())
  val M1_ = Input(Bool())
  val RFSH_ = Input(Bool())
}

class DecoderIo extends Bundle {
  val byte = Input(UInt(8.W))
  val m1 = Output(Bool())
}

class Memory extends Module {
  val io = IO(new Bundle {
    val imem = new ImemPortIo()
  })

  def fallingedge(x: Bool) = !x && RegNext(x)
  def risingedge(x: Bool) = x && !RegNext(x)

  val mem = Mem(65536, UInt(8.W))
  val peek = mem(0x1000.U)
  loadMemoryFromFile(mem, "src/hex/fetch.hex")

  mem.write(0x1234.U, 0x55.U)
//  mem.write(0xFFFF.U, 0xFF.U)
//  mem.write(0xFFFE.U, 0xFE.U)

  io.imem.data := 0.U

  when(io.imem.MREQ_ === 0.B) {
    when(io.imem.RD_ === 0.U) {
      io.imem.data := mem(io.imem.addr)
    }
    when(io.imem.WR_ === 0.B) {
      mem.write(io.imem.addr, io.imem.data1)
    }
  }

//  printf("%d\n", peek)
}