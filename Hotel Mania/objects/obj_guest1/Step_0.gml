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



