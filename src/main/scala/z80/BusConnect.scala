package z80

import chisel3._
import chisel3.util._

/* n bits tristate w width bus buffer */
class BusConnect(size:Int = 2, width:Int = 8) extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
      val instruments = Vec(size, new Bundle {
        val input = Input(UInt(8.W))
        val output = Output(UInt(8.W))
        val dir = Input(Bool())
      })
    })

    val ind = width -1
    val pref = "instruments"

    val name_ = (n:Int, post:String) => f"${pref}_${n}_${post}"
    val name_input = (n:Int) => name_(n, "input")
    val name_output_ = (n:Int) => name_(n, "output")
    val name_dirs_ = (n:Int) => name_(n, "dir")
    val lists = (0 until size)

    setInline("BusConnect.v",
    f"""
    |module BusConnect(
    |${lists.map(n => f"\tinput [${ind}:0] ${name_input(n)}").mkString(",\n")},
    |${lists.map(n => f"\toutput [${ind}:0] ${name_output_(n)}").mkString(",\n")},
    |${lists.map(n => f"\tinput ${name_dirs_(n)}").mkString(",\n")}
    |);
    |
    |${lists.map(a => f"wire [${ind}:0] output_${a}_ = " + (lists.withFilter(b => b!=a).map(n => f"(${name_dirs_(n)}?${name_input(n)}:${width}'bZ)").mkString("|"))).mkString(";\n")};
    |
    |${lists.map(n => f"assign ${name_output_(n)} = output_${n}_").mkString(";\n")};
    |
    |endmodule
    """.stripMargin)
}