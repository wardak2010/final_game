//if (instance_exists(global.desk)) {
    //var g = instance_create_layer(-32, global.desk.y, "Instances", obj_guest1);
//}

if (guest_count < max_guests) {
    var desk = instance_find(obj_checkinDesk, 0);
    if (desk != noone) {
        instance_create_layer(-32, desk.y, "Instances", obj_guest1);
        guest_count++;

        // Ensure only one guest spawns at the start
        if (guest_count == 1) {
            alarm[0] = 10 * room_speed; // After first spawn, guests come every 15 seconds
        } else {
            alarm[0] = 10 * room_speed; // Normal spawn rate
        }
    }
}





