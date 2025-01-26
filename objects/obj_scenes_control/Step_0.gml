if(!global.win){
	if(!audio_is_playing(snd_intro)){	
		audio_play_sound(snd_intro, 1, false);
	}
	if(keyboard_check_pressed(vk_enter)){
		instance_create_layer(x, y, "Instances_1", obj_faded);
	}	
	if(image_index > image_number - 1){
		instance_create_layer(x, y, "Instances_1", obj_faded);
	}
}else{
	sprite_index = spr_scene_win;
	
	if(!audio_is_playing(snd_win)){	
		audio_play_sound(snd_win, 1, false);
	}
	if(image_index > image_number - 1){
		room_goto(rm_creditos);
		global.win = false;
	}
}