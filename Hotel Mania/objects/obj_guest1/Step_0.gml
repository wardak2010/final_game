// Decrease satisfaction over time
if (personality[? "satisfaction"] > 0) {
    personality[? "satisfaction"] -= 0.01;

}

// If satisfaction drops too much, change mood
if (personality[? "satisfaction"] < 40) {
    personality[? "mood"] = "Angry";
} else if (personality[? "satisfaction"] < 80) {
    personality[? "mood"] = "Neutral";
} else {
    personality[? "mood"] = "Happy";
}

// Check the event type in myMap
if (myMap[? "event_type"] == "spawn") {  
    // This code runs if the event type is spawn.
    show_debug_message("The event type is spawn.");
}






