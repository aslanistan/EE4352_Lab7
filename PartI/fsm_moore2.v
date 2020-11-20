module fsm(clk, rst, inp, outp); 

input clk,rst,inp;
output reg outp;
localparam S0 = 3'b000;
localparam S1 = 3'b001;
localparam S2 = 3'b010;
localparam S3 = 3'b011;
localparam S4 = 3'b100;
reg [2:0] state;

always @(posedge clk, posedge rst)
begin
    if(rst)
        state <= S0;
    else
    begin
    case (state)
    S0:
        begin
            if(inp) state <= S1;
            else state <= S0;
        end
    S1:
        begin
            if(inp) state <= S1;
            else state <= S2;
        end
    S2:
        begin
            if(inp) state <= S3;
            else state <= S0;
        end
    S3:
        begin
            if(inp) state <= S4;
            else state <= S2;
        end
    S4:
        begin
            if(inp) state <= S1;
            else state <= S2;
        end
    endcase
    end
end

always @(posedge clk, posedge rst)
begin
    if (rst) 
    outp <= 0;
    else if(state==S4)
    outp <=1;
    else 
    outp <=0;
end

endmodule