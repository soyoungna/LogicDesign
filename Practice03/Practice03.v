module mux2to1_cond(  out,
                      in0,
                      in1,
                      sel);
output          out;
input           in0;
input           in1;
input           sel;


assign  out = (sel)? in1 : in0 ;

endmodule


module mux2to1_if( out, in0, in1, sel);

output          out;
input           in0;
input           in1;
input           sel;

reg             out;

always @(in0, in1, sel) begin
      if(sel == 1'b0) begin
       out = in0 ;
    end else begin 
       out = in1 ;
    end
    
end
endmodule

module mux2to1_case( out, in0, in1, sel);

output    out;
input     in0;
input     in1;
input     sel;

reg      out;

always @(sel, in1, in0) begin
      case( {sel, in1, in0})
        3'b000 :{out} = 1'b0; 
        3'b001 :{out} = 1'b1;
        3'b010 :{out} = 1'b0;                   
        3'b011 :{out} = 1'b1;             
        3'b100 :{out} = 1'b0;
        3'b101 :{out} = 1'b0;
        3'b110 :{out} = 1'b1;
        3'b111 :{out} = 1'b1;
      endcase
      
end
endmodule 
        

module mux4to1_if(out, in, sel);

output out;

input [3:0] in;

input [1:0] sel;


reg out;

always @( in, sel) begin
      if(sel == 2'b00)begin
        out = in[0];
    end else if(sel == 2'b01) begin
        out = in[1];
    end else if(sel == 2'b10) begin
      out = in[2];
  end else begin 
    out = in[3];
  end
  
end
endmodule


    
module mux4to1_case(out, in, sel);
  
  output out;
  input  [3:0] in;
  input  [1:0] sel;
  
reg out;

always @(in, sel) begin
  case( sel )
    2'b00 :{out} = in[0];
    2'b01 :{out} = in[1];
    2'b10 :{out} = in[2];
    2'b11 :{out} = in[3];
  endcase
end 
endmodule

module mux4to1_cond(out, in, sel);
  
  output      out;
  
  input [3:0] in;
  input [1:0] sel;
  
  wire  [1:0] cy;
  
 mux2to1_cond   uo( .out(cy[0]),
                   .in0(in[0]),
                   .in1(in[1]),
                   .sel(sel[0]));
               
 mux2to1_cond   u1( .out(cy[1]),
                    .in0(in[2]),
                    .in1(in[3]),
                    .sel(sel[0]));
               
 mux2to1_cond   u2( .out(out),
                    .in0(cy[0]),
                    .in1(cy[1]),
                    .sel(sel[1]));        

endmodule      
               
               
                
  

