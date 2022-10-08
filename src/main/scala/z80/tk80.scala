package tk80

import Z80Test._
import z80._
import chisel3._
import chisel3.iotesters._
import chisel3.util._

import scalafx.scene.paint.Color
import scalafx.scene.shape._
import scalafx.scene.shape.Path
import scalafx.scene.Group
import scalafx.scene.layout.StackPane
import scalafx.application.JFXApp
import scalafx.scene.control.Label
import scalafx.scene.control.Button
import scalafx.scene.Scene
import scalafx.scene.input.KeyCode
import scalafx.scene.control.CheckBox
import scalafx.geometry.Pos
import scalafx.geometry.Insets
import scalafx.scene.layout._
import scalafx.Includes._
import scalafx.application.Platform
import javafx.scene.text.TextAlignment

class segment_path extends Path {
  opacity =  1.00000000
//  fill = Color.rgb(0xff, 0xc3, 0x49, 1.00000000)
  fill = Color.rgb(0xff, 0x11, 0x11, 1.00000000)
  stroke = Color.rgb(0xd4, 0xd4, 0xd4, 1.00000000)
  strokeWidth =  0.21100740
  strokeLineCap =  scalafx.scene.shape.StrokeLineCap.Round
  strokeLineJoin =  scalafx.scene.shape.StrokeLineJoin.Round
  strokeMiterLimit = 4.00000000
}

class seven_segment extends StackPane {
  val sss =  new seven_segment1
  children = List (
    new Group(sss)
  )

  class seven_segment1 extends Group {
    scaleX = 0.075
    scaleY = 0.075
    val amber_color = Color.rgb(0xff, 0xc3, 0x49, 1.00000000)
    val red = Color.rgb(0xff, 0x11, 0x11, 1.00000000)

    val A = new segment_path {elements = List(MoveTo(218.61162321, -1010.8041333), LineTo(595.76687550 ,-1010.8041333), LineTo(595.76687550, -954.90872361), LineTo(218.61162321, -954.90872361), LineTo(218.61162321, -1010.8041333))}
    val B = new segment_path {elements = List(MoveTo(571.11290540, -578.56008614), LineTo(595.76684296 ,-954.90868478), LineTo(651.54270452, -951.25490577), LineTo(626.88876696, -574.90630714), LineTo(571.11290540, -578.56008614))}
    val C = new segment_path {elements = List(MoveTo(546.45898247, -146.31590720), LineTo(571.11292003 ,-522.66450584), LineTo(626.88878158, -519.01072683), LineTo(602.23484402, -142.66212820), LineTo(546.45898247, -146.31590720))}
    val D = new segment_path {elements = List(MoveTo(169.30368499, -146.31586030), LineTo(546.45893728 ,-146.31586030), LineTo(546.45893728,  -90.42045413), LineTo(169.30368499,  -90.42045413), LineTo(169.30368499, -146.31586030))}
    val E = new segment_path {elements = List(MoveTo(113.52781140, -149.96961499), LineTo(138.18174896 ,-526.31821362), LineTo(193.95761052, -522.66443462), LineTo(169.30367296, -146.31583598), LineTo(113.52781140, -149.96961499))}
    val F = new segment_path {elements = List(MoveTo(138.18177372, -582.21373356), LineTo(162.83571128 ,-958.56233219), LineTo(218.61157284, -954.90855319), LineTo(193.95763528, -578.55995455), LineTo(138.18177372, -582.21373356))}
    val G = new segment_path {elements = List(MoveTo(193.95763968, -578.55993556), LineTo(571.11289197 ,-578.55993556), LineTo(571.11289197, -522.66452579), LineTo(193.95763968, -522.66452579), LineTo(193.95763968, -578.55993556))}
    val dot = new scalafx.scene.shape.Circle { centerX = 660; centerY = -80; radius = 40; fill = Color.Red }

    children = List(dot, A, B, C, D, E, F, G)

