event_inherited();

//Caso colida com a magia do player
if(collision_circle(x + sprite_width/2 + (obj_player.sprite_width/2), y + sprite_height + (obj_player.sprite_height/2), obj_player.interaction_radius, obj_player, false, true)){
	if(obj_player.estado == "Magic"){
		if(obj_player.magic_b == 4){
			global.win = true;
		}
	}
}