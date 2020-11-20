module fsm_test;

reg  clk, rst, inp;
wire outp;
reg[15:0] sequence;
integer i;

//fsm_moore dut( clk, rst, inp, outp);
fsm_mealy dut(clk,rst,inp,outp);
initial
begin

   clk = 0;
        rst = 1;
        sequence = 16'b0101_0111_0111_0010;
   #5 rst = 0;

   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = sequence[i];
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut.state, " Input = ", inp, ", Output = ", outp);

   end
        test2;
end
task test2;
   for( i = 0; i <= 15; i = i + 1)
   begin
      inp = $random % 2;
      #2 clk = 1;
      #2 clk = 0;
      $display("State = ", dut.state, " Input = ", inp, ", Output = ", outp);

   end
endtask
initial
begin
$dumpfile("test.vcd");
$dumpvars(0,fsm_test);  
end

endmodule