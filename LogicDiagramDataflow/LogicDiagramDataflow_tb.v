`timescale 1ns/1ps

module logic_diagram_dataflow_tb;
    reg A;
    reg B;
    reg C;
    wire D;
    wire E;

    logic_diagram_dataflow dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E)
    );

    initial begin
        $dumpfile("LogicDiagramDataflow.vcd");
        $dumpvars(0, logic_diagram_dataflow_tb);

        A = 0; B = 0; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 0; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 0; #10;
        A = 1; B = 1; C = 1; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t A=%b B=%b C=%b D=%b E=%b", $time, A, B, C, D, E);
    end
endmodule
