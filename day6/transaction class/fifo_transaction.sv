class transaction;
rand bit rst_tb,wrenb_tb,rdenb_tb;
rand bit [7:0] data_in_tb;
bit [7:0] data_out_tb;
bit full,empty;
constraint control_op{
rst_tb dist {0:=8,1:=2};
wrenb_tb dist {0:=3,1:=7};
rdenb_tb dist {0:=8,1:=2};
data_in_tb dist{[1:2]:/10,[3:88]:/90};
}
function void display();
$display ("rst_tb=%d,wren_tb=%d,rdenb_tb=%d,din=%d,dout=%d,full=%d,empty=%d",rst_tb,wrenb_tb,rdenb_tb,data_in_tb,data_out_tb,full,empty);
endfunction
endclass

module fifo_transaction(

    );
    transaction f;
  initial begin
    f=new();
    for(int i=0;i<10;i++) begin
      f.randomize();
      f.display();
      end
      $finish;
      end
endmodule
