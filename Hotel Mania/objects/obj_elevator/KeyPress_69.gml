// Elevator Object: Key Pressed Event for E
if (playerInside) {
    if (instance_exists(playerInst)) {
        playerInst.inElevator = false;
        // Adjust player position to avoid immediate re-collision
        playerInst.x = x + sprite_get_width(sprite_index) * 0.5 + 5;
        playerInst.y = y;
        show_debug_message("Player " + string(playerInst.id) + " exited the elevator.");
    }
    // Clear the elevator's variables
    playerInside = false;
    playerInst = noone;
}
