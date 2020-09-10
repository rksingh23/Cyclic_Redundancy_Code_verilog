//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: CRC.v
// Purpose: Implement cyclic redundancy check (CRC)to detect accidental changes to raw data.
// Concept: 1. CRC is commonly used in digital networks and storage devices.
//          2. Based on the remainder of a polynomial division of their contents,a short check value attached to the transmitted data.
//          3. On retrieval the calculation is repeated, if the check values do not match we declare the presumed data to be corrupted. 
//          4. Our CRC module encodes a 32-bit of message with a 4-bit CRC using a polynomial,
//          5. Frequency : 250MHz clock and “RST” is asserted for 2 cycles at the beginning of simulation.
//
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



`timescale 1ns/1ns
module CRC(D_IN, CLK, RST, D_OUT);
  input CLK, RST;
  input[31:0] D_IN;
  output [35:0] D_OUT;
  integer i;
  reg [35:0] temp_din,temp_1;

always@(posedge CLK)
begin
if (RST)
temp_1<=36'b0;
else
temp_1<={D_IN,temp_din[3:0]};
end

always@(*)
begin
temp_din={D_IN,4'b0000};
for (i=35;i>3;i=i-1)
begin
if(temp_din[i]==1)
begin
temp_din[i-:5]=((temp_din[i-:5])^(5'b10011));
end
else
begin
temp_din[i-:5]=temp_din[i-:5];
end
end
end

assign D_OUT=temp_1;

endmodule