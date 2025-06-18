// Create a global array of fixed spawn points.
global.spawnPoints = array_create(4);
global.spawnPoints[0] = { x: 693, y: 1732, timer: irandom_range(300, 900), cooldown: 0, instance: noone };
global.spawnPoints[1] = { x: 923, y: 1685, timer: irandom_range(300, 900), cooldown: 0, instance: noone };
global.spawnPoints[2] = { x: 1397, y: 1704, timer: irandom_range(300, 900), cooldown: 0, instance: noone };
global.spawnPoints[3] = { x: 1628, y: 1692, timer: irandom_range(300, 900), cooldown: 0, instance: noone };

// Tracking cleaning progress.
global.cleanedRooms = 0;
global.cleaningTarget = 8;
