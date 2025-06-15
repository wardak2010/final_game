// Destroy any active review box.
with (obj_review_box) {
    instance_destroy();
}

// Bring guest in front of the checkout desk.
depth = -100;  // Adjust if needed, ensuring the guest is drawn in front.


// Set up alarm[1] to destroy the guest after it moves off-screen.
alarm[1] = 90;   // 90 steps is about 1.5 seconds; tweak as necessary.

// --- Alarm[0] Event for obj_guest1 ---
// Set the guest to move right (0 degrees is to the right)
direction = 0;   
speed = 5;       // Adjust the speed as necessary


