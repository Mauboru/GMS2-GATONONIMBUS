depth = -10000;

//Ja mudei de rooom
if (mudei){
	alpha -= .02;
	
}else{
	alpha += .02;
}

//Quando o alpha passar de 1 mudo de room
if (alpha >= 1){
	if(room == rm_01){
		global.win = true;
		room_goto(rm_scenes);
	}else{
		room_goto(rm_01);
	}
}

//Me destruindo depois de transparente e mudado de room
if (mudei && alpha <= 0){
	instance_destroy();
}