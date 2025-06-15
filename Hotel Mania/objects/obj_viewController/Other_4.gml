/// obj_viewController – Room Start
// ------------------------------------------------------------------
// Enable view 0 in this room, plug in the global camera
view_enabled          = true;
view_visible[0]       = true;
view_set_camera(0, global.cam);

// Resize viewport to your target window size
view_set_wport(0, global.VIEW_W);
view_set_hport(0, global.VIEW_H);

// Position the viewport in the window (0,0 = top-left)
view_set_xport(0, 0);
view_set_yport(0, 0);

// OPTIONAL: force window size so OS-level window never changes
window_set_size(global.VIEW_W, global.VIEW_H);


