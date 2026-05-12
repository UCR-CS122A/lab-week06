module top (
    input  logic CLK,
    output logic LCD_CLK,
    output logic LCD_DEN,
    output logic [4:0] LCD_R,
    output logic [5:0] LCD_G,
    output logic [4:0] LCD_B
);

logic [15:0] pixel;
logic [7:0]  pixel_address;

assign LCD_CLK = CLK;

dp_buffer sprite_buf (
    .clk(CLK),
    .raddr(pixel_address),
    .rdata(pixel)
);

lcd lcd_inst (
    .pclk(CLK),
    .pixel(pixel),
    .pixel_address(pixel_address),
    .LCD_DEN(LCD_DEN),
    .LCD_R(LCD_R),
    .LCD_G(LCD_G),
    .LCD_B(LCD_B)
);

endmodule