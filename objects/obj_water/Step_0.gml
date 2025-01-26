//Caso o player colida em mim
if(instance_place(x, y, obj_player) && sprite_index != spr_ice && sprite_index != spr_ice_buraco){
	if(obj_player.estado != "Magic"){
		obj_player.estado = "Fall";
	}
}

//Caso colida com a magia do player
if(collision_circle(x + obj_player.sprite_width/2, y + obj_player.sprite_height/2, obj_player.interaction_radius, obj_player, false, true)){
	if(obj_player.estado == "Magic"){
		if(obj_player.magic_b == 2){
			if(obj_player.magic_t <= 0){
				if(img_buraco){
					sprite_index = spr_ice_buraco;
				}else{
					sprite_index = spr_ice;
				}
			}
		}else if(obj_player.magic_b == 1){
			if(!instance_exists(obj_particles_effects)){
				instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Particles", obj_particles_effects);
			}
			if(obj_player.magic_t <= 0){
				if(img_buraco){
					sprite_index = spr_buraco_full;
				}else{
					sprite_index = spr_water;
				}				
				instance_destroy(obj_particles_effects);
			}
		}
	}else{
		instance_destroy(obj_particles_effects);
	}
}