/*
* A vectorized buffer. Takes from the input one bit at a time and serves 9-bit
* vectors, buffering `nb_vectors` vectors.
*/


// TODO: Add #vectors parameter. Needs to be a power of 2 for right overflows
module vector_buffer
    #(parameter nb_vectors = 8)
(
    input bit,
    input bit_valid,
    input clk,

    input req,
    output [7:0] vector,
    output valid,

);
  // The actual ring buffer
  // TODO: Size is #vectors
  reg [7:0][nb_vectors - 1:0] buffer; 

  // Both consumer and producer indices
  // TODO: Size is log2(#vectors): [log2(#vectors)-1:0]
  reg [$clog2(nb_vectors) - 1:0] cons;
  reg [$clog2(nb_vectors) - 1:0] prod;
  reg is_empty;

  // Among the currently produced vector, the number
  // of bits already filled
  reg [2:0] fill;

  initial begin
    cons = 0;
    prod = 0;
    fill = 0;
    is_empty = 1;
  end

  always @(posedge clk) begin
    // TODO; 
    if (bit_valid) begin
        // An input bit is present
        if ((cons != prod) || is_empty) begin
            // We can store it

            // Shift the vector and append the input bit
            buffer[prod] = (buffer[prod] << 1) | {7'b0000000, bit}; 
            fill = fill + 1;
            // We have completed a vector
            if (fill == 0)
              prod = prof + 1;
        end
    end

    // TODO: consumer
  end

  // If no request or no data to send, output 0
  assign vector = buffer[0];
endmodule
