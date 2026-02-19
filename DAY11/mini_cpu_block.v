module mini_cpu_block(
    input clk ,
    input reset ,
    input [7:0] a,
    input [7:0] b,
    input [1:0] sel ,
    output reg [7:0] result ,
    output reg zero ,
    output reg carry 
);

reg [8:0] sum ; // 9 - bit to capture the carry 

always @(*)begin
    sum = a + b ;    
end


always @(posedge clk ) begin
    if(reset)begin
        result <= 0 ;
        zero <= 0;
        carry <= 0;
    end
    else begin
        case(sel)
            2'b00: begin
                result <= sum[7:0] ;
                carry <= sum[8];
            end
            2'b01 : begin
                result <= a-b;
                carry <= 0;
            end
            2'b10: begin 
                result <= a  & b ;
                carry <= 0 ;
            end
            2'b11:begin
                result <= a | b ;
                carry <= 0 ;
            end
        endcase

        if (reset == 0 )
            zero <= 1 ;
        else 
            zero <= 0 ;
    end
end
endmodule