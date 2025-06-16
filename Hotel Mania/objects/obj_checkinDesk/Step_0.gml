// obj_checkinDesk - Step Event

// First, check if the player is colliding with or near the desk.
// (Adjust the collision check as needed. Here, we use instance_place.)
if (place_meeting(x, y, obj_player)) {
    // If the player is there and R is pressed, check in the guests.
    if (keyboard_check_pressed(ord("R"))) {
        // Determine a target X for checked‑in guests.
        // For example, assume you want them to end up a little to the right of the desk.
        var deskRight = x + sprite_get_width(sprite_index);
        var target_position = deskRight + 20;  // 20 pixels to the right
        
        // Use a with statement to affect all obj_guest instances.
        with (obj_guest) {
            // Only check in guests that are still waiting.
            if (waiting) {
                waiting = false;   // Mark them as no longer waiting.
                checkedIn = true;  // Mark them as checked in.
                targetX = target_position;
                // (If desired, you can also record their starting Y value to maintain a line.)
            }
        }
        show_debug_message("Check-in complete at desk. Target for guests: " + string(target_position));
    }
}





