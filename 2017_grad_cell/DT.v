module DT(
	input 			clk,
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	 	[9:0]	sti_addr ,
	input		[15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	 	[7:0]	res_do,
	input		[7:0]	res_di
	);

	localparam init = 4'd0;
	localparam forward_read_pixel = 4'd1;
	localparam pixel_plus = 4'd2;
	localparam read_forward = 4'd3;
	localparam write_pixel = 4'd4;
	localparam backward_read_pixel = 4'd5;
	localparam read_backward = 4'd6;
	localparam pixel_sub = 4'd7;
	localparam finish = 4'd8;


	reg [3:0] state,next_state;
	reg [13:0] pixel_addr ;
	reg [7:0] pixel_reg;
	reg [2:0] counter;
	reg [7:0] min_value;
	reg flag;

	assign sti_addr = pixel_addr[13:4];
	assign res_do = min_value + flag;

	wire forward_pixel = sti_di[~pixel_addr[3:0]];
	wire [6:0] x,y;
	assign x = pixel_addr[6:0];
	assign y = pixel_addr[13:7];
	wire picture_board = (flag)? (x==126):(x==1);
	wire [13:0] forward [0:3];
	assign forward[0] = pixel_addr -129;
	assign forward[1] = pixel_addr -128;
	assign forward[2] = pixel_addr -127;
	assign forward[3] = pixel_addr -1;
	wire [13:0] backward [0:3];
	assign backward[0] = pixel_addr +129;
	assign backward[1] = pixel_addr +128;
	assign backward[2] = pixel_addr +127;
	assign backward[3] = pixel_addr +1;

	always@(posedge clk or negedge reset)begin
		if(!reset)begin
			state <= init;
		end else begin
			state <= next_state;
		end
	end

	always@(*)begin
		if(!reset)begin
			next_state <= init;
		end else begin
			case(state)
				init:begin
					next_state <= forward_read_pixel;
				end
				forward_read_pixel:begin
					next_state <= (forward_pixel==0)? pixel_plus: read_forward;
				end
				pixel_plus:begin
					next_state <=  (pixel_addr ==16254)? backward_read_pixel  :forward_read_pixel ;
				end
				read_forward:begin
					next_state <= (res_di == 0 || counter==3)? write_pixel: read_forward;
				end
				write_pixel:begin
					next_state <= (flag)? pixel_plus:pixel_sub;
				end

				backward_read_pixel:begin
					next_state <= (res_di==0)? pixel_sub:read_backward ;
				end
				read_backward:begin
					next_state<= (res_di==0 || counter==3) ? write_pixel:read_backward;
				end
				pixel_sub:begin
					next_state <= (pixel_addr ==192)? finish:backward_read_pixel;
				end
				finish:begin
					next_state <= finish;
				end
				default:begin
					next_state <= init;
				end
			endcase //(state)
		end
	end

	always@(*)begin
		done <= 0;
    	sti_rd<= 0;
    	res_rd<=0;
    	res_wr<=0;
		res_addr<=0;
    	case(state)
    		forward_read_pixel:begin
    			sti_rd <= 1;
			end
    		read_forward:begin
    			res_rd <= 1;
				res_addr <= forward[counter];
    		end
    		write_pixel:begin
    			res_wr<=1;
				res_addr <= pixel_addr;
    		end
			backward_read_pixel:begin
				res_rd<=1;
				res_addr <= pixel_addr;
			end
			read_backward:begin
				res_rd<=1;
				res_addr <= backward[counter];
			end
			finish:begin
				done<=1;
			end
    		default:begin
    		end
    	endcase//(state)
    end


	always@(posedge clk or negedge reset)begin
		if(!reset)begin
			pixel_addr <= 14'd129;
			flag <= 1;
			//pixel_reg <= 8'd0;
			min_value <= 8'hFF;
		end else begin
			case(state)
				init:begin
					flag<=1;
				end
				forward_read_pixel:begin
					//pixel_reg <= forward_pixel;
					min_value <= 8'hFF;
				end
				backward_read_pixel:begin
					min_value <= res_di;
				end
				pixel_plus:begin
					if(pixel_addr < 16254)
						pixel_addr <= pixel_addr + {picture_board,1'b1} ;
					else
						flag <= 0;
				end
				pixel_sub:begin
					pixel_addr <= pixel_addr - {picture_board,1'b1};
				end
				read_forward:begin
					min_value <= (res_di<min_value)? res_di:min_value;
				end
				read_backward:begin
					min_value <= (res_di+1 < min_value)? res_di+1:min_value;
				end
				write_pixel:begin

				end

			endcase //(state)
		end
	end

	always@(posedge clk or negedge reset)begin
		if(!reset)begin
			counter <= 0;
		end else begin
			case(state)
				read_forward,read_backward:begin
					counter <= counter + 1;
				end
				pixel_plus,pixel_sub:begin
					counter <= 0;
				end
			endcase//(state)
		end
	end

endmodule

