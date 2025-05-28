// Elevator Create Event

moveSpeed = 4;  // How many pixels per step the elevator moves

// Boundaries (adjust these values for your room layout)
// Here we assume the elevator sprite’s origin is centered.
upperBound = 60;  
lowerBound = room_height - (sprite_get_height(sprite_index) * 0.5);

// Variables to track if a player is inside
playerInside = false;
playerInst = noone;
