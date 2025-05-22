// Create a data structure to store guest personality traits
personality = ds_map_create(); // ✅ Creates the map properly
ds_map_add(personality, "mood", choose("Happy", "Neutral", "Angry")); // ✅ Adds a key-value pair
personality["preference"] = choose("Luxury", "Budget", "Foodie");
personality["satisfaction"] = 100; // Full satisfaction starts at 100




