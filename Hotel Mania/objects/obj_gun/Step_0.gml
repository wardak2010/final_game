



// Get target angle based on mouse position
var target_angle = point_direction(x, y, mouse_x, mouse_y);

// Apply full rotation without limits
image_angle = target_angle;


// Shift gun further to the right
if instance_exists(obj_player) {
    x = obj_player.x + (30 * obj_player.image_xscale); // Increase this number for more shift
    y = obj_player.y;
}






