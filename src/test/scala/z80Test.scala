package z80

import chisel3._
//import chisel3.iotesters._
import org.scalatest._
import chiseltest._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation

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