// obj_elevator - Step Event

// Move the elevator upward when W is pressed.
if (keyboard_check(ord("W"))) {
    y -= moveSpeed;
    if (y < upperBound) y = upperBound;
}

// Move the elevator downward when S is pressed.
if (keyboard_check(ord("S"))) {
    y += moveSpeed;
    if (y > lowerBound) y = lowerBound;
}
