// --- Destroy Event for obj_guest1 ---

// Properly free DS maps when the object is destroyed.
if (ds_exists(personality, ds_type_map)) {
    ds_map_destroy(personality);
}
if (ds_exists(myMap, ds_type_map)) {
    ds_map_destroy(myMap);
}
