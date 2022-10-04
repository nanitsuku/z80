package z80

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFileInline
//import common.Consts._
//import util

class ImemPortIo extends Bundle {
  val addr = Input(UInt(16.W))
  val data = Output(UInt(8.W))
  val data1 = Input(UInt(8.W))
  val RD_ = Input(Bool())
  val WR_ = Input(Bool())
  val MREQ_ = Input(Bool())
  val IORQ_ = Input(Bool())
  val M1_ = Input(Bool())
  val RFSH_ = Input(Bool())
  val HALT_ = Input(Bool())

}

class DecoderIo extends Bundle {
  val byte = Input(UInt(8.W))
  val m1 = Output(Bool())
}

class TK80Memory (filename:String) extends Memory(filename, 65536) {
  val DIG = Wire(Vec(8, UInt(8.W)))
  for (i<-0 to 7) {
    DIG(i) := mem.read(0x83F8.U+i.asUInt())
  }

  val KFLAG = Wire(UInt(8.W))
  KFLAG := mem.read(0x83F3.U)

  val ADRESH = Wire(UInt(8.W))
  ADRESH := mem.read(0x83EF.U)
  val ADRESL = Wire(UInt(8.W))
  ADRESL := mem.read(0x83EE.U)

  val DATAH = Wire(UInt(8.W))
  DATAH := mem.read(0x83ED.U)
  val DATAL = Wire(UInt(8.W))
  DATAL := mem.read(0x83EC.U)

  val ADDRESS_LEDS = Wire(Vec(4,UInt(8.W)))
  for (i<-0 to 3) {
    ADDRESS_LEDS(i) := mem.read(0x83FB.U-i.asUInt)
  }

  val DATA_LEDS = Wire(Vec(4,UInt(8.W)))
  for (i<-0 to 3) {
    DATA_LEDS(i) := mem.read(0x83FF.U-i.asUInt)
  }

  val DISP = Wire(Vec(4,UInt(8.W)))
  for (i<-0 to 3) {
    DISP(i) := mem.read((0x83F4.U+i.asUInt()))
  }

  dontTouch(DIG)
  dontTouch(KFLAG)
  dontTouch(ADRESH)
  dontTouch(ADRESL)
  dontTouch(DATAH)
  dontTouch(DATAL)
  dontTouch(DISP)
}

class Memory(filename:String, capacity:Integer = 65536) extends Module {
  val io = IO(new Bundle {
    val imem = new ImemPortIo()
  })

  val mem = Mem(capacity, UInt(8.W))

  loadMemoryFromFile(mem, filename)
  loadMemoryFromFileInline(mem, filename)

  io.imem.data := 0.U

  when(io.imem.MREQ_ === 0.B) {
    when(io.imem.RD_ === 0.U) {
      io.imem.data := mem(io.imem.addr)
    }
    when(io.imem.WR_ === 0.B) {
      mem.write(io.imem.addr, io.imem.data1)
    }
  }
}