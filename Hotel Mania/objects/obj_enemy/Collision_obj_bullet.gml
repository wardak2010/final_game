

// Prevent processing the same bullet twice by checking a flag on "other" (the bullet)
if (!variable_instance_exists(other, "hit")) {
    other.hit = false;
}

if (!other.hit) {
    other.hit = true;  // Mark the bullet so it can’t hit again
    enemy_health -= 1;
    enemy_health = max(enemy_health, 0);  // Clamp enemy_health so it never goes below 0
    show_debug_message("Enemy health after hit: " + string(enemy_health));
    
    if (enemy_health <= 0) {
        show_debug_message("Enemy about to be destroyed!");
        // If you want a delay before destroying the enemy, set an alarm.
        // For immediate destruction, just call instance_destroy(); here.
        alarm[0] = 30;  // Delay destruction by 30 frames (half a second)
    }
}

