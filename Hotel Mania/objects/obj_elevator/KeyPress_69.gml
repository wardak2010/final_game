// obj_elevator - Key Press E Event

if (playerInside) {
    if (instance_exists(playerInst)) {
        // Detach the player: reset its attached flag and reposition it
        playerInst.inElevator = false;
        // Move the player out to the right so it does not immediately re-collide with the elevator
        playerInst.x = x + sprite_get_width(sprite_index) * 0.5 + 5;
        playerInst.y = y;
        show_debug_message("Player " + string(playerInst.id) + " exited the elevator.");
    }
    // Clear the elevator's attachment variables
    playerInside = false;
    playerInst = noone;
}
