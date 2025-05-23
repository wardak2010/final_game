// Collision Event (obj_guest collides with obj_checkout)

// If by any chance the global variables are not set, initialize them here as a fallback:
if (!variable_global_exists("review_count")) {
    global.reviews = [];
    global.review_count = 0;
}

var review = "";
var guestMood = personality[? "mood"];  // Assumes your guest's personality map was created earlier

if (guestMood == "Happy") {
    review = "Loved it! Will return!";
} else if (guestMood == "Neutral") {
    review = "It was fine. Nothing special.";
} else { // For any other mood, e.g., "Angry"
    review = "Terrible service! Never coming back!";
}

// Save the review into the global array and increment the count
global.reviews[global.review_count] = review;
global.review_count += 1;

// Output a debug message (optional)
show_debug_message("Checkout review: " + review);

// Destroy the guest, since it is now checking out
instance_destroy();




