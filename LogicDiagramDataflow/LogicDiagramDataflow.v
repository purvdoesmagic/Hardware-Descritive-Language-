module logic_diagram_dataflow (
    input wire A,
    input wire B,
    input wire C,
    output wire D,
    output wire E
);
    assign D = A | B;
    assign E = D & C;
endmodule
