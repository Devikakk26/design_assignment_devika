module top_module_tb;
reg clk_tb,rst_tb;
reg [7:0] sin_tb;
wire [7:0] dout_tb;
top_module dut(clk_tb,rst_tb,sin_tb,dout_tb);
initial
begin
clk_tb = 0;
rst_tb = 1;
sin_tb = 0;
#12 rst_tb = 0;
end
always #5 clk_tb = ~clk_tb;
initial
begin
#15 sin_tb = 8'h4f;
#10 sin_tb = 8'h23;
#10 sin_tb = 8'h74;
#10 sin_tb = 8'h5d;
#10 sin_tb = 8'ha3;
#10 sin_tb = 8'h69;
#10 sin_tb = 8'h10;
#10 sin_tb = 8'h56;
#10
#250;
$finish;
end
endmodule
