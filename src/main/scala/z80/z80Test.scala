import chisel3._
//import org.scalatest._
//import chiseltest._
import z80._
import chisel3.iotesters._
import org.scalatest._
import chisel3.util.experimental.BoringUtils

import scala.util.matching.Regex

//import chiseltest._
//import chiseltest.experimental.TestOptionBuilder._
//import chiseltest.internal.VerilatorBackendAnnotation

//package example.lambda

import scalafx.Includes._
import scalafx.application.JFXApp
import scalafx.application.Platform
import scalafx.application.JFXApp.PrimaryStage
import scalafx.scene.Scene
import scalafx.scene.control.Button
import scalafx.scene.control.TextField
import scalafx.scene.layout.VBox
import treadle.executable.Big
import java.math.MathContext
import org.scalacheck.Prop
import java.util.ArrayList
import scala.collection.mutable.ListBuffer
import scala.util.control.Breaks

object ScalaFxHello extends JFXApp  {
  val tf = new TextField()
  val ho = new hoge()
  stage = new PrimaryStage {
    title = "Hello"
    scene = new Scene {
      root = new VBox {
        children = List(new Button("Hello Button") {
          onMouseClicked = handle {
            println("hello")
            ho.runTask
          }
        },  tf)
//        children = new TextField()
      }
    }
  }

  class hoge() {
  def startTask = {
      val backgroundThread = new Thread {
          setDaemon(true)
          override def run = {
              runTask
          }
      }
      backgroundThread.start()
  }

  def runTask= {
    iotesters.Driver.execute(Array(""), () => new ALU()) {
        /*
        c => new PeekPokeTester(c) {
            poke(c.io.input_A,99)
            step(0)
            println(s"hoge")
        }
        */
        c => new hagehoge(c)
    }
  }
}


class hagehoge(c: ALU) extends PeekPokeTester(c) {
    private val alu = c
    for( i<- 0x00 to 0xFF by 1) {
//        printf(p"pc_reg : 0x${Hexadecimal(c.io.output_C)}\n")
            println(s"hoge")
            poke(c.io.input_A, i)
            poke(c.io.input_B, 100)
            step(1)
            println(s"${peek(c.io.output_C)}")
            println(s"${"00000"+peek(c.io.flag).toInt.toBinaryString.takeRight(8)}")
            tf.setText(s"${"00000"+peek(c.io.flag).toInt.toBinaryString.takeRight(8)}")
//            if(peek(c.io.flag)!=null) { println("hoge")}
//            tf.setText("test")
            expect(c.io.output_C, if((i+100)>255) (i+100-256) else (i+100))
    }
}

}
/*
class TopTestPeekPokeTester(c: Top) extends PeekPokeTester(c) {
    while (peek(c.io.halt)==0) {
//        System.out.printf("%d\n", peekAt(c.core.regfiles_front, 7))
//        System.out.println(peekAt(c.core.regfiles_front, 7))

//          println(s"AAAA:${peekAt(c.core.regfiles_front, c.core.A_op.litValue().toInt)}")

//          println(s"${peek(c.core.A).toInt}")
//        System.out.println(peek(c.core.A))
//        println(s"${peek(c.core.regfiles_front(7))}\n")
        step(1)
    }
}
*/
object TopGenerate extends App {
//    chisel3.Driver.execute(args, () => new Top)
    (new chisel3.stage.ChiselStage).emitVerilog(
        new Top("src/hex/fetch.hex")
    )
}

class ALUTester(c: ALU) extends PeekPokeTester(c) {

  def printlnFlag(flag:UInt) {
    println(s"${("00000"+peek(flag).toInt.toBinaryString).takeRight(8)}")
  }

  private val alu = c
  val input_b = 100;
  var intermediate = 0;
  var intermediatel = 0;

