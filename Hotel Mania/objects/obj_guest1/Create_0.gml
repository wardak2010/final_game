/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2B898515
/// @DnDArgument : "code" "myMap = ds_map_create();  // This makes a new, empty map.$(13_10)myMap[? "event_type"] = "spawn";  // This sets the key "event_type" to the value "spawn".$(13_10)$(13_10)// Create a data structure to store guest personality traits$(13_10)$(13_10)personality = ds_map_create(); // ✅ Creates the map properly$(13_10)ds_map_add(personality, "mood", choose("Happy", "Neutral", "Angry")); // ✅ Adds a key-value pair$(13_10)personality[? "preference"] = choose("Luxury", "Budget", "Foodie");$(13_10)personality[? "satisfaction"] = 100;$(13_10)$(13_10)// Create Event of obj_guest$(13_10)font_ui = fnt_default; // Assign the font to a variable$(13_10)$(13_10)$(13_10)$(13_10)"
myMap = ds_map_create();  // This makes a new, empty map.
myMap[? "event_type"] = "spawn";  // This sets the key "event_type" to the value "spawn".

// Create a data structure to store guest personality traits

personality = ds_map_create(); // ✅ Creates the map properly
ds_map_add(personality, "mood", choose("Happy", "Neutral", "Angry")); // ✅ Adds a key-value pair
personality[? "preference"] = choose("Luxury", "Budget", "Foodie");
personality[? "satisfaction"] = 100;

// Create Event of obj_guest
font_ui = fnt_default; // Assign the font to a variable

/// @DnDAction : YoYo Games.Movement.Set_Direction_Random
/// @DnDVersion : 1.1
/// @DnDHash : 07942B2D
/// @DnDArgument : "direction" "180,0"
direction = choose(180,0);

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 2B13B7C7
/// @DnDArgument : "speed" "3"
speed = 3;