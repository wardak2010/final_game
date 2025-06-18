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

//checkin mechanic
// STATE: WALKING – Guest moves horizontally toward the waiting line.
if (state == "walking") {
    // Keep y fixed.
    y = global.waitingLineY;
    
    // Move horizontally toward the target.
    if (x < target_x) {
        x += move_speed;
        if (x > target_x) x = target_x;
    } else if (x > target_x) {
        x -= move_speed;
        if (x < target_x) x = target_x;
    }
    
    // When near the target and not already queued, join the queue.
    if (abs(x - target_x) < 5 && !queued) {
        ds_list_add(global.guestQueue, id);
        queued = true;
        state = "waiting";
        
        // Assign queue_index as the current last index.
        queue_index = ds_list_size(global.guestQueue) - 1;
        
        // Position the guest in line.
        x = global.waitingLineX - queue_index * global.lineSpacing;
        y = global.waitingLineY;
        show_debug_message("Guest " + string(id) + " joined queue at index " + string(queue_index));
    }
}

// STATE: WAITING – Guest stays in the line based on its queue_index.
else if (state == "waiting") {
    // Use the stored queue_index to determine its position.
    x = global.waitingLineX - queue_index * global.lineSpacing;
    y = global.waitingLineY;
    // Optionally you can output debug info:
    // show_debug_message("Guest " + string(id) + " waiting at index " + string(queue_index));
}

// STATE: CHECKED_IN – Guest leaves the waiting area horizontally.
else if (state == "checked_in") {
    x += 4;  // Now moves to the right.
    y = global.waitingLineY;
    if (x > room_width + sprite_width) {  // Adjust the boundary check accordingly.
        instance_destroy();
    }
}


/// obj_guest - Step Event

// Ensure global variables are set (optional redundancy)
/// obj_guest - Step Event

// Ensure global waiting area variables exist.
/// obj_guest - Step Event

// Make sure our global waiting area variables exist.
if (!variable_global_exists("waitingLineX")) { global.waitingLineX = 500; }
if (!variable_global_exists("waitingLineY")) { global.waitingLineY = 400; }
if (!variable_global_exists("lineSpacing")) { global.lineSpacing = 50; }

// Define our constant speed.
var const_speed = 3;

// Behavior based on the guest's state.
if (state == "walking") {
    // Move toward the waiting line position.
    var d = point_distance(x, y, target_x, target_y);
    if (d > const_speed) {
        var dir = point_direction(x, y, target_x, target_y);
        x += lengthdir_x(const_speed, dir);
        y += lengthdir_y(const_speed, dir);
    } else {
        // Snap into the waiting area and change state.
        x = target_x;
        y = target_y;
        state = "waiting";
    }
}
else if (state == "waiting") {
    // In waiting state, the guest's position is determined by your queue repositioning code.
    // Ensure that your repositioning code only affects guests where state == "waiting".
    x = target_x;
    y = target_y;
}
else if (state == "checked_in") {
    // When checked in, simply increment x by const_speed to move right.
    // No repositioning should occur here.
    x += const_speed;
}
