//Caso o player colida em mim
if(instance_place(x, y, obj_player)){
	if(obj_player.estado != "Magic"){
		obj_player.estado = "Fall";
	}
}

//Caso colida com a magia do player
if(collision_circle(x + obj_player.sprite_width/2, y + obj_player.sprite_height/2, obj_player.interaction_radius, obj_player, false, true)){
	if(obj_player.estado == "Magic"){
		if(obj_player.magic_b == 4){
			if(obj_player.magic_t <= 0){
				var agua = instance_create_layer(x, y, "Instances", obj_water);
				agua.sprite_index = spr_buraco_full;
				agua.image_speed = 0.5;
				agua.img_buraco = true;
			
				instance_destroy();
			}
		}
	}
}