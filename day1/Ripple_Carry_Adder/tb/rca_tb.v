module rca_tb(

    );
    reg [3:0]A;
    reg [3:0]B;
    reg CIN;
    wire [3:0]S;
    wire COUT;
    rca rca1(A,B,CIN,S,COUT);
 initial 
 begin
 {A,B,CIN}=0;
 end
initial
 begin
 A=4'b0000;
 B=4'b0000;
 CIN=1'b0;
 #1
 A=4'b0010;
 B=4'b0100;
 CIN=1'b1;
 #1
 A=4'b1110;
 B=4'b0110;
 CIN=1'b1;
 #1
 A=4'b0011;
 B=4'b1100;
 CIN=1'b1;
 #1;
 end
endmodule
