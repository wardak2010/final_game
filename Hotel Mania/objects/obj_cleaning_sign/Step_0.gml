/// --- ROOM TRANSITION SECTION ---
/// If the cleaning target is reached and we haven’t transitioned yet,
/// check if a valid next room exists, then go to it.
if (!global.transitioning && global.cleanedRooms >= global.cleaningTarget) {
    global.transitioning = true;   // Ensure we only do this once
    var nextRoom = room_next(room);
    show_debug_message("Current room: " + string(room) + ", Next room: " + string(nextRoom));
    if (nextRoom != -1) {     // There is a valid next room
        show_debug_message("Cleaning complete! Moving to next room...");
        room_goto(nextRoom);
    } else {
        show_debug_message("Cleaning complete, but no next room found.");
    }
}

/// --- CLEANING SIGN INTERACTION SECTION ---
/// This section handles the cleaning of a sign that the player is overlapping.
/// (It assumes each cleaning sign instance stores its own cleaningProgress, cleaningDuration, and a flag 'cleaned'.)
var sign_inst = instance_place(x, y, obj_cleaning_sign);
if (sign_inst != noone) {
    // You are colliding with a cleaning sign.
    if (keyboard_check(ord("D"))) {
        // Increase the cleaning progress on the specific cleaning sign instance.
        sign_inst.cleaningProgress += 1;
        
        // Play the cleaning sound (if it's not already playing)
        if (!audio_is_playing(Cartoon_Squeaky_Sound_Effect)) {
            audio_play_sound(Cartoon_Squeaky_Sound_Effect, 1, false);
        }
        
        // When cleaning for this sign is complete—and hasn't already been counted:
        if (sign_inst.cleaningProgress >= sign_inst.cleaningDuration && !sign_inst.cleaned) {
            sign_inst.cleaned = true;  // Mark as counted to prevent multiple increments
            // Increase the global counter but ensure it does not exceed the target.
            global.cleanedRooms = min(global.cleanedRooms + 1, global.cleaningTarget);
            
            show_debug_message("Cleaning complete for sign. Total cleaned: " + string(global.cleanedRooms));
            instance_destroy(sign_inst);
        }
    } else {
        // If the player is no longer holding D, reset the progress for that sign.
        sign_inst.cleaningProgress = 0;
    }
}
