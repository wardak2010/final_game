if (instance_exists(other)) { 
    other.enemy_health -= 1; // Reduce enemy health
    show_debug_message("Enemy health after hit: " + string(other.enemy_health)); // Debugging

    if (other.enemy_health <= 0) {
        other.instance_destroy(); // Destroy enemy only if health reaches zero
    }
   
   instance_destroy(); // Bullet disappears after impact
}

show_debug_message("Bullet collided with enemy and is destroyed.");

