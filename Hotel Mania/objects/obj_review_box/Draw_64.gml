// Define a padding value for the text inside the review box.
var padding = 5;

// Calculate the width and height of the review text.
var text_w = string_width(reviewText);
var text_h = string_height(reviewText);

// Compute overall box dimensions, adding padding on both sides.
var box_width = text_w + padding * 2;
var box_height = text_h + padding * 2;

// Draw the review box background.
draw_set_color(c_white);
draw_rectangle(x, y, x + box_width, y + box_height, false);

// Draw a border around the box.
draw_set_color(c_black);
draw_rectangle(x, y, x + box_width, y + box_height, true);

// Draw the review text inside the box.
draw_set_color(c_black);
draw_text(x + padding, y + padding, reviewText);
draw_set_font(fnt_2)





