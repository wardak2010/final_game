// Step Event for obj_guest1

// Decrease satisfaction gradually.
if (personality[?"satisfaction"] > 0) {
    personality[?"satisfaction"] -= 0.01;
}
 
// Update mood based on satisfaction.
if (personality[?"satisfaction"] < 40) {
    personality[?"mood"] = "Angry";
} else if (personality[?"satisfaction"] < 80) {
    personality[?"mood"] = "Neutral";
} else {
    personality[?"mood"] = "Happy";
}
 
// (Optional) Check myMap event type.
if (myMap[?"event_type"] == "spawn") {
    show_debug_message("The event type is spawn.");
}
// Only move if not colliding with obj_checkout
if (!place_meeting(x, y, obj_checkout)) {

    // Find the nearest instance of obj_checkout
    var targetInst = instance_nearest(x, y, obj_checkout);
    
    // If a target exists, move toward it.
    if (targetInst != noone) {
        // Calculate the angle from this guest toward the target
        var targetAngle = point_direction(x, y, targetInst.x, targetInst.y);
        
        // Define move speed (change the value as needed)
        var moveSpeed = 3;
        
        // Update position using the correct built-in functions.
        // (Make sure it's "lengthdir_x" and "lengthdir_y" with the correct spelling.)
        x += lengthdir_x(moveSpeed, targetAngle);
        y += lengthdir_y(moveSpeed, targetAngle);
    }
}

// --- Alternative Timer Method (Commented Out)
// if (destroyTimer >= 0) {
//     destroyTimer -= 1;
//     if (destroyTimer <= 0) {
//         show_debug_message("[STEP] Timer expired for guest id " + string(id) + ". Destroying guest.");
//         instance_destroy();
//     }
// }
