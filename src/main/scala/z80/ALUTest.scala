import z80._

import chisel3._
import chisel3.iotesters._
import chisel3.util.experimental.BoringUtils

import org.scalatest._

import scala.util.matching.Regex

/*
import java.awt.event.{ KeyEvent, InputEvent }
import javax.swing.KeyStroke
*/

import scalafx.scene.input.KeyCode
import scalafx.Includes._
import scalafx.application.Platform
import scalafx.application.JFXApp.PrimaryStage
import scalafx.application.JFXApp
import scalafx.scene.Scene
import scalafx.scene.control.Button
import scalafx.scene.control.TextField
import scalafx.scene.layout.VBox

import scalafx.scene._;
import scalafx.scene.paint._;
import javafx.scene.shape._;
import treadle.executable.Big

import java.math.MathContext
import org.scalacheck.Prop
import java.util.ArrayList
import scala.collection.mutable.ListBuffer
import scala.util.control.Breaks

//import chiseltest._
//import chiseltest.experimental.TestOptionBuilder._
//import chiseltest.internal.VerilatorBackendAnnotation

//package example.lambda


object ALUTestGUI extends JFXApp  {

//  def nativeLibPath = System.getProperty("path.separator") + ("~/.openjfx/cache/ / "native" )

  val tf = new TextField()
  stage = new PrimaryStage {
    title = "ALUTestGUI"
    scene = new Scene() {
      root = new VBox {
        children = List(
          new Button("StartTest") {
            onMouseClicked = handle {
              val ho = new ALUTestThread(3)
              ho.startTask
            }},
          new Button("Quit") {
            onMouseClicked = handle {
              close()
            }},
          tf)
      }
    }
  }

  class ALUTestThread(i:Integer) {
    val aa = i    
      val backgroundThread = new Thread {
        setDaemon(true)
        override def run = {
          runTask
        }
      }

    def startTask = {
      backgroundThread.start()
    }

    def runTask= {
      iotesters.Driver.execute(Array(""), () => new ALU()) {
        c => new ALUTestForGUI(c)
      }
    }
  }

  class ALUTestForGUI(c: ALU) extends PeekPokeTester(c) {
    private val alu = c
    for( i<- 0x00 to 0xFF by 1) {
      poke(c.io.input_A, i)
      poke(c.io.input_B, 100)
      poke(c.io.calc_type, ALU.add_op)
  //    println(s"${peek(c.io.output_C)}")
  
  //    println(s"${"00000"+peek(c.io.flag).toInt.toBinaryString.takeRight(8)}")
  //    tf.setText(s"${"00000"+peek(c.io.flag).toInt.toBinaryString.takeRight(8)}")
  
      step(1)
//      Thread.sleep(50)
      val ppp = s"${peek(c.io.output_C)}" 
      Platform.runLater( () -> { 
        tf.setText(ppp)
      })
      expect(c.io.output_C, if((i+100)>255) (i+100-256) else (i+100))
    }
  }
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

    if(calc_type == ALU.add_op|| calc_type == ALU.adc_op) {
      N = 0
      H = if (intermediatel > 0x0f) 1 else 0
      PV = if (((((input_a&0x80)^(input_b&0x80)) == 0) && ((input_a&0x80)!=(intermediate&0x80)))) 1 else 0
      C = if (intermediate>255) 1 else 0
    } else if (calc_type == ALU.sub_op|| calc_type == ALU.sbc_op) {
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
    poke(c.io.calc_type, ALU.add_op)
    intermediate = i + input_b
    intermediatel = (i&0x0f) + (input_b&0x0f)
    F = calc_expect(ALU.add_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate>255) intermediate-256 else intermediate)

    /* adc */
    println(s"===adc===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, ALU.adc_op)
    intermediate = i + input_b + 1
    intermediatel = (i&0x0f) + (input_b&0x0f) + 1
    F = calc_expect(ALU.adc_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate>255) intermediate-256 else intermediate)

    /* sub */
    println(s"===sub===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, ALU.sub_op)
    intermediate = i - input_b
    intermediatel = (i&0x0f) - (input_b&0x0f)
    F = calc_expect(ALU.sub_op, i, input_b, intermediate, intermediatel)
    step(1)
    println(s"${peek(c.io.output_C)}")
    expect(c.io.flag, F|0x28)
    expect(c.io.output_C, if(intermediate<0) intermediate+256 else intermediate)

    /* sbc */
    println(s"===sbc===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, ALU.sbc_op)
    intermediate = i - input_b - 1
    intermediatel = (i&0x0f) - (input_b&0x0f) - 1
    F = calc_expect(ALU.sbc_op, i, input_b, intermediate, intermediatel)
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
    poke(c.io.calc_type, ALU.and_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.output_C, i & input_b)

    /* xor */
    println(s"===xor===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, ALU.xor_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.output_C, i ^ input_b)

    /* or */
    println(s"===or===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, ALU.or_op)
    step(1)
    println(s"${peek(c.io.output_C)}")
    printlnFlag((c.io.flag))
    expect(c.io.output_C, i | input_b)

    /* cp */
    println(s"===cp===")
    poke(c.io.input_A, i)
    poke(c.io.input_B, input_b)
    poke(c.io.input_carry, 1)
    poke(c.io.calc_type, ALU.cp_op)
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