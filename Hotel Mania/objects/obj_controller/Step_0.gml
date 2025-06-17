// Check if the cleaning target has been met and a transition hasn’t already occurred
if (!global.transitioning && global.cleanedRooms >= global.cleaningTarget) {
    var nextRoom = room_next(room);
    show_debug_message("Current room: " + string(room) + " | Next room: " + string(nextRoom));
    if (nextRoom != -1) {  // Make sure there is a next room
        global.transitioning = true; // Ensure this block runs only once
        show_debug_message("Cleaning complete! Moving to next room...");
        room_goto(nextRoom);
    } else {
        show_debug_message("Cleaning complete, but no next room found.");
    }
}


















