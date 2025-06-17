// Initialize enemy count
global.enemy_count = 0;
global.max_enemies = 12;
global.spawn_index = 0;

// Define specific spawn positions (adjust as needed)
global.spawn_points = [
    [150, 2384], // Off-screen left at y = 100
    [182, 2499], // Off-screen left at y = 250
    [548, 1917], // Off-screen left at y = 400
    [562, 1875]  // Off-screen left at y = 550
];

// Start first enemy spawn after 5 seconds
alarm[0] = 300;
