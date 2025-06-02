// STATE: WALKING – the guest moves toward the check‑in desk.
if (state == "walking") {
    // Move toward the target position.
    move_towards_point(target_x, target_y, move_speed);
    
    // When close enough, join the waiting line (if not already queued).
    if (distance_to_point(target_x, target_y) < 5 && !queued) {
        ds_list_add(global.guestQueue, id);
        queued = true;
        state = "waiting";
        
        // Immediately snap into position based on the index.
        var index = ds_list_find_index(global.guestQueue, id);
        x = global.waitingLineX - index * global.lineSpacing;
        y = global.waitingLineY;
        show_debug_message("Guest joined the line at index " + string(index));
    }
}

// STATE: WAITING – guest stays in the line.
if (state == "waiting") {
    var index = ds_list_find_index(global.guestQueue, id);
    if (index != -1) {
        // Arrange horizontally: later index means further left.
        x = global.waitingLineX - index * global.lineSpacing;
        y = global.waitingLineY;
    }
}

// STATE: CHECKED_IN – guest leaves the waiting line.
if (state == "checked_in") {
    // Move the guest to the left until it goes off-screen.
    x -= 4;  // Speed can be adjusted.
    if (x < -sprite_width) {
        instance_destroy();
    }
}
