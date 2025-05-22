// Decrease satisfaction over time
if (personality["satisfaction"] > 0) {
    personality["satisfaction"] -= 0.1; 
}

// If satisfaction drops too much, change mood
if (personality["satisfaction"] < 40) {
    personality["mood"] = "Angry";
} else if (personality["satisfaction"] < 80) {
    personality["mood"] = "Neutral";
} else {
    personality["mood"] = "Happy";
}




