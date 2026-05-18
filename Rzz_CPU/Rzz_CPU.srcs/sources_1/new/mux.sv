`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/18/2026 10:31:15 AM
// Design Name:
// Module Name: mux
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module mux(
        input logic a,
        input logic b,
        input logic sel,
        output logic y
    );

// Continuous assignment
assign y = (sel == 1'b1) ? b : a;

endmodule
