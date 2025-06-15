/// obj_viewController – Game Start
// ------------------------------------------------------------------
// Global constants you want every room to respect
global.VIEW_W = 1500;    // viewport width  (window size)
global.VIEW_H =  750;    // viewport height (window size)
global.CAM_W  = 2000;    // how much of the room the player sees
global.CAM_H  = 1000;

// Create ONE camera and remember its ID
global.cam = camera_create_view(
             0, 0,                       // x,y start pos
             global.CAM_W, global.CAM_H, // width, height of camera
             0,                          // rotation
             obj_player,                 // object to follow
             -1, -1,                     // speed borders (disabled)
             global.CAM_W/2,
             global.CAM_H/2);

show_debug_message("[INIT] Global camera created ↦ id " + string(global.cam));



