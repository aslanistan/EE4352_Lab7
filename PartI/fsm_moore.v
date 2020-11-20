module fsm_moore(clk,rst,inp,outp);
input inp; 
input clk,rst; 
output reg outp;  
reg [2:0] state;

always @(posedge clk, posedge rst) 
begin
 if(rst)
  state <= 3'b000; 
  else
  begin
      case (state)
      3'b000:
        begin
            if(inp) state <= 3'b001;
            else state <= 3'b000;
        end
       3'b001:
        begin
            if(inp) state <= 3'b001;
            else state <= 3'b010;
        end       
       3'b010:
        begin
            if(inp) state <= 3'b011;
            else state <= 3'b000;
        end  
       3'b011:
        begin
            if(inp) state <= 3'b100;
            else state <= 3'b010;
        end  
       3'b100:
        begin
            if(inp) state <= 3'b001;
            else state <= 3'b010;
        end
      endcase 
  end
end
always @(posedge clk, posedge rst)
begin
    if(rst)
    outp <=0;
    else if (state == 3'b100)
    outp <= 1;
    else
    outp <=0;
end

endmodule 