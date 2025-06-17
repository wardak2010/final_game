room_restart();
// Initialize enemy count
global.enemy_count = 0;
global.max_enemies = 15;
global.spawn_index = 0;

// Define specific spawn positions (adjust as needed)
global.spawn_points = [
    [-50, 100], // Off-screen left at y = 100
    [-50, 250], // Off-screen left at y = 250
    [-50, 400], // Off-screen left at y = 400
    [-50, 550]  // Off-screen left at y = 550
];

// Start first enemy spawn after 5 seconds
alarm[0] = 300;
