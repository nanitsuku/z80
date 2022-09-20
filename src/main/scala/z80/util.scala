package z80

import chisel3._
import chisel3.util._

class AAA extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
  })

  setInline("AAA.v",
  f"""
  | /* verilator lint_off UNOPTFLAT */
  |module AAA(
  |);
  |
  |endmodule
  """.stripMargin)
}
