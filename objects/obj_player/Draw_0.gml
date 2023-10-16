// Sprite management
if (hsp != 0 && vsp==0 && on_ground>0) sprite_index = spr_player_walk else sprite_index = spr_player_idle

if (on_ground<coyote_time) {
	if (vsp < 0 ) sprite_index = spr_player_jump
	else sprite_index = spr_player_falling
}

// Draw sprite
draw_sprite_ext(sprite_index, image_index, x, y, xscale*dir, yscale, image_angle, image_blend, image_alpha)