// Reverse movement when hitting the edge
if x <= 0 || x >= room_width - sprite_width {
    direction = 180 - direction; // Reverse horizontal movement
    x = clamp(x, 1, room_width - sprite_width - 1); // Prevents sticking
}

if y <= 0 || y >= room_height - sprite_height {
    direction = -direction; // Reverse vertical movement
    y = clamp(y, 1, room_height - sprite_height - 1); // Keeps enemy inside
}













