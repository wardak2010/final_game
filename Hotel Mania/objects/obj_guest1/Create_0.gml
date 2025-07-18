/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 640AEB37
/// @DnDArgument : "code" "// Create Event for obj_guest1$(13_10)$(13_10)// Always create the personality map. (No conditional check needed.)$(13_10)personality = ds_map_create();$(13_10)personality[?"mood"]         = "Happy";$(13_10)personality[?"satisfaction"] = 100;$(13_10)$(13_10)// Create myMap if you use it.$(13_10)myMap = ds_map_create();$(13_10)myMap[?"event_type"] = "none";$(13_10)// --- Create Event in obj_guest1 ---$(13_10)$(13_10)$(13_10)// Add data to the ds_map; here we use "Happy" as an example.$(13_10)// Options might be "Happy", "Neutral", or any other value.$(13_10)ds_map_add(personality, "mood", "Happy");$(13_10)$(13_10)$(13_10)// --- Create Event in obj_guest1 ---$(13_10)// Optional: Initialize the personality ds_map, if not already set.$(13_10)if (!variable_instance_exists(id, "personality"))$(13_10){$(13_10)    personality = ds_map_create();$(13_10)    ds_map_add(personality, "mood", "Happy");  // Change "Happy" to what you need.$(13_10)}$(13_10)$(13_10)// --- Create Event in obj_guest1 ---$(13_10)$(13_10)// Ensure the game runs at 60 FPS.$(13_10)game_set_speed(60, gamespeed_fps);$(13_10)show_debug_message("Game speed set to 60 FPS; room_speed is: " + string(room_speed));$(13_10)$(13_10)// Initialize the personality ds_map if it doesn't exist.$(13_10)if (!variable_instance_exists(id, "personality")) {$(13_10)    personality = ds_map_create();$(13_10)    ds_map_add(personality, "mood", "Happy");  // Set this as needed.$(13_10)    show_debug_message("Personality ds_map created with mood 'Happy'.");$(13_10)}$(13_10)$(13_10)// Create a flag to ensure we only schedule the destruction once.$(13_10)destroyScheduled = false;$(13_10)guest_mood = "neutral"; // Default value to prevent errors$(13_10)max_guests = 7; // Set the maximum number of happy guests needed$(13_10)persistent = true;$(13_10)$(13_10)//for checkin mechanic$(13_10)// obj_guest - Create Event$(13_10)// First, initialize global variables if they don't exist.$(13_10)if (!variable_global_exists("waitingLineX")) {$(13_10)    global.waitingLineX = 100;      // Set a default X value$(13_10)}$(13_10)if (!variable_global_exists("waitingLineY")) {$(13_10)    global.waitingLineY = 300;      // Set a default Y value$(13_10)}$(13_10)if (!variable_global_exists("lineSpacing")) {$(13_10)    global.lineSpacing = 75;       // For example, spacing out the guests$(13_10)}$(13_10)$(13_10)// Set initial state: possible values are "walking", "waiting", "checked_in"$(13_10)state = "walking";$(13_10)$(13_10)// Flag to ensure the guest is only added once to the queue.$(13_10)queued = false;$(13_10)$(13_10)// This variable will hold this guest’s index once in line.$(13_10)queue_index = 0;$(13_10)$(13_10)// Horizontal movement speed.$(13_10)move_speed = 3;$(13_10)$(13_10)// Set the horizontal target to the waiting area.$(13_10)target_x = global.waitingLineX;$(13_10)// The vertical position will remain fixed at the waiting line y.$(13_10)target_y = global.waitingLineY;$(13_10)$(13_10)          $(13_10)$(13_10)"
// Create Event for obj_guest1

// Always create the personality map. (No conditional check needed.)
personality = ds_map_create();
personality[?"mood"]         = "Happy";
personality[?"satisfaction"] = 100;

// Create myMap if you use it.
myMap = ds_map_create();
myMap[?"event_type"] = "none";
// --- Create Event in obj_guest1 ---


// Add data to the ds_map; here we use "Happy" as an example.
// Options might be "Happy", "Neutral", or any other value.
ds_map_add(personality, "mood", "Happy");


// --- Create Event in obj_guest1 ---
// Optional: Initialize the personality ds_map, if not already set.
if (!variable_instance_exists(id, "personality"))
{
    personality = ds_map_create();
    ds_map_add(personality, "mood", "Happy");  // Change "Happy" to what you need.
}

// --- Create Event in obj_guest1 ---

// Ensure the game runs at 60 FPS.
game_set_speed(60, gamespeed_fps);
show_debug_message("Game speed set to 60 FPS; room_speed is: " + string(room_speed));

// Initialize the personality ds_map if it doesn't exist.
if (!variable_instance_exists(id, "personality")) {
    personality = ds_map_create();
    ds_map_add(personality, "mood", "Happy");  // Set this as needed.
    show_debug_message("Personality ds_map created with mood 'Happy'.");
}

// Create a flag to ensure we only schedule the destruction once.
destroyScheduled = false;
guest_mood = "neutral"; // Default value to prevent errors
max_guests = 7; // Set the maximum number of happy guests needed
persistent = true;

//for checkin mechanic
// obj_guest - Create Event
// First, initialize global variables if they don't exist.
if (!variable_global_exists("waitingLineX")) {
    global.waitingLineX = 100;      // Set a default X value
}
if (!variable_global_exists("waitingLineY")) {
    global.waitingLineY = 300;      // Set a default Y value
}
if (!variable_global_exists("lineSpacing")) {
    global.lineSpacing = 75;       // For example, spacing out the guests
}

// Set initial state: possible values are "walking", "waiting", "checked_in"
state = "walking";

// Flag to ensure the guest is only added once to the queue.
queued = false;

// This variable will hold this guest’s index once in line.
queue_index = 0;

// Horizontal movement speed.
move_speed = 3;

// Set the horizontal target to the waiting area.
target_x = global.waitingLineX;
// The vertical position will remain fixed at the waiting line y.
target_y = global.waitingLineY;

/// @DnDAction : YoYo Games.Movement.Set_Direction_Random
/// @DnDVersion : 1.1
/// @DnDHash : 401A68E4
/// @DnDArgument : "direction" "180,0"
direction = choose(180,0);

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 0D9195B1
/// @DnDArgument : "speed" "3"
speed = 3;