cleaningProgress = 0;
cleaningDuration = 180;  // For example, 180 steps equals 3 seconds at 60 FPS.
cleaned = false;
spawn_index = -1;      // This will be assigned by the room controller when spawned.
if (!ds_exists(global.guestQueue, ds_type_list)) {
    global.guestQueue = ds_list_create();
}
