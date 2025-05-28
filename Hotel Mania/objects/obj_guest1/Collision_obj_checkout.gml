// --- Collision Event: obj_guest1 collides with obj_checkout ---

if (!destroyScheduled) {

    // Debug: Confirm the collision occurred.
    show_debug_message("[COLLISION] Guest " + string(id) + " collided with obj_checkout.");

    // Initialize global reviews if needed.
    if (!variable_global_exists("review_count")) {
        global.reviews = [];
        global.review_count = 0;
    }

    // Determine review based on the guest's mood.
    // (Assuming 'personality' is a ds_map that contains a key "mood".)
    var guestMood = personality[?"mood"];
    var review = "";

    if (guestMood == "Happy") {
        review = "Loved it! Will return!";
        // Increase health by 1, but don’t exceed max_health.
        global.health = clamp(global.health + 1, 0, global.max_health);
    }
    else if (guestMood == "Angry") {  // Make sure the mood string matches your usage.
        review = "Terrible service! Never coming back!";
        // Decrease health by 1, but don’t go negative.
        global.health = clamp(global.health - 1, 0, global.max_health);
    }
    else {
        review = "It was fine. Nothing special.";
        // No change to health for a "Neutral" mood.
    }

    // Record the review globally.
    global.reviews[global.review_count] = review;
    global.review_count++;

    // Create a review box instance (ensure that obj_review_box exists and is on the "Instances" layer).
    var reviewBoxX = x - 50;
    var reviewBoxY = (y - 60) - 50 - 10;
    var reviewBoxInst = instance_create_layer(reviewBoxX, reviewBoxY, "Instances", obj_review_box);
    reviewBoxInst.reviewText = review;
    reviewBoxInst.depth = -150;  // Bring it on top.

    // Freeze guest movement immediately.
    speed = 0;

    // Set alarm[0] to trigger after 3 seconds (3 * 60 FPS = 180 steps).
    alarm[0] = 180;
    destroyScheduled = true;  // Prevent this code from retriggering.

    show_debug_message("[COLLISION] Guest " + string(id) + " alarm[0] set for 180 steps.");
}
