module full_subtractor (
    input wire A,
    input wire B,
    input wire Bin,
    output wire Diff,
    output wire Bout
);
    assign Diff = A ^ B ^ Bin;
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);
endmodule
