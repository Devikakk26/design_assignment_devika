module top_module(input clk,rst,input [7:0] sin,output [7:0] dout
);

wire [7:0] sout, fifo_out;
wire rd_enb, full, empty;
face_module fm1(clk,sin,sout
);
fifo ff1(clk,rst,1'b1,rd_enb,sout,full,empty,fifo_out);
  out_module om1(clk,rst,fifo_out,rd_enb,dout);

endmodule
