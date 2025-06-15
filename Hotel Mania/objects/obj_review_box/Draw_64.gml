
// --- Draw GUI Event for obj_review_box ---

// We'll update the draw position based on the attached guest's current position,
// so the review box stays on top of that guest even if the guest moves.
var draw_x, draw_y;
if (variable_instance_exists(id, "attached_guest") && instance_exists(attached_guest)) {
    // Get the current attached guest's world coordinates.
    var owner = attached_guest;
    
    // Use the same conversion constants as before.
    var cam_w = 2000;
    var cam_h = 1000;
    var vp_w  = 1500;
    var vp_h  = 750;
    var scaleX = vp_w / cam_w;  // 0.75
    var scaleY = vp_h / cam_h;  // 0.75
    
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    
    // Convert the owner's current world position to GUI coordinates.
    var owner_gui_x = (owner.x - cam_x) * scaleX;
    var owner_gui_y = (owner.y - cam_y) * scaleY;
    
    // Calculate owner's horizontal center.
    var owner_sprite_width = sprite_get_width(owner.sprite_index) * owner.image_xscale;
    var owner_gui_width = owner_sprite_width * scaleX;
    var owner_center_x = owner_gui_x + (owner_gui_width / 2);
    
    // Assume the same mood box parameters as before.
    var mood_box_height = 50;
    var mood_box_gap = 5;
    var mood_box_top_gui = owner_gui_y - mood_box_height - mood_box_gap;
    
    // Use the stored box dimensions.
    var review_box_width_gui = box_width;
    var review_box_height_gui = box_height;
    // Extra upward offset (should match what was used in collision event)
    var extra_offset = 10;
    
    // Recalculate the review box's GUI position relative to the owner's position.
    var review_box_top_gui_calc = mood_box_top_gui - review_box_height_gui - extra_offset;
    var review_box_left_gui_calc = owner_center_x - (review_box_width_gui / 2);
    
    draw_x = review_box_left_gui_calc;
    draw_y = review_box_top_gui_calc;
}
else {
    // If no attached guest is found, fall back on the stored initial GUI values.
    draw_x = (variable_instance_exists(id, "gui_x")) ? gui_x : x;
    draw_y = (variable_instance_exists(id, "gui_y")) ? gui_y : y;
}

// Use the stored dimensions if available.
var box_w = (variable_instance_exists(id, "box_width")) ? box_width : (string_width(reviewText) + 10);
var box_h = (variable_instance_exists(id, "box_height")) ? box_height : (string_height(reviewText) + 10);

// Draw the review box background.
draw_set_color(c_white);
draw_rectangle(draw_x, draw_y, draw_x + box_w, draw_y + box_h, false);

// Draw the border.
draw_set_color(c_black);
draw_rectangle(draw_x, draw_y, draw_x + box_w, draw_y + box_h, true);

// Set the font.
draw_set_font(fnt_2);

// Center the review text within the box.
var text_w = string_width(reviewText);
var text_h = string_height(reviewText);
var text_x = draw_x + (box_w - text_w) / 2;
var text_y = draw_y + (box_h - text_h) / 2;
draw_set_color(c_black);
draw_text(text_x, text_y, reviewText);
