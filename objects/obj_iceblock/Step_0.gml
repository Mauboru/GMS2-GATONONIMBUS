//Ajustando profundidae
depth = -y;

//Caso colida com a magia do player
if(collision_circle(x + obj_player.sprite_width/2, y + obj_player.sprite_height/2, obj_player.interaction_radius, obj_player, false, true)){
	if(obj_player.estado == "Magic"){
		if(obj_player.magic_b == 1){
			if(!instance_exists(obj_particles_effects)){
				instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Particles", obj_particles_effects);
			}
			if(obj_player.magic_t <= 0){
				instance_create_layer(x, y, "Instances", obj_rock);
				instance_destroy(obj_particles_effects);
				instance_destroy();
			}
		}
	}else{
		instance_destroy(obj_particles_effects);
	}
}