module DT(
    input 			            clk,
    input			            reset,
    output	reg		            done,
    output	reg		            sti_rd,
    output	    	[9:0]	    sti_addr,
    input		    [15:0]	    sti_di,
    output	reg		            res_wr,
    output	reg		            res_rd,
    output	reg 	[13:0]	    res_addr,
    output	reg 	[7:0]	    res_do,
    input		    [7:0]	    res_di
    );
// ////////////////////////////////////////////////
// VAR
wire [13:0] addr;
reg  [2:0]  cnt;
reg  [6:0]  pos_y, pos_x;
reg         flag;
reg  [7:0]  min;
////////////////////////////////////////////////
// STATE

reg         [3:0] cs, ns;
parameter   [3:0] IDLE            = 4'h0,
                  READ_DATA       = 4'h1,
                  WRITE_MEM       = 4'h2,
                  FORWARD         = 4'h3,
                  FORWARD_WRITE   = 4'h4,
                  INITIAL         = 4'h5,
                  BACKWARD_READ   = 4'h6,
                  BACKWARD        = 4'h7,
                  BACKWARD_WRITE  = 4'h8,
                  DONE            = 4'h9;

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        cs <= IDLE;
    end
    else begin
        cs <= ns;
    end
end

always @(*)begin
    case(cs)
        IDLE:       ns <= READ_DATA;
        READ_DATA:  ns <= WRITE_MEM;
        WRITE_MEM:begin
            if(sti_di[~pos_x[3:0]] == 1'h0)begin
                if((&pos_y) && (&pos_x))begin
                    ns <= INITIAL;
                end
                else if(&pos_x[3:0])begin
                    ns <= READ_DATA;
                end
                else begin
                    ns <= WRITE_MEM;
                end
            end
            else begin
                ns <= FORWARD;
            end
        end
        FORWARD:begin
            if(min == 8'h0)begin
                ns <= FORWARD_WRITE;
            end
            else begin
            if(cnt == 3'h5)begin
                ns <= FORWARD_WRITE;
            end
            else begin
                ns <= FORWARD;
            end
            end
        end
        FORWARD_WRITE:begin
            if(&pos_x[3:0])begin
                ns <= READ_DATA;
            end
            else begin
                ns <= WRITE_MEM;
            end
        end
        INITIAL:    ns <= BACKWARD_READ;
        BACKWARD_READ:begin
            if((!(| pos_x)) || (& pos_x) || (!(| pos_y)) || (& pos_y))begin
                if((pos_x == 7'h0) && (pos_y == 7'h0))begin
                    ns <= DONE;
                end
                else begin
                    ns <= BACKWARD_READ;
                end
            end
            else begin
                if(res_di == 8'h0)begin
                    ns <= BACKWARD_READ;
                end
                else begin
                    ns <= BACKWARD;
                end
            end
        end
        BACKWARD:begin
            if(cnt == 3'h5)begin
                ns <= BACKWARD_WRITE;
            end
            else begin
                ns <= BACKWARD;
            end
        end
        BACKWARD_WRITE:     ns <= BACKWARD_READ;
    endcase
end
////////////////////////////////////////////////
// FLAG

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        flag <= 1'h0;
    end
    else begin
        if((cs == WRITE_MEM) && (ns == FORWARD))begin
            flag <= 1'h1;
        end
        else begin
            flag <= 1'h0;
        end
    end
end
////////////////////////////////////////////////
// CNT

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        cnt <= 3'h0;
    end
    else begin
        case(cs)
            FORWARD:    cnt <= cnt + 3'h1;
            INITIAL:    cnt <= 3'h0;
            BACKWARD:   cnt <= cnt + 3'h1;
            default:    cnt <= 3'h0;
        endcase
    end
end
////////////////////////////////////////////////
// POSITION

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        {pos_y, pos_x} <= 14'h0;
    end
    else begin
        if((cs == WRITE_MEM) && (ns == FORWARD))begin
            {pos_y, pos_x} <= {pos_y, pos_x};
        end
        else if(cs == FORWARD_WRITE)begin
            {pos_y, pos_x} <= {pos_y, pos_x} + 14'h1;
        end
        else if(cs == WRITE_MEM)begin
            {pos_y, pos_x} <= {pos_y, pos_x} + 14'h1;
        end
        else if(cs == INITIAL)begin
            {pos_y, pos_x} <= {7'h7f, 7'h7f};
        end
        else if(cs == BACKWARD_READ)begin
            if((!(| pos_x)) || (& pos_x) || (!(| pos_y)) || (& pos_y))begin
                {pos_y, pos_x} <= {pos_y, pos_x} - 14'h1;
            end
            else begin
                if(res_di == 8'h0)begin
                    {pos_y, pos_x} <= {pos_y, pos_x} - 14'h1;
                end
                else begin
                    {pos_y, pos_x} <= {pos_y, pos_x};
                end
            end
        end
        else if(cs == BACKWARD_WRITE)begin
            {pos_y, pos_x} <= {pos_y, pos_x} - 14'h1;
        end
    end
end
////////////////////////////////////////////////
// ADDR

assign sti_addr = {pos_y, pos_x[6:4]};

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        sti_rd <= 1'h0;
    end
    else begin
        if(ns == READ_DATA)  sti_rd <= 1'h1;
        else                 sti_rd <= 1'h0;
    end
end
////////////////////////////////////////////////
// MEM

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        res_wr <= 1'h0;
    end
    else begin
        if((cs == WRITE_MEM) && (ns == FORWARD))begin
            res_wr <= 1'h0;
        end
        else if(cs == WRITE_MEM)begin
            res_wr <= 1'h1;
        end
        else if(ns == FORWARD_WRITE)begin
            res_wr <= 1'h1;
        end
        else if(ns == BACKWARD_WRITE)begin
            res_wr <= 1'h1;
        end
        else begin
            res_wr <= 1'h0;
        end
    end
end

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        res_rd <= 1'h0;
    end
    else begin
        if((cs == FORWARD) && (ns == FORWARD_WRITE))begin
            res_rd <= 1'h0;
        end
        else if(cs == FORWARD)begin
            res_rd <= 1'h1;
        end
        else if(cs == BACKWARD_READ)begin
            res_rd <= 1'h1;
        end
        else if((cs == BACKWARD) && (ns == BACKWARD_WRITE))begin
            res_rd <= 1'h0;
        end
        else if((cs == BACKWARD))begin
            res_rd <= 1'h1;
        end
        else begin
            res_rd <= 1'h0;
        end
    end
end

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        res_addr <= 14'h0;
    end
    else begin
        case(cs)
            WRITE_MEM:          res_addr <= {pos_y, pos_x};
            FORWARD:begin
                if(min == 8'h0)begin
                    res_addr <= {pos_y, pos_x};
                end
                else begin
                    case(cnt)
                        0:          res_addr <= {pos_y - 7'h1, pos_x - 7'h1};
                        1:          res_addr <= {pos_y - 7'h1, pos_x       };
                        2:          res_addr <= {pos_y - 7'h1, pos_x + 7'h1};
                        3:          res_addr <= {pos_y       , pos_x - 7'h1};
                        default:    res_addr <= {pos_y       , pos_x       };
                    endcase
                end
            end
            INITIAL:            res_addr <= {pos_y, pos_x};
            BACKWARD_READ:      res_addr <= {pos_y, pos_x};
            BACKWARD:begin
                case(cnt)
                    0:          res_addr <= {pos_y       , pos_x       } + 14'h1;
                    1:          res_addr <= {pos_y       , pos_x + 7'h1} + 14'h1;
                    2:          res_addr <= {pos_y + 7'h1, pos_x - 7'h1} + 14'h1;
                    3:          res_addr <= {pos_y + 7'h1, pos_x       } + 14'h1;
                    4:          res_addr <= {pos_y + 7'h1, pos_x + 7'h1} + 14'h1;
                    default:    res_addr <= {pos_y       , pos_x       } + 14'h1;
                endcase
            end
        endcase
    end
end

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        res_do <= 8'h0;
    end
    else begin
        if((cs == WRITE_MEM) && (ns == FORWARD))begin
            res_do <= 8'h0;
        end
        else if(cs == WRITE_MEM)begin
            res_do <= {7'h0, sti_di[~pos_x[3:0]]};
        end
        else if(ns == FORWARD_WRITE)begin
            res_do <= (min + 7'h1);
        end
        else if(ns == BACKWARD_WRITE)begin
            res_do <= min;
        end
        else begin
            res_do <= 8'h0;
        end
    end
end
////////////////////////////////////////////////
// PROCESS

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        min <= 7'h7f;
    end
    else begin
        case(cs)
            FORWARD:begin
                case(cnt)
                    1:          min <= res_di;
                    2:          min <= (min > res_di) ? res_di : min;
                    3:          min <= (min > res_di) ? res_di : min;
                    4:          min <= (min > res_di) ? res_di : min;
                    5:          min <= min;
                    default:    min <= 7'h7f;
                endcase
            end
            INITIAL:            min <= 7'h7f;
            BACKWARD:begin
                case(cnt)
                    1:          min <= res_di;
                    2:          min <= (min > (res_di + 8'h1)) ? (res_di + 8'h1): min;
                    3:          min <= (min > (res_di + 8'h1)) ? (res_di + 8'h1): min;
                    4:          min <= (min > (res_di + 8'h1)) ? (res_di + 8'h1): min;
                    5:          min <= (min > (res_di + 8'h1)) ? (res_di + 8'h1): min;
                    6:          min <= min;
                    default:    min <= 7'h7f;
                endcase
            end
            default:    min <= 7'h7f;
        endcase
    end
end
////////////////////////////////////////////////
// CONTROL

always @(posedge clk or negedge reset)begin
    if(!reset)begin
        done <= 1'h0;
    end
    else begin
        if(ns == DONE)  done <= 1'h1;
        else            done <= 1'h0;
    end
end
////////////////////////////////////////////////

endmodule