    def set(value:Integer) = {
      def getColor(j:Integer):Color = { if ((value&j)>0) red else Color.Transparent }

      A.fill = getColor(0x01)
      B.fill = getColor(0x02)
      C.fill = getColor(0x04)
      D.fill = getColor(0x08)
      E.fill = getColor(0x10)
      F.fill = getColor(0x20)
      G.fill = getColor(0x40)
      dot.fill = getColor(0x80)
    }
  }
  def set(value:Integer) = { sss.set(value) }
}

object TK80TestGUI extends JFXApp  {
  val backend = "verilator"
  var prev_state = -1
  var prev_t_cycle = -1
  val filename_default =  "src/hex/ld"
  val args = List()
  val filename = if (args.length>0) args(0) else filename_default
  val unit_test = new UnitTest(filename + ".lst")
  val driverTestDir = "test_result/TopSupervisor"
  var first = true
  var prev_address = 0
  var prev_pc = 0.U
  var pc = 0.U
  var r = 0.U
  var r_unit_test = 0
  val arg = Array("--backend-name", backend, "--target-dir", driverTestDir, "--top-name", "TopSupervisor", "--display-base", "16", "--generate-vcd-output", "on", "--tr-mem-to-vcd", "mem1:h83c0-83ff")

  val pc_text = new Label() { textFill = Color.Red; textAlignment = TextAlignment.RIGHT }
  val addr_text = new Label() { textFill = Color.Red }
  val data_text = new Label() { textFill = Color.Red }
  val others_text = new Label() { textFill = Color.Red }
  val address_leds = List(new seven_segment(), new seven_segment(), new seven_segment(), new seven_segment())
  val data_leds = List(new seven_segment(), new seven_segment(), new seven_segment(), new seven_segment())

  var pc_ = 0
  var addr_ = 0
  var adata_ = 0

  var key_data_1 = 0xFF
  var key_data_2 = 0xFF
  var key_data_3 = 0xFF
  var reset_button = 0xFF
  var step_run = false

  class ButtokTK80(name:String, value_set: (Int) => Unit, value:Int, special:Boolean = false) extends Button(name) {
    prefHeight = 75
    prefWidth = 75

    val color = if (special) "coral" else "green"
    val font_size = if (special) "16px" else "40px"
    style = f"-fx-base: '${color}'; -fx-font: bold ${font_size} 'Aria Black'; -fx-alignment: center; -fx-padding: 0px"
    onMousePressed = handle {
      value_set(value)
    }
    onMouseReleased = handle {
      value_set(0xFF)
    }
  }

