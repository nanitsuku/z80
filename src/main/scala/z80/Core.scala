package z80

import chisel3._
import chisel3.util._
//import common.Consts._

class Decoder extends Module {
  val io = IO(new Bundle {
    val dd = new DecoderIo()
  })

  def exchange(bbb:UInt) {
  }

  io.dd.m1 := 1.B
  printf(p"data: 0x${Hexadecimal(io.dd.byte)}\n")

  when (io.dd.byte === BitPat("b00001000")) {printf("EX AF,AF'\n"); io.dd.m1:=0.B; exchange(io.dd.byte)}
  when (io.dd.byte === BitPat("b000?1010")) {printf("LD A,(BC) or LD A,(DE)\n"); io.dd.m1:=0.B}
}

class AFIO extends Bundle {
  val A = Input(UInt(8.W))
  val F = Input(UInt(8.W))
}

/*
class AF extends Module {
  val io=IO(new Bundle{
    val input = new AFIO()
    val output = Flipped(new AFIO())
  })
  val A = RegInit(0.U(8.W))
  val F = RegInit(0.U(8.W))

  A := io.input.A
  F := io.input.F

  if (reset == 1.B) {
    A := 0.U
    F := 0.U
  }

  io.output.A := A
  io.output.F := F
}
*/

class Core extends Module {
  val io = IO(new Bundle {
    val bus = Flipped(new ImemPortIo())
//    val dd = Flipped(new DecoderIo())
    val exit = Output(Bool())
  })

  val reset_hold = RegInit(1.U(1.W))

  when(fallingedge(reset.asBool)) {
    reset_hold := 0.B
  }

  // register
  val F = RegInit(0xFF.U(8.W))
  val S_flag = WireDefault(F(7))
  val Z_flag = WireDefault(F(6))
  val H_flag = WireDefault(F(4))
  val PV_flag = WireDefault(F(2))
  val N_flag = WireDefault(F(1))
  val C_flag = WireDefault(F(0))

  val R = RegInit(40.U(8.W))
  val I = RegInit(0.U(8.W))

  val alu = Module(new ALU())

  val PC_next = RegInit(0.U(16.W))
  val in_refresh = RegInit(0.B)

  val M1_state = 1.U(2.W)
  val M2_state = 2.U(2.W)
  val M3_state = 3.U(2.W)

  val machine_state = RegInit(M1_state)
  val machine_state_next = RegInit(M1_state)

  val mem_refer_addr = RegInit(0.U(16.W))

  io.bus.data1 := 0.U

  ///// registers
  // 8bit registers
  val A_op = "b111".U(3.W)
  val B_op = "b000".U(3.W)
  val C_op = "b001".U(3.W)
  val D_op = "b010".U(3.W)
  val E_op = "b011".U(3.W)
  val H_op = "b100".U(3.W)
  val L_op = "b101".U(3.W)

  val regfiles_front = Mem(8, UInt(8.W))
  val regfiles_back = Mem(8, UInt(8.W))

  val A = WireDefault(regfiles_front(A_op))
  val B = WireDefault(regfiles_front(B_op))
  val C = WireDefault(regfiles_front(C_op))
  val D = WireDefault(regfiles_front(D_op))
  val E = WireDefault(regfiles_front(E_op))
  val H = WireDefault(regfiles_front(H_op))
  val L = WireDefault(regfiles_front(L_op))

  val A_prime = WireDefault(regfiles_back(A_op))
  val B_prime  = WireDefault(regfiles_back(B_op))
  val C_prime  = WireDefault(regfiles_back(C_op))
  val D_prime  = WireDefault(regfiles_back(D_op))
  val E_prime  = WireDefault(regfiles_back(E_op))
  val H_prime  = WireDefault(regfiles_back(H_op))
  val L_prime  = WireDefault(regfiles_back(L_op))
 
  // 16bit registers
  val PC = RegInit(0.U(16.W))
  val IX = RegInit(0.U(16.W))
  val IY = RegInit(0.U(16.W))
  val SP = RegInit(0xFFFF.U(16.W))

