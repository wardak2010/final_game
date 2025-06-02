if (keyboard_check_pressed(ord("C"))) {
    show_debug_message("C key pressed: processing check-in");
    if (ds_list_size(global.guestQueue) > 0) {
        // Retrieve the guest at the front of the line.
        var guest = global.guestQueue[| 0];
        
        // Change the guest's state to check them in.
        with (guest) {
            state = "checked_in";
            show_debug_message("Guest has been checked in.");
        }
        
        // Remove the guest from the queue.
        ds_list_delete(global.guestQueue, 0);
        
        // Re-arrange remaining guests in the line.
        for (var i = 0; i < ds_list_size(global.guestQueue); i++) {
            var queuedGuest = global.guestQueue[| i];
            queuedGuest.x = global.waitingLineX - i * global.lineSpacing;
            queuedGuest.y = global.waitingLineY;
        }
    } else {
        show_debug_message("No guests waiting to be checked in.");
    }
}
