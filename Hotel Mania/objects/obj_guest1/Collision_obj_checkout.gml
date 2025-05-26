// Collision Event (obj_guest1 collides with obj_checkout)

// Ensure global review storage variables are initialized
if (!variable_global_exists("review_count")) {
    global.reviews = [];
    global.review_count = 0;
}

var review = "";
var guestMood = personality[? "mood"];  // Correct map lookup using the ? accessor

// Determine the review text based on the guest's mood
if (guestMood == "Happy") {
    review = "Loved it! Will return!";
} else if (guestMood == "Neutral") {
    review = "It was fine. Nothing special.";
} else {  // For any other mood, e.g., "Angry"
    review = "Terrible service! Never coming back!";
}

// Record the review globally (if needed)
global.reviews[global.review_count] = review;
global.review_count += 1;

// Create an instance of obj_review_box relative to the guest's position.
// For example, 50 pixels above and centered on the guest.
var boxX = x - 50;  // Adjust offset as necessary
var boxY = y - 50;
var reviewBoxInst = instance_create_layer(boxX, boxY, "Instances", obj_review_box);
reviewBoxInst.reviewText = review; // Pass the review text

// Freeze the guest's movement
speed = 0;
depth = -100;  // Bring the guest to the front

// Set Alarm[1] to destroy the guest after 5 seconds (300 steps)
alarm[1] = 300;
