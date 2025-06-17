

// obj_cleaning_sign - Create Event

// Set the sprite for the cleaning sign (set this in the object editor or here).
sprite_index = spr_cleaning_sign;

// Total number of steps required to hold the E key (3 seconds at 60 FPS)
cleaningDuration = 180;

// Initialize the cleaning progress.
cleaningProgress = 0;

// A flag to ensure this cleaning sign only increments the counter once.
cleaned = false;
global.cleaningTarget = 8; // Adjust this based on your game design

















