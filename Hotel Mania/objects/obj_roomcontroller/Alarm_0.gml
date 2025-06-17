var spawn_x = irandom_range(100, room_width - 100);
var spawn_y = irandom_range(100, room_height - 100);

// Check if this position is already occupied
var is_duplicate = false;
for (var i = 0; i < ds_list_size(global.cleaning_sign_positions); i++) {
    var existing_x = global.cleaning_sign_positions[| i][0];
    var existing_y = global.cleaning_sign_positions[| i][1];

    if (point_distance(spawn_x, spawn_y, existing_x, existing_y) < 50) {
        is_duplicate = true;
        break;
    }
}

// Spawn only if no duplicate exists
if (!is_duplicate) {
    var new_sign = instance_create_layer(spawn_x, spawn_y, "Instances", obj_cleaning_sign);

    // Store the new position
    ds_list_add(global.cleaning_sign_positions, [spawn_x, spawn_y]);

    // Set the next spawn timer (adjust for slower rate)
    alarm[0] = irandom_range(600, 900); // Random delay between 10 to 15 seconds
}
else {
    // Try again sooner if the position was occupied
    alarm[0] = 60; // Try again in 1 second
}


















