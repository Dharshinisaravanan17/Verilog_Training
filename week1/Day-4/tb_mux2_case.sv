module tb_mux2_case;
  reg a,b,sel;
  wire y;
  
  mux2_case uut(.a(a), .b(b), .sel(sel), .y(y));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    a=0;b=1;sel=0; #10;
    sel=1;         #10;
    a=1;b=0;sel=0; #10;
    sel=1;         #10;
    
    $finish;
  end
endmodule
    