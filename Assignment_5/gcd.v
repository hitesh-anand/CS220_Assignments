module gcd(
input [7:0] a,
input [7:0] b,
input clk,
input rst
);

reg [7:0] rem_a;
reg [7:0] rem_b;
reg [7:0] gcd = 8'hx;
reg [2:0] state = 3'h1;
reg done = 1'b0;
parameter S0 = 3'h1;
parameter S1 = 3'h2;
parameter S2 = 3'h3;
parameter S3 = 3'h4;


always @ (posedge clk or negedge clk) begin
    case(state)
        S0: 
                begin
                    rem_a <= a;
                    rem_b <= b;
                    done <= 1'b0;
                    if(rem_a < rem_b)
                    begin
                        rem_b <= rem_a;
                        rem_a <= rem_b;
                    end
                    state <= S1;
                end
        S1:  
                begin
                    if (done == 1'b1) begin
                        state <= S0;
                    end
                    else if (rem_b == 16'h0)
                    begin
                        state <= S3;
                    end
                    else begin
                        state <= S2;
                    end
                end
        S2: 
                begin
                    rem_a <= rem_b;
                    rem_b <= rem_a%rem_b;
                    state <= S1;
                end
        S3: 
                        begin
                            gcd <= rem_a;
                            done <= 1'b1;
                            state <= S1;
                        end

    endcase
end

always @(gcd) begin
    $display("At time : %d, a = %b, b = %b and gcd is %b", $time, a, b, gcd);
end

endmodule