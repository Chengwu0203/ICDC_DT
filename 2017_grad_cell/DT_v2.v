module DT(
input 			 clk,
input			 reset,
output			 done ,
output			 sti_rd ,
output 	[9:0]	 sti_addr ,
input	[15:0]	 sti_di,
output			 res_wr ,
output			 res_rd ,
output 	[13:0]	 res_addr ,
output reg [7:0] res_do,
input	[7:0]	 res_di
);

reg [2:0] status, next_status;
reg [2:0] work;
reg [2:0] count;
reg [7:0] data;
reg [6:0] x,y;

wire [6:0] a1 = y + 1'd1;
wire [6:0] a2 = y - 1'd1;
wire [6:0] a3 = x + 1'd1;
wire [6:0] a4 = x - 1'd1;
wire [6:0] a5 = x + 2'd2;
wire [6:0] a6 = x - 2'd2;

assign sti_rd = |work[1:0];
assign res_wr = work[0] | (count == 4) ;
assign res_rd = 1'b1;
assign done = work[2];

assign sti_addr = {y, x} >> 4;
assign res_addr = {y, x};
//======================================================= status
always @(posedge clk, negedge reset) begin
	if(!reset) status <= 0;
	else 	  status <= next_status;
end

always @(*) begin
	case(status)
		0: next_status = 1;
		1:begin
			if(sti_di[~x[3:0]] == 1)
				next_status = 2;
			else if(&{y, x})
				next_status = 3;
			else
				next_status = 1;
		end
		2:begin
			if(!res_di | count == 4)
				next_status = 1;
			else
				next_status = 2;
		end
		3:	next_status = 4;
		4:begin
			if(!{y, x})
				next_status = 6;
			else if(res_di > 0)
				next_status = 5;
			else
				next_status = 4;
		end
		5:begin
			if(count == 4)
				next_status = 4;
			else
				next_status = 5;
		end
		6:	next_status = 6;
		default:begin

		end
	endcase
end

always @(*) begin
	case(status)
		1:	work = 3'b001;
		2:	work = 3'b010;
		5:	work = 3'b010;
		6:	work = 3'b100;
		default:work = 3'b000;
	endcase
end
//======================================================= count
always @(posedge clk, negedge reset) begin
	if(!reset)begin
		count <= 3'b0;
	end
	else begin
		if(work[1]) count <= count + 3'd1;
		else count <= 3'b0;
	end
end
//======================================================= x, y
always @(posedge clk) begin
	case(status)
		0:begin
			{y, x} <= {7'b1, 7'b1};
		end
		1:begin
			if(sti_di[~x[3:0]])
				{y, x} <= {a2, a4};
			else begin
				if(&x) {y, x} <= {a1, a3};
				else   {y, x} <= {y, a3};
			end
		end
		2:begin
			case(count)
				0:begin
					if(res_di)
						{y, x} <= {y, a3};
					else
						{y, x} <= {a1, a5};
				end
				1:begin
					if(res_di)
						{y, x} <= {y, a3};
					else
						{y, x} <= {a1, a3};
				end
				2:begin
					if(res_di)
						{y, x} <= {a1, a6};
					else
						{y, x} <= {a1, x};
				end
				3:begin
					if(res_di)
						{y, x} <= {y, a3};
					else
						{y, x} <= {y, a5};
				end
				default:begin
					{y, x} <= {y, a3};
				end
			endcase
		end
		3: {y, x} <= ~{7'b1, 7'b1};
		4:begin
			if(res_di > 0)
				{y, x} <= {a1, a3};
			else begin
				if(!x)  {y, x} <= {a2, a4};
				else	{y, x} <= {y, a4};
			end
		end
		5:begin
			if(count == 2)
				{y, x} <= {a2, a5};
			else
				{y, x} <= {y, a4};
		end
		default: {y, x} <= {7'b0, 7'b0};
	endcase
end
//======================================================= res_do
always @(*) begin
	case(status)
		1:	res_do = sti_di[~res_addr[3:0]];
		2:begin
			if(count == 4)	res_do = data + 8'd1;
			else res_do = 8'd0;
		end
		5:	res_do = data;
		default:res_do = 8'h0;
	endcase
end
//======================================================= data
always @(posedge clk, negedge reset) begin
	if(!reset)begin
		data <= 8'hff;
	end
	else begin
		case(status)
			2:begin
				if(data > res_di)
					data <= res_di;
				else
					data <= data;
			end
			4:	data <= res_di;
			5:begin
				if(data > res_di + 1)
					data <= res_di + 8'd1;
				else
					data <= data;
			end
			default:data <= 8'hff;
		endcase
	end
end
endmodule