  def ld_r1_r2_hl(instruction:UInt) {
    val op = Wire(UInt(2.W))
    op := instruction(7,6)
    val dst_reg = Wire(UInt(3.W))
    dst_reg := instruction(5,3)
    val src_reg = Wire(UInt(3.W))
    src_reg := instruction(2,0)

    switch(machine_state) {
      is(M1_state) {
        when(src_reg === "b110".U) {
          machine_state_next := M2_state
          mem_refer_addr := Cat(regfiles_front(H_op), regfiles_front(L_op))
          opcode_index := 1.U
        }.otherwise {
          regfiles_front(dst_reg) := regfiles_front(src_reg)
          opcode_index := 0.U
        }
        PC_next := PC_next + 1.U
        regfiles_front(dst_reg) := regfiles_front(src_reg)
      }
      is(M2_state) {
        regfiles_front(dst_reg) := io.bus.data
        machine_state_next := M1_state
        opcode_index := 0.U
      }
    }
  }

  def ld_n(instruction:UInt) {
    printf(p"ld_n${instruction}\n")
    switch (machine_state) {
      is (M1_state) {
        machine_state_next := M2_state
        opcode_index := 1.U
        mem_refer_addr := PC + 1.U
      }
      is (M2_state) {
        machine_state_next := M1_state
        opcode_index := 0.U
        regfiles_front(opcodes(0)(5,3)) := opcodes(1)
      }
    }
    PC_next := PC_next + 1.U
  }

  def add_a_r(opcode:UInt) {
    alu.io.input_A := regfiles_front(A_op)
    alu.io.input_B := regfiles_front(opcodes(0)(2,0))
    alu.io.input_carry := C_flag
    alu.io.calc_type := opcode & "b11111000".U(8.W)

    switch(machine_state) {
      is(M1_state) {
        switch(opcode(7,4)) {
          is(0x08.U) {
            // add or adc
            when(opcode(2,0) === 0x06.U) {
              // add/adc  a,(HL) 
            }
          }
          is(0x09.U) {
            // sub or sbc
            when(opcode(2,0) === 0x06.U) {
            // sub/sbc a,(HL)
            }
         }
          is(0x0A.U) {
            // and or xor
            when(opcode(2,0) === 0x06.U) {
              // and/xor a,(HL)
            }
          }
          is(0x0B.U) {
            // or or cp
            when(opcode(2,0) === 0x06.U) {
              // or/cp a,(HL)
            }
          }
        }
        PC_next := PC_next + 1.U
      }
    }
    regfiles_front(A_op) := alu.io.output_C
    F := alu.io.flag
  }

  def ld_mem_r(opcode:UInt) {
    switch (machine_state) {
      is (M1_state) {
        machine_state_next := M3_state
        opcode_index := 1.U
        mem_refer_addr := Cat(H, L)
        PC_next := PC_next + 1.U
      }
      is (M3_state) {
        io.bus.data1 := regfiles_front(opcodes(0)(2,0)) 
        machine_state_next := M1_state
        opcode_index := 0.U
      }
    }
  }

  def jp(opcode:UInt) {
    mem_refer_addr := PC_next + 1.U
    PC_next := PC_next + 1.U
    switch (machine_state) {
      is (M1_state) {
        machine_state_next := M2_state
        opcode_index := 1.U
//        mem_refer_addr := PC + 1.U
        PC_next := PC_next + 1.U
      }
      is (M2_state) {
        opcodes(opcode_index) := io.bus.data
          when(m1_t_cycle === 2.U) {
  //        mem_refer_addr := PC_next + 1.U
          switch(opcode_index) {
            is(1.U) {
              opcode_index := opcode_index + 1.U
              PC_next := PC_next + 1.U
            }
            is(2.U) {
              opcode_index := 0.U
              machine_state_next := M1_state
              PC_next := 0x00.U
              PC := PC_next
            }
          }
        }
      }
    }
//    mem_refer_addr := PC_next
  }

def halt(opcode:UInt) {
  machine_state_next := M1_state
  opcode_index := 0.U
  mem_refer_addr := PC
  PC_next := PC_next
}

