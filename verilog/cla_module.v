module CLA(input [3:0] A_in, B_in, input Cin, clk, output [3:0] S, output Cout);

  wire [3:0] A, B;
  wire [3:0] P, G;
  wire [4:0] C;

  d_ff dff_A0(.D(A_in[0]), .clk(clk), .Q(A[0]));
  d_ff dff_A1(.D(A_in[1]), .clk(clk), .Q(A[1]));
  d_ff dff_A2(.D(A_in[2]), .clk(clk), .Q(A[2]));
  d_ff dff_A3(.D(A_in[3]), .clk(clk), .Q(A[3]));

  d_ff dff_B0(.D(B_in[0]), .clk(clk), .Q(B[0]));
  d_ff dff_B1(.D(B_in[1]), .clk(clk), .Q(B[1]));
  d_ff dff_B2(.D(B_in[2]), .clk(clk), .Q(B[2]));
  d_ff dff_B3(.D(B_in[3]), .clk(clk), .Q(B[3]));

  assign P = A ^ B; 
  assign G = A & B;  

  assign C[0] = Cin;
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
  assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
  assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

  assign Cout = C[4];

  assign S = P ^ C[3:0];

endmodule



module d_ff(
  input D, clk,
  output reg Q
);
  always @(posedge clk) begin
    Q <= D;
  end
endmodule

