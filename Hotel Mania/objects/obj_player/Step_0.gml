

if (mouse_check_button_pressed(mb_left)) {
    var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
    
    // Calculate angle to the mouse
    bullet.direction = point_direction(x, y, mouse_x, mouse_y);
    bullet.speed = 10; // Adjust speed as needed
}


