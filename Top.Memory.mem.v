module BindsTo_0_Memory(
  input         clock,
  input         reset,
  input  [15:0] io_imem_addr,
  output [7:0]  io_imem_data,
  input  [7:0]  io_imem_data1,
  input         io_imem_RD_,
  input         io_imem_WR_,
  input         io_imem_MREQ_
);

initial begin
  $readmemh("src/hex/fetch.hex", Memory.mem);
end
                      endmodule

bind Memory BindsTo_0_Memory BindsTo_0_Memory_Inst(.*);