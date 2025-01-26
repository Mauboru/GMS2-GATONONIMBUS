if(instance_place(x, y, obj_player) && obj_player.estado != "Save"){
	obj_player.estado = "Save";
	obj_player.xx = xx;
	obj_player.yy = yy;
}