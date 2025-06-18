// Define fixed spawn points
spawnPoints = array_create(4);
spawnPoints[0] = { x: 693, y: 1732, timer: irandom_range(300, 900) };
spawnPoints[1] = { x: 923, y: 1685, timer: irandom_range(300, 900) };
spawnPoints[2] = { x: 1397, y: 1704, timer: irandom_range(300, 900) };
spawnPoints[3] = { x: 1628, y: 1692, timer: irandom_range(300, 900) };

// Start the list of cleaning signs (optional)
global.cleaning_sign_positions = ds_list_create();

// Game progress tracking (optional but useful)
if (!variable_global_exists("cleanedRooms")) {
    global.cleanedRooms = 0;
}
global.cleaningTarget = 8;

// Start the spawn cycle
alarm[0] = 600;
