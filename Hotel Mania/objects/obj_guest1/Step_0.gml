// Step Event for obj_guest1

// Decrease satisfaction gradually.
if (personality[?"satisfaction"] > 0) {
    personality[?"satisfaction"] -= 0.01;
}
 
// Update mood based on satisfaction.
if (personality[?"satisfaction"] < 40) {
    personality[?"mood"] = "Angry";
} else if (personality[?"satisfaction"] < 80) {
    personality[?"mood"] = "Neutral";
} else {
    personality[?"mood"] = "Happy";
}
 
// (Optional) Check myMap event type.
if (myMap[?"event_type"] == "spawn") {
    show_debug_message("The event type is spawn.");
}

// --- Step Event in obj_guest1 (Optional for debugging) ---
// This will log the current alarm[1] value each step.
if (alarm[1] != -1) {
    show_debug_message("Guest " + string(id) + " alarm[1] value: " + string(alarm[1]));
}


// --- Step Event for obj_guest1 ---
// If the guest leaves the right side of the room, destroy it.
if (x > room_width + sprite_get_width(sprite_index)) {
    instance_destroy();
}

//checkin mechanic
// obj_guest - Step Event

// When checked in, the guest will move to the right toward targetX.
if (checkedIn) {
    // If the guest hasn't reached its target, move right.
    if (x < targetX) {
        x += moveSpeed;
        // Optionally, if you want smooth movement you can use:
        // x = lerp(x, targetX, 0.1);
    }
    
    // (If the guest overshoots or reaches the target, you can freeze it or trigger some other event.)
    if (x >= targetX) {
        x = targetX;
        // You might change the state further (e.g., set checkedIn = false or set a new state).
    }
}
