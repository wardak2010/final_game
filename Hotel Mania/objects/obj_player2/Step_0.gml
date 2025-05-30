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





