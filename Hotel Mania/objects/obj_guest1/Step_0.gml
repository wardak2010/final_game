// Step Event for obj_guest1

// Decrease satisfaction gradually.
if (personality[?"satisfaction"] > 0) {
    personality[?"satisfaction"] -= 0.01;
}
 
// Update mood based on satisfaction.
if (personality[?"satisfaction"] < 40) {
    personality[?"mood"] = "Angry";
} else if (personality[?"satisfaction"] < 80) {
    personality[?"mood"] = "Neutral";
} else {
    personality[?"mood"] = "Happy";
}
 
// (Optional) Check myMap event type.
if (myMap[?"event_type"] == "spawn") {
    show_debug_message("The event type is spawn.");
}

// --- Step Event in obj_guest1 (Optional for debugging) ---
// This will log the current alarm[1] value each step.
if (alarm[1] != -1) {
    show_debug_message("Guest " + string(id) + " alarm[1] value: " + string(alarm[1]));
}


// --- Step Event for obj_guest1 ---
// If the guest leaves the right side of the room, destroy it.
if (x > room_width + sprite_get_width(sprite_index)) {
    instance_destroy();
}

//for checkin mechanic
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








