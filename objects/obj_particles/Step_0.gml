//Escolhendo quais poderes ativar visualmente
if(obj_player.magic_b == 1){
	//Poder do Fogo
	part_type_speed(part, 1, 4, -0.01, 0);
	part_type_direction(part, 0, 359, 0, 10);
	part_type_shape(part, pt_shape_flare);
	part_type_size(part, .1, .35, -0.01, 0);
	part_type_gravity(part, 0.1, 90);
	part_type_color2(part, c_red, c_yellow);
	part_type_blend(part, true);
	part_type_life(part, room_speed, room_speed * 2);
	part_type_alpha3(part, 1, .7, .2);
}else if(obj_player.magic_b == 2){
	//Poder do Gelo
	part_type_speed(part, 1, 4, -0.01, 0);
	part_type_direction(part, 0, 359, 0, 10);
	part_type_shape(part, pt_shape_snow);
	part_type_size(part, .1, .35, -0.01, 0);
	part_type_gravity(part, 0.1, 90);
	part_type_color2(part, c_white, c_grey);
	part_type_blend(part, true);
	part_type_life(part, room_speed, room_speed * 2);
	part_type_alpha3(part, 1, .7, .2);	
}else if(obj_player.magic_b == 3){
	//Poder do Vento
	part_type_speed(part, 1, 4, -0.01, 0);
	part_type_direction(part, 0, 359, 0, 10);
	part_type_shape(part, pt_shape_cloud);
	part_type_size(part, .1, .35, -0.01, 0);
	part_type_gravity(part, 0.1, 90);
	part_type_color2(part, c_white, c_black);
	part_type_blend(part, true);
	part_type_life(part, room_speed, room_speed * 2);
	part_type_alpha3(part, 1, .7, .2);	
}else if(obj_player.magic_b == 4){
	//Poder da Chuva
	part_type_speed(part, 1, 4, -0.01, 0);
	part_type_direction(part, 0, 359, 0, 10);
	part_type_shape(part, pt_shape_disk);
	part_type_size(part, .1, .2, -0.01, 0);
	part_type_gravity(part, 0.1, 0);
	part_type_color2(part, c_aqua, c_blue);
	part_type_blend(part, true);
	part_type_life(part, room_speed, room_speed * 2);
	part_type_alpha3(part, 1, .7, .2);	
}

part_emitter_region(sys, em, x - 50, x + 50, y - 50, y + 50, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(sys, em, part, 50);