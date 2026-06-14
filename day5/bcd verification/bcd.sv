module fa(input a,b,cin,output sum,carry );
wire w1,w2,w3,w4;
xor(w1,a,b);
xor(sum,w1,cin);
and(w2,a,cin);
and(w3,a,b);
and(w4,b,cin);
or(carry,w2,w3,w4);
endmodule
module rca(input [3:0]a,input [3:0]b,input cin,output [3:0]s,output cout);
wire c1,c2,c3;
fa FA1(a[0],b[0],cin,s[0],c1);
fa FA2(a[1],b[1],c1,s[1],c2);
fa FA3(a[2],b[2],c2,s[2],c3);
fa FA4(a[3],b[3],c3,s[3],cout);
endmodule

module bcd_adder(input [3:0]a,input [3:0]b,input Cin,output [3:0]sum,output cout

    );
    wire [3:0]s,d;
wire e1,e2;
rca rca1(a,b,Cin,s,e1);
assign e2=(s[3]&s[2])|(s[3]&s[1])|e1;
assign d[3]=1'b0;
assign d[0]=1'b0;
assign d[1]=e2;
assign d[2]=e2;
rca rca2(s,d,1'b0,sum,cout);

endmodule
