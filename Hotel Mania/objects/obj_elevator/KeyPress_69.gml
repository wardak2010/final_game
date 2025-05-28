// Elevator Key Press Event – E

if (playerInside) {
    show_debug_message("E key pressed: Exiting elevator.");
    
    // Mark that no player is inside the elevator any longer
    playerInside = false;
    
    // If the player instance is still valid...
    if (instance_exists(playerInst)) {
        // Clear the flag in the player that stops its movement
        playerInst.inElevator = false;
        // Optionally reposition the player just outside the elevator.
        // Example: move the player 10 pixels to the right.
        playerInst.x = x + sprite_get_width(sprite_index) * 0.5 + 10;
        playerInst.y = y;
    }
    
    // Clear the stored reference to the player
    playerInst = noone;
}





