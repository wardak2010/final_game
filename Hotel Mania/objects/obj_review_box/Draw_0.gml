// obj_review_box Draw Event

// Define padding for the text inside the box
var padding = 10;

// Measure the dimensions of the review text
var txtWidth = string_width(reviewText);
var txtHeight = string_height(reviewText);
var boxWidth = txtWidth + padding * 2;
var boxHeight = txtHeight + padding * 2;

// Draw a semi-transparent background rectangle for the review box
draw_set_alpha(0.8);
draw_set_color(c_white);
draw_rectangle(x, y, x + boxWidth, y + boxHeight, false);
draw_set_alpha(1);  // Reset alpha back to opaque

// Draw a border around the box
draw_set_color(c_black);
draw_rectangle(x, y, x + boxWidth, y + boxHeight, true);

// Finally, draw the review text inside the box
draw_set_color(c_black);
draw_text(x + padding, y + padding, reviewText);





