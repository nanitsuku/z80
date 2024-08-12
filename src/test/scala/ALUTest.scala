import chisel3._
import chiseltest._
import chisel3.util._
import org.scalatest.flatspec.AnyFlatSpec
import z80._
import java.util.concurrent.atomic.AtomicLongFieldUpdater
import scalafx.Includes._
import scalafx.application.JFXApp
import scalafx.scene.Scene
import scalafx.scene.layout.VBox
import scalafx.scene.control.Button
import scalafx.scene.control.TextField
import scalafx.application.Platform
import java.util.concurrent.CountDownLatch
import org.scalatest.matchers.should.Matchers

class ALUTestSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "ALU"

  it should "ADD" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* add */
        //        println(s"===add===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.add_op)
        intermediate = i + input_b
        intermediatel = (i & 0x0f) + (input_b & 0x0f)
        F = calc_expect(ALU.add_op, i, input_b, intermediate, intermediatel)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        c.io.flag.expect((F | 0x28).U)
        c.io.output_C.expect((if (intermediate > 255) intermediate - 256 else intermediate).U)
      }
    }
  }

  it should "ADC" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        //        println(s"===adc===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.adc_op)
        intermediate = i + input_b + 1
        intermediatel = (i & 0x0f) + (input_b & 0x0f) + 1
        F = calc_expect(ALU.add_op, i, input_b, intermediate, intermediatel)
        c.clock.step(1)
        //        println(s"${i} ${input_b} ${c.io.output_C.peek().litValue}")
        c.io.flag.expect((F | 0x28).U)
        c.io.output_C.expect((if (intermediate > 255) intermediate - 256 else intermediate).U)
      }
    }
  }

  it should "SUB" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* sub */
        //        println(s"===sub===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.sub_op)
        val intermediateSub = i - input_b
        val intermediatelSub = (i & 0x0f) - (input_b & 0x0f)
        val FSub = calc_expect(ALU.sub_op, i, input_b, intermediateSub, intermediatelSub)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        c.io.flag.expect((FSub | 0x28).U)
        c.io.output_C.expect((if (intermediateSub < 0) intermediateSub + 256 else intermediateSub).U)
      }
    }
  }

  it should "SBC" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* sbc */
        //      println(s"===sbc===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.sbc_op)
        val intermediateSbc = i - input_b - 1
        val intermediatelSbc = (i & 0x0f) - (input_b & 0x0f) - 1
        val FSbc = calc_expect(ALU.sbc_op, i, input_b, intermediateSbc, intermediatelSbc)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        //        printlnFlag(c.io.flag.peek())
        c.io.flag.expect((FSbc | 0x28).U)
        c.io.output_C.expect((if (intermediateSbc < 0) intermediateSbc + 256 else intermediateSbc).U)
      }
    }
  }

  it should "AND" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* and */
        //        println(s"===and===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.and_op)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        //        printlnFlag(c.io.flag.peek())
        c.io.output_C.expect((i & input_b).U)
      }
    }
  }

  it should "XOR" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* xor */
        //        println(s"===xor===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.xor_op)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        //        printlnFlag(c.io.flag.peek())
        c.io.output_C.expect((i ^ input_b).U)
      }
    }
  }

  it should "OR" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* or */
        //        println(s"===or===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.or_op)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        //        printlnFlag(c.io.flag.peek())
        c.io.output_C.expect((i | input_b).U)
      }
    }
  }

  it should "CP" in {
    test(new ALU) { c =>
      var F = 0
      val input_b = 100;
      var intermediate = 0;
      var intermediatel = 0;

      for( i<- 0x00 to 0xFF by 1) {
        /* cp */
        //        println(s"===cp===")
        c.io.input_A.poke(i.U)
        c.io.input_B.poke(input_b.U)
        c.io.input_carry.poke(1.U)
        c.io.calc_type.poke(ALU.cp_op)
        c.clock.step(1)
        //        println(s"${c.io.output_C.peek().litValue}")
        c.io.output_C.expect(i.U)
        //        printlnFlag(c.io.flag.peek())
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

object ALUTestGUI extends JFXApp  {

  //  def nativeLibPath = System.getProperty("path.separator") + ("~/.openjfx/cache/ / "native" )

  val tf = new TextField()
  stage = new JFXApp.PrimaryStage {
    title = "ALUTestGUI"
    scene = new Scene() {
      root = new VBox {
        children = List(
        new Button("StartTest") {
          onMouseClicked = handle {
            val ho = new ALUTestThread(3)
            ho.startTask
          }
        },
        new Button("Quit") {
          onMouseClicked = handle {
            close()
          }
        },
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
      //val c = new ALUTester()
      //val c = new ALUTestForGUI(new ALU)
      val c = new ALUTestForGUI()
      c.execute()
      /*
      iotesters.Driver.execute(Array(""), () => new ALU()) {
      c => new ALUTestForGUI(c)
      }
      */
    }
  }

  //  class ALUTestForGUI(c: ALU) extends AnyFlatSpec with ChiselScalatestTester {
  class ALUTestForGUI extends AnyFlatSpec with ChiselScalatestTester {
    //    private val alu = c

    it should "ADD" in {
      test(new ALU) { c =>
        for( i<- 0x00 to 0xFF by 1) {
          c.io.input_A.poke(i)
          c.io.input_B.poke(100)
          c.io.calc_type.poke(ALU.add_op)
          c.clock.step(1)
          val ppp = s"${c.io.output_C.peek().litValue.toInt}"

          Platform.runLater( () -> {
            tf.setText(ppp)
          })
          c.io.output_C.expect(if((i+100)>255) (i+100-256) else (i+100))
        }
      }
    }
  }
}

class ALUTestGUISpec extends AnyFlatSpec with Matchers {
  "ALUTestGUI" should "run without errors" in {
    ALUTestGUI.main(Array.empty[String])
    succeed
  }
}