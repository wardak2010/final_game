// In your controller/waiting area (e.g., obj_controller) Create event:
if (!variable_global_exists("guestQueue")) {
    global.guestQueue = ds_list_create();
}

global.waitingLineX = 500;   // X-coordinate behind the checkout desk.
global.waitingLineY = 400;   // Y-coordinate for the waiting line.
global.lineSpacing   = 50;   // Adjust this to control spacing between guests.





