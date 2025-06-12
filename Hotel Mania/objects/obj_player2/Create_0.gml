// In obj_player - Create Event
gun = instance_create_layer(x, y, "Instances", obj_gun);

player_health = 4; // Renamed from "health"
player_health = 100;


// obj_player2 - Create Event
inElevator = false; //To work the elevator (obj_player2 code)
currentElevator = noone;

//For checkin mechanic (obj_player3 code)
// obj_guest2 - Create Event
checkedIn = false;  // Indicates if they've been checked in
state = "waiting";  // Can change to "checkedin" once they are processed

