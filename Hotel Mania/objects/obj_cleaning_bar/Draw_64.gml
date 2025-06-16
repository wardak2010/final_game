
// obj_cleaning_bar - Draw GUI Event

// --- Define Offsets for the Bar ---
var barOffsetX = 20;  // Move the progress bar 20 pixels to the right.
var barOffsetY = 20;  // Move the progress bar 20 pixels down.

// --- Define the Base Position for the Bar ---
var baseBarX = 50;    // Base X coordinate (before offset)
var baseBarY = 50;    // Base Y coordinate (before offset)

// --- Set the Final Bar Position With Offsets ---
var barX = baseBarX + barOffsetX;
var barY = baseBarY + barOffsetY;

// --- Define Progress Bar Dimensions ---
var totalWidth = 200;   // Full width of the progress bar.
var totalHeight = 20;   // Full height of the progress bar.

// --- Draw the Progress Bar Background ---
draw_set_color(c_black);
draw_rectangle(barX, barY, barX + totalWidth, barY + totalHeight, false);

// --- Calculate and Draw the Filled Portion ---
var ratio = global.cleanedRooms / global.cleaningTarget;  // e.g., target is 8.
var fillWidth = totalWidth * ratio;
draw_set_color(c_green);
draw_rectangle(barX, barY, barX + fillWidth, barY + totalHeight, false);

// --- Draw the Progress Bar Border ---
draw_set_color(c_white);
draw_rectangle(barX, barY, barX + totalWidth, barY + totalHeight, true);

// --- Draw the Counter Text in the Center (e.g., "3/8") ---
draw_set_color(c_white);
draw_set_font(fnt_2);  // Use your desired font.
draw_text(barX + totalWidth / 2 - 20, barY + totalHeight / 2 - 6, string(global.cleanedRooms) + "/" + string(global.cleaningTarget));

// --- Now Draw the Cleaning Sign Icon ---
// (Assuming you have a sprite named spr_cleaning_sign_icon)

// Determine the icon's dimensions.
var iconWidth = sprite_get_width(spr_cleaningicon);
var iconHeight = sprite_get_height(spr_cleaningicon);

// Calculate the base icon position relative to the progress bar.
// Originally, the icon is placed to the left of the bar.
var iconMargin = 10;  // Margin between the icon and the bar.
var baseIconX = barX - iconWidth - iconMargin;
var baseIconY = barY + (totalHeight - iconHeight) / 2;

// --- Add a Custom Offset for the Icon (if you want it a little more to the right and down) ---
var iconOffsetX = 10;  // Move the icon 10 pixels to the right relative to its base position.
var iconOffsetY = 10;  // Move the icon 10 pixels downward relative to its base position.

// Final icon position.
var iconX = baseIconX + iconOffsetX;
var iconY = baseIconY + iconOffsetY;

// Draw the cleaning sign icon.
draw_sprite(spr_cleaningicon, 0, iconX, iconY);
