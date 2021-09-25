import chisel3._
//import org.scalatest._
//import chiseltest._
import z80._
import chisel3.iotesters._


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
        System.out.println(peekAt(c.core.regfiles_front, 7))
//        println(s"${peek(c.core.regfiles_front(7))}\n")
        step(1)
    }
}

object TopGenerate extends App {
//    chisel3.Driver.execute(args, () => new Top)
    (new chisel3.stage.ChiselStage).emitVerilog(
        new Top
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
    iotesters.Driver.execute(args, () => new Top()) {
        /*
        c => new PeekPokeTester(c) {
            poke(c.io.input_A,99)
            step(0)
            println(s"hoge")
        }
        */
        c => new TopTestPeekPokeTester(c)
    }

}