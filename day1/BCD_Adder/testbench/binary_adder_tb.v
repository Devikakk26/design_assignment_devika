module binary_adder_tb();
reg [3:0]a_tb;
reg [3:0]b_tb;
reg CIN;
wire [3:0]sum_tb;
wire COUT;
binary_adder ba1(a_tb,b_tb,CIN,sum_tb,COUT);
initial
begin
{a_tb,b_tb,CIN}=0;
end
initial
begin
a_tb=4'b0110;
b_tb=4'b1000;
CIN=1'b1;
#1
a_tb=4'b1001;
b_tb=4'b0000;
CIN=1'b0;
#1
a_tb=4'b0011;
b_tb=4'b1001;
CIN=1'b1;
#1
a_tb=4'b0110;
b_tb=4'b1001;
CIN=1'b0;
#1
a_tb=4'b0010;
b_tb=4'b0001;
CIN=1'b1;
#1;
$finish;
end
endmodule
