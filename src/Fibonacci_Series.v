module Fibonacci_Series
( 
    input wire CLK_IN,
    input wire RST_N,
    output wire [7:0]SEQUENCE
);

reg [7:0] SEQUENCE_I1,SEQUENCE_I2;

assign SEQUENCE = RST_N ? 15'b1 :(SEQUENCE_I1 + SEQUENCE_I2);

always@(posedge CLK_IN) begin 
    if(SEQUENCE < 8'hDA) begin 
        SEQUENCE_I2 = SEQUENCE_I1;
        SEQUENCE_I1 = SEQUENCE;
    end 
    else begin 
        SEQUENCE_I2 = 15'b1;
        SEQUENCE_I1 = 15'b0;
    end 
end 
endmodule


