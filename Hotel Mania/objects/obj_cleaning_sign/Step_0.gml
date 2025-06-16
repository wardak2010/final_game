// obj_cleaning_sign - Step Event
// In obj_cleaning_sign - Step Event (at the very start)
if (y > room_height - 50) {  // Adjust the threshold as needed.
    instance_destroy();
    exit; // Prevent any further code execution in this event.
}

// Check if the player is overlapping the cleaning sign.
if (place_meeting(x, y, obj_player)) {
    // If the cleaning key (E) is held:
    if (keyboard_check(ord("E"))) {
        cleaningProgress += 1;
        
        // When the cleaning progress reaches the necessary duration,
        // and if this sign has not already been registered as cleaned:
        if (cleaningProgress >= cleaningDuration && !cleaned) {
            cleaned = true;  // Make sure it increments only once.
            global.cleanedRooms += 1;
            show_debug_message("Cleaning complete. Total cleaned: " + string(global.cleanedRooms));
            instance_destroy();  // Remove the cleaning sign.
        }
    }
    else {
        // If the key is not being held, reset progress.
        cleaningProgress = 0;
    }
}
else {
    // If the player leaves the area, reset progress.
    cleaningProgress = 0;
}
