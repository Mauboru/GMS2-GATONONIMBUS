if(room == rm_01 && obj_player.estado != "Dead"){
	if(!audio_is_playing(snd_tema)){
		audio_play_sound(snd_tema, 1, true);
	}
}
if(room == rm_menu){
	if(!audio_is_playing(snd_menu)){
		audio_play_sound(snd_menu, 1, true);
	}
}

if(room != rm_scenes && global.win == true){
	instance_create_layer(x, y, "Instances", obj_faded);
}

show_debug_message(global.win)