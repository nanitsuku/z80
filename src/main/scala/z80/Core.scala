package z80

import chisel3._
import chisel3.util._


class Core extends Module {

  val io = IO(new Bundle {
    val bus = Flipped(new ImemPortIo())
    val exit = Output(Bool())
    val M1 = Output(UInt(8.W))
  })

  val reset_hold = RegInit(1.U(1.W))

  when(fallingedge(reset.asBool)) {
    reset_hold := 0.B
  }

  val PC_next = RegInit(0.U(16.W))
  val in_refresh = RegInit(0.B)

  val M1_state = 1.U(3.W)
  val M2_state = 2.U(3.W)
  val M3_state = 3.U(3.W)
  val MX_state_8 = 4.U(3.W)
  val MINOUT_state = 5.U(3.W)

  val machine_state = RegInit(M1_state)
  val machine_state_next = RegInit(M1_state)


  val IFF = RegInit(0.B)

  val mem_refer_addr = RegInit(0.U(16.W))

  io.bus.data1 := 0.U
  io.bus.IORQ_ := 1.B

  ///// registers
  // 8bit registers
  val A_op = "b111".U(3.W)
  val B_op = "b000".U(3.W)
  val C_op = "b001".U(3.W)
  val D_op = "b010".U(3.W)
  val E_op = "b011".U(3.W)
  val H_op = "b100".U(3.W)
  val L_op = "b101".U(3.W)
  val F_op = "b110".U(3.W)

  //val regfiles_front = Mem(8, UInt(8.W))
  val regfiles_front = Reg(Vec(8, UInt(8.W)))
//  val regfiles_back = Mem(8, UInt(8.W))
  val regfiles_back = Reg(Vec(8, UInt(8.W))) 

  val A = WireDefault(regfiles_front(A_op))
  val B = WireDefault(regfiles_front(B_op))
  val C = WireDefault(regfiles_front(C_op))
  val D = WireDefault(regfiles_front(D_op))
  val E = WireDefault(regfiles_front(E_op))
  val F = WireDefault(regfiles_front(F_op))
  val H = WireDefault(regfiles_front(H_op))
  val L = WireDefault(regfiles_front(L_op))

  val A_prime = WireDefault(regfiles_back(A_op))
  val B_prime  = WireDefault(regfiles_back(B_op))
  val C_prime  = WireDefault(regfiles_back(C_op))
  val D_prime  = WireDefault(regfiles_back(D_op))
  val E_prime  = WireDefault(regfiles_back(E_op))
  val F_prime =  WireDefault(regfiles_front(F_op))
  val H_prime  = WireDefault(regfiles_back(H_op))
  val L_prime  = WireDefault(regfiles_back(L_op))

  // register
//  val F = RegInit(0xFF.U(8.W))
  val S_flag = WireDefault(F(7))
  val Z_flag = WireDefault(F(6))
  val H_flag = WireDefault(F(4))
  val PV_flag = WireDefault(F(2))
  val N_flag = WireDefault(F(1))
  val C_flag = WireDefault(F(0))

  val R = RegInit(40.U(8.W))
  val I = RegInit(0.U(8.W))

  val alu = Module(new ALU())
  val alu16 = Module(new ALU16())

  alu16.io.input_register := 0.U
  alu16.io.offset := 0.S
 
  // 16bit registers
  val PC = RegInit(0.U(16.W))
  val IX = RegInit(0.U(16.W))
  val IY = RegInit(0.U(16.W))
  val SP = RegInit(0xFFFF.U(16.W))

  val BC_op = "b00".U
  val DE_op = "b01".U
  val HL_op = "b10".U
  val SP_op = "b11".U
 
  def ld_r_ix_iy_d(instruction:UInt) {
    // M1 -> M1 -> M2 -> MX(5) -> M2
    switch(machine_state) {
      is(M1_state) {
        switch(m1_t_cycle) {
          is(2.U) {
            opcode_index := opcode_index + 1.U
          }
          is(3.U) {
            when(opcode_index===1.U) {
              machine_state_next := M1_state
            } .otherwise {
              machine_state_next := M2_state
              mem_refer_addr := PC_next
            }
          }
        }
      }
      is(M2_state) {
        switch(opcode_index) {
          is(2.U) {
            mem_refer_addr := PC_next
            when(m1_t_cycle===2.U) {
                machine_state_next := MX_state_8 
                dummy_cycle := 5.U
                PC_next := PC_next + 1.U
                opcode_index := opcode_index + 1.U
            }
          }
          is(3.U) {
            alu16.io.input_register := IX
            alu16.io.offset := opcodes(2).asSInt()
            mem_refer_addr := alu16.io.output
            when(m1_t_cycle===2.U) {
              opcode_index := 0.U
              machine_state_next := M1_state
              regfiles_front(A_op) := io.bus.data
            } 
          }
        }
      }
      is(MX_state_8) {
        when(m1_t_cycle===3.U) {
          machine_state_next := M2_state
        }
        when(m1_t_cycle===4.U) {
          alu16.io.input_register := IX
          alu16.io.offset := opcodes(2).asSInt()
          mem_refer_addr := alu16.io.output
         }
      }
    }
  }

