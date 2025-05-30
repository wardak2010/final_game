// obj_guest2 - Step Event
if (state == "waiting") {
    // Optional idle behavior: a slight random movement
    x += random_range(-1, 1);
    y += random_range(-1, 1);
} else if (state == "checkedin") {
    // After being checked in, the guest could move towards a room or simply change appearance.
    // For example:
    // x = lerp(x, target_x, 0.05);
    // y = lerp(y, target_y, 0.05);
}
