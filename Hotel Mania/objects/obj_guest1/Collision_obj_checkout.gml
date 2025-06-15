// --- Collision Event: obj_guest1 collides with obj_checkout ---

if (!destroyScheduled) {

    // Debug: Confirm the collision occurred.
    show_debug_message("[COLLISION] Guest " + string(id) + " collided with obj_checkout.");

    // Ensure global `max_health` exists to prevent errors.
    if (!variable_global_exists("max_health")) {
        show_debug_message("Warning: global.max_health was not initialized. Setting default value.");
        global.max_health = 100;  // Default max health value
    }

    if (!variable_global_exists("health")) {
        global.health = 50;  // Default starting health
    }

    // Ensure global reviews exist before adding new ones.
    if (!variable_global_exists("review_count")) {
        global.reviews = [];
        global.review_count = 0;
    }

    // Determine review based on the guest's mood.
    var guestMood = personality[?"mood"];
    var review = "";

    if (guestMood == "Happy") {
        review = "Loved it! Will return!";
        // Increase health by 1, but don’t exceed max_health.
        global.health = clamp(global.health + 1, 0, global.max_health);
    }
    else if (guestMood == "Angry") {
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

    // Create a review box instance to display feedback.
    var reviewBoxX = x - 50;
    var reviewBoxY = (y - 60) - 50 - 10;
    var reviewBoxInst = instance_create_layer(reviewBoxX, reviewBoxY, "Instances", obj_review_box);
    reviewBoxInst.reviewText = review;
    reviewBoxInst.depth = -150;  

    // Freeze guest movement immediately.
    speed = 0;

    // Set alarm[0] to trigger after 3 seconds (3 * 60 FPS = 180 steps).
    alarm[0] = 180;
    destroyScheduled = true;

    show_debug_message("[COLLISION] Guest " + string(id) + " alarm[0] set for 180 steps.");
}
