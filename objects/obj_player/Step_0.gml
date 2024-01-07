//Get inputs
var _key_right = keyboard_check(vk_right);
var _key_left = keyboard_check(vk_left);
var _key_jump = keyboard_check(ord("Z"));
var _key_jump_pressed = keyboard_check_pressed(ord("Z"));

// Horizontal movement
var _move = _key_right - _key_left

// Collision object
var _hor_collision_objects = [obj_collision, obj_collision_slide]
var _ver_collision_objects = [obj_collision, obj_collision_slide]

// Add the vertical collision with all the obj_one_way_platform below us
with (obj_one_way_platform) {
    if (round(other.bbox_bottom) <= round(bbox_top)) {
        array_push(_ver_collision_objects, id);
    }
}

if (_move == 0) {
	hsp = approach(hsp, 0, dec);
} else {
	hsp = approach(hsp, _move * hsp_walk, acc);
}

if (hsp !=0) dir = sign(hsp)
 
// Vertical movement
vsp += grv;

// Check if jump button is pressed
if _key_jump_pressed can_jump = jump_buffer else can_jump--;

// Check if we are on ground
if place_meeting(x,y+1,_ver_collision_objects) on_ground = coyote_time else on_ground--;
 
// Check if we can jump
if (can_jump > 0) && (on_ground > 0)
{
    vsp = vsp_jump;
    can_jump = 0;
	on_ground = 0;
	// Animation
	//xscale = .8;
	//yscale = 1.2
}
 
// Variable jump height
if (!_key_jump and vsp < 0) vsp *= 0.5;

//Horizontal move & collide
var _horizontal_collisions = move_and_collide(hsp, 0, _hor_collision_objects, abs(hsp))

 show_debug_message(_ver_collision_objects)
//Vertical move & collide
var _vertical_collisions = move_and_collide(0, vsp, _ver_collision_objects, abs(vsp)+1 , hsp, vsp, hsp, vsp)
if (array_length(_vertical_collisions)  > 0) {
	vsp = 0;
}

// Variables for animations
//xscale = lerp(xscale, 1, .1)
//yscale = lerp(yscale, 1, .1)