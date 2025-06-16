// obj_player - Create Event
inElevator = false;       // Indicates if the player is attached to an elevator.
currentElevator = noone;   // Will store the elevator instance to which the player attaches.
attachOffsetX = 0;         // Horizontal offset from the elevator's position.
attachOffsetY = 0;         // Vertical offset from the elevator's position.

//For checkin mechanic (obj_player3 code)
// obj_guest2 - Create Event
checkedIn = false;  // Indicates if they've been checked in
state = "waiting";  // Can change to "checkedin" once they are processed

