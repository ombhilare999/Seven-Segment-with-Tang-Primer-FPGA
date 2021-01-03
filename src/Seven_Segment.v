module Seven_Segment
	(
		input wire CLK_IN,
		input wire RST_N,
		output reg [6:0] OUTPUT
	);

	parameter time1 = 25'd24_000_000;  //24 MHz counter

	parameter zero   = 7'b1111110;  //Value for zero
	parameter one    = 7'b0110000;  //Value for one
	parameter two    = 7'b1101101;  //Value for two
	parameter three  = 7'b1111001;  //Value for three
	parameter four   = 7'b0110011;  //Value for four
	parameter five   = 7'b1011011;  //Value for five
	parameter six    = 7'b1011111;  //Value for six
	parameter seven  = 7'b1110001;  //Value for seven
	parameter eight  = 7'b1111111;  //Value for eight
	parameter nine   = 7'b1110011;  //Value for nine
	parameter A      = 7'b1110111;  //Value for A
	parameter B      = 7'b0011111;  //Value for B 
	parameter C      = 7'b1001110;  //Value for C
	parameter D      = 7'b0111101;  //Value for D
	parameter E      = 7'b1001111;  //Value for E
	parameter F      = 7'b1000111;  //Value for F

	reg [24:0] count;
	reg [3:0] number = 4'b0000;

	always @(posedge CLK_IN) begin
		if(RST_N==0) begin			//Code for reset
			OUTPUT <= zero;
			number <= 4'b0000;
			count <= 25'd0;
		end
	
		if(count == time1) 
		begin
			if(number > 4'd15) begin
				number <= 4'b0;
			end
			else begin
				case(number)
					4'b0000: OUTPUT <= zero;
					4'b0001: OUTPUT <= one;
					4'b0010: OUTPUT <= two;
					4'b0011: OUTPUT <= three;
					4'b0100: OUTPUT <= four;
					4'b0101: OUTPUT <= five;
					4'b0110: OUTPUT <= six;
					4'b0111: OUTPUT <= seven;
					4'b1000: OUTPUT <= eight;
					4'b1001: OUTPUT <= nine;
					4'b1010: OUTPUT <= A;
					4'b1011: OUTPUT <= B;
					4'b1100: OUTPUT <= C;
					4'b1101: OUTPUT <= D;
					4'b1110: OUTPUT <= E;
					4'b1111: OUTPUT <= F;
					default: OUTPUT <= zero;
				endcase
				
			end
			count <= 25'd0;
			number <= number + 1'b1;
		end
		else begin
 			count <= count + 1'b1;
		end
 	end
endmodule
