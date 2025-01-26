function scr_colisor(){
	var obj = argument0;
	
	obj.move = true;
	
	if(obj_player.dir == 0){
		obj.down = 1;
	}
	if(obj_player.dir == 1){
		obj.up = 1;
	}
	if(obj_player.dir == 2){
		obj.right = 1;
	}
	if(obj_player.dir == 3){
		obj.left = 1;
	}

	obj.vel_h = (obj.right - obj.left) * obj.vel;
	obj.vel_v = (obj.down - obj.up) * obj.vel;

	if(place_meeting(x, y, obj_water)){
		if(obj_water.image_index == 0){
			obj.desli = obj.des_g;
		}
	}else{
		obj.desli = obj.des_n;
	}

	obj.velv = lerp(obj.velv, obj.vel_v, obj.desli);
	obj.velh = lerp(obj.velh, obj.vel_h, obj.desli);
}