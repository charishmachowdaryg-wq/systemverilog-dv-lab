
module tb;
  reg clk,rst;
  reg wr_en,rd_en;
  reg [63:0]data_in;
  wire [63:0] data_out;
  wire full,empty;
   
  logic [63:0] exp_q[$];
  logic [63:0] expected=0;

  sync_fifo dut(.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));
   
   always #5 clk=~clk;
    initial begin
      clk=0;
      rst=1;
      wr_en=0;
      rd_en=0;
      data_in=0;
      #10 rst=0;
      for(int i=0;i<128;i++)
        begin
      wr_en=1; 
      data_in=$urandom;
          #10;
     // data_in=8'hB2; #10;
    //  data_in=8'hC3; #10;
    //  wr_en=0;
    //  rd_en=1;#20;
      //rd_en=0;
        end
      for(int i=0;i<128;i++)
        begin
      wr_en=0;
          #10 rd_en=1; 
     // data_in=8'hA1; #10;
        end
      #30;
      $finish;
  end
  reg [63:0] prev_expected=0;

always @(posedge clk) begin
  if (wr_en && !full)
    exp_q.push_back(data_in);

  if (rd_en && !empty)
    expected = exp_q.pop_front();

  if (rd_en && !empty) begin

    if (expected !== prev_expected) begin
      prev_expected = expected;
      #1;

      if (data_out === expected)
        $display("PASS: expected=%0h actual=%0h", expected, data_out);
      else
        $display("FAIL: expected=%0h actual=%0h", expected, data_out);
    end

  end

end
      

    initial    $monitor("time=%0t,wr_en=%b,rd_en=%b,data_in=%h,data_out=%h,full=%b,empty=%b",$time,wr_en,rd_en,data_in,data_out,full,empty);
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule