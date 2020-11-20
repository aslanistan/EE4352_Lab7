module fsm_test2;

reg  clk, rst, inp;
wire outp;
reg[31:0] sequence;
integer i;

fsm dut( clk, rst, inp, outp);

initial
begin

   clk = 0;
        rst = 1;
        sequence = 32'b0101_0111_0111_0010_0100_1111_0110_1011;
   #5 rst = 0;

   for( i = 0; i <= 31; i = i + 1)
   begin
      inp = sequence[i];
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut.state, " Input = ", inp, ", Output = ", outp);

   end
end

initial
begin
$dumpfile("test.vcd");
$dumpvars(0,fsm_test2);  
end

endmodule