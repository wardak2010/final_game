// ----- Cleaning Interaction -----
// Get the first instance of obj_player (change this to match your player object name)
var _player = instance_find(obj_player, 0);
if (_player != noone)
{
    // Find the nearest cleaning sign to the player's current position.
    var _closestSign = instance_nearest(_player.x, _player.y, obj_cleaning_sign);
    
    // If a cleaning sign exists and is within 64 pixels of the player...
    if (_closestSign != noone && point_distance(_closestSign.x, _closestSign.y, _player.x, _player.y) < 64)
    {
        // If the D key is pressed, increase its cleaning progress.
        if (keyboard_check(ord("D")))
        {
            _closestSign.cleaningProgress += 1;
            
            // When cleaningProgress reaches or exceeds the sign's cleaningDuration...
            if (_closestSign.cleaningProgress >= _closestSign.cleaningDuration)
            {
                _closestSign.cleaned = true;
                global.cleanedRooms += 1;
                instance_destroy(_closestSign); // Its Destroy Event will handle spawn point cooldown.
            }
        }
    }
}

// ----- Spawn & Cooldown Logic -----
for (var i = 0; i < array_length(global.spawnPoints); i++)
{
    var sp = global.spawnPoints[i];
    
    // If the spawn point is cooling down, decrement its cooldown.
    if (sp.cooldown > 0)
    {
        sp.cooldown -= 1;
    }
    
    // If the spawn point is not cooling down and no sign is currently active...
    if (sp.cooldown <= 0 && sp.instance == noone)
    {
        sp.timer -= 1;
        
        // When the timer reaches zero, spawn a new cleaning sign at this spawn point.
        if (sp.timer <= 0)
        {
            var new_sign = instance_create_layer(sp.x, sp.y, "Instances", obj_cleaning_sign);
            new_sign.spawn_index = i;   // Record which spawn point created this sign.
            sp.instance = new_sign;       // Mark this spawn point as in use.
            sp.timer = irandom_range(300, 900);  // Reset the spawn timer (adjust as desired).
        }
    }
    
    // Write the updated spawn point struct back.
    global.spawnPoints[i] = sp;
}

// ----- Optional: Remove All Signs When Target Is Reached -----
if (global.cleanedRooms >= global.cleaningTarget)
{
    with (obj_cleaning_sign)
    {
        instance_destroy();
    }
}
