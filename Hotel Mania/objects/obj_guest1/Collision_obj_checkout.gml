// Collision Event: obj_guest1 collides with obj_checkout

// Debug: Confirm collision.
show_debug_message("[COLLISION] Guest id " + string(id) + " collided with obj_checkout.");
 
// 1. Initialize global review storage if not defined.
if (!variable_global_exists("review_count")) {
    global.reviews = [];
    global.review_count = 0;
}
 
// 2. Choose the review text based on the guest’s mood.
var review = "";
var guestMood = personality[?"mood"];
if (guestMood == "Happy") {
    review = "Loved it! Will return!";
} else if (guestMood == "Neutral") {
    review = "It was fine. Nothing special.";
} else {
    review = "Terrible service! Never coming back!";
}
 
// 3. Record the review globally.
global.reviews[global.review_count] = review;
global.review_count++;
 
// 4. Create the review box instance above the mood box.
// (Assuming the mood box is drawn at y - 60 with a height of 50.)
var reviewBoxX = x - 50;
var reviewBoxY = (y - 60) - 50 - 10; // places review box 50 pixels above the mood box, plus a 10-pixel margin
 
var reviewBoxInst = instance_create_layer(reviewBoxX, reviewBoxY, "Instances", obj_review_box);
reviewBoxInst.reviewText = review;
reviewBoxInst.depth = -150;  // ensure it draws on top
 
// 5. Freeze the guest’s movement.
speed = 0;
 
// 6. Set an alarm to destroy the guest after 3 seconds.
// (3 * room_speed steps; e.g., if room_speed is 60, then 3*60 = 180 steps.)
alarm[1] = 3 * room_speed;
 
// Debug: Report the alarm setting.
show_debug_message("[COLLISION] Guest id " + string(id) + " alarm[1] set for " + string(3 * room_speed) + " steps.");

show_debug_message("[COLLISION] Guest " + string(id) + " alarm[1] set for " + string(3 * room_speed) + " steps.");
