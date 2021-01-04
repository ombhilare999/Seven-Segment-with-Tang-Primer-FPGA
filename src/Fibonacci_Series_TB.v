`include "Fibonacci_Series.v"
`include "Seven_Segment.v"

module Fibonacci_Series_TB
(
    input wire clk,
    input wire RST_N,
    output wire [13:0]Segment_out
);

    wire [7:0]OUT;
    reg [24:0] count;
    reg clk_slow = 1'b0;
    reg reset = 1'b1;

    parameter time1 = 25'd24_000_000;  //24 MHz counter

    //Creating Fibonacci_Series instant
    Fibonacci_Series i1
    (
        .CLK_IN(clk_slow),
        .RST_N(reset),
        .SEQUENCE(OUT)
    );

    //Creating Seven_Segment instant
    Seven_Segment i2
    (
        .CLK_IN(clk_slow),
        .NUMBER_IN(OUT[7:4]),
        .OUTPUT(Segment_out[13:7])
    );

    //Creating Seven_Segment instant
    Seven_Segment i3
    (
        .CLK_IN(clk_slow),
        .NUMBER_IN(OUT[3:0]),
        .OUTPUT(Segment_out[6:0])
    );


	always @(posedge clk) begin
		if(RST_N==0) begin			//Code for reset
			count <= 25'd0;
            clk_slow <= 1'b0;         
		end
	
		if(count == time1) begin
			count <= 25'd0;
            clk_slow <= ~clk_slow;
			reset <= 1'b0;        
        end
        else begin 
 			count <= count + 1'b1;
        end
    end
endmodule