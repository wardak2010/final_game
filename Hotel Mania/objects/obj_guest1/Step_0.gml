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

//for checkin mechanic
// obj_guest Step Event

// Get reference to the desk
var desk = instance_find(obj_checkinDesk, 0);
if (desk == noone) exit;

switch (state) {
    case "entering":
        x += speed_walk;

        if (x >= desk.x - checkOffset && !queued) {
            queued = true;

            ds_list_add(global.guestQueue, id);
            queue_index = ds_list_size(global.guestQueue) - 1;

            target_x = global.waitingLineX - queue_index * global.lineSpacing;
            state = "waiting";
        }
        break;

    case "waiting":
        if (abs(x - target_x) > 1) {
            x += sign(target_x - x) * speed_walk;
        } else {
            x = target_x;
        }
        break;

    case "checked_in":
        x += speed_walk * 2;
        if (x > room_width + sprite_width) {
            instance_destroy();
        }
        break;
}
