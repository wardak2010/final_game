// obj_elevator - Step Event
if (keyboard_check(ord("W"))) {
    y -= moveSpeed;
    if (y < upperBound) y = upperBound;
}
if (keyboard_check(ord("S"))) {
    y += moveSpeed;
    if (y > lowerBound) y = lowerBound;
}
