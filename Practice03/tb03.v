module tb_pri03 ;

reg in0;
reg in1;
reg sel;

wire out1 ;

wire out2 ;

wire out3 ;

mux2to1_cond   dut_1( .out(out1),
                      .in0(in0),
                      .in1(in1),
                      .sel(sel));

              
mux2to1_if     dut_2( .out(out2),
                      .in0(in0),
                      .in1(in1),
                      .sel(sel));
            
mux2to1_case    dut_3( .out(out3),
                       .in0(in0),
                       .in1(in1),
                       .sel(sel));  
                                         

initial begin 
  
       $display("Mux2to1_cond : out1");
       $display("mux2to1_if : out2");
       $display("mux2to1_case : out3");
       $display("================================================");
       $display("  in0  in1  sel  out1  out2  out3  ");
       $display("================================================");
       #(50) {in0, in1, sel} = 3'b000; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b001; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b010; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b011; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b100; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b101; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b110; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) {in0, in1, sel} = 3'b111; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d", in0, in1, sel, out1, out2, out3);
       #(50) $finish;
end

endmodule
  

module tb_prj03_2 ;

reg [3:0] in ;


reg [1:0] sel;

wire out1;
wire out2;
wire out3;

mux4to1_if      dut1(.out(out1),
                .in(in),
                .sel(sel));
mux4to1_case    dut2(.out(out2),
                .in(in),
                .sel(sel));  
                                    
mux4to1_cond   dut3(.out(out3),
                .in(in),
                .sel(sel));   
                
initial begin 
  
       $display("Mux2to1_cond : out1");
       $display("mux2to1_if : out2");
       $display("mux2to1_case : out3");
       $display("================================================");
       $display("   in[0]  in[1]  in[2]  in[3]  sel  out1  out2  out3  ");
       $display("================================================");
       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b000000; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);

       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b000001; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);
       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b000010; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);

       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b000100; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);

       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b001010; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);

       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b010001; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);
       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b100010; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);

       #(50) {in[0], in[1],in[2],in[3], sel} = 6'b111111; #(50)  $display("  %d\t%d\t%d\t%d\t%d\t%d\t%d\t%d", in[0], in[1], in[2], in[3], sel, out1, out2, out3);
       #(50) $finish;
end

endmodule      