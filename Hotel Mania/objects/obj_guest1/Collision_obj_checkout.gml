// --- Collision Event: obj_guest1 collides with obj_checkout ---

if (!destroyScheduled) {

    // --- Global Setup & Debug ---
    show_debug_message("[COLLISION] Guest " + string(id) + " collided with obj_checkout.");
    if (!variable_global_exists("max_health")) {
        global.max_health = 100;
    }
    if (!variable_global_exists("health")) {
        global.health = 50;
    }
    if (!variable_global_exists("review_count")) {
        global.reviews = [];
        global.review_count = 0;
    }

    // --- Determine Review Based on Guest Mood ---
    var guestMood = personality[?"mood"];
    var review = "";
    if (guestMood == "Happy") {
        review = "Loved it! Will return!";
        global.health = clamp(global.health + 1, 0, global.max_health);
    }
    else if (guestMood == "Angry") {
        review = "Terrible service! Never coming back!";
        global.health = clamp(global.health - 1, 0, global.max_health);
    }
    else {
        review = "It was fine. Nothing special.";
    }
    global.reviews[global.review_count] = review;
    global.review_count++;

    // --- Coordinate Conversion Setup ---
    // Camera (world): 2000 x 1000
    // Viewport (GUI): 1500 x 750  (scale factor: 0.75 on both X and Y)
    var cam_w = 2000;
    var cam_h = 1000;
    var vp_w  = 1500;
    var vp_h  = 750;
    var scaleX = vp_w / cam_w;  // 0.75
    var scaleY = vp_h / cam_h;  // 0.75

    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    show_debug_message("Camera position: (" + string(cam_x) + ", " + string(cam_y) + ")");

    // Convert the guest's world position (x,y) to GUI coordinates.
    var guest_gui_x = (x - cam_x) * scaleX;
    var guest_gui_y = (y - cam_y) * scaleY;

    // Calculate the guest's horizontal center in GUI space.
    var guest_sprite_width = sprite_get_width(sprite_index) * image_xscale;
    var guest_gui_width = guest_sprite_width * scaleX;
    var guest_center_x = guest_gui_x + (guest_gui_width / 2);

    // --- Positioning Relative to the Mood Box ---
    // Assume the mood box is drawn above the guest with these properties:
    // (Mood box is 50 GUI pixels high and sits 5 GUI pixels above the guest.)
    var mood_box_height = 50;
    var mood_box_gap    = 5;
    var mood_box_top_gui = guest_gui_y - mood_box_height - mood_box_gap;

    // --- Dynamic Sizing for the Review Box ---
    // Size the box to fit the review text with a little padding.
    var padding = 5;
    var text_w = string_width(review);
    var text_h = string_height(review);
    var review_box_width_gui = text_w + (padding * 2);
    var review_box_height_gui = text_h + (padding * 2);
    // (Optional: clamp width to avoid absurd values)
    review_box_width_gui = min(review_box_width_gui, 1024);

    // Extra upward offset so the box appears a bit higher.
    var extra_offset = 10;
    
    // Position the review box so its bottom edge touches the top of the mood box,
    // then move it further upward by extra_offset.
    var review_box_top_gui  = mood_box_top_gui - review_box_height_gui - extra_offset;
    // Center the review box horizontally on the guest.
    var review_box_left_gui = guest_center_x - (review_box_width_gui / 2);

    // --- Convert GUI Coordinates Back to World Coordinates ---
    var review_box_world_x = (review_box_left_gui / scaleX) + cam_x;
    var review_box_world_y = (review_box_top_gui  / scaleY) + cam_y;

    // --- Create the Review Box Instance ---
    var reviewBoxInst = instance_create_layer(review_box_world_x, review_box_world_y, "Instances", obj_review_box);
    reviewBoxInst.reviewText = review;
    
    // Save the initially computed GUI coordinates and dimensions (these are used as defaults)
    reviewBoxInst.gui_x = review_box_left_gui;
    reviewBoxInst.gui_y = review_box_top_gui;
    reviewBoxInst.box_width = review_box_width_gui;
    reviewBoxInst.box_height = review_box_height_gui;
    
    // **Key addition:** Save a reference to this guest so the review box can update its position.
    reviewBoxInst.attached_guest = id;
    reviewBoxInst.depth = -150;  

    // Freeze guest movement, then set an alarm.
    speed = 0;
    alarm[0] = 180;  // 3 seconds (assuming 60 FPS)
    destroyScheduled = true;
    
    show_debug_message("[COLLISION] Created review box at world (" +
        string(review_box_world_x) + ", " + string(review_box_world_y) +
        ") corresponding to GUI (" + string(review_box_left_gui) + ", " +
        string(review_box_top_gui) + ")");
}
