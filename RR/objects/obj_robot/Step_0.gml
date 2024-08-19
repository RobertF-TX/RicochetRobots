// Step Event
if (keyboard_check_pressed(vk_up)) {
    move_robot(0, -10);
} else if (keyboard_check_pressed(vk_down)) {
    move_robot(0, 10);
} else if (keyboard_check_pressed(vk_left)) {
    move_robot(-10, 0);
} else if (keyboard_check_pressed(vk_right)) {
    move_robot(10, 0);
}

function move_robot(dx, dy) {
    // Calculate the next position
    var next_x = x + dx;
    var next_y = y + dy;

    // Check if the robot is about to move off-screen
    if (next_x >= 0 && next_x + sprite_width <= room_width && next_y >= 0 && next_y + sprite_height <= room_height) {
        // Check for collisions with walls or other robots
        if (!place_meeting(next_x, next_y, obj_wall) && !place_meeting(next_x, next_y, obj_robot)) {
            // Move the robot by 10 pixels
            x = next_x;
            y = next_y;
        }
    }
}

if (place_meeting(x, y, obj_target)) {
    show_message("Robot reached the target!");
    // Optionally reset or restart the game
}