  def calc_expect(calc_type:UInt, input_a:Integer, input_b:Integer, intermediate:Integer, intermediatel:Integer):Int = {
    var S = 0
    var Z = 0
    var H = 0
    var PV = 0
    var N = 0
    var C = 0

    S = ((intermediate&0x80) >> 7)
    Z = if ((intermediate & 255) == 0) 1 else 0
    H = if (intermediatel > 0x0f) 1 else 0

    if(calc_type == alu.add_op|| calc_type == alu.adc_op) {
      N = 0
      H = if (intermediatel > 0x0f) 1 else 0
      PV = if (((((input_a&0x80)^(input_b&0x80)) == 0) && ((input_a&0x80)!=(intermediate&0x80)))) 1 else 0
      C = if (intermediate>255) 1 else 0
    } else if (calc_type == alu.sub_op|| calc_type == alu.sbc_op) {
      N = 1
      H = if (intermediatel < 0x00) 1 else 0
      PV = if ((((input_a&0x80)^(input_b&0x80)) != 0)  && ((input_a&0x80)!=(intermediate&0x80))) 1 else 0
      C = if (intermediate<0) 1 else 0
    }
    (S<<7) + (Z<<6) + (H<<4) + (PV<<2) + (N<<1) + (C<<0)
  }

  var F = 0

