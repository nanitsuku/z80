package z80

import chisel3._
//import chisel3.iotesters._
import org.scalatest._
//import chiseltest._
//import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation
//import chisel3.iotesters._
import org.scalatest._
//import chisel3.util.experimental.BoringUtils
import firrtl_interpreter.InterpretiveTester

class hogehogehoge2 extends FlatSpec with Matchers {
  behavior of "hhh"

  it should "hhh" in {
   val s = Driver.emit(() => new Top)

    val tester = new InterpretiveTester(s)

    for( i <- 1 to 5) {
        println(tester.peek("io_core"))
        tester.step()
        println("hoge")
    }

 
  }
}