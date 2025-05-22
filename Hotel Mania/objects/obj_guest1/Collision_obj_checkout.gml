
var review = "";
var guestMood = ds_map_find_value(personality, "mood"); // ✅ Correct way to access mood

if (guestMood == "Happy") {
    review = "Loved it! Will return!";
} else if (guestMood == "Neutral") {
    review = "It was fine. Nothing special.";
} else {
    review = "Terrible service! Never coming back!";
}

// Save review in a global array
global.reviews[global.review_count] = review;
global.review_count += 1;



