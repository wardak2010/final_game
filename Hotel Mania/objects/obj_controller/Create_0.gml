// Create the guest queue if it doesn't exist.
if (!variable_global_exists("guestQueue")) {
    global.guestQueue = ds_list_create();
}

// Set waiting area coordinates behind the checkout desk.
global.waitingLineX = 500;   // Modify to match your checkout desk position.
global.waitingLineY = 400;   // Fixed vertical coordinate.

// Set spacing between guests. Increase this value if they overlap.
global.lineSpacing = 75;

// Initialize your global variables
global.cleanedRooms   = 0;      // Number of signs cleaned so far
global.cleaningTarget = 8;      // The target count to transition rooms
global.transitioning  = false;  // Flag to ensure a room transition happens only once
global.guestQueue = ds_list_create();
