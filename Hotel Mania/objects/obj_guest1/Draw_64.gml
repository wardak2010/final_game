// Draw GUI Event for obj_guest

// -----------------------------------------------------------
// 1. Select the appropriate mood sprite based on the personality
// -----------------------------------------------------------
var moodSprite;
if (personality[? "mood"] == "Happy") {
    moodSprite = spr_mood_happy;
} else if (personality[? "mood"] == "Neutral") {
    moodSprite = spr_mood_neutral;
} else if (personality[? "mood"] == "Angry") {
    moodSprite = spr_mood_angry;
}

// -----------------------------------------------------------
// 2. Prepare text strings and measure their widths
// -----------------------------------------------------------
var moodLabel = "Mood: "; // Plain text that doesn't include an emoji
var satisfaction_text = "Satisfaction: " + string(round(personality[? "satisfaction"]));

// Get the width of the mood label text
var moodLabelWidth = string_width(moodLabel);

// Get the width of the mood sprite (the emoji)
var emojiWidth = sprite_get_width(moodSprite);

// Calculate the total width required for the first line (text plus emoji)
var line1_width = moodLabelWidth + emojiWidth;

// Also, measure the width of the satisfaction text (second line)
var satisfactionWidth = string_width(satisfaction_text);

// -----------------------------------------------------------
// 3. Determine the textbox dimensions (width and height)
// -----------------------------------------------------------
var text_width = max(line1_width, satisfactionWidth) + 10;  // Add 10 pixels for inner padding
var box_height = 50; // Adjust the height if needed

// -----------------------------------------------------------
// 4. Calculate the textbox position
// -----------------------------------------------------------
// Here, we center the box horizontally above the guest and adjust the horizontal offset as needed.
var box_x = x - (text_width / 2) + 30; // Adjust the +30 until it aligns well
var box_y = y - 60;                   // Position above the guest

// -----------------------------------------------------------
// 5. Draw the textbox background and border
// -----------------------------------------------------------
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + text_width, box_y + box_height, false);

draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + text_width, box_y + box_height, true);

// -----------------------------------------------------------
// 6. Draw the text and single emoji inside the textbox
// -----------------------------------------------------------
// Draw the "Mood: " label
draw_set_color(c_black);
draw_text(box_x + 5, box_y + 10, moodLabel);
draw_set_font(fnt_default);

// Draw the emoji sprite right after the mood label; only one emoji is drawn here
draw_sprite(moodSprite, 0, box_x + 5 + moodLabelWidth, box_y + 3);

// Draw the satisfaction text on the next line
draw_text(box_x + 5, box_y + 25, satisfaction_text);



