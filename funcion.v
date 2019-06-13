module counter(
 input clk,
 input rst,
 input in1,
 input in2,
 input in3,
 output reg [2:0] freg,
 output reg [2:0] freg1,
 output reg [2:0] freg2,
 output reg led0,
 output reg led1,
 output reg led2,
 output reg [31:0] c
);

reg [31:0] counter;
reg [31:0] countrp;

reg [2:0] reg1;
reg [2:0] reg2;
reg [2:0] reg3;

reg [4:0] cs;
reg [4:0] ns;

always @ (posedge clk) begin
 if(rst)
  ns<=5'd0;
 else
  cs<=ns;
end

always @ (*) 
case(cs) 
 5'd0:begin
  if(in1)
   ns<=5'd1;
  else if(in2)
   ns<=5'd2;
  else if(in3) 
   ns<=5'd3;
  else
   ns<=5'd0;
 end
 5'd1: begin 
  if(counter == 200) 
   ns<=5'd4;
  else
   ns<=5'd1;
 end
 5'd2:begin
  if(counter == 200) 
   ns<=5'd4;
  else
   ns<=5'd2;
 end
 5'd3: begin
  if(counter == 200) 
   ns<=5'd4;
  else
   ns<=5'd3;
 end
 5'd4:begin
   if(in1)
    ns<=5'd5;
   else if(in2)
    ns<=5'd6;
   else if(in3)
    ns<=5'd7;
   else
    ns<=5'd4;
 end
 5'd5:begin
  if(counter == 200) 
   ns<=5'd8;
  else
   ns<=5'd5;
 end
 5'd6:begin
  if(counter == 200) 
   ns<=5'd8;
  else
   ns<=5'd6;
 end
 5'd7:begin
  if(counter == 200) 
   ns<=5'd8;
  else
   ns<=5'd7;
 end
 5'd8:begin
   if(in1)
    ns<=5'd9;
   else if(in2)
    ns<=5'd10;
   else if(in3)
    ns<=5'd11;
   else
    ns<=5'd8;
 end
 5'd9:begin
  if(counter == 200) 
   ns<=5'd12;
  else
   ns<=5'd9;
 end
 5'd10:begin
  if(counter == 200) 
   ns<=5'd12;
  else
   ns<=5'd10;
 end
 5'd11:begin
  if(counter == 200) 
   ns<=5'd12;
  else
   ns<=5'd11;
 end
 5'd12:begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  else
   ns<=5'd13;
 end
 5'd13: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(reg1 == 3'b001)
   ns<=5'd14;
  if(reg1 == 3'b010)
   ns<=5'd15;
  if(reg1 == 3'b100)
   ns<=5'd16;
 end
 5'd14: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd17;
  else;
     ns<=5'd14;
 end
 5'd15: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd17;
  else;
     ns<=5'd15;
 end
 5'd16: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd17;
  else;
     ns<=5'd16;
 end
 5'd17: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(reg2 == 3'b001)
   ns<=5'd18;
  if(reg2 == 3'b010)
   ns<=5'd19;
  if(reg2 == 3'b100)
   ns<=5'd20;
 end
 5'd18: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd21;
  else;
     ns<=5'd18;
 end
 5'd19: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd21;
  else;
     ns<=5'd19;
 end
 5'd20: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd21;
  else;
     ns<=5'd20;
 end
 5'd21: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(reg3 == 3'b001)
   ns<=5'd22;
  if(reg3 == 3'b010)
   ns<=5'd23;
  if(reg3 == 3'b100)
   ns<=5'd24;
 end
 5'd22: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd25;
  else;
     ns<=5'd22;
 end
 5'd23: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd25;
  else;
     ns<=5'd23;
 end
 5'd24: begin
  if(in1 || in2 || in3)
     ns<=5'd26;
  if(counter == 200)
     ns<=5'd25;
  else;
     ns<=5'd24;
 end
endcase

always @ (*) 
case(cs)
 5'd0:begin
  countrp = 0;
  freg <= 0;
  freg1 <= 0;
  freg2 <= 0;
  led0 <= 0;
  led1 <= 0;
  led2 <= 0;
 end
 5'd1: begin
  countrp = counter + 1;
  led0 <= 1;
  reg1 <= 3'b001;
 end
 5'd2:begin
  countrp = counter + 1;
  led1 <= 1;
  reg1 <= 3'b010;
 end
 5'd3:begin
  countrp = counter + 1;
  led2 <= 1;
  reg1 <= 3'b100;
 end 
 5'd4:begin
  countrp <= 0;
  led0 <= 0;
  led1 <= 0;
  led2 <= 0;
 end
 5'd5: begin
  countrp = counter + 1;
  led0 <= 1;
  reg2 <= 3'b001;
 end
 5'd6: begin
  countrp = counter + 1;
  led1 <= 1;
  reg2 <= 3'b010;
 end
 5'd7: begin
  countrp = counter + 1;
  led2 <= 1;
  reg2 <= 3'b100;
 end
 5'd8:begin
  countrp <= 0;
  led0 <= 0;
  led1 <= 0;
  led2 <= 0;
 end
 5'd9:begin
  countrp = counter + 1;
  led0 <= 1;
  reg3 <= 3'b001;
 end 
 5'd10:begin
  countrp = counter + 1;
  led1<=1;
  reg3 <= 3'b010;
 end
 5'd11:begin
  countrp = counter + 1;
  led2<=1;
  reg3 <= 3'b100;
 end
 5'd12: begin
  countrp <= 0;
  freg <= reg1;
  freg1 <= reg2;
  freg2 <= reg3;
  led0 <= 0;
  led1 <= 0;
  led2 <= 0;
 end
 5'd14: begin
  countrp = counter + 1;
  led0 <= 1;
 end  
 5'd15: begin
  countrp = counter + 1;
  led1 <= 1;
 end 
 5'd16: begin
  countrp = counter + 1;
  led2 <= 1;
 end 
 5'd17:begin
  countrp<=0;
  led0 <= 0;
  led1 <= 0;
  led2 <= 0;
 end
 5'd25: begin
  led0 <= 1;
  led1 <= 0;
  led2 <= 1;
 end  
endcase

always @ (posedge clk) begin
 counter <=  countrp;
 c <= counter;
end

endmodule
