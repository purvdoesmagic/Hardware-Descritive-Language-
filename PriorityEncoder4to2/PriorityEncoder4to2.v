module priority_encoder4to2(I, Y, Valid);

input [3:0] I;
output reg [1:0] Y;
output reg Valid;

always @(*)
begin
    if (I[3] == 1) begin
        Y = 2'b11;
        Valid = 1;
    end
    else if (I[2] == 1) begin
        Y = 2'b10;
        Valid = 1;
    end
    else if (I[1] == 1) begin
        Y = 2'b01;
        Valid = 1;
    end
    else if (I[0] == 1) begin
        Y = 2'b00;
        Valid = 1;
    end
    else begin
        Y = 2'b00;
        Valid = 0;
    end
end

endmodule
