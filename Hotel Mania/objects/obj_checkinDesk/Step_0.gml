if (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("R"))) {
    if (ds_list_size(global.guestQueue) > 0) {
        var guest = global.guestQueue[| 0];

        with (guest) {
            state = "checked_in";
        }

        ds_list_delete(global.guestQueue, 0);

        // Reposition remaining guests
        for (var i = 0; i < ds_list_size(global.guestQueue); i++) {
            var g = global.guestQueue[| i];
            g.queue_index = i;
            g.target_x = global.waitingLineX - i * global.lineSpacing;
        }
    }
}
