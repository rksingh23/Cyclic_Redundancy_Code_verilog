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

module tb_CRC();

reg CLK, RST;
reg [31:0] D_IN;
wire[35:0] D_OUT;
  
CRC dut(.D_IN(D_IN),.CLK(CLK),.RST(RST),.D_OUT(D_OUT));

initial
begin
CLK=0;
forever #2 CLK=~CLK;
end

initial 
begin
RST=1;
#10
RST=0;
#5;
D_IN = 32'b 11111111111111111111111111111111;
#10;
D_IN = 32'b 00000000000000000000000000000000;
#10;
D_IN = 32'h12345678;
#10;
end
endmodule