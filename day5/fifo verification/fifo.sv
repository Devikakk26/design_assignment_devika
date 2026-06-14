module fifo(input clk,rst, wr_enb, rd_enb,input [7:0] data_in,output reg full, empty,output reg [7:0] data_out
);
reg [7:0] mem[7:0];
reg [2:0] wr_ptr, rd_ptr;
reg [3:0] count;
integer i;
assign full  = (count == 4'd8);
assign empty = (count == 4'd0);
always @(posedge clk)
begin
  if(rst) begin
wr_ptr <= 0;
rd_ptr <= 0;
count  <= 0;
data_out <= 0;

for(i=0;i<8;i=i+1)
mem[i] <= 0;
end
else begin
case({wr_enb,rd_enb})
2'b10: begin // write only
if(!full)
begin
mem[wr_ptr] <= data_in;
wr_ptr <= wr_ptr + 1'b1;
count <= count + 1'b1;
end
end

2'b01: begin // read only
if(!empty)
begin
data_out <= mem[rd_ptr];
rd_ptr <= rd_ptr + 1'b1;
count <= count - 1'b1;
end
end
2'b11: begin 
if(!full && !empty)
begin
mem[wr_ptr] <= data_in;
data_out <= mem[rd_ptr];
wr_ptr <= wr_ptr + 1'b1;
rd_ptr <= rd_ptr + 1'b1;
end
end
endcase
end
