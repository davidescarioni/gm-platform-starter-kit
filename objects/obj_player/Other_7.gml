// Mantain the last frame during jump animations
if (sprite_index = spr_player_jump) || (sprite_index = spr_player_falling) {
	image_index = sprite_get_number(sprite_index) - 1;
}