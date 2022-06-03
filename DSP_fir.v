//Author:Pranav Prabhu
//Title:4-Tap FIR Filter

module DSP_fir(output reg signed[15:0]o_acc,input signed[7:0] i_a,input clock);
wire signed [7:0]h0,h1,h2,h3;
wire signed [15:0] mcm0,mcm1,mcm2,mcm3,add1,add2,add3;
wire signed [15:0] Q1,Q2,Q3;

//Filter coefficients
assign h0=-2;
assign h1=-1;
assign h2=-3;
assign h3=4;

//MUltiple Constant Multiplication Blocks
assign mcm0=h0*i_a;
assign mcm1=h1*i_a;
assign mcm2=h2*i_a;
assign mcm3=h3*i_a;

//Addition Block
assign add1=Q1+mcm2;
assign add2=Q2+mcm1;
assign add3=Q3+mcm0;

//Delay Block
dff ff1(.d(mcm3),.clk(clock),.q(Q1));
dff ff2(.d(add1),.clk(clock),.q(Q2));
dff ff3(.d(add2),.clk(clock),.q(Q3));

always@(posedge clock)
		o_acc<=add3;
endmodule
