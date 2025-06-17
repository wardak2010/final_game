// In the Collision Event with obj_waitingarea:
if (!queued) {
    ds_list_add(global.guestQueue, id);
    queued = true;
    state = "waiting";
    show_debug_message("Guest collided with waiting area—now waiting.");
}


















