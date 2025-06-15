// Draw GUI Event for obj_guest1

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
 
// 3. Measure text and determine the box dimensions.
var moodLabelWidth = string_width(moodLabel);
var emojiWidth     = sprite_get_width(moodSprite);
var line1_width    = moodLabelWidth + emojiWidth;
var satisfactionWidth = string_width(satisfaction_text);
 
var text_width = max(line1_width, satisfactionWidth) + 10;  // extra inner padding
var box_height = 50;
 
// 4. Calculate box position (centered above the guest).
var box_x = x - (text_width / 2) + 30;  // adjust +30 offset as needed
var box_y = y - 60;                    // drawn above the guest
 
// 5. Draw the box background and border.
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + text_width, box_y + box_height, false);
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + text_width, box_y + box_height, true);
 
// 6. Draw the text and emoji.
draw_set_color(c_black);
draw_text(box_x + 5, box_y + 10, moodLabel);
draw_set_font(fnt_default);
draw_sprite(moodSprite, 0, box_x + 5 + moodLabelWidth, box_y + 3);
draw_text(box_x + 5, box_y + 25, satisfaction_text);
draw_self();
