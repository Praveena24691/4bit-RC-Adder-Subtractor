`timescale 1ns / 1ps

module tb_adder_subtractor();
    // Inputs (reg) and Outputs (wire)
    reg [3:0] A, B;
    reg M;
    wire [3:0] Sum;
    wire Cout;

    // --- This connects your Testbench to your Design ---
    adder_subtractor_4bit uut (
        .A(A), 
        .B(B), 
        .M(M), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        // Initialize
        A = 0; B = 0; M = 0;
        #20;
        
        // Test 1: Addition (5 + 3 = 8)
        A = 4'b0101; B = 4'b0011; M = 0; #20;
        
        // Test 2: Subtraction (5 - 3 = 2)
        A = 4'b0101; B = 4'b0011; M = 1; #20;
        
        // Test 3: Subtraction (3 - 5 = -2)
        A = 4'b0011; B = 4'b0101; M = 1; #20;
        
        $finish;
    end
endmodule