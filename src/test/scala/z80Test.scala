package z80

import chisel3._
//import chisel3.iotesters._
import org.scalatest._
import chiseltest._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation
import chisel3.iotesters._
import org.scalatest._
import chisel3.util.experimental.BoringUtils
import firrtl_interpreter.InterpretiveTester

class HexTest extends FlatSpec with ChiselScalatestTester {
//class HexTest extends ChiselFlatSpec {
  "mycpu" should "work through hex" in {
    test(new Top).withAnnotations(Seq(VerilatorBackendAnnotation)) { c =>
      while (!c.io.exit.peek().litToBoolean){
        c.clock.step(1)
//        println(s"${c.core.A.peek()}")
//        println(s"${c.core.regfiles_front(0)}")
      }
    }
  }
}

class TopTestPeekPokeTester(c: Top) extends PeekPokeTester(c) {
//    while (peek(c.io.exit)==0) {
      for( i <-1 to 5 ) {
//        System.out.printf("%d\n", peekAt(c.core.regfiles_front, 7))
//        System.out.println(peekAt(c.core.regfiles_front, 7))
//          println(s"AAAA:${peekAt(c.core.regfiles_front, c.core.A_op.litValue().toInt)}")
//          println(s"AAAA:${c.core.io.bus.IORQ_.toString()}")
//          System.out.printf("%d\n", c.core.io.bus.IORQ_.peek())
            poke(c.io.exit, 1)
//            println(s"${peek(c.clock)}")
//            println(s"${peek(c.core.io.exit)}")
            println(s"${peek(c.io.exit)}")
//          println(s"${peek(c.core.A).toInt}")
//        System.out.println(peek(c.core.A))
//        println(s"${peek(c.core.regfiles_front(7))}\n")
        step(1)

      }
//    }
}

class hhh extends FlatSpec with Matchers {
  behavior of "hhh"

  it should "hhh" in {
    chisel3.iotesters.Driver(() => new Top) {
      c =>
        new TopTestPeekPokeTester(c)
    } should be (true)
  }

}
/*
class hogehogehoge extends FlatSpec with Matchers {
  behavior of "hhh"

  it should "hhh" in {
    val s = Driver.emit(() => new Top)
    chisel3.iotesters.Driver(() => new Top) {
      c =>
        new TopTestPeekPokeTester(c)
    } should be (true)
  }

}
*/