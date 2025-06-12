player_health -= 1; // Decrease new variable
if player_health <= 0 {
    room_restart(); // Restart when health reaches 0
}

show_debug_message("Player hit! Health: " + string(player_health));














