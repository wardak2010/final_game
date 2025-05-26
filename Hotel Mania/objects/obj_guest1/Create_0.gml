// Create Event for obj_guest1

// Always create the personality map. (No conditional check needed.)
personality = ds_map_create();
personality[?"mood"]         = "Happy";
personality[?"satisfaction"] = 100;

// Create myMap if you use it.
myMap = ds_map_create();
myMap[?"event_type"] = "none";

// (For an alternative timer approach, we initialize destroyTimer.)
destroyTimer = -1;
move_speed=2

