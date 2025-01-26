if(room == rm_01){
	depth = -10000;
	tutorial = collision_circle(x + obj_player.sprite_width/2, y + obj_player.sprite_height/2, obj_player.interaction_radius, obj_player, false, true);

	if(obj_player.y < y && destroy == true){
		instance_destroy();
	}
}else{
	if(keyboard_check_pressed(vk_enter)){
		room_goto(rm_menu);
	}
}