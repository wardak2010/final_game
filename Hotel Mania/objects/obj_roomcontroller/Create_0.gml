

// Reset the alarm to spawn again at a future time
alarm[0] = irandom_range(300, 900);

// obj_roomcontroller - Create Event
// Initialize desired_x and desired_y to the coordinates where you want the cleaning sign to appear.
// You could choose fixed values or random ones.
desired_x = irandom_range(100, room_width - 100);  
desired_y = irandom_range(100, room_height - 100);

// If you want to create one immediately, you can call instance_create_layer here:
instance_create_layer(desired_x, desired_y, "Instances", obj_cleaning_sign);

// obj_roomcontroller - Create Event

// Define an array to hold multiple spawn points.
// Each spawn point is defined by its x, y, and a timer value.
// The timer is set to a random value between 300 and 900 steps (5 to 15 seconds at 60 FPS).
spawnPoints = array_create(4);
spawnPoints[0] = { x: 693, y: 1732, timer: irandom_range(300, 900) };
spawnPoints[1] = { x: 923, y: 1685, timer: irandom_range(300, 900) };
spawnPoints[2] = { x: 1397, y: 1704, timer: irandom_range(300, 900) };
spawnPoints[3] = { x: 1628, y: 1692, timer: irandom_range(300, 900) };

// In obj_roomcontroller - Create Event
if (!variable_global_exists("cleanedRooms")) {
    global.cleanedRooms = 0;
}


// obj_roomcontroller - Create Event

global.cleaningTarget = 8;         // Total cleaning signs to clean for the goal.














