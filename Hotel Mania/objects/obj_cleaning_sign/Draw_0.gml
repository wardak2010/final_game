// obj_cleaning_sign - Draw Event

// First, draw the cleaning sign's sprite.
draw_sprite(sprite_index, image_index, x, y);

// Draw a progress bar above the sign.

// Set the width of the progress bar equal to the sprite's width.
var barWidth = sprite_get_width(sprite_index);
var barHeight = 5;  // Adjust the height as needed.
var progress = cleaningProgress / cleaningDuration;  // Ratio from 0 to 1.

// Draw the filled portion of the progress bar in green.
draw_set_color(c_green);
draw_rectangle(x, y - 10, x + barWidth * progress, y - 10 + barHeight, false);

// Draw the border of the progress bar in black.
draw_set_color(c_black);
draw_rectangle(x, y - 10, x + barWidth, y - 10 + barHeight, true);
