// Initialize the state.
state = "walking";   // Other states: "waiting", "checked_in"

// A flag to ensure the guest is added only once.
queued = false;

// Movement speed (adjust to preference).
move_speed = 2;

// Set target to the waiting area (using globals).
target_x = global.waitingLineX;
target_y = global.waitingLineY;