  var i = 0
  val ho = new TK80TestThread(3)
  stage = new JFXApp.PrimaryStage {
    title = "TK80TestGUI"
    onCloseRequest = handle {
      ho.running = false
      close()
    }
    scene = new Scene(75*5, 600) {
      onKeyPressed = (event: scalafx.scene.input.KeyEvent) => {
        others_text.setText("hoge")
      //      val currentTime: Duration = null
        event.code match {
          case KeyCode.F1 => { key_data_3=0xFD }
          case KeyCode.F2 => { key_data_3=0xFF }
          case KeyCode.F3 => { key_data_3=0xBF }
          case KeyCode.F4 => { key_data_3=0x7F }
          case KeyCode.F5 => { key_data_3=0xFE }
          case KeyCode.F10 => { key_data_3=0xFD }
          case KeyCode.F12 => { reset_button=0x00 }
          case KeyCode.Insert => { key_data_3=0xEF }
          case KeyCode.BackSpace => { key_data_3=0xF7 }
          case KeyCode.PageUp => { key_data_3=0xDF }
          case KeyCode.Digit0 => { key_data_1=0xFE }
          case KeyCode.Digit1 => { key_data_1=0xFD }
          case KeyCode.Digit2 => { key_data_1=0xFB }
          case KeyCode.Digit3 => { key_data_1=0xF7 }
          case KeyCode.Digit4 => { key_data_1=0xEF }
          case KeyCode.Digit5 => { key_data_1=0xDF }
          case KeyCode.Digit6 => { key_data_1=0xBF }
          case KeyCode.Digit7 => { key_data_1=0x7F }
          case KeyCode.Digit8 => { key_data_2=0xFE }
          case KeyCode.Digit9 => { key_data_2=0xFD }
          case KeyCode.A => { key_data_2=0xFB }
          case KeyCode.B => { key_data_2=0xF7 }
          case KeyCode.C => { key_data_2=0xEF}
          case KeyCode.D => { key_data_2=0xDF}
          case KeyCode.E => { key_data_2=0xBF}
          case KeyCode.F => { key_data_2=0x7F}
          case KeyCode.F6 => { key_data_3=0xFB }
          case _ =>  {}
        }
      }
      onKeyReleased = handle {
        key_data_1 = 0xFF
        key_data_2 = 0xFF
        key_data_3 = 0xFF
      }
      fill = Color.Black
      root = new VBox {
        background = new Background(Array(new BackgroundFill(Color.Black,new CornerRadii(0),Insets(0))))
        children = List(
          new HBox {
            prefHeight = 10
          },
           new HBox{
            fill = Color.Black
            alignment = Pos.Center
            children =
              (address_leds.reverse ::: List(new HBox(){prefWidth=10}) ::: data_leds.reverse)
          },
          new HBox {
            prefHeight = 10
          },
          /*
          new HBox {
            prefHeight = 20
          },
          */
          new HBox {
            children = List(
              new ButtokTK80("RET", (vv:Int)=>{key_data_3=vv}, 0xFD, true),
              new ButtokTK80("RUN", (vv:Int)=>{key_data_3=vv}, 0xFE, true),
              new ButtokTK80("STORE\nDATA", (vv:Int)=>{key_data_3=vv}, 0xBF, true),
              new ButtokTK80("LOAD\nDATA", (vv:Int)=>{key_data_3=vv}, 0x7F, true),
              new ButtokTK80("RESET", (vv:Int)=>{reset_button=vv}, 0x00, true),
            )
          },
          new HBox {
            children = List(
              new ButtokTK80("C", (vv:Int)=>{key_data_2=vv}, 0xEF),
              new ButtokTK80("D", (vv:Int)=>{key_data_2=vv}, 0xDF),
              new ButtokTK80("E", (vv:Int)=>{key_data_2=vv}, 0xBF),
              new ButtokTK80("F", (vv:Int)=>{key_data_2=vv}, 0x7F),
              new ButtokTK80("ADRS\nSET", (vv:Int)=>{key_data_3=vv}, 0xFB, true),
            )
          },
          new HBox {
            children = List(
              new ButtokTK80("8", (vv:Int)=>{key_data_2=vv}, 0xFE),
              new ButtokTK80("9", (vv:Int)=>{key_data_2=vv}, 0xFD),
              new ButtokTK80("A", (vv:Int)=>{key_data_2=vv}, 0xFB),
              new ButtokTK80("B", (vv:Int)=>{key_data_2=vv}, 0xF7),
              new ButtokTK80("READ\nINCR", (vv:Int)=>{key_data_3=vv}, 0xEF, true),
            )
          },
          new HBox {
            children = List(
              new ButtokTK80("4", (vv:Int)=>{key_data_1=vv}, 0xEF),
              new ButtokTK80("5", (vv:Int)=>{key_data_1=vv}, 0xDF),
              new ButtokTK80("6", (vv:Int)=>{key_data_1=vv}, 0xBF),
              new ButtokTK80("7", (vv:Int)=>{key_data_1=vv}, 0x7F),
              new ButtokTK80("READ\nDECR", (vv:Int)=>{key_data_3=vv}, 0xF7, true),
            )
          },
          new HBox {
            children = List(
              new ButtokTK80("0", (vv:Int)=>{key_data_1=vv}, 0xFE),
              new ButtokTK80("1", (vv:Int)=>{key_data_1=vv}, 0xFD),
              new ButtokTK80("2", (vv:Int)=>{key_data_1=vv}, 0xFB),
              new ButtokTK80("3", (vv:Int)=>{key_data_1=vv}, 0xF7),
              new ButtokTK80("WRITE\nINCR", (vv:Int)=>{key_data_3=vv}, 0xDF, true),
            )
          },
          new HBox {
            children =  List (
            )
          },
          pc_text, /*addr_text, data_text,*/ others_text,
          new HBox {
            alignment = Pos.Center
            children =  List(
              new CheckBox("Step") {
                selected = true
                textFill = Color.Red
                step_run = selected.value
                onMouseReleased = handle {
                  step_run = selected.value
                }
              },
              new Button("StartTest") {
                textFill = Color.Red
                onMouseClicked = handle {
                  ho.startTask
                  this.visible = false
                }
              },
              new Button("Quit") {
                textFill = Color.Red
                onMouseClicked = handle {
                  ho.running = false
                  close()
                }
              },
            )
          },
        )
      }
    }
  }

