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
  val HALT_ = Input(Bool())

}

class DecoderIo extends Bundle {
  val byte = Input(UInt(8.W))
  val m1 = Output(Bool())
}

class Memory(filename:String) extends Module {
  val io = IO(new Bundle {
    val imem = new ImemPortIo()
//    val DIG = Output(Vec(8, UInt(8.W)))
  })

  def fallingedge(x: Bool) = !x && RegNext(x)
  def risingedge(x: Bool) = x && !RegNext(x)

  val mem = Mem(65536, UInt(8.W))
//  io.HOGE := mem.read(0x83EB.U)
  val DIG = Wire(Vec(8, UInt(8.W)))
  for (i<-0 to 7) {
    DIG(i) := mem.read(0x83F8.U+i.asUInt())
  }

  val KFLAG = Wire(UInt(8.W))
  KFLAG := mem.read(0x83F3.U)

  val ADRES = Wire(UInt(16.W))
  ADRES := mem.read(0x83EE.U)

  val DATA = Wire(UInt(16.W))
  DATA := mem.read(0x83EC.U)

  val DISP = Wire(Vec(4,UInt(8.W)))
  for (i<-0 to 3) {
    DISP(i) := mem.read((0x83F4.U+i.asUInt()))
  }

  loadMemoryFromFile(mem, filename)
  loadMemoryFromFileInline(mem, filename)

  io.imem.data := 0.U

  when(io.imem.MREQ_ === 0.B) {
    when(io.imem.RD_ === 0.U) {
      io.imem.data := mem(io.imem.addr)
//      printf(f"MEMREAD:${io.imem.addr}, ${io.imem.data}")
    }
    when(io.imem.WR_ === 0.B) {
      mem.write(io.imem.addr, io.imem.data1)
//      printf(f"MEMWRITE:${io.imem.addr}, ${io.imem.data1}")
    }
  }

  dontTouch(DIG)
  dontTouch(KFLAG)
  dontTouch(ADRES)
  dontTouch(DATA)
  dontTouch(DISP)
//  printf("%d\n", peek)
}