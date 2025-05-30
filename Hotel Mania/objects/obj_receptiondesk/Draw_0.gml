// obj_receptionDesk - Draw Event
draw_self();  // Draw the desk's sprite

// Look for a guest near the desk using the correct object name:
var guest = instance_nearest(x, y, obj_guest2);
if (guest != noone && point_distance(x, y, guest.x, guest.y) < 100) {
    draw_set_color(c_white);
    draw_text(x - 40, y - 50, "Press C to check in guest");
}
