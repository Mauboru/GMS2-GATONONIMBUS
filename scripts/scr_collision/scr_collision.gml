function scr_collision(){
	var obj = argument0;

	if(place_meeting(x + hspd, y, obj)) {
		while(!place_meeting(x + sign(hspd), y, obj)) {
			x += sign(hspd);
		}
		if(instance_place(x, y, obj_box)){
			obj_player.hspd = 1.5;
		}else{
			hspd = 0;
		}
	}
	
	if(place_meeting(x, y + vspd, obj)) {
		while(! place_meeting(x, y + sign(vspd), obj)) {
			y += sign(vspd);
		}
		if(instance_place(x, y, obj_box)){
			obj_player.vspd = 1.5;
		}else{
			vspd = 0;
		}
	}
}