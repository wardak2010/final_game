// Room controller spawn logic
if (global.cleanedRooms < global.cleaningTarget) {
    // Existing spawn logic (looping through spawnPoints, decrementing timers, etc.)
    for (var i = 0; i < array_length(spawnPoints); i++) {
        spawnPoints[i].timer -= 1;
        if (spawnPoints[i].timer <= 0) {
            instance_create_layer(spawnPoints[i].x, spawnPoints[i].y, "Instances", obj_cleaning_sign);
            spawnPoints[i].timer = irandom_range(300, 900);
            show_debug_message("Spawned cleaning sign at (" + string(spawnPoints[i].x) + ", " + string(spawnPoints[i].y) + ")");
        }
    }
} 

// --- New Code: Remove all cleaning signs once the cleaning target is reached ---
if (global.cleanedRooms >= global.cleaningTarget) {
    with (obj_cleaning_sign) {
        instance_destroy();
    }
    // Optionally, you can output a debug message confirming the removal.
    show_debug_message("Cleaning target reached (" + string(global.cleanedRooms) + "). All cleaning signs removed.");
}


