module cla_proj;
  reg [3:0] A_in, B_in;
  reg Cin, clk;
  wire [3:0] S;
  wire Cout;

  CLA cla_ff_inst(.A_in(A_in), .B_in(B_in), .Cin(Cin), .clk(clk), .S(S), .Cout(Cout));

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock period of 10 units
  end

  // Testbench logic
  initial begin
    $dumpfile("proj.vcd");
    $dumpvars(0, cla_proj);

    // Test cases with Cin = 0
    Cin = 0;
    A_in = 4'b0000; B_in = 4'b0000; #10;
    A_in = 4'b0001; B_in = 4'b0001; #10;
    A_in = 4'b0010; B_in = 4'b0010; #10;
    A_in = 4'b0011; B_in = 4'b0011; #10;
    A_in = 4'b0100; B_in = 4'b0100; #10;
    A_in = 4'b0101; B_in = 4'b0101; #10;
    A_in = 4'b0110; B_in = 4'b0110; #10;
    A_in = 4'b0111; B_in = 4'b0111; #10;
    A_in = 4'b1000; B_in = 4'b1000; #10;
    A_in = 4'b1001; B_in = 4'b1001; #10;
    A_in = 4'b1010; B_in = 4'b1010; #10;
    A_in = 4'b1011; B_in = 4'b1011; #10;
    A_in = 4'b1100; B_in = 4'b1100; #10;
    A_in = 4'b1101; B_in = 4'b1101; #10;
    A_in = 4'b1110; B_in = 4'b1110; #10;
    A_in = 4'b1111; B_in = 4'b1111; #10;

    // Test cases with Cin = 1
    Cin = 1;
    A_in = 4'b0000; B_in = 4'b0000; #10;
    A_in = 4'b0001; B_in = 4'b0001; #10;
    A_in = 4'b0010; B_in = 4'b0010; #10;
    A_in = 4'b0011; B_in = 4'b0011; #10;
    A_in = 4'b0100; B_in = 4'b0100; #10;
    A_in = 4'b0101; B_in = 4'b0101; #10;
    A_in = 4'b0110; B_in = 4'b0110; #10;
    A_in = 4'b0111; B_in = 4'b0111; #10;
    A_in = 4'b1000; B_in = 4'b1000; #10;
    A_in = 4'b1001; B_in = 4'b1001; #10;
    A_in = 4'b1010; B_in = 4'b1010; #10;
    A_in = 4'b1011; B_in = 4'b1011; #10;
    A_in = 4'b1100; B_in = 4'b1100; #10;
    A_in = 4'b1101; B_in = 4'b1101; #10;
    A_in = 4'b1110; B_in = 4'b1110; #10;
    A_in = 4'b1111; B_in = 4'b1111; #10;

    $finish; // End simulation
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | A_in = %b, B_in = %b, Cin = %b | S = %b, Cout = %b", 
             $time, A_in, B_in, Cin, S, Cout);
  end
endmodule



// module cla_proj_tb;
//   reg [3:0] A_in, B_in; // 4-bit inputs
//   reg Cin;              // Carry-in
//   reg clk;              // Clock signal
//   wire [3:0] S;         // 4-bit sum output
//   wire Cout;            // Carry-out

//   // Instantiate the CLA module
//   CLA cla_inst (
//     .A_in(A_in), 
//     .B_in(B_in), 
//     .Cin(Cin), 
//     .S(S), 
//     .Cout(Cout)
//   );

//   // Generate clock signal
//   initial begin
//     clk = 0;
//     forever #5 clk = ~clk; // 10-timeunit clock period
//   end

//   // Generate all possible input combinations
//   integer i;
//   initial begin
//     $dumpfile("cla_proj.vcd"); // VCD file for GTKWAVE
//     $dumpvars(0, cla_proj_tb); // Dump all variables

//     // Systematic input generation
//     for (i = 0; i < 512; i = i + 1) begin
//       {A_in, B_in, Cin} = i;  // Assign combinations
//       #10;                   // Wait for 1 clock cycle
//     end

//     $finish; // End simulation
//   end

//   // Monitor values
//   initial begin
//     $monitor("Time=%0t | A_in=%b | B_in=%b | Cin=%b | S=%b | Cout=%b",
//              $time, A_in, B_in, Cin, S, Cout);
//   end
// endmodule
