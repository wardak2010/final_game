show_debug_message("Enemy Health in Step: " + string(enemy_health));
// Prevent enemy from leaving the room
if x <= 0 || x >= room_width {
    direction = 180 - direction; // Reverse horizontal movement
}
if y <= 0 || y >= room_height {
    direction = -direction; // Reverse vertical movement
}






