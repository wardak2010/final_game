/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3851BA6D
/// @DnDArgument : "code" "reviewText = "";  // Initialize reviewText as an empty string$(13_10)$(13_10)// Create a data structure to store guest personality traits$(13_10)personality = ds_map_create();$(13_10)ds_map_add(personality, "mood", choose("Happy", "Neutral", "Angry"));     // Random mood$(13_10)ds_map_add(personality, "preference", choose("Luxury", "Budget", "Foodie")); // Random preference$(13_10)ds_map_add(personality, "satisfaction", 100);                              // Starting satisfaction$(13_10)$(13_10)// You can also set a default font if used later (optional)$(13_10)font_ui = fnt_default;$(13_10)$(13_10)// Initialize myMap for the spawn mechanic$(13_10)myMap = ds_map_create();$(13_10)myMap[? "event_type"] = "spawn";$(13_10)"
reviewText = "";  // Initialize reviewText as an empty string

// Create a data structure to store guest personality traits
personality = ds_map_create();
ds_map_add(personality, "mood", choose("Happy", "Neutral", "Angry"));     // Random mood
ds_map_add(personality, "preference", choose("Luxury", "Budget", "Foodie")); // Random preference
ds_map_add(personality, "satisfaction", 100);                              // Starting satisfaction

// You can also set a default font if used later (optional)
font_ui = fnt_default;

// Initialize myMap for the spawn mechanic
myMap = ds_map_create();
myMap[? "event_type"] = "spawn";

/// @DnDAction : YoYo Games.Movement.Set_Direction_Random
/// @DnDVersion : 1.1
/// @DnDHash : 7C7687C3
/// @DnDArgument : "direction" "180,0"
direction = choose(180,0);

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 4ADAA291
/// @DnDArgument : "speed" "3"
speed = 3;