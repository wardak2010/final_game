// Prevent controller logic from interfering if a restart is triggered
if (global.forceRestart) {
    // Exit early so we don’t transition to the next room unexpectedly
    exit;
}

// Check if the cleaning target has been reached and we’re not already transitioning
if (!global.transitioning && global.cleanedRooms >= global.cleaningTarget) {
    var nextRoom = room_next(room);
    show_debug_message("Current room: " + string(room) + " | Next room: " + string(nextRoom));

    if (nextRoom != -1) {
        global.transitioning = true; // Mark as transitioning
        show_debug_message("Cleaning complete! Moving to next room...");
        room_goto(nextRoom);
    } else {
        show_debug_message("Cleaning complete, but no next room found.");
    }
}
