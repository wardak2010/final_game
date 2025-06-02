// First, initialize global variables if they don't exist.
if (!variable_global_exists("waitingLineX")) {
    global.waitingLineX = 100;      // Set a default X value
}
if (!variable_global_exists("waitingLineY")) {
    global.waitingLineY = 300;      // Set a default Y value
}
if (!variable_global_exists("lineSpacing")) {
    global.lineSpacing = 75;       // For example, spacing out the guests
}

// Set initial state: possible values are "walking", "waiting", "checked_in"
state = "walking";

// Flag to ensure the guest is only added once to the queue.
queued = false;

// This variable will hold this guest’s index once in line.
queue_index = 0;

// Horizontal movement speed.
move_speed = 2;

// Set the horizontal target to the waiting area.
target_x = global.waitingLineX;
// The vertical position will remain fixed at the waiting line y.
target_y = global.waitingLineY;
