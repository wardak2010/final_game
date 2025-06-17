// obj_player - Step Event

// 1. When I is pressed, attach to the nearest elevator.
if (keyboard_check_pressed(ord("I"))) {
    show_debug_message("I key pressed.");
    
    // Find the nearest elevator regardless of collision.
    currentElevator = instance_nearest(x, y, obj_elevator);
    if (currentElevator != noone) {
        inElevator = true;
        // Save the difference between the player's current position and the elevator's position.
        attachOffsetX = x - currentElevator.x;
        attachOffsetY = y - currentElevator.y;
        show_debug_message("Player attached to elevator. Offsets: " +
                           string(attachOffsetX) + ", " + string(attachOffsetY));
    } else {
        show_debug_message("No elevator found near player.");
    }
}

// 2. If attached and the elevator exists, update the player's position relative to the elevator.
if (inElevator && instance_exists(currentElevator)) {
    x = currentElevator.x + attachOffsetX;
    y = currentElevator.y + attachOffsetY;
}

// 3. When E is pressed, detach the player.
if (keyboard_check_pressed(ord("E"))) {
    if (inElevator) {
        inElevator = false;
        currentElevator = noone;
        show_debug_message("Player detached from elevator.");
        // Optionally, reposition the player so that it no longer overlaps the elevator.
        x += 200;
    }
}


//For checkin mechanic (obj_player3 code)
if (keyboard_check_pressed(ord("C"))) {
    if (ds_list_size(global.guestQueue) > 0) {
        // Get the guest at the front of the queue.
        var guest = global.guestQueue[| 0];
        with (guest) {
            state = "checked_in";  // Change state so it stops being repositioned.
            show_debug_message("Guest " + string(id) + " checked in and moving right.");
        }
        // Remove from the queue.
        ds_list_delete(global.guestQueue, 0);
        
        // Reposition the remaining waiting guests (only if they are still waiting).
        var count = ds_list_size(global.guestQueue);
        for (var i = 0; i < count; i++) {
            var g = global.guestQueue[| i];
            if (g.state == "waiting") {
                g.queue_index = i;
                // Update their target positions.
                g.target_x = global.waitingLineX + i * global.lineSpacing;
                g.target_y = global.waitingLineY;
            }
        }
    }
}

//gun mechanic

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

//cleaningmechanic
// Find the nearest cleaning sign if none is currently tracked
if (global.activeCleaningSign == noone) {
    global.activeCleaningSign = instance_nearest(x, y, obj_cleaning_sign);
}

// Ensure the tracked sign still exists before modifying it
if (instance_exists(global.activeCleaningSign)) {
    if (keyboard_check(ord("D"))) {
        // Increase cleaning progress only for the tracked sign
        global.activeCleaningSign.cleaningProgress += 1;

        // Play the cleaning sound smoothly (no overlaps)
        if (!audio_is_playing(Cartoon_Squeaky_Sound_Effect)) {
            audio_play_sound(Cartoon_Squeaky_Sound_Effect, 1, false);
        }

        // Once cleaning is complete, ensure only this sign disappears
        if (global.activeCleaningSign.cleaningProgress >= global.activeCleaningSign.cleaningDuration && !global.activeCleaningSign.cleaned) {
            global.activeCleaningSign.cleaned = true;
            global.cleanedRooms = min(global.cleanedRooms + 1, global.cleaningTarget);

            show_debug_message("Cleaning complete for one sign. Total cleaned: " + string(global.cleanedRooms));

            instance_destroy(global.activeCleaningSign); // Destroy only the tracked sign
            global.activeCleaningSign = noone; // Reset tracking
        }
    } else {
        global.activeCleaningSign.cleaningProgress = 0; // Reset progress if key is released
    }
}

// Reset tracking if the player moves away from the sign or if it no longer exists
if (global.activeCleaningSign != noone && (!place_meeting(x, y, global.activeCleaningSign) || !instance_exists(global.activeCleaningSign))) {
    global.activeCleaningSign = noone;
}
