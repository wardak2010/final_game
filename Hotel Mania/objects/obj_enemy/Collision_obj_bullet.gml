with (other) { // Refers to the enemy object
    if (object_index == obj_enemy) { // Ensure it's affecting an enemy
        hit_count += 1; // Increase hit count in enemy
        
        if (hit_count >= 4) {
            instance_destroy(); // Destroy enemy after 4 hits
        }
    }
}

instance_destroy(); // Destroy the bullet itself