  def inc_dec_16(instruction:UInt) {
    var register = WireDefault(MuxCase(instruction(5,4), 
    Array(
      (instruction(5,4) === BC_op) -> Cat(regfiles_front(B_op), regfiles_front(C_op)),
      (instruction(5,4) === DE_op) -> Cat(regfiles_front(D_op), regfiles_front(E_op)),
      (instruction(5,4) === HL_op) -> Cat(regfiles_front(H_op), regfiles_front(L_op)),
      (instruction(5,4) === SP_op) -> SP
    )))

    val input = RegInit(register)
    val output = WireDefault(register)
    val result = RegInit(0.U(16.W))
    val oooo = RegInit(0.U(16.W))
  
    alu16.io.input_register := input
    alu16.io.offset := Mux(instruction(3) === 0.U, 1.S, -1.S)
   switch(machine_state) {
      is(M1_state) {
        input := register
        machine_state_next := MX_state_8
        alu16.io.input_register := input
        dummy_cycle := 2.U
        when(m1_t_cycle===1.U) {
        } .elsewhen(m1_t_cycle===3.U) {
        } .otherwise {
          input := register
        }
      }
      is(MX_state_8) {
        switch(m1_t_cycle) {
          is(2.U) {
/*
            regfiles_front(B_op) := alu16.io.output(15,8)
            regfiles_front(C_op) := alu16.io.output(7,0)
*/
            switch(instruction(5,4)) {
              is(BC_op) {
                regfiles_front(B_op) := alu16.io.output(15,8)
                regfiles_front(C_op) := alu16.io.output(7,0)
              }
              is(DE_op) {
                regfiles_front(D_op) := alu16.io.output(15,8)
                regfiles_front(E_op) := alu16.io.output(7,0)
              }
              is(HL_op) {
                regfiles_front(H_op) := alu16.io.output(15,8)
                regfiles_front(L_op) := alu16.io.output(7,0)
              }
              is(SP_op) {
                SP := alu16.io.output
              }
            }

            machine_state_next := M1_state
            opcode_index := 0.U
            output := result
          }
          is(1.U) {
            machine_state_next := M1_state
            opcode_index := 0.U
          }
        }
      }
    }
  }

  def inc_dec(instruction:UInt) {
    alu.io.input_B := 1.U
    alu.io.input_carry := 0.U
    alu.io.calc_type := Mux(opcodes(0)(0), alu.sub_op, alu.add_op)
    when(instruction === BitPat("b0011010?")) {  // inc/dec (HL)
      val temp = RegInit(0.U)
      // M1(4) -> M2(3) -> MX(1) -> M3(3)   11
      alu.io.input_A := opcodes(1)
      switch(machine_state) {
        is(M1_state) {
          machine_state_next := M2_state
          mem_refer_addr := Cat(H ,L)
          opcode_index := 1.U
        }
        is(M2_state) {
//          alu.io.input_A := opcodes(1)
          machine_state_next := MX_state_8
          /*
          when(m1_t_cycle===2.U) {
            alu.io.input_A := opcodes(1)
            machine_state_next := MX_state_8
          }*/
          when(m1_t_cycle===2.U) {
            temp := alu.io.output_C
          }
 
          dummy_cycle := 1.U
        }
        is(MX_state_8) {
          when(m1_t_cycle === 1.U) {
            machine_state_next := M3_state
          }
        }
        is(M3_state) {
          machine_state_next := M1_state
          when(m1_t_cycle === 2.U) {
            io.bus.data1 := temp
            mem_refer_addr := PC_next
            opcode_index := 0.U
          }
        }
      }
    } .elsewhen(instruction === BitPat("b00???10?")) { // inc/dec r/r-1
      alu.io.input_A := regfiles_front(opcodes(0)(5,3))
      // M1(4)
      when(m1_t_cycle===3.U) {
        regfiles_front(opcodes(0)(5,3)) := alu.io.output_C
      }
    }
  }