  val opcodes = Mem(4, UInt(8.W))
  val opcode_index = RegInit(0.U(8.W))

  var to_be_read = RegInit(0.U(8.W))
  def decode (/*instruction:UInt*/) = {
    printf(p"----decode ${Hexadecimal(opcodes(0))} ${Hexadecimal(opcodes(1))}\n")
    when (opcodes(0) === BitPat("b01110110")) {printf("HALT\n"); halt(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b01110???")) {printf("LD (HL),r\n"); ld_mem_r(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b01??????")) {printf("LD r1,r2\n"); ld_r1_r2_hl(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b00???110")) {printf("LD r,n\n"); ld_n(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b10??0???")) {printf("ADD A,r\n"); add_a_r(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11000011")) {printf("JP nn"); jp(opcodes(0));}
    /*
    .elsewhen (opcodes(0) === BitPat("b00000000")) {printf("NOP\n"); to_be_read = 0; PC_next := PC_next + 1.U}
    .elsewhen (opcodes(0) === BitPat("b00001000")) {printf("EX AF,AF'\n"); 0}
    .elsewhen (opcodes(0) === BitPat("b000?1010")) {printf("LD A,(BC) or LD A,(DE)\n"); 0}
    .elsewhen (opcodes(0) === BitPat("b00110010")) {printf("LD (nn).A\n"); to_be_read = 0;}
    .otherwise {}
    */
  }
 
  //**********************************
  // Instruction Fetch (IF) Stage

  io.bus.addr := PC
  io.bus.RD_ := 1.B
  io.bus.WR_ := 1.B
  io.bus.MREQ_ := 1.B
  //io.dd.byte := io.bus.data
  val data = io.bus.data
  io.bus.M1_ := 1.B
  io.bus.RFSH_ := 1.B

  alu.io.input_A := 0.U
  alu.io.input_B := 0.U
  alu.io.calc_type := 0.U
  alu.io.input_carry := 0.B

  val m1_t_cycle = RegInit(1.U(8.W))

  def fallingedge(x: Bool) = !x && RegNext(x)
  def risingedge(x: Bool) = x && !RegNext(x)
//  when(io.dd.m1 === 1.B) {

  when(!reset_hold) {

    switch(machine_state) {

      // M1 State
      is(M1_state)  {
        when(m1_t_cycle < 4.U) {
          m1_t_cycle := m1_t_cycle + 1.U
        } otherwise {
          m1_t_cycle := 1.U
          R := Cat(R(7), (R(6,0) + 1.U)&0x7F.U)  // for refresh register
        }

        when(m1_t_cycle === 1.U) {
          // fetch
          io.bus.addr := PC_next
          io.bus.MREQ_ := 1.B
          io.bus.M1_ := 0.B
          io.bus.RFSH_ := 1.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
            io.bus.RD_ := 0.B
          }
          opcodes(opcode_index) := io.bus.data //io.dd.byte
        } .elsewhen(m1_t_cycle === 2.U) {
          io.bus.MREQ_ := 0.B
          io.bus.M1_ := 0.B
          io.bus.RFSH_ := 1.B
          io.bus.RD_ := 0.B
          decode()
        } .elsewhen(m1_t_cycle === 3.U) {
          // refresh cycle1
          io.bus.addr := Cat(I, R&0x7F.U)
          io.bus.MREQ_ := 1.B
          io.bus.M1_ := 1.B
          io.bus.RFSH_ := 0.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
          }
          PC := PC_next
        } .elsewhen(m1_t_cycle === 4.U) {
          // refresh cycle2
          io.bus.addr := Cat(I, R&0x7F.U)
          io.bus.MREQ_ := 0.B
          io.bus.M1_ := 1.B
          io.bus.RFSH_ := 0.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 1.B
          }
          machine_state := machine_state_next
        }
      }
      // M2 state
      is(M2_state) {
        io.bus.addr := mem_refer_addr
        when(m1_t_cycle < 3.U) {
          m1_t_cycle := m1_t_cycle + 1.U
        }
  
        io.bus.RD_ := 1.B
        when(m1_t_cycle === 1.U) {
          // read_memory
  //        io.bus.addr := PC
          io.bus.MREQ_ := 1.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
            io.bus.RD_ := 0.U
          }
          opcodes(opcode_index) := io.bus.data
//          opcode_index := opcode_index + 1.U
        } .elsewhen(m1_t_cycle === 2.U) {
          io.bus.RD_ := 0.U
          io.bus.MREQ_ := 0.B
          decode()
        } .elsewhen(m1_t_cycle === 3.U) {
          io.bus.MREQ_ := 0.B
          io.bus.RD_ := 0.U

          when(fallingedge(clock.asBool)) {
            io.bus.RD_ := 1.U
            io.bus.MREQ_ := 1.B
          }
          PC := PC_next
          m1_t_cycle := 1.U
          machine_state := machine_state_next
        }
      }
      is(M3_state) {
        io.bus.addr := mem_refer_addr
        when(m1_t_cycle < 3.U) {
          m1_t_cycle := m1_t_cycle + 1.U
        }
  
        when(m1_t_cycle === 1.U) {
          io.bus.WR_ := 1.B
          // read_memory
  //        io.bus.addr := PC
          io.bus.MREQ_ := 1.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
          }
//        opcodes(opcode_index) := io.bus.data
//          opcode_index := opcode_index + 1.U
         } .elsewhen(m1_t_cycle === 2.U) {
          when(fallingedge(clock.asBool)) {
            io.bus.WR_ := 0.B
          }
          io.bus.MREQ_ := 0.B
          decode(/*opcode_index*/)
        } .elsewhen(m1_t_cycle === 3.U) {
          io.bus.MREQ_ := 0.B
          io.bus.WR_ := 0.B
          when(fallingedge(clock.asBool)) {
            io.bus.WR_ := 1.B
          }
          decode(/*opcode_index*/)
           /*
          io.bus.MREQ_ := 1.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
          }
          */
          PC := PC_next
          m1_t_cycle := 1.U
          machine_state := machine_state_next
        }
      }
    }
  } 

  when(fallingedge(reset.asBool)) {
    PC := 0.U
    m1_t_cycle := 1.U
//    io.bus.addr := PC
  }

