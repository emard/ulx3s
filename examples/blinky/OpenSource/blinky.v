`ifdef VERILATOR
/* verilator lint_off UNUSED */		// Not all of btn gets used, sigh
module blinky(input i_clk, input [6:0] btn, output [7:0] o_led);
/* verilator lint_on UNUSED */
    wire i_clk;
    wire [6:0] btn;
    wire [7:0] o_led;
`else
module top(input clk_25mhz,
           input [6:0] btn,
           output [7:0] led,
           output wifi_gpio0);

    wire i_clk;

    // Tie GPIO0, keep board from rebooting
    assign wifi_gpio0 = 1'b1;
    assign i_clk= clk_25mhz;
    reg [7:0] o_led;
    assign led= o_led;
`endif

    localparam ctr_width = 32;
    reg [ctr_width-1:0] ctr = 0;

    always @(posedge i_clk) begin
               ctr <= ctr + 1;
          o_led[7] <= 1;
          o_led[6] <= btn[1];
        o_led[5:0] <= ctr[23:18];
    end

endmodule
