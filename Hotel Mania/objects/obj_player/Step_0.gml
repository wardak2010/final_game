

// PLAYER MOVEMENT & FLIPPING
if keyboard_check(vk_right) {
    x += speed;
    image_xscale = 1; // Face right
}
if keyboard_check(vk_left) {
    x -= speed;
    image_xscale = -1; // Face left
}

// GUN ATTACHMENT & POSITIONING
if instance_exists(gun) {
    gun.image_xscale = image_xscale; // Flip gun with player

    // Keep gun attached to player (adjust offsets as needed)
    if image_xscale == 1 {
        gun.x = x + 16; // Gun stays on right
    } else {
        gun.x = x - 16; // Gun stays on left
    }
}

// SHOOTING MECHANICS (Trigger a shot from the gun)
if (mouse_check_button_pressed(mb_left) && instance_exists(gun)) {
    var bullet = instance_create_layer(gun.x, gun.y, "Instances", obj_bullet);
    
    // Fire toward the mouse from the gun's position
    bullet.direction = gun.image_angle;
    bullet.speed = 10;
}



