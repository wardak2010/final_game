// Elevator Step Event

// Process elevator movement only if a player is inside
if (playerInside) {

    // Continuous Movement:
    // - If W is held, move upward (y decreases)
    if (keyboard_check(ord("W"))) {
        y -= moveSpeed;
        if (y < upperBound) {
            y = upperBound;
        }
    }
    
    // - If S is held, move downward (y increases)
    if (keyboard_check(ord("S"))) {
        y += moveSpeed;
        if (y > lowerBound) {
            y = lowerBound;
        }
    }
    
    // Keep the player attached to the elevator:
    if (instance_exists(playerInst)) {
        playerInst.x = x;
        playerInst.y = y;
    }
}
