if (spawn_index != undefined && spawn_index >= 0) {
    var sp = global.spawnPoints[spawn_index];
    sp.cooldown = room_speed * 5;   // 5-second cooldown
    sp.instance = noone;            // Clear the active instance so that this spawn point is free
    sp.timer = 0;                   // Reset spawn timer, so a new sign spawns immediately after cooldown
    global.spawnPoints[spawn_index] = sp;   // Write the updated struct back into the global array
    show_debug_message("Set cooldown on spawn point " + string(spawn_index) + " from sign " + string(id));
}
