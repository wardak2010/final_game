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
    x -= 4;  // Adjust the speed as desired.
    y = global.waitingLineY; // Keep the same vertical level.
    if (x < -sprite_width) {
        instance_destroy();
    }
}
