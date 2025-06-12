
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
	// Play shooting sound
    audio_play_sound(Gunshot_Sound_Effect__Loud_and_Short_, 1, false);
}

//For elevator mechanic (obj_player2 code)
// obj_player2 - Step Event

// If not attached yet, check if the player is colliding with an elevator.
if (!inElevator) {
    var elevatorInst = instance_place(x, y, obj_elevator);
    if (elevatorInst != noone) {
        inElevator = true;
        currentElevator = elevatorInst;
        show_debug_message("Player entered elevator");
    }
}

// If the player is attached to an elevator, update its position.
if (inElevator && instance_exists(currentElevator)) {
    // Optionally, you can add an offset if you want the player to appear at a specific point on the elevator.
    // For example, here the player sticks exactly to the elevator's center:
    x = currentElevator.x;
    y = currentElevator.y;
}

// Allow the player to detach by pressing E.
if (inElevator && keyboard_check_pressed(ord("E"))) {
    inElevator = false;
    currentElevator = noone;
    
    // Move the player far enough away so that they’re no longer colliding with the elevator.
    x += 200;  // You can adjust this offset value as needed.
    show_debug_message("Player exited elevator");
}

//For checkin mechanic (obj_player3 code)
if (keyboard_check_pressed(ord("C"))) {
    show_debug_message("C key pressed: processing check-in");
    
    if (ds_list_size(global.guestQueue) > 0) {
        // Retrieve the guest at the front (index 0) of the queue.
        var guest = global.guestQueue[| 0];
        
        // Change that guest's state to "checked_in".
        with (guest) {
            state = "checked_in";
            show_debug_message("Guest " + string(id) + " is being checked in.");
        }
        
        // Remove the guest from the queue.
        ds_list_delete(global.guestQueue, 0);
        
        // Reassign queue_index and reposition remaining guests.
        for (var i = 0; i < ds_list_size(global.guestQueue); i++) {
            var queuedGuest = global.guestQueue[| i];
            queuedGuest.queue_index = i;
            queuedGuest.x = global.waitingLineX - i * global.lineSpacing;
            queuedGuest.y = global.waitingLineY;
            show_debug_message("Guest " + string(queuedGuest.id) + " repositioned to index " + string(i));
        }
    } else {
        show_debug_message("No guests waiting to be checked in.");
    }
}







