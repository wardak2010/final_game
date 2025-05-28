// obj_healthbar: Draw GUI Event

// Check and initialize globals if they don't exist.
if (!variable_global_exists("health")) {
    global.health = 0;
    global.max_health = 6;
}

var xPos = 20;
var yPos = 20;
var barWidth = 200;
var barHeight = 20;

// Draw the background bar (a gray rectangle).
draw_set_color(c_gray);
draw_rectangle(xPos, yPos, xPos + barWidth, yPos + barHeight, false);

// Clamp the health value and calculate the filled proportion.
var clampedHealth = clamp(global.health, 0, global.max_health);
var healthProportion = clampedHealth / global.max_health;

// Draw the filled portion of the health bar (green).
draw_set_color(c_green);
draw_rectangle(xPos, yPos, xPos + (barWidth * healthProportion), yPos + barHeight, false);

// Draw an outline around the health bar.
draw_set_color(c_black);
draw_rectangle(xPos, yPos, xPos + barWidth, yPos + barHeight, true);

// Optionally, draw the health text in the center.
draw_set_color(c_white);
draw_text(xPos + (barWidth * 0.5) - 10, yPos + (barHeight * 0.5) - 6, string(clampedHealth) + "/" + string(global.max_health));
