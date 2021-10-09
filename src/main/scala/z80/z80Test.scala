import chisel3._
//import org.scalatest._
//import chiseltest._
import z80._
import chisel3.iotesters._
import org.scalatest._
import chisel3.util.experimental.BoringUtils

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

class TopTestPeekPokeTester(c: Top) extends PeekPokeTester(c) {
    while (peek(c.io.exit)==0) {
//        System.out.printf("%d\n", peekAt(c.core.regfiles_front, 7))
//        System.out.println(peekAt(c.core.regfiles_front, 7))

//          println(s"AAAA:${peekAt(c.core.regfiles_front, c.core.A_op.litValue().toInt)}")

//          println(s"${peek(c.core.A).toInt}")
//        System.out.println(peek(c.core.A))
//        println(s"${peek(c.core.regfiles_front(7))}\n")
        step(1)
    }
}

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

object TopTest extends App {
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
        while(peek(c.io.exit)==0) { 
//          peekAt(c.core.regfiles_front, 7)
//            poke(,99)
//            c.io.exit.peek
//            peek("c_core_A")
//peek(c.core.A)
//peek(c.core.io.bus.addr)
          if (m1==0 && peek(c.io.M1)==1) {
//          println(s"aaaa:${peek(c.io.registers.PC)}")
          }
          m1 = peek(c.io.M1).toInt
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
  val exit = Output(Bool())
  val machine_state = Output(UInt(8.W))
  val t_cycle = Output(UInt(8.W))
  val PC = Output(UInt(16.W))
  val SP = Output(UInt(16.W))
  val IX = Output(UInt(16.W))
  val IY = Output(UInt(16.W))
  val R = Output(UInt(8.W))
  val I = Output(UInt(8.W))
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

 io.exit := WireDefault(0.B)
 io.machine_state := WireDefault(0.U(8.W))
 io.t_cycle := WireDefault(0.U(8.W))
 
 io.PC := WireDefault(0.U(16.W))
 io.SP := WireDefault(0.U(16.W))
 io.IX := WireDefault(0.U(16.W))
 io.IY := WireDefault(0.U(16.W))
 
 io.R := WireDefault(0.U(8.W))
 io.I := WireDefault(0.U(8.W))

// BoringUtils.bore(top.core.A, Seq(io.A))
 BoringUtils.bore(top.io.exit, Seq(io.exit))
 BoringUtils.bore(top.core.machine_state, Seq(io.machine_state))
 BoringUtils.bore(top.core.m1_t_cycle, Seq(io.t_cycle))
 
 BoringUtils.bore(top.core.PC, Seq(io.PC))
 BoringUtils.bore(top.core.SP, Seq(io.SP))
 BoringUtils.bore(top.core.IX, Seq(io.IX))
 BoringUtils.bore(top.core.IY, Seq(io.IY))
 
 BoringUtils.bore(top.core.R, Seq(io.R))
 BoringUtils.bore(top.core.I, Seq(io.I))
// Boring

// io.A := A
// io.exit := exit
// io.machine_state := machine_state
// io.t_cycle := t_cycle

}

object TopTest22 extends App {
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
    val filename =  "src/hex/ex.hex"
    val driverTestDir = "hogehoge"
    iotesters.Driver.execute(Array("--backend-name", backend, "--target-dir", driverTestDir),
       () => new TopSupervisor(if (args.length>0) args(0) else filename)) {
        c => new PeekPokeTester(c) {
          System.out.println(" PC  A  B  C  D  E  F  H  L  A' B' C' D' E' F' H' L'  SP   IX   IY  R  I IFF  IFF2\n")
          while(peek(c.io.exit)==0) {
            val machine_state:Int = peek(c.io.machine_state).toInt
            val t_cycle:Int = peek(c.io.t_cycle).toInt
            if (machine_state == 1 &&  (prev_state != 1 || (prev_state == 1 && prev_t_cycle ==4 && t_cycle == 1)))  {
//              System.out.println(s"${peek(c.io.reg(c.top.core.A_op.litValue().toInt))}\n")
/*
              System.out.println(s"${c.top.core.A_op}\n")
*/
              val regs = List(c.top.core.A_op, c.top.core.B_op, c.top.core.C_op, c.top.core.D_op, c.top.core.E_op, c.top.core.F_op, c.top.core.H_op, c.top.core.L_op)
              val pc = peek(c.io.PC).toInt
              val sp = peek(c.io.SP).toInt
              val ix = peek(c.io.IX).toInt
              val iy = peek(c.io.IY).toInt
              val r = peek(c.io.R)
              val i = peek(c.io.I)

              System.out.print(f"$pc%04X ")
//:              System.out.print(s"${Integer.toString(peek(c.io.PC).toInt, 16)}%X ")
              regs.map { n => val dd = peek(c.io.regs_front(n.toInt)).toInt; System.out.print(f"$dd%02X ") }
              regs.map { n => val dd = peek(c.io.regs_back(n.toInt)).toInt; System.out.print(f"$dd%02X ") }
              System.out.print(f"$sp%04X ")
              System.out.print(f"$ix%04X ")
              System.out.print(f"$iy%04X ")
              System.out.print(f"$r%02X ")
              System.out.print(f"$i%02X ")
              /*
              for ( i <-0 to 7 ) {
                System.out.print(s"${peek(c.io.reg(i))} ")
              }
              */
              System.out.println()
//              System.out.println(s"${c.top.core.A_op.litValue().toInt}\n")
            }
            step(1)
            prev_state = machine_state
            prev_t_cycle = t_cycle
          } 
      }
    }
}