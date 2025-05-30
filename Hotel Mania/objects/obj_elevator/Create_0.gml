// obj_elevator - Create Event
moveSpeed = 4;
upperBound = 60;
lowerBound = room_height - (sprite_get_height(sprite_index) * 0.5);

playerInside = false;  // Initialize playerInside
playerInst = noone;    // Initialize playerInst (the instance of the attached player, if any)
canAttach = true;      // If you're using a flag to control attachment
