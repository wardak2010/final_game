// obj_player - Create Event
inElevator = false;         // True when the player is attached.
transitioning = false;      // True while moving into the elevator.
targetX = x;                // The target X when entering an elevator.
targetY = y;                // The target Y when entering an elevator.
transitionSpeed = 0.1;      // Adjust this between 0.05 and 0.2 for smoothness.
elevatorInst = noone;       // Will hold the instance of the elevator we're attaching to.
attachOffsetX = 0;          // Offset from the elevator's x position.
attachOffsetY = 0;          // Offset from the elevator's y position.


//For checkin mechanic (obj_player3 code)
// obj_guest2 - Create Event
checkedIn = false;  // Indicates if they've been checked in
state = "waiting";  // Can change to "checkedin" once they are processed

