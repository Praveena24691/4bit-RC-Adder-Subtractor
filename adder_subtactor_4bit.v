// --- PART 1: The Small Component (1-bit Full Adder) ---
module full_adder(
    input a, 
    input b, 
    input cin,
    output sum, 
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


// --- PART 2: The Big Component (4-bit Top Level) ---
module adder_subtractor_4bit(
    input [3:0] A, 
    input [3:0] B,
    input M,            // M=0 for Add, M=1 for Subtract
    output [3:0] Sum,
    output Cout
);
    // Internal wires to connect the carry from one adder to the next
    wire c0, c1, c2; 
    wire [3:0] B_xor_M;

    // Logic for 2's complement subtraction
    assign B_xor_M = B ^ {4{M}};
    // Hierarchical Instantiation: 
    // We are "plugging in" 4 copies of the full_adder module
    full_adder fa0 (A[0], B_xor_M[0], M,  Sum[0], c0);
    full_adder fa1 (A[1], B_xor_M[1], c0, Sum[1], c1);
    full_adder fa2 (A[2], B_xor_M[2], c1, Sum[2], c2);
    full_adder fa3 (A[3], B_xor_M[3], c2, Sum[3], Cout);

endmodule
