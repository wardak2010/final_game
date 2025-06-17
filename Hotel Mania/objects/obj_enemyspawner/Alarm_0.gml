if (global.enemy_count < global.max_enemies) {
    // Get the next spawn position from the predefined list
    var spawnX = global.spawn_points[global.spawn_index][0]; // X position (-50)
    var spawnY = global.spawn_points[global.spawn_index][1]; // Y position

    // Spawn enemy at the predefined position
    instance_create_layer(spawnX, spawnY, "Instances", obj_enemy);

    // Increase enemy count
    global.enemy_count += 1;

    // Cycle through spawn points
    global.spawn_index = (global.spawn_index + 1) mod array_length(global.spawn_points);

    // Set alarm to spawn another enemy in 20 seconds
    alarm[0] = 1200;
}
