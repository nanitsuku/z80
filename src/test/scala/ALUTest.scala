import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import z80._
import java.util.concurrent.atomic.AtomicLongFieldUpdater

class MyModule extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  io.out := io.in + 1.U
}

class MyModuleSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "MyModule"

  it should "increment the input" in {
    test(new MyModule) { c =>
      c.io.in.poke(10.U)
      c.clock.step(1)
      c.io.out.expect(11.U)
    }
  }
}

class hoge() {

  print("hoge")
  val a = new ALUTestThread(1)

  a.startTask
}

class ALUTestThread(i:Integer) extends AnyFlatSpec with ChiselScalatestTester {
  val aa = i

  it should "hogehoge" in {
    val backgroundThread = new Thread {
      setDaemon(true)
      override def run = {
        runTask
      }
    }

    backgroundThread.start()
  }

  def test() = {
    print("hoge")
  }

  def startTask = {
//    backgroundThread.start()
    print("hoge")
  }

  def runTask= {
//    new MyModuleSpec()
    val c = new ALUTester()
    c.execute()
  }
}

class ALUTester extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "ALU"

  it should "add two numbers" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* add */
        println(s"===add===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.add_op)
        intermediate = i + input_b
        intermediatel = (i & 0x0f) + (input_b & 0x0f)
        F = calc_expect(ALU.add_op, i, input_b, intermediate, intermediatel)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        c.io.flag.expect((F | 0x28).U)
        c.io.output_C.expect((if (intermediate > 255) intermediate - 256 else intermediate).U)

        println(s"===adc===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.adc_op)
        intermediate = i + input_b + 1
        intermediatel = (i & 0x0f) + (input_b & 0x0f) + 1
        F = calc_expect(ALU.add_op, i, input_b, intermediate, intermediatel)
        c.clock.step(1)
        println(s"${i} ${input_b} ${c.io.output_C.peek().litValue}")
        c.io.flag.expect((F | 0x28).U)
        c.io.output_C.expect((if (intermediate > 255) intermediate - 256 else intermediate).U)

        /* sub */
        println(s"===sub===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.sub_op)
        val intermediateSub = i - input_b
        val intermediatelSub = (i & 0x0f) - (input_b & 0x0f)
        val FSub = calc_expect(ALU.sub_op, i, input_b, intermediateSub, intermediatelSub)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        c.io.flag.expect((FSub | 0x28).U)
        c.io.output_C.expect((if (intermediateSub < 0) intermediateSub + 256 else intermediateSub).U)

        /* sbc */
        println(s"===sbc===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.sbc_op)
        val intermediateSbc = i - input_b - 1
        val intermediatelSbc = (i & 0x0f) - (input_b & 0x0f) - 1
        val FSbc = calc_expect(ALU.sbc_op, i, input_b, intermediateSbc, intermediatelSbc)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        printlnFlag(c.io.flag.peek())
        c.io.flag.expect((FSbc | 0x28).U)
        c.io.output_C.expect((if (intermediateSbc < 0) intermediateSbc + 256 else intermediateSbc).U)

        /* and */
        println(s"===and===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.and_op)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        printlnFlag(c.io.flag.peek())
        c.io.output_C.expect((i & input_b).U)

        /* xor */
        println(s"===xor===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.xor_op)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        printlnFlag(c.io.flag.peek())
        c.io.output_C.expect((i ^ input_b).U)

        /* or */
        println(s"===or===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.or_op)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        printlnFlag(c.io.flag.peek())
        c.io.output_C.expect((i | input_b).U)

        /* cp */
        println(s"===cp===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.cp_op)
        c.clock.step(1)
        println(s"${c.io.output_C.peek().litValue}")
        c.io.output_C.expect(i.U)
        printlnFlag(c.io.flag.peek())
      }
    }

  }

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

  def printlnFlag(flag: UInt): Unit = {
    val binaryString = flag.litValue.toString(2).reverse.padTo(8, '0').reverse
    println(s"flag: $binaryString")
  }
}