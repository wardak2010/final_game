draw_self(); // Draw the enemy

// Draw a red background for the health bar
draw_set_color(c_red);
draw_rectangle(x + 10, y - 30, x + 50, y - 25, false);

// Draw the green health bar that shrinks as health decreases
draw_set_color(c_green);
draw_rectangle(x + 10, y - 30, x + 10 + (enemy_health * 10), y - 25, false);






