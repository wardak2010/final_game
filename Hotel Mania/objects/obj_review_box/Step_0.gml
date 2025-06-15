// Decrement the display time each step
displayTime -= 1;

// When displayTime reaches 0 or less, destroy the review box
if (displayTime <= 0) {
    instance_destroy();
}






