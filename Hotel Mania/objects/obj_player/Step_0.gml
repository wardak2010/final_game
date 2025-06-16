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

	