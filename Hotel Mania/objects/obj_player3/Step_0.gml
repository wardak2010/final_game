// obj_receptionist - Step Event

// Look for the nearest waiting guest (using the correct object name)
var guest = instance_nearest(x, y, obj_guest2);

// When the receptionist presses C, check in the guest.
if (keyboard_check_pressed(ord("C"))) {
    if (guest != noone && guest.checkedIn == false) {
        guest.checkedIn = true;
        guest.state = "checkedin";  // Change their state
        show_debug_message("Guest " + string(guest.id) + " has been checked in!");
        
      
    }
}
