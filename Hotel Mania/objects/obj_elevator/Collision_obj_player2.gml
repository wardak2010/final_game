// Elevator Collision Event (with obj_player)

// Mark that a player has entered the elevator
playerInside = true;
playerInst = other;  // 'other' is the colliding player instance

// Optionally, set a flag on the player so that its own movement code is disabled
other.inElevator = true;

// Snap the player into the elevator
// (Assumes both elevator and player sprites have their origins set to Center)
other.x = x;
other.y = y;

show_debug_message("Player " + string(other.id) + " entered the elevator.");
