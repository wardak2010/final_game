//Room End Event of obj_controller
if (ds_exists(global.guestQueue, ds_type_list)) {
    ds_list_destroy(global.guestQueue);
}
