// obj_controller Create Event

// Create a global queue for guests.
global.guestQueue = ds_list_create();

// Coordinates for the check-in desk.
global.checkinX = 400;  // For example, the desk’s X-coordinate.
global.checkinY = 300;  // The desk’s Y-coordinate.

// Define the waiting line position.
// In this design, the first guest will be at (checkinX, checkinY),
// and subsequent guests will appear to the left.
global.waitingLineX = global.checkinX;
global.waitingLineY = global.checkinY;
global.lineSpacing  = 40;  // Horizontal spacing between guests.
