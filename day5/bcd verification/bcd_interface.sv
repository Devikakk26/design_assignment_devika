interface bcd_adder_if(

    );
 logic [3:0]a;
 logic [3:0]b;
 logic Cin;
 logic [3:0]sum;
 logic cout; 
endinterface

module bcd_interface(

    );
    bcd_adder_if aif();
    bcd_adder dut(aif.a,aif.b,aif.Cin,aif.sum,aif.cout);
    initial begin
aif.a=4;
aif.b=3;
aif.Cin=1'b1;
#10;
aif.a=3;
aif.b=7;
aif.Cin=1'b0;
end
initial begin
$monitor("sum of %d , %d and carry %d is sum %d and carry %d",aif.a,aif.b,aif.Cin,aif.sum,aif.cout);
#15;
$finish;
end
endmodule
