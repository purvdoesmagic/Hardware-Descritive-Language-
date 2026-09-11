module mux2to1_bufif (
    input wire I0,
    input wire I1,
    input wire S,
    output wire Y
);
    bufif0 (Y, I0, S);
    bufif1 (Y, I1, S);
endmodule