  def ld_rr_rp_nn(opcode:UInt) {
    // LD A,(BC|DE)   M1(4) M2(3)
    // LD A,(nn)      M1(4) M2(3) M2(3) M2(3)
    // LD HL,(nn)     M1(4) M2(3) M2(3) M2(3) M2(3)
    switch(machine_state) {
      is(M1_state) {
        when(m1_t_cycle === 3.U) {
          when(~opcode(5)) { // ld A,(BC|DE)
            mem_refer_addr := Mux(opcode(4), Cat(D, E), Cat(B, C))
          } .otherwise {
            mem_refer_addr := PC_next
          }
          machine_state_next := M2_state
          opcode_index := opcode_index + 1.U
        }
      }
      is(M2_state) {
        when(~opcode(5)) {
          // ld A,(BC|DE)
          regfiles_front(A_op) := io.bus.data
          machine_state_next := M1_state
          opcode_index := 0.U
        } .otherwise {
          // ld A,(nn)  ld HL,(nn)
          switch(opcode_index)   {
            is(1.U) {
              mem_refer_addr := PC_next + 1.U
              PC_next := PC_next + 1.U
              opcode_index := opcode_index + 1.U
            }
            is(2.U) {
              when(opcode(4)) {
                // LD A,(nn)
//                regfiles_front(A_op) := io.bus.data
                /*
                machine_state_next := M1_state
                opcode_index := 0.U
                */
              } .otherwise {
                // LD HL,(nn)
//                regfiles_front(L_op) := io.bus.data
              }
              mem_refer_addr := Cat(opcodes(2), opcodes(1))
              PC_next := PC_next + 1.U
              opcode_index := opcode_index + 1.U
            }
            is(3.U) {
              when(opcode(4)) {
                regfiles_front(A_op) := io.bus.data
                machine_state_next := M1_state
                opcode_index := 0.U
              } .otherwise {
                regfiles_front(L_op) := io.bus.data
              }
              mem_refer_addr := mem_refer_addr + 1.U    
            }
            is(4.U) {
              regfiles_front(H_op) := io.bus.data
              machine_state_next := M1_state
              opcode_index := 0.U
            }
          }
//          opcode_index := opcode_index + 1.U
        }
      }
    }
  }

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
        when(m1_t_cycle===3.U) {
//          PC_next := PC_next + 1.U
        }
       // regfiles_front(dst_reg) := regfiles_front(src_reg)
      }
      is(M2_state) {
        when(m1_t_cycle===2.U) {
          regfiles_front(dst_reg) := io.bus.data
          machine_state_next := M1_state
          opcode_index := 0.U
        }
      }
    }
  }

  def ld_a_n(instruction:UInt) {
//    printf(p"ld_a_n${instruction}\n")
    switch (machine_state) {
      is (M1_state) {
        when(m1_t_cycle === 2.U) {
//          PC_next := PC_next + 1.U
        } .elsewhen(m1_t_cycle === 3.U) {
          opcode_index := 1.U
          machine_state_next := M2_state
          when(opcodes(0)(6)===0.U) {
            mem_refer_addr := PC_next
          } otherwise {
            mem_refer_addr := Cat(H, L)
          }
        }
      }
      is (M2_state) {
        machine_state_next := M1_state
        opcode_index := 0.U
        regfiles_front(opcodes(0)(5,3)) := opcodes(1)
        PC_next := PC_next + 1.U
      }
    }
  }

  def rp_pair_af = (RP:UInt) => 
    ListLookup(RP, List(4.U, 6.U), //List(B_op, C_op),
      Array(
        new BitPat(BC_op.litValue(), 3, 2) -> List(B_op, C_op),
        new BitPat(DE_op.litValue(), 3, 2) -> List(D_op, E_op),
        new BitPat(HL_op.litValue(), 3, 2) -> List(H_op, L_op),
        new BitPat(SP_op.litValue(), 3, 2) -> List(A_op, F_op),
     )
    )
 

  def push_pop(opcode:UInt) {
    // push  M1(4) MX(1) M3(3) M3(3)
    // pop   M1(4)       M3(3) M3(3)
    val RP = opcode(5,4)
//    val RP = 0.U
//    val RH = 0.U
//    var RL = 0.U
/*
    val rh = WireInit(MuxCase(regfiles_front(B_op),
      Seq(
        (RP ===  BC_op) -> regfiles_front(B_op),
        (RP ===  DE_op) -> regfiles_front(D_op),
        (RP ===  HL_op) -> regfiles_front(H_op),
        (RP ===  SP_op) -> regfiles_front(A_op),
      )
    ))
*/
/*
    val List(rhp, rlp) = ListLookup(RP, List(4.U, 6.U), //List(B_op, C_op),
      Array(
        new BitPat(BC_op.litValue(), 3, 2) -> List(B_op, C_op),
        new BitPat(DE_op.litValue(), 3, 2) -> List(D_op, E_op),
        new BitPat(HL_op.litValue(), 3, 2) -> List(H_op, L_op),
        new BitPat(SP_op.litValue(), 3, 2) -> List(A_op, F_op),
      )
    )
    */
    val rhp :: rlp :: Nil  = rp_pair_af(RP)
/*
    val rl = WireInit(MuxCase(regfiles_front(C_op),
      Seq(
        (RP ===  BC_op) -> regfiles_front(C_op),
        (RP ===  DE_op) -> regfiles_front(E_op),
        (RP ===  HL_op) -> regfiles_front(L_op),
        (RP ===  SP_op) -> F,
      )
    ))
*/
//    val RH :: RL :: Nil = signals

    switch(opcode(2)) {
      is(0.B) { // POP
        switch(machine_state) {
          is(M1_state) {
            when(m1_t_cycle === 2.U) {
              mem_refer_addr := SP
              opcode_index := opcode_index + 1.U
              machine_state_next := M2_state
            }
          }
          is(M2_state) {
            switch(opcode_index) {
              is(1.U) {
//                rl := io.bus.data
                when(m1_t_cycle === 2.U) {
//                rl := io.bus.data
//                regfiles_front(rlp) := opcodes(opcode_index)
                regfiles_front(rlp) := opcodes(opcode_index)
                printf(p"${rhp} ${rlp} ${RP} ${L_op}\n")
//                  mem_refer_addr := SP
                  opcode_index := opcode_index + 1.U
//                  mem_refer_addr := SP + 1.U
when(fallingedge(clock.asBool())) {

                  mem_refer_addr := SP + 1.U
} .otherwise {

                  mem_refer_addr := SP + 1.U
}
                 } .elsewhen (m1_t_cycle === 3.U) {
                   SP := SP + 1.U
                  mem_refer_addr := SP + 1.U
                  when(fallingedge(clock.asBool())) {
//               L := io.bus.data
//                regfiles_front(L_op) := io.bus.data
//                  SP := SP + 1.U
 //               mem_refer_addr := SP + 1.U
  
//                  rh := io.bus.data
                   }
                }
              }
              is(2.U) {
//                mem_refer_addr := SP
                  mem_refer_addr := SP + 1.U
                when(m1_t_cycle === 2.U) {
//                  rh := io.bus.data
                regfiles_front(rhp) := io.bus.data
                  SP := SP + 1.U
                  machine_state_next := M1_state
                  opcode_index := 0.U
//                mem_refer_addr := SP
                } .otherwise {

//                  opcode_index := 0.U
//                mem_refer_addr := SP
                }
              }
            }
         }
        }
      } 
      is(1.B) { // PUSH
        switch(machine_state) {
          is(M1_state) {
            when(m1_t_cycle === 2.U) {
              opcode_index := opcode_index + 1.U
              machine_state_next := MX_state_8
              dummy_cycle := 0.U
              mem_refer_addr := SP - 1.U
              SP := SP - 1.U
            }
          }
          is(MX_state_8) {
            machine_state_next := M3_state
            machine_state := M3_state
          }
          is(M3_state) {
            switch(opcode_index) {
              is(1.U) {
//                io.bus.data1 := rh
                io.bus.data1 := regfiles_front(rhp)
                when(m1_t_cycle === 3.U) {
                  SP := SP - 1.U
                  opcode_index := opcode_index + 1.U
                  mem_refer_addr := SP - 1.U
                } .otherwise {
//                io.bus.data1 := rh
                io.bus.data1 := regfiles_front(rhp)
                }
              }
              is(2.U) {
                //io.bus.data1 := rl
                io.bus.data1 := regfiles_front(rlp)
                when(m1_t_cycle === 2.U) {
//                  when(fallingedge(clock.asBool())) {
                    machine_state_next := M1_state
//                  }
                } .elsewhen(m1_t_cycle === 3.U) {
                  opcode_index := 0.U
                }
                /*
                when(m1_t_cycle === 2.U) {
                  io.bus.data1 := rl
//                  SP := SP - 1.U
//                  opcode_index := opcode_index + 1.U
//                  mem_refer_addr := SP - 1.U
                   machine_state_next := M1_state
                  opcode_index := 0.U
               } .elsewhen(m1_t_cycle === 3.U) {
                  io.bus.data1 := rl
                  when(risingedge(clock.asBool())) {
                  machine_state_next := M1_state
                  opcode_index := 0.U
                  }
                  io.bus.data1 := rl
                } .otherwise {
                }
                  io.bus.data1 := rl
                  */
                /*
                mem_refer_addr := SP - 1.U
                machine_state_next := M1_state
                opcode_index := 0.U
                */
              }
            }
          }
        }
      } 
    }
  }

  def add_a_r(opcode:UInt) {
    val src_reg = RegInit(0.U(8.W))
    alu.io.input_A := regfiles_front(A_op)
//    alu.io.input_A := src_reg
    alu.io.input_B := regfiles_front(opcodes(0)(2,0))
//    alu.io.input_carry := RegInit(C_flag)
    alu.io.input_carry := C_flag
    alu.io.calc_type := Mux(opcode(7,6) === "b11".U,
                     opcode & "b10111000".U(8.W),
                     opcode & "b11111000".U(8.W))

    switch(machine_state) {
      is(M1_state) {
        when(m1_t_cycle===3.U) {
          src_reg := regfiles_front(A_op)
          switch(opcode(7,4)&"b1011".U) {
            is(0x08.U) {
              // add or adc
              when(opcode(6) === 1.U) {
                // n
                mem_refer_addr := PC_next
                PC_next := PC_next + 1.U
                machine_state_next := M2_state
                opcode_index := opcode_index + 1.U
                alu.io.input_B := io.bus.data
              } .elsewhen(opcode(2,0) === 0x06.U) {
                // add/adc  a,(HL)
                mem_refer_addr := Cat(H,L)
                machine_state_next := M2_state
                opcode_index := opcode_index + 1.U
              }
            }
            is(0x09.U) {
              // sub or sbc
              when(opcode(6) === 1.U) {
                // n
                mem_refer_addr := PC_next
                PC_next := PC_next + 1.U
                machine_state_next := M2_state
                opcode_index := opcode_index + 1.U
                alu.io.input_B := io.bus.data
              } .elsewhen(opcode(2,0) === 0x06.U) {
                // sub/sbc a,(HL)
                mem_refer_addr := Cat(H,L)
                machine_state_next := M2_state
                alu.io.input_B := io.bus.data
                opcode_index := opcode_index + 1.U
              }
           }
            is(0x0A.U) {
              // and or xor
              when(opcode(6) === 1.U) {
                // n
                mem_refer_addr := PC_next
                PC_next := PC_next + 1.U
                machine_state_next := M2_state
                opcode_index := opcode_index + 1.U
                alu.io.input_B := io.bus.data
              } .elsewhen(opcode(2,0) === 0x06.U) {
                // and/xor a,(HL)
                mem_refer_addr := Cat(H,L)
                machine_state_next := M2_state
                alu.io.input_B := io.bus.data
                opcode_index := opcode_index + 1.U
              }
            }
            is(0x0B.U) {
              // or or cp
              when(opcode(6) === 1.U) {
                // n
                mem_refer_addr := PC_next
                PC_next := PC_next + 1.U
                machine_state_next := M2_state
                opcode_index := opcode_index + 1.U
                alu.io.input_B := io.bus.data
              } .elsewhen(opcode(2,0) === 0x06.U) {
                // or/cp a,(HL)
                mem_refer_addr := Cat(H,L)
                machine_state_next := M2_state
                alu.io.input_B := io.bus.data
                opcode_index := opcode_index + 1.U
              }
            }
          }
//        PC_next := PC_next + 1.U
          regfiles_front(A_op) := alu.io.output_C
          regfiles_front(F_op) := alu.io.flag
        }
      }
      is(M2_state) {
        when(m1_t_cycle===2.U) {
          regfiles_front(A_op) := alu.io.output_C
          regfiles_front(F_op) := alu.io.flag
          alu.io.input_B := io.bus.data
          opcode_index := 0.U
          machine_state_next := M1_state 
        }
      }
    }
  }

  def ld_mem_r(opcode:UInt) {
    switch (machine_state) {
      is (M1_state) {
        when(m1_t_cycle===3.U) {
          machine_state_next := M3_state
          opcode_index := 1.U
          mem_refer_addr := Cat(H, L)
//          PC_next := PC_next + 1.U
        }
      }
      is (M3_state) {
        io.bus.data1 := regfiles_front(opcodes(0)(2,0)) 
        machine_state_next := M1_state
        opcode_index := 0.U
      }
    }
  }

  def jp(opcode:UInt) {
//    PC_next := PC_next + 1.U
    val op = WireDefault(Cat(opcodes(0)(0), opcodes(0)(5,3)))
    switch (machine_state) {
      is (M1_state) {
        switch(m1_t_cycle) {
          is(2.U) {
        machine_state_next := M2_state
        opcode_index := 1.U
//        PC_next := PC_next + 1.U
          mem_refer_addr := PC_next + 1.U
          }
        }
      }
      is (M2_state) {
        opcodes(opcode_index) := io.bus.data
//        mem_refer_addr := PC_next
        when(m1_t_cycle === 2.U) {
          mem_refer_addr := PC_next + 1.U
          switch(opcode_index) {
            is(1.U) {
              opcode_index := opcode_index + 1.U
              PC_next := PC_next + 1.U
            }
            is(2.U) {
              opcode_index := 0.U
              machine_state_next := M1_state
//              PC_next := Cat(opcodes(2), opcode(1))
//              PC_next := Cat(opcodkkkes(1)(8.W), opcode(2)(8.W))

              val cond = MuxCase(0.B,
                Array(
                  (op === "b1000".U) -> 1.B,
                  (op === "b0000".U && Z_flag === 0.U) -> 1.B,
                  (op === "b0001".U && Z_flag === 1.U) -> 1.B,
                  (op === "b0010".U && C_flag === 0.U) -> 1.B,
                  (op === "b0011".U && C_flag === 1.U) -> 1.B,
                  (op === "b0100".U && PV_flag=== 0.U) -> 1.B,
                  (op === "b0101".U && PV_flag=== 1.U) -> 1.B,
                  (op === "b0110".U && S_flag === 0.U) -> 1.B,
                  (op === "b0111".U && S_flag === 1.U) -> 1.B,
                )
              )

              when(cond === 0.B) {
                PC_next := PC_next + 1.U
              } .otherwise {
                PC_next := Cat(opcodes(1),opcodes(2))
              }

//              PC_next := Cat(opcodes(1),opcodes(2))
//              PC := PC_next
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

  def nop(opcode:UInt) {
    machine_state_next := M1_state
    opcode_index := 0.U
  }
  
  def iff(opcode:UInt) {
    IFF := opcodes(0)(3)
  }
  
  def ret(opcode:UInt) {
    // RET M1(4) M2(3) M2(3) 
    // RET no cond  M1(4) MX(1)
    // RET cond M1(4) MX(1) M2(3) M2(3) 
  
    val op = WireDefault(Cat(opcodes(0)(0), opcodes(0)(5,3)))
    val cond = MuxCase(0.B,
      Array(
        (op === "b1001".U) -> 1.B,
        (op === "b0000".U && Z_flag === 0.U) -> 1.B,
        (op === "b0001".U && Z_flag === 1.U) -> 1.B,
        (op === "b0010".U && C_flag === 0.U) -> 1.B,
        (op === "b0011".U && C_flag === 1.U) -> 1.B,
        (op === "b0100".U && PV_flag=== 0.U) -> 1.B,
        (op === "b0101".U && PV_flag=== 1.U) -> 1.B,
        (op === "b0110".U && S_flag === 0.U) -> 1.B,
        (op === "b0111".U && S_flag === 1.U) -> 1.B,
      )
    )
  
    switch(machine_state) {
      is(M1_state) {
        switch(m1_t_cycle) {
          is(2.U) {
            when(op==="b1001".U) {
              machine_state_next := M2_state 
            } otherwise {
              machine_state_next := MX_state_8
            }
            dummy_cycle := 1.U
            mem_refer_addr := SP
            opcode_index := opcode_index + 1.U
          }
        }
      }
      is(MX_state_8) {
        when(cond===1.U) {
          machine_state_next := M2_state
        } otherwise {
          machine_state_next := M1_state
          opcode_index := 0.U
        }
      }
       is(M2_state) {
        switch(m1_t_cycle) {
          is(2.U) {
  //          opcodes(opcode_index) := io.bus.data
            SP := SP + 1.U
            opcode_index := opcode_index + 1.U
            mem_refer_addr := SP + 1.U
            when(opcode_index===2.U) {
              PC_next := Cat(opcodes(1), io.bus.data)
              opcode_index := 0.U
              machine_state_next := M1_state
            }
          }
        }
      }
    }
  }
  
  def in_out(opcode:UInt) {
    switch(machine_state) {
      is(M1_state) {
        when(m1_t_cycle===2.U) {
          machine_state_next := M2_state;
          mem_refer_addr := PC_next + 1.U
          opcode_index := opcode_index + 1.U
        }
      }
      is(M2_state) {
        when(m1_t_cycle===2.U) {
          machine_state_next := MINOUT_state
          mem_refer_addr := Cat(A, opcodes(1))
          PC_next := PC_next + 1.U
        }
      }
      is(MINOUT_state) {
        io.bus.addr := mem_refer_addr
        switch(m1_t_cycle) {
          is(1.U) {
            /*
            when(opcodes(0)(3)===0.U) {
              io.bus.data1 := A
            }
            */
            when(fallingedge(clock.asBool())) {
              when(opcodes(0)(3)===0.U) {
                io.bus.data1 := A
              }
            }
          }
          is(2.U) {
            when(opcodes(0)(3)===0.U) {
              io.bus.data1 := A
            }
            when(fallingedge(clock.asBool())) {
              io.bus.IORQ_ := 0.U
              when(opcodes(0)(3)===1.U) { // IN A,(N)
                io.bus.RD_ := 0.U
              } otherwise { // OUT A,(N)
                io.bus.WR_ := 0.U
              }
            }
          }
          is(3.U) {
            when(opcodes(0)(3)===0.U) {
              io.bus.data1 := A
            }
            machine_state_next := M1_state
          }
          is(4.U) {
            when(opcodes(0)(3)===0.U) {
              io.bus.data1 := A
            }
             when(fallingedge(clock.asBool())) {
              io.bus.IORQ_ := 1.U
              when(opcodes(0)(3)===1.U) { // IN A,(N)
                io.bus.RD_ := 1.U
              } otherwise { // OUT A,(N)
                io.bus.WR_ := 1.U
              }
            }
            opcode_index := 0.U
          }
        }
      }
    }
  
  }

def call(opcode:UInt) {
  /* call  17  M1(4) M2(3) M2(3) MX M3(3) M3(3) */
//  val sub_state = 0.U
//  printf(p"machine_state ${machine_state}\n")

  val op = WireDefault(Cat(opcodes(0)(0), opcodes(0)(5,3)))
  val cond = MuxCase(0.B,
    Array(
      (op === "b1001".U) -> 1.B,
      (op === "b0000".U && Z_flag === 0.U) -> 1.B,
      (op === "b0001".U && Z_flag === 1.U) -> 1.B,
      (op === "b0010".U && C_flag === 0.U) -> 1.B,
      (op === "b0011".U && C_flag === 1.U) -> 1.B,
      (op === "b0100".U && PV_flag=== 0.U) -> 1.B,
      (op === "b0101".U && PV_flag=== 1.U) -> 1.B,
      (op === "b0110".U && S_flag === 0.U) -> 1.B,
      (op === "b0111".U && S_flag === 1.U) -> 1.B,
    )
  )

  switch(machine_state) {
    is(M1_state) {
      switch(m1_t_cycle) {
        is(1.U) {
          PC_next := PC_next + 1.U
//          println("\n")
        }
        is(2.U) {
          machine_state_next := M2_state
//          PC_next := PC_next + 1.U
          mem_refer_addr := PC_next + 1.U
          opcode_index := opcode_index + 1.U
//          sub_state := 0.U
        }
        is(3.U) {

//          PC_next := PC_next + 1.U
        }
      }
    }
    is(M2_state) {
//      PC_next := PC_next + 1.U
      switch(m1_t_cycle) {
        /*
        is(1.U) {
        }
        */
        is(2.U) {
          mem_refer_addr := PC_next + 1.U
              PC_next := PC_next + 1.U
          opcode_index := opcode_index + 1.U
          when(opcode_index===2.U) {
            when(cond === 1.U) {
              machine_state_next := MX_state_8
            } .otherwise {
              machine_state_next := M1_state
              opcode_index := 0.U
            }
//            mem_refer_addr90 := 
            dummy_cycle := 1.U
//            PC_next := PC_next + 1.U
          }
        }
        /*
        is(3.U) {
        }
        */
      }
    }
    is(MX_state_8) {
      alu16.io.input_register := SP
     switch(m1_t_cycle) {
        is(1.U) {
          machine_state_next := M3_state
        }
      }
    }
    is(M3_state) {
      alu16.io.input_register := SP
             mem_refer_addr := alu16.io.output
      when(m1_t_cycle===2.U) {
        switch(opcode_index) {
          is(3.U) {
      alu16.io.input_register := SP
      alu16.io.offset := -0.S
             mem_refer_addr := alu16.io.output
            opcode_index := opcode_index + 1.U

           io.bus.data1 := PC(15,8)
          }
          is(4.U) {
      alu16.io.input_register := SP
//      alu16.io.offset := -1.S
             alu16.io.offset := -1.S
            machine_state_next := M1_state
            opcode_index := 0.U
           io.bus.data1 := PC(7,0)
            SP := alu16.io.output
            PC_next := Cat(opcodes(2),opcodes(1))
          }
        }
      }
    }
  }
}

def daa(opcode:UInt) {
  val temp = RegInit(regfiles_front(A_op)(8.U))

}

def rst(opcode:UInt) {
  // M1(4) MX(1) M3(3) M3(3)
  val adr = opcode(5,3) << 3.U
  val tmp = RegInit(PC+1.U)

  switch(machine_state) {
    is(M1_state) {
       when(m1_t_cycle===2.U) {
         dummy_cycle := 0.U
         machine_state_next := MX_state_8
         opcode_index := opcode_index + 1.U
       }     
    }
    is(MX_state_8) {
      when(fallingedge(clock.asBool())) {
      machine_state_next := M3_state
      machine_state:= M3_state
      mem_refer_addr := SP
      }
   }
    is(M3_state) {
      switch(opcode_index) {
        is(1.U) {
          io.bus.data1 := PC(15,8)
          when(m1_t_cycle===3.U) {
            SP := SP - 1.U
            opcode_index := opcode_index + 1.U
          }
        }
        is(2.U) {
          io.bus.data1 := PC(7,0)
          when(m1_t_cycle===3.U) {
            io.bus.data1 := PC(7,0)
            mem_refer_addr := SP
            SP := SP - 1.U
            machine_state_next := M1_state
            PC_next := adr
            opcode_index := 0.U
          }
        }
      }
    }
  }
}

def shift_rotate(opcode:UInt) {
  val temp = Reg(UInt(8.W))
  val pre_F = Reg(UInt(8.W))
  var ofs = 0.U

  switch(m1_t_cycle) {
    is(2.U) {
      pre_F := regfiles_front(F_op)
      switch(opcode(4,3)) {
        is("b00".U) {
          // RLCA
          temp := Cat(A(6,0), A(7))
          regfiles_front(F_op) := regfiles_front(F_op).bitSet(0.U, A(7))
        }
        is("b01".U) {
          // RRCA
          temp := Cat(A(0), A(7,1))
          regfiles_front(F_op) := regfiles_front(F_op).bitSet(0.U, A(0))
        }
        is("b10".U) {
          // RLA
          temp := Cat(A(6,0) , C_flag)
//          C_flag := A(7)
          regfiles_front(F_op) := regfiles_front(F_op).bitSet(0.U, A(7))
        }
        is("b11".U) {
          // RRA
          temp := Cat(C_flag, A(7,1))
          regfiles_front(F_op) := regfiles_front(F_op).bitSet(0.U, A(0))
        }
      }
    }
    is(3.U) {
      regfiles_front(A_op) := temp
      machine_state_next := M1_state
      opcode_index := 0.U
    }
  }
}

def ld_rpp_a(opcode:UInt) {
  // LD (BC/DE),A   M1(4) M3(3)
  // LD (nn), A     M1(4) M2(3) M2(3) M3(3)
  switch(machine_state) {
    is(M1_state) {
      switch(m1_t_cycle) {
        is(3.U) {
          opcode_index := opcode_index + 1.U
          when(opcode(5)) {
            machine_state_next := M2_state
            mem_refer_addr := PC_next //+ 1.U
          } otherwise {
            mem_refer_addr := Mux(opcode(4), Cat(D, E), Cat(B, C))
            machine_state_next := M3_state
          }
        }
      }
    }
    is(M2_state) {
      opcode_index := opcode_index + 1.U
      switch(opcode_index) {
        is(1.U) {
          mem_refer_addr := PC_next + 1.U
        }
        is(2.U) {
          mem_refer_addr := Cat(opcodes(2), opcodes(1))
          machine_state_next := M3_state
        }
      }
      PC_next := PC_next + 1.U
    }
    is(M3_state) {
      when(opcode_index === 1.U || (opcode_index === 3.U && opcode(4))) {
        io.bus.data1 := A
        machine_state_next := M1_state
        opcode_index := 0.U
      } .elsewhen((opcode_index === 3.U || opcode_index === 4.U) && ~opcode(4)) {
        switch(opcode_index) {
          is(3.U) {
            io.bus.data1 := L
            mem_refer_addr := mem_refer_addr + 1.U
            opcode_index := opcode_index + 1.U
          }
          is(4.U) {
            io.bus.data1 := H 
            machine_state_next := M1_state
            opcode_index := 0.U
          }
        }
      }/* .otherwise {
        opcode_index := opcode_index + 1.U
      }*/
    }
  }
}

def ex_af_afp(opcode:UInt) {
  val tmp = Reg(Vec(2, UInt(8.W)))

  switch(m1_t_cycle) {
    is(2.U) {
      tmp(0) := regfiles_front(A_op)
      tmp(1) := regfiles_front(F_op)
      regfiles_front(A_op) := regfiles_back(A_op) 
      regfiles_front(F_op) := regfiles_back(F_op) 
    }
    is(3.U) {
      regfiles_back(A_op) := tmp(0)
      regfiles_back(F_op) := tmp(1)
      machine_state_next := M1_state
    }
    is(4.U) {
    }
  }
}

def cf(opcode:UInt) {
  when(m1_t_cycle === 3.U) {
    switch(opcode(3)) {
      is(0.B) { 
        // scf
        regfiles_front(F_op) := regfiles_front(F_op).bitSet(0.U, 1.B)
      }
      is(1.B) {
        // ccf
        regfiles_front(F_op) := regfiles_front(F_op).bitSet(0.U, ~C_flag)
      }
    }
  }
}

def jr(opcode:UInt) {
  // JR M1(4) M2(3) MX(5)
  // JR condition  M1(4) M2(3) MX(7)
  // DJNZ condition  M1(4) M2(3) MX(8)

  val cond =
    MuxCase(0.B,
      Array(
        (opcode === "b00011000".U) -> 1.B,
        (opcode === "b00111000".U) -> C_flag,
        (opcode === "b00110000".U) -> ~C_flag,
        (opcode === "b00101000".U) -> Z_flag,
        (opcode === "b00100000".U) -> ~Z_flag,
        (opcode === "b00010000".U && B =/= 0x00.U) -> 1.B,
      )
    )

  switch(machine_state) {
    is(M1_state) {
      switch(m1_t_cycle) {
        is(3.U) {
          opcode_index := opcode_index + 1.U
          mem_refer_addr := PC_next
          machine_state_next := M2_state
          PC_next := PC_next + 1.U
        }
      } 
    }
    is(M2_state) {

      dummy_cycle :=
        MuxCase(5.U, 
          Array(
            (opcode === 0x10.U) -> 6.U,
          )
        )

      machine_state_next := MX_state_8
//      PC_next := PC_next + 1.U
    }
    is(MX_state_8) {
      when(m1_t_cycle===4.U) {
        machine_state_next := M1_state
        opcode_index := 0.U
        when(cond) {
          PC_next := PC_next + Cat(Fill(8, opcodes(1)(7)),opcodes(1))
        }
      }
    }
  }
}

def ld_rp_nn(opcode:UInt) {
  val rhp :: rlp :: Nil = rp_pair_af(opcode(5,4))
  switch(machine_state) {
    is(M1_state) {
      switch(m1_t_cycle) {
        is(3.U) {
          opcode_index := opcode_index + 1.U
          machine_state_next := M2_state
          mem_refer_addr := PC_next //+ 1.U
         }
        is(4.U) {
        }
      }
    }
    is(M2_state) {
      mem_refer_addr := PC_next
      switch(opcode_index) {
        is(1.U) {
          switch(m1_t_cycle) {
            is(2.U) {
              PC_next := PC_next + 1.U
              mem_refer_addr := PC_next + 1.U
              opcode_index := opcode_index + 1.U
              when(opcode(5,4) === 3.U) {
              } .otherwise {
                regfiles_front(rlp) := opcodes(1)
              }
            } 
            is(3.U) {
            }
          }
        }
        is(2.U) {
          switch(m1_t_cycle) {
            is(2.U) {
              PC_next := PC_next + 1.U
              machine_state_next := M1_state
              opcode_index := 0.U
              when(opcode(5,4) === 3.U) {
                SP := Cat(opcodes(2), opcodes(1))
              } .otherwise {
                regfiles_front(rhp) := opcodes(2)
              }
            } 
            is(3.U) {
            }
          }
        }
      }
    }
  }
}

  def add16(opcode:UInt) {

  }

  def exx(opcode:UInt) {
    val regfiles_tmp = Reg(Vec(8, UInt(8.W)))

    for( r <- List(B_op, C_op, D_op, E_op, H_op, L_op)) {
      when(m1_t_cycle === 2.U) {
        regfiles_tmp(r) := regfiles_front(r)
      } .otherwise {
        regfiles_front(r) := regfiles_back(r)
        regfiles_back(r) := regfiles_tmp(r)
      }
    }
  }

  def ex_spa_hl(opcode:UInt) {
    // M1(4) M2(3) M2(3) MX(3) M3(3) M3(3)   5/19
    val tmph = Reg(UInt(8.W))
    val tmpl = Reg(UInt(8.W))
    switch(machine_state) {
      is(M1_state) {
        switch(m1_t_cycle) {
          is(2.U) {
            tmph := H
            tmpl := L
          }
          is(3.U) {
            mem_refer_addr := SP
            machine_state_next := M2_state
            opcode_index := opcode_index + 1.U
          }
        }
     }
      is(M2_state) {
        switch(opcode_index) {
          is(1.U) {
            regfiles_front(L_op) := io.bus.data
            mem_refer_addr := SP + 1.U
            opcode_index := opcode_index + 1.U
          }
          is(2.U) {
            regfiles_front(H_op) := io.bus.data
            mem_refer_addr := SP
            opcode_index := opcode_index + 1.U
            dummy_cycle := 3.U
            machine_state_next := MX_state_8
          }
        }
      }
      is(MX_state_8) {
        machine_state_next := M3_state
      }
      is(M3_state) {
        switch(opcode_index) {
          is(3.U) {
              io.bus.data1:= tmpl
            when(m1_t_cycle === 2.U) {
//              io.bus.data1:= tmpl
            } .otherwise {
              when(fallingedge(clock.asBool())) {
              mem_refer_addr := SP + 1.U
//            io.bus.data1:= tmph
              }
              opcode_index := opcode_index + 1.U
            }
          }
          is(4.U) {
              io.bus.data1:= tmph
            when(m1_t_cycle === 2.U) {
//              io.bus.data1:= tmph

/*
              machine_state_next := M1_state
              opcode_index := 0.U
              */
 //             mem_refer_addr := SP + 1.U
              when(fallingedge(clock.asBool())) {
                 machine_state_next := M1_state
              opcode_index := 0.U
              io.bus.data1:= tmph
              }
            } .otherwise {
                machine_state_next := M1_state
              opcode_index := 0.U
              io.bus.data1:= tmph
              when(risingedge(clock.asBool())) {
             io.bus.data1:= tmph
              }
//              opcode_index := opcode_index + 1.U
//              io.bus.data1:= tmph
            }
          }
        }
      }
    }
  }


  val opcodes = Mem(4, UInt(8.W))
  val opcode_index = RegInit(0.U(8.W))

  var to_be_read = RegInit(0.U(8.W))
  def decode (/*instruction:UInt*/) = {
//    printf(p"----decode ${Hexadecimal(opcodes(0))} ${Hexadecimal(opcodes(1))}\n")
    when (opcodes(0) === BitPat("b00000000")) {/*printf("NOP\n");*/ nop(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b11011001")) {/*printf("exx\n");*/  exx(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11100011")) {/*printf("exx\n");*/  ex_spa_hl(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b00001000")) {/*printf("LD rp,nn\n");*/  ex_af_afp(opcodes(0));}

    .elsewhen (opcodes(0) === BitPat("b00??1010")) {/*printf("LD rp,nn\n");*/  ld_rr_rp_nn(opcodes(0));}

//    .elsewhen (opcodes(0) === BitPat("b0010?010")) {/*printf("LD rp,nn\n");*/  ld_hl_nnp(opcodes(0));}

    .elsewhen (opcodes(0) === BitPat("b0011?111")) {/*printf("LD rp,nn\n");*/  cf(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b00???000")) {/*printf("LD rp,nn\n");*/  jr(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b00??0010")) {/*printf("LD rp,nn\n");*/  ld_rpp_a(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b00??0001")) {/*printf("LD rp,nn\n");*/  ld_rp_nn(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b000??111")) {/*printf("inout\n");*/  shift_rotate(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11??0?01")) {/*printf("inout\n");*/  push_pop(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11???111")) {/*printf("inout\n");*/  rst(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b1101?011")) {/*printf("inout\n");*/  in_out(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b1111?011")) {/*printf("DI/EI\n");*/  iff(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11001101") || opcodes(0) === BitPat("b11???100")) {/*printf("CALL\n");*/  call(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11???00?")) {/*printf("RET\n");*/  ret(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b00???011")) {/*printf("inc/dec16\n");*/  inc_dec_16(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b00???10?")) {/*printf("inc/dec\n");*/  inc_dec(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b01110110")) {/*printf("HALT\n");*/  halt(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b01110???")) {/*printf("LD (HL),r\n");*/  ld_mem_r(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b01??????")) {/*printf("LD r1,r2\n");*/  ld_r1_r2_hl(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b0????110")) {/*printf("LD r,n_(hl)\n");*/  ld_a_n(opcodes(0)); }
    .elsewhen (opcodes(0) === BitPat("b10??????") || opcodes(0) === BitPat("b11???110")) {/*printf("ADD A,r\n");*/  add_a_r(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11000011") || opcodes(0) === BitPat("b11???010")) {/*printf("JP nn");*/  jp(opcodes(0));}
    .elsewhen (opcodes(0) === BitPat("b11011101")) {/*printf("DD");*/  ld_r_ix_iy_d(opcodes(0));}
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

  io.M1 := io.bus.M1_

  alu.io.input_A := 0.U
  alu.io.input_B := 0.U
  alu.io.calc_type := 0.U
  alu.io.input_carry := 0.B

  val m1_t_cycle = RegInit(1.U(8.W))

  def fallingedge(x: Bool) = !x && RegNext(x)
  def risingedge(x: Bool) = x && !RegNext(x)

  val dummy_cycle = RegInit(0.U)

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
          io.bus.addr := PC_next
          PC_next := PC_next + 1.U
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
          decode()
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
          io.bus.MREQ_ := 1.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
            io.bus.RD_ := 0.U
          }
          opcodes(opcode_index) := io.bus.data
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
          // write memory 
          io.bus.MREQ_ := 1.B
          when(fallingedge(clock.asBool)) {
            io.bus.MREQ_ := 0.B
          }
        } .elsewhen(m1_t_cycle === 2.U) {
          when(fallingedge(clock.asBool)) {
            io.bus.WR_ := 0.B
          }
          io.bus.MREQ_ := 0.B
          decode()
        } .elsewhen(m1_t_cycle === 3.U) {
          io.bus.MREQ_ := 0.B
          io.bus.WR_ := 0.B
          when(fallingedge(clock.asBool)) {
            io.bus.WR_ := 1.B
          }
          decode()
          PC := PC_next
          m1_t_cycle := 1.U
          machine_state := machine_state_next
        }
      }
      is(MX_state_8) {
        when(m1_t_cycle < dummy_cycle) {
          m1_t_cycle := m1_t_cycle + 1.U
        } .otherwise {
          m1_t_cycle := 1.U
          machine_state := machine_state_next
        }
        decode()
      }
      is(MINOUT_state) {
//        machine_state := machine_state_next
        when(m1_t_cycle < 4.U) {
          m1_t_cycle := m1_t_cycle + 1.U
        } .otherwise {
          m1_t_cycle := 1.U
        machine_state := machine_state_next
        }
        decode()
      }
    }
  } 

  when(fallingedge(reset.asBool)) {
    PC := 0.U
    m1_t_cycle := 1.U
//    io.bus.addr := PC
  }

  //**********************************
  // Debug
//  io.exit := (data === 0x34.U(8.W))
  io.exit := (data.asUInt === BitPat("b11111111")) //&& (m1_t_cycle === 4.U)
  /*
  printf("--------\n")
  printf(p"PC: 0x${Hexadecimal(PC)}\n")
  printf(p"opcode: 0x${Hexadecimal(opcodes(0))}\n")
//  printf(p"m1: 0x${Hexadecimal(io.dd.m1)}\n")
  printf(p"m1: 0x${Hexadecimal(m1_t_cycle)}\n")
  printf(p"iff: 0x${Hexadecimal(IFF)}\n")
  printf(p"data: 0x${Hexadecimal(io.bus.data)}\n")
  printf(p"rd: 0x${Hexadecimal(io.bus.RD_)}\n")
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
*/
}
