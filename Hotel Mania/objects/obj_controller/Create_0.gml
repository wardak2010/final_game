// Create the guest queue if it doesn't exist.
if (!variable_global_exists("guestQueue")) {
    global.guestQueue = ds_list_create();
}

// Set waiting area coordinates behind the checkout desk.
global.waitingLineX = 500;   // Modify to match your checkout desk position.
global.waitingLineY = 400;   // Fixed vertical coordinate.

// Set spacing between guests. Increase this value if they overlap.
global.lineSpacing = 75;