  for( i<- 0x00 to 0xFF by 1) {
    /* add */
    println(s"===add===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.add_op)
    intermediate = i + input_b
    intermediatel = (i&0x0f) + (input_b&0x0f)
    F = calc_expect(alu.add_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate>255) intermediate-256 else intermediate)

    /* adc */
    println(s"===adc===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.adc_op)
    intermediate = i + input_b + 1
    intermediatel = (i&0x0f) + (input_b&0x0f) + 1
    F = calc_expect(alu.adc_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate>255) intermediate-256 else intermediate)

    /* sub */
    println(s"===sub===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.sub_op)
    intermediate = i - input_b
    intermediatel = (i&0x0f) - (input_b&0x0f)
    F = calc_expect(alu.sub_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate<0) intermediate+256 else intermediate)

    /* sbc */
    println(s"===sbc===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.sbc_op)
    intermediate = i - input_b - 1
    intermediatel = (i&0x0f) - (input_b&0x0f) - 1
    F = calc_expect(alu.sbc_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate<0) intermediate+256 else intermediate)

    /* and */
    println(s"===and===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.and_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.output_C, i & input_b)

    /* xor */
    println(s"===xor===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.xor_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.output_C, i ^ input_b)

    /* or */
    println(s"===or===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.or_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.output_C, i | input_b)

    /* cp */
    println(s"===cp===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, alu.cp_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.output_C, i)
    printlnFlag((c.io.flag))
  }
}

object ALUTest extends App {
    iotesters.Driver.execute(args, () => new ALU()) {
        /*
        c => new PeekPokeTester(c) {
            poke(c.io.input_A,99)
            step(0)
            println(s"hoge")
        }
        */
        c => new ALUTester(c)
    }

}

object TopTestObsolete extends App {
//    iotesters.Driver.execute(args, () => new Top()) {
//    val backend = "firrtl"
//    val backend = "treadle"
//    val backend = "ivl"
//    val backend = "vcs"
//    val backend = "vsim"
    val backend = "verilator"
    iotesters.Driver.execute(Array("--backend-name", backend), () => new Top("src/hex/fetch.hex")) {
//    iotesters.Driver.execute(Array("--tr-write-vcd"), () => new Top()) {
//        /*
        c => new PeekPokeTester(c) {
//          chisel3.util.experimental.loadMemoryFromFile(c.memory.mem, "src/hex/fetch.hex")
//          for(i <- 1 to 10) {
//        var regs = c.io.registers
        var m1 = 0
        while(peek(c.core.io.bus.HALT_) == 1) { 
//          peekAt(c.core.regfiles_front, 7)
//            poke(,99)
//            c.io.exit.peek
//            peek("c_core_A")
//peek(c.core.A)
//peek(c.core.io.bus.addr)
          if (m1==0 && peek(c.core.io.bus.M1_)==1) {
//          println(s"aaaa:${peek(c.io.registers.PC)}")
          }
          m1 = peek(c.core.io.bus.M1_).toInt
//          regs = c.io.registers
//println(s"m1:${peek(c.io.M1)}")
//peek("Top.core_io_bus_data")
//peek("Top_io_exit")
//peek("Top.io_exit")
//            println(s"${peek(c.io.
//              peek(c.core.io.exit)
//              System.out.println(peekAt(c.core.regfiles_front, 7))
//            peekAt(c.core.regfiles_front, 7)
//println(c.io.exit.pathName)
//            println(s"${peek(c.memory.mem.read(0.U))}")
            step(1)
//            println(s"hoge")
          }
        }
//        */
//        c => new TopTestPeekPokeTester(c)
    }

}

/*
class hhh extends FlatSpec with Matchers {
  behavior of "hhh"

  it should "hhh" in {
    chisel3.iotesters.Driver(() => new Top) {
      c =>
        new TopTestPeekPokeTester(c)
    } should be (true)
  }

}
*/

class TopSupervisor(filename:String) extends Module {
  var io = IO(new Bundle {
//  val A = Output(UInt(8.W))
  val regs_front = Output(Vec(8,UInt(8.W)))
  val regs_back = Output(Vec(8,UInt(8.W)))
  val halt_ = Output(Bool())
  val machine_state = Output(UInt(8.W))
  val t_cycle = Output(UInt(8.W))
  val PC = Output(UInt(16.W))
  val SP = Output(UInt(16.W))
  val IX = Output(UInt(16.W))
  val IY = Output(UInt(16.W))
  val R = Output(UInt(8.W))
  val I = Output(UInt(8.W))
  val IFF1 = Output(UInt(8.W))
  val IFF2 = Output(UInt(8.W))
 })


 val top = Module(new Top(filename))

// val A = WireDefault(0.U(8.W))
// val reg = Wire(Vec(8,UInt(8.W)))

 for ( i <- 0 to 7 ) {
  io.regs_front(i) :=  WireDefault(0.U(8.W))
  io.regs_back(i) :=  WireDefault(0.U(8.W))
//  reg(i) := io.reg(i)
//  io.reg(i) := reg(i)
  BoringUtils.bore(top.core.regfiles_front(i), Seq(io.regs_front(i)))
  BoringUtils.bore(top.core.regfiles_back(i), Seq(io.regs_back(i)))
//  io.reg(i) := reg(i)
 }

 io.halt_ := WireDefault(0.B)
 io.machine_state := WireDefault(0.U(8.W))
 io.t_cycle := WireDefault(0.U(8.W))
 
 io.PC := WireDefault(0.U(16.W))
 io.SP := WireDefault(0.U(16.W))
 io.IX := WireDefault(0.U(16.W))
 io.IY := WireDefault(0.U(16.W))
 
 io.R := WireDefault(0.U(8.W))
 io.I := WireDefault(0.U(8.W))

 io.IFF1 := WireDefault(0.U(8.W))
 io.IFF2 := WireDefault(0.U(8.W))

// BoringUtils.bore(top.core.A, Seq(io.A))
 BoringUtils.bore(top.core.io.bus.HALT_ , Seq(io.halt_))
 BoringUtils.bore(top.core.machine_state, Seq(io.machine_state))
 BoringUtils.bore(top.core.m1_t_cycle, Seq(io.t_cycle))
 
 BoringUtils.bore(top.core.PC, Seq(io.PC))
 BoringUtils.bore(top.core.SP, Seq(io.SP))
 BoringUtils.bore(top.core.IX, Seq(io.IX))
 BoringUtils.bore(top.core.IY, Seq(io.IY))
 
 BoringUtils.bore(top.core.R, Seq(io.R))
 BoringUtils.bore(top.core.I, Seq(io.I))
 
 BoringUtils.bore(top.core.IFF1, Seq(io.IFF1))
 BoringUtils.bore(top.core.IFF2, Seq(io.IFF2))
// Boring

// io.A := A
// io.exit := exit
// io.machine_state := machine_state
// io.t_cycle := t_cycle

}

object TopTest extends App {
//    iotesters.Driver.execute(args, () => new Top()) {
//    val backend = "firrtl"
//    val backend = "treadle"
//    val backend = "ivl"
//    val backend = "vcs"
//    val backend = "vsim"

    val backend = "verilator"
    var prev_state = -1
    var prev_t_cycle = -1
//    val filename =  "src/hex/fetch.hex"
//    val filename =  "src/hex/ld.hex"
//    val filename =  "src/hex/ex.hex"
    val filename_default =  "src/hex/test"
    val filename = if (args.length>0) args(0) else filename_default
    val unit_test = new UnitTest(filename + ".lst")
    val driverTestDir = "hogehoge"
    var first = true
    var prev_address = 0
    var prev_pc = 0.U
    var pc = 0.U
    var cc = 0
    iotesters.Driver.execute(Array("--backend-name", backend, "--target-dir", driverTestDir),
       () => new TopSupervisor(filename + ".hex")) {
        c => new PeekPokeTester(c) {
      val unit_test = new UnitTest(filename + ".lst")
          System.out.println("   PC  A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L'  SP   IX   IY  R  I IFF  IFF2 IM\n")
              val regs = List(c.top.core.A_op, c.top.core.B_op, c.top.core.C_op, c.top.core.D_op, c.top.core.E_op, c.top.core.F_op, c.top.core.H_op, c.top.core.L_op)
//              pc = peek(c.io.PC).U
              var sp = peek(c.io.SP).U
              var ix = peek(c.io.IX).U
              var iy = peek(c.io.IY).U
              var r = peek(c.io.R).U
              var i = peek(c.io.I).U
              var iff1 = 0.U //peek(c.io.IFF).U
              var iff2 = 0.U //peek(c.io.IFF2).U
              /*
              val itt = if(first) {
                first = false
                unit_test.setInit(regs.map( n => peek(c.io.regs_front(n.toInt)).U), regs.map( n => peek(c.io.regs_back(n.toInt)).U), pc, ix, iy, 0.U, 0.U, r, i)
              }
              */
               val itt = unit_test.initialize(regs.map( n => peek(c.io.regs_front(n.toInt)).U), regs.map( n => peek(c.io.regs_back(n.toInt)).U), pc.toInt, sp.toInt, ix.toInt, iy.toInt, iff1.toInt, iff2.toInt,  r.toInt, i.toInt)
//                unit_test.setInit(regs.map( n => peek(c.io.regs_front(n.toInt)).U), regs.map( n => peek(c.io.regs_back(n.toInt)).U), pc, ix, iy, 0.U, 0.U, r, i)
              var pcc = pc.toInt
          while(peek(c.io.halt_)==1) {
            val machine_state:Int = peek(c.io.machine_state).toInt
            val t_cycle:Int = peek(c.io.t_cycle).toInt

            if (machine_state == 1 &&  t_cycle == 1 && (prev_state != 1 || (prev_state == 1 && prev_t_cycle ==4 )) )   {
//              System.out.println(s"${peek(c.io.reg(c.top.core.A_op.litValue().toInt))}\n")
/*
              System.out.println(s"${c.top.core.A_op}\n")
*/
              pc = peek(c.io.PC).U
              sp = peek(c.io.SP).U
              ix = peek(c.io.IX).U
              iy = peek(c.io.IY).U
              r = peek(c.io.R).U
              i = peek(c.io.I).U
              iff1 = peek(c.io.IFF1).U
              iff2 = peek(c.io.IFF2).U
              System.out.print("D ")
              System.out.print(f"$prev_pc%04X ")
//:              System.out.print(s"${Integer.toString(peek(c.io.PC).toInt, 16)}%X ")
              regs.map { n => val dd = peek(c.io.regs_front(n.toInt)).toInt; System.out.print(f"$dd%02X ") }
              regs.map { n => val dd = peek(c.io.regs_back(n.toInt)).toInt; System.out.print(f"$dd%02X ") }
              System.out.print(f"$sp%04X ")
              System.out.print(f"$ix%04X ")
              System.out.print(f"$iy%04X ")
              System.out.print(f"$r%02X ")
              System.out.print(f"$i%02X ")
              System.out.print(f"$iff1%02X ")
              System.out.print(f"$iff2%02X ")
 
              System.out.println()
              var s:Status = itt.next().asInstanceOf[Status]
              if (s.PC!=0 && s.invalid) {
                s = itt.next().asInstanceOf[Status]
              }

              System.out.print("U ")
              s.print()

              if (! s.check(regs.map { n => peek(c.io.regs_front(n.toInt)).asUInt()}, regs.map { n => peek(c.io.regs_back(n.toInt)).asUInt()}, pc.toInt, sp.toInt, ix.toInt, iy.toInt, iff1.toInt, iff2.toInt, r.toInt, i.toInt)) {
                println("error")
              }
              cc = cc + 1
            }
            step(1)
            prev_state = machine_state
            prev_t_cycle = t_cycle
            prev_pc = pc
          } 
      }
    }
}

object Status {
  val prime_offset = 8
  val A=0;
  val B=1;
  val C=2;
  val D=3;
  val E=4;
  val H=5;
  val L=6;
  val F=7;
  val A_ = A+prime_offset;
  val B_ = B+prime_offset;
  val C_ = C+prime_offset;
  val D_ = D+prime_offset;
  val E_ = E+prime_offset;
  val H_ = H+prime_offset;
  val L_ = L+prime_offset;
  val F_ = F+prime_offset;
  val register_index = Map(
    "RA"->0,"RB"->1,"RC"->2,"RD"->3,"RE"->4,"RF"->5, "RH"->6,"RL"->7
  )
}

case class Status(pc:Integer, regs:Array[UInt], sp:Integer, ix:Integer, iy:Integer, iff1:Integer, iff2:Integer, r:Integer, i:Integer) {
//  var regfiles = Array[UInt]()
//  var PC = 0x0000;
  var regfiles = regs
  var PC = pc
  var SP = sp
  var IX = ix
  var IY = iy
  var IFF1 = iff1
  var IFF2 = iff2
  var R = r
  var I = i
  var invalid = false

  def print() {
    System.out.print(f"$PC%04X ")
    regfiles.map( {n => val dd = n.litValue; System.out.print(f"$dd%02X ")})
    System.out.print(f"$SP%04X ")
    System.out.print(f"$IX%04X ")
    System.out.print(f"$IY%04X ")
    System.out.print(f"$R%02X ")
    System.out.print(f"$I%02X ")
    System.out.print(f"$IFF1%02X ")
    System.out.print(f"$IFF2%02X ")
   println
  }

  def check(regs_f:List[UInt],regs_b:List[UInt], pc:Integer, sp:Integer, ix:Integer, iy:Integer, iff1:Integer, iff2:Integer, r:Integer, i:Integer): Boolean = {
    for ( (s, d) <- regfiles zip Array.concat(regs_f.toArray, regs_b.toArray)) {
      if ( s.litValue != d.litValue ) {
      //  println(s,d)
        return false
        Breaks.break()
      }
//      println(s,d)
    }
    if ( sp != SP ) return false
    true 
  }
}

class UnitTest(filename:String) {
  var prev_status:Status = new Status(0,Array[UInt](), 0, 0, 0, 0, 0, 0, 0)
  var expect_status:Status = new Status(0,Array[UInt](),0, 0, 0, 0, 0, 0, 0)

  val bufferedSource = io.Source.fromFile(filename)

  var PC = 0x0000;

  val expects:ListBuffer[Status] = ListBuffer()

  def initialize2 = {
    for (line <- bufferedSource.getLines() if(line.contains("expect"))) yield {
      val comm = line.split("; ")
      val cols = line.split(" ")
      if (line.startsWith(";")) expect_status.invalid = true
      if(cols(0).matches("[0-9a-fA-F]{4}")) {
        expect_status.PC = Integer.parseInt(cols(0), 16)
        expect_status.invalid = true
        for(e <- comm) {
          if(e.toLowerCase.startsWith("expect")) {
//            print(e)
            expect_status.invalid = false
            for((ee, index) <- e.split("""\s+""").drop(1).zipWithIndex) {
              if(index >= 1 && index <= 16) {
                expect_status.regfiles(index-1) = 
                  if(ee.startsWith("R")) {
                    prev_status.regfiles(Status.register_index(ee))
                  } else if(ee=="NC") {
                    prev_status.regfiles(index-1)
                  } else {
                    Integer.parseInt(ee, 16).asUInt()
                  }
              } else {
                if (index == 17) {
                  expect_status.SP =
                    if (ee == "NC") {
                       prev_status.SP
                    } else {
                      Integer.parseInt(ee, 16)
                    }
                }
                if (index == 22) {
                  expect_status.IFF1=
                    if (ee == "NC") {
                       prev_status.IFF1
                    } else {
                      Integer.parseInt(ee, 8)
                    }
                }
                if (index == 23) {
                  expect_status.IFF2=
                    if (ee == "NC") {
                       prev_status.IFF2
                    } else {
                      Integer.parseInt(ee, 8)
                    }
                }
                 /*
                index match {
                  case 17 =>  expect_status.SP = Integer.parseInt(ee, 16)
                  case 18 =>
                  case 19 =>
                  case 20 =>
                  case 21 =>
                  case 22 =>
                  case 23 =>
                  case 24 =>
                  case 25 =>
                  case 26 =>
                  case 27 =>
                  case 28=>
                  case _ => ""
                } 
                    */
              }
            }
//            println

/* 
            prev_status = expect_status
            expect_status
          } else {
            false
            */
          }
//          expect_status.print()
//          println(expects.length.toString())
//          expect_status.print()
        }
//        expect_status.print()
//        expects :+ expect_status
//        expects += expect_status.copy()
//        prev_status = expect_status
/*
        expect_status 
      } else {
        false
        */
      }
      expect_status 
    }
  }

  def initialize(regs_f:List[UInt],regs_b:List[UInt], pc:Integer, sp:Integer, ix:Integer, iy:Integer, iff1:Integer, iff2:Integer, r:Integer, i:Integer): Iterator[Any] = {
    prev_status.regfiles =  Array.concat(regs_f.toArray, regs_b.toArray)
    prev_status.SP = sp 
    prev_status.IX = ix
    prev_status.IY = iy
    prev_status.IFF1 = iff1
    prev_status.IFF2 = iff2
    prev_status.R = r
    prev_status.I = i

    expect_status = prev_status
    initialize2
  }

  def check(regs_f:List[UInt],regs_b:List[UInt], pc:Integer, sp:Integer, ix:Integer, iy:Integer, iff:Integer, iff2:Integer, r:Integer, i:Integer): Boolean = {
    for ( (s, d) <- prev_status.regfiles zip Array.concat(regs_f.toArray, regs_b.toArray)) {
      if ( s != d ) Breaks.break()
      false
    }
    true 
  }
}

object TopTest23 extends App {
  val bufferedSource = io.Source.fromFile("src/hex/test.lst")

  var PC = 0x0000;

  for (line <- bufferedSource.getLines) {
    val comm = line.split("; ")
    val cols = line.split(" ")
    if(cols(0).matches("[0-9a-fA-F]{4}")) {
      PC = Integer.parseInt(cols(0), 16)
      for(e <- comm) {
        if(e.toLowerCase.startsWith("expect")) {
          for((ee, index) <- e.split("""\s+""").drop(1).zipWithIndex) {
            print(PC, index, ee)
          }
          println
//        println(e)
        }
      }
//      if(cols(1).length>0)
//        println(cols.length)
//       println(cols(0))
    }
   /* 
    for(c<-comm) {
      println(c)
    }
    */
    /*
    for ( f<- cols) {
    println(f)
    }
    */
  }
}