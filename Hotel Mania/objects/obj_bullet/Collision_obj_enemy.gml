if (other.object_index == obj_enemy) { // Ensure it's affecting enemies
    other.hit_count += 1; // Increase enemy hit count

    if (other.hit_count >= 4) { // Destroy only after 4 hits
        other.instance_destroy();
    }
}

instance_destroy(); // Destroy bullet after impact