//  when (decode(data).U === BitPat("b00000000")) printf("hoge")

  //**********************************
  // Debug
//  io.exit := (data === 0x34.U(8.W))
  io.exit := (data.asUInt === BitPat("b11111111"))
  printf("--------\n")
  printf(p"PC: 0x${Hexadecimal(PC)}\n")
  printf(p"opcode: 0x${Hexadecimal(opcodes(0))}\n")
//  printf(p"m1: 0x${Hexadecimal(io.dd.m1)}\n")
  printf(p"m1: 0x${Hexadecimal(m1_t_cycle)}\n")
//  printf(p"A: 0x${Hexadecimal(A)}\n")
//  printf(p"B: 0x${Hexadecimal(B)}\n")
//  printf(p"F: 0x${Hexadecimal(F)}\n")
//  printf(p"F: 0x${Hexadecimal(mem_refer_addr)}\n")
//  printf(p"M1: 0x${Hexadecimal(io.bus.M1_)}\n")
//  printf(p"reset_hold: 0x${Hexadecimal(reset_hold)}\n")
//  printf(p"ALU : 0x${Hexadecimal(alu.io.output_C)}\n")
//  printf(p"aa: 0x${Hexadecimal(io.bus.MREQ_)}\n")
//  printf(p"aa: 0x${Hexadecimal(io.bus.RFSH_)}\n")
//  printf("---------\n")
}
