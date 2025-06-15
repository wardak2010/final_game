// -------------------------
// Draw GUI Event for obj_guest1
// -------------------------

// Debug: Output guest's mood for verification.
show_debug_message("Guest mood: " + personality[?"mood"]);

// 1. Choose the appropriate mood sprite.
var moodSprite;
if (personality[?"mood"] == "Happy") {
    moodSprite = spr_mood_happy;
} else if (personality[?"mood"] == "Neutral") {
    moodSprite = spr_mood_neutral;
} else if (personality[?"mood"] == "Angry") {
    moodSprite = spr_mood_angry;
}
 
// 2. Prepare text strings.
var moodLabel         = "Mood: ";
var satisfaction_text = "Satisfaction: " + string(round(personality[?"satisfaction"]));
 
// 3. Measure text lengths and determine the mood box dimensions.
var moodLabelWidth    = string_width(moodLabel);
var emojiWidth        = sprite_get_width(moodSprite);
var line1_width       = moodLabelWidth + emojiWidth;
var satisfactionWidth = string_width(satisfaction_text);
 
var text_width = max(line1_width, satisfactionWidth) + 10;  // Extra inner padding
var box_height = 50;
 
// 4. Determine the scaling factors between the camera (world) and viewport (GUI)
//    Camera settings: 2000 x 1000
//    Viewport settings: 1500 x 750
var scaleX = 1500 / 2000;  // 0.75
var scaleY = 750 / 1000;   // 0.75
 
// 5. Convert the guest's world position to GUI coordinates.
//    The Draw GUI event uses the GUI coordinate system, so subtract the camera's world position
//    then multiply by the scaling factor.
var guest_screen_x = (x - camera_get_view_x(view_camera[0])) * scaleX;
var guest_screen_y = (y - camera_get_view_y(view_camera[0])) * scaleY;
 
// 6. Calculate the guest's center X position.
//    Since your guest sprite's origin is at the top-left, add half of its width (converted to GUI size).
var guest_screen_width = sprite_get_width(sprite_index) * image_xscale * scaleX;
var guest_center_x = guest_screen_x + (guest_screen_width / 2);
 
// 7. Assume the guest's top edge is at guest_screen_y (top-left origin).
var guest_top = guest_screen_y;
 
// 8. Position the mood box so that it is centered horizontally above the guest
//    and sits just above the guest's top (with a 5-pixel gap).
var box_x = guest_center_x - (text_width / 2);
var box_y = guest_top - box_height - 5;
 
// Debug: Output computed positions for verification.
show_debug_message("Guest center: " + string(guest_center_x));
show_debug_message("Mood box position: (" + string(box_x) + ", " + string(box_y) + ")");
 
// 9. Draw the mood box background and border.
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + text_width, box_y + box_height, false);
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + text_width, box_y + box_height, true);
 
// 10. Draw the mood label, emoji, and satisfaction text inside the box.
draw_set_color(c_black);
draw_text(box_x + 5, box_y + 10, moodLabel);
draw_set_font(fnt_default);
draw_sprite(moodSprite, 0, box_x + 5 + moodLabelWidth, box_y + 3);
draw_text(box_x + 5, box_y + 25, satisfaction_text);
