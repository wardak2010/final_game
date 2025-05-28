// Destroy any active review box.
with (obj_review_box) {
    instance_destroy();
}

// Bring guest in front of the checkout desk.
depth = -100;  // Adjust if needed, ensuring the guest is drawn in front.

// Start guest movement off-screen to the left.
speed = 4;       // Adjust the speed as necessary.
direction = 180; // 180 degrees to move left.

// Set up alarm[1] to destroy the guest after it moves off-screen.
alarm[1] = 90;   // 90 steps is about 1.5 seconds; tweak as necessary.
