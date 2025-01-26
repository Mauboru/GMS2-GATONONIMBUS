if(collision_rectangle(x, y, x + sprite_width + 5, y + sprite_height + 5, obj_player, false, true)){
	if(obj_player.estado == "Magic"){
		if(obj_player.magic_b == 2){
			image_index = 0;
		}
	}
}

if(image_index = 1){
	if(instance_place(x, y, obj_player)){
		game_restart();
	}
}