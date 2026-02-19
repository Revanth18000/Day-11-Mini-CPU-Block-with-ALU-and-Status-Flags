module mini_cpu_tb;
reg clk;
reg reset ;
reg [7:0] a ;
reg [7:0] b ;
reg [1:0] sel ;

wire  [7:0] result ;
wire zero ;
wire carry ;

mini_cpu_block uut ( 
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .sel(sel),
    .result(result),
    .zero(zero),
    .carry(carry)
);

always #5 clk = ~clk ;

initial begin
    clk = 0 ;
    reset = 1;

    a=0;
    b=0;
    sel =0 ;

    #10 reset  =  0 ;

    a = 8'd10; b = 8'd5; sel = 2'b00; #10;  // ADD
    a = 8'd5;  b = 8'd5; sel = 2'b01; #10;  // SUB = 0 → zero flag
    a = 8'd8;  b = 8'd1; sel = 2'b00; #10;  // ADD
    a = 8'd4;  b = 8'd2; sel = 2'b10; #10;  // AND

    #30 $finish ;
end
endmodule