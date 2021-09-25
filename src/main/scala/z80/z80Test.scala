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

object HogeDriver extends App {
//    chisel3.Driver.execute(args, () => new Top)
    (new chisel3.stage.ChiselStage).emitVerilog(
        new Top
    )
}

class hogehoge(c: ALU) extends PeekPokeTester(c) {
    private val alu = c
    for( i<- 0x00 to 0xFF by 1) {
//        printf(p"pc_reg : 0x${Hexadecimal(c.io.output_C)}\n")
            println(s"hoge")
            poke(c.io.input_A, i)
            poke(c.io.input_B, 100)
            step(1)
            println(s"${peek(c.io.output_C)}")
            println(s"${"00000"+peek(c.io.flag).toInt.toBinaryString.takeRight(8)}")
            expect(c.io.output_C, if((i+100)>255) (i+100-256) else (i+100))
    }
}

object AAAA extends App {
    iotesters.Driver.execute(args, () => new ALU()) {
        /*
        c => new PeekPokeTester(c) {
            poke(c.io.input_A,99)
            step(0)
            println(s"hoge")
        }
        */
        c => new hogehoge(c)
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