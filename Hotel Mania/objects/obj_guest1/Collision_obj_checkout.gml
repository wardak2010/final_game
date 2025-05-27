// --- Collision Event: obj_guest1 collides with obj_checkout ---

// Only process if destruction hasn't been scheduled yet
if (!destroyScheduled) {
    
    // Debug: Confirm the collision occurred.
    show_debug_message("[COLLISION] Guest " + string(id) + " collided with obj_checkout.");
    
    // Initialize global reviews if needed.
    if (!variable_global_exists("review_count")) {
        global.reviews = [];
        global.review_count = 0;
    }
    
    // Determine review based on the guest's mood (using ds_map accessor for ds_map).
    var guestMood = personality[?"mood"];
    var review = "";
    if (guestMood == "Happy") {
        review = "Loved it! Will return!";
    } else if (guestMood == "Neutral") {
        review = "It was fine. Nothing special.";
    } else {
        review = "Terrible service! Never coming back!";
    }
    
    // Record the review globally.
    global.reviews[global.review_count] = review;
    global.review_count++;
    
    // Create a review box instance (make sure obj_review_box and the "Instances" layer exist).
    var reviewBoxX = x - 50;
    var reviewBoxY = (y - 60) - 50 - 10;
    var reviewBoxInst = instance_create_layer(reviewBoxX, reviewBoxY, "Instances", obj_review_box);
    reviewBoxInst.reviewText = review;
    reviewBoxInst.depth = -150;  // Bring it on top.
    
    // Freeze guest movement.
    speed = 0;
    
    // Set the alarm to trigger the destruction in 3 seconds (3 * 60 FPS = 180 steps).
    alarm[0] = 180;
    destroyScheduled = true;  // Prevent resetting the alarm if the collision triggers again.
    
    show_debug_message("[COLLISION] Guest " + string(id) + " alarm[0] set for 180 steps.");
}