  class TK80TestThread(i:Integer) {
    var running = true
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
      iotesters.Driver.execute(arg, () => new TopSupervisor("src/hex/tk80.hex")) {
        c => new PeekPokeTester(c) {
          val regs = List(Core.A_op, Core.B_op, Core.C_op, Core.D_op, Core.E_op, Core.F_op, Core.H_op, Core.L_op)
          pc = peek(c.io.PC).U
          var sp = peek(c.io.SP).U
          var ix = peek(c.io.IX).U
          var iy = peek(c.io.IY).U
              r = peek(c.io.R).U
              r_unit_test = peek(c.io.R).toInt
          var i = peek(c.io.I).U
          var iff1 = 0.U //peek(c.io.IFF).U
          var iff2 = 0.U //peek(c.io.IFF2).U

          poke(c.io.INT_, 1)
          var next_m1_int = 0
          while(peek(c.io.halt_)==1 && running) {
            val machine_state:Int = peek(c.io.machine_state).toInt
            val t_cycle:Int = peek(c.io.t_cycle).toInt

            if (machine_state == 1 &&  t_cycle == 1 && (prev_state != 1 || (prev_state == 1 && prev_t_cycle ==4 )) )   {
              pc = peek(c.io.PC).U
              sp = peek(c.io.SP).U
              ix = peek(c.io.IX).U
              iy = peek(c.io.IY).U
              r = peek(c.io.R).U
              i = peek(c.io.I).U
              iff1 = peek(c.io.IFF1).U
              iff2 = peek(c.io.IFF2).U
              poke(c.io.keys(0), key_data_1)
              poke(c.io.keys(1), key_data_2)
              poke(c.io.keys(2), key_data_3)

              val pc_str = f"${pc.intValue()}%04X"
              var others_str = ""
              if (pc.intValue() >= 0x01F9) {
                others_str = pc_str
              }

              reset(if (reset_button==0xFF) 0 else 1)

              val address_str = f"${peek(c.io.ADDRH_register).intValue()&0xFF}%02X${peek(c.io.ADDRL_register).intValue()&0xFF}%02X"
              val data_str = f"${peek(c.io.DATAH_register).intValue()&0xFF}%02X${peek(c.io.DATAL_register).intValue()&0xFF}%02X"

              val address_leds_value = peek(c.io.ADDRESS_LEDS)
              val data_leds_value = peek(c.io.DATA_LEDS)
              val led_enable = (peek(c.io.PortCLOutput)>8)
 //            val others_str = f"${peek(c.io.key_output)}"
//              others_str = f"${step_run} ${!step_run}"
              Platform.runLater(() -> {
                pc_text.setText(pc_str)
                addr_text.setText(address_str)
                data_text.setText(data_str)
//                others_text.setText((others_str))
                for (i <-0 to 3) {
                  address_leds(i).set(if (led_enable) address_leds_value(i).intValue() else 0x00)
                  data_leds(i).set(if (led_enable) data_leds_value(i).intValue() else 0x00)
                }
               })
            }
            if (peek(c.io.IFF1) == 1) {
              if (peek(c.io.M1_) == 0) {
                next_m1_int = next_m1_int + 16
                poke(c.io.INT_,!step_run)
              }
            } else {
              poke(c.io.INT_, 1)
              next_m1_int = 0
            }
           step(1)
            prev_state = machine_state
            prev_t_cycle = t_cycle
            prev_pc = pc
          }
        }
      }
    }
  }
}