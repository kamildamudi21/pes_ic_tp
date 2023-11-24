module pes_ripco(input clk , input reset , output [1:0] q);
reg [1:0]q_int;

always @ (posedge clk, posedge reset)
begin
	if(reset)
		q_int[0] <= 1'b0;
	else
		q_int[0] <= ~q_int[0];
end


always @ (posedge q_int[0], posedge reset)
begin
	
	if(reset)
		q_int[1] <= 1'b0;
	else
		q_int[1] <= ~q_int[1];

end

assign q = q_int;

endmodule

/*
module pes_ripco (
    input clk, 
    input reset, 
    output [1:0] q
);
    reg [1:0] q_int;

    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            q_int <= 2'b00; // Resetting both bits
        end else begin
            q_int[0] <= ~q_int[0]; // Toggling the first bit at every clock cycle
        end
    end

    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            q_int[1] <= 1'b0; // Resetting the second bit
        end else if (q_int[0] == 1'b1) begin // Toggling the second bit when the first bit is high
            q_int[1] <= ~q_int[1];
        end
    end

    assign q = q_int; // Assigning the internal register to the output

endmodule
*/
