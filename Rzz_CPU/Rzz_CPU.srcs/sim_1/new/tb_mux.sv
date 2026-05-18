`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 05/18/2026 11:18:09 AM
// Design Name:
// Module Name: tb_mux
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

// We don't need any port cause it's the top level
module tb_mux();

logic tb_a;
logic tb_b;
logic tb_sel;
logic tb_y;

// Instantiate the mux (DUT = Device Under Test)
mux dut (
    .a(tb_a),
    .b(tb_b),
    .sel(tb_sel),
    .y(tb_y)
);

initial begin
	// Simulation starts here at time 0

	// Initialize inputs
	tb_a = 1'b0;
	tb_b = 1'b0;
	tb_sel = 1'b0;

	// Wait for 10 time units
	#10;

	tb_a = 1'b1;
	#10;

	tb_sel = 1'b1;
	#10;


end

endmodule
