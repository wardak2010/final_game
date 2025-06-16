// obj_player - Step Event

// 1. Start the elevator entry if NOT already inside or transitioning.
if (!inElevator && !transitioning) {
    // Check for collision with an elevator and U key press.
    if (place_meeting(x, y, obj_elevator) && keyboard_check_pressed(ord("U"))) {
        // Get the nearest elevator instance.
        elevatorInst = instance_nearest(x, y, obj_elevator);
        if (elevatorInst != noone) {
            // Get dimensions of the elevator and player.
            var elevW = sprite_get_width(elevatorInst.sprite_index);
            var elevH = sprite_get_height(elevatorInst.sprite_index);
            var plyW  = sprite_get_width(sprite_index);
            var plyH  = sprite_get_height(sprite_index);
            
            // Calculate the target position INSIDE the elevator:
            // • Horizontally center the player:
            //       targetX = left side of elevator + (elevator width - player width)/2
            // • Vertically align so the bottom of the player touches the bottom of the elevator:
            //       targetY = elevatorInst.y + elevator height - player height.
            targetX = elevatorInst.x + (elevW - plyW) / 2;
            targetY = elevatorInst.y + elevH - plyH;
            
            // Begin smooth transition into the elevator.
            transitioning = true;
        }
    }
}

// 2. Smoothly move the player toward the target position during transition.
if (transitioning) {
    x = lerp(x, targetX, transitionSpeed);
    y = lerp(y, targetY, transitionSpeed);
    
    // When the player is within 1 pixel of the target, snap to position.
    if (point_distance(x, y, targetX, targetY) < 1) {
         x = targetX;
         y = targetY;
         transitioning = false;
         inElevator = true;
         
         // Calculate the offset from the elevator's top-left.
         attachOffsetX = x - elevatorInst.x;
         attachOffsetY = y - elevatorInst.y;
         show_debug_message("Player attached to elevator.");
    }
}

// 3. Once inside the elevator, update the player's position relative to the elevator each step.
if (inElevator && instance_exists(elevatorInst)) {
    x = elevatorInst.x + attachOffsetX;
    y = elevatorInst.y + attachOffsetY;
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

	