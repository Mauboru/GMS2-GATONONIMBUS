//Configurando a profundidade
depth = - (y + sprite_height);

vel_h = (right - left) * vel;
vel_v = (down - up) * vel;

if(place_meeting(x, y, obj_water)){
	if(obj_water.image_index == 0){
		desli = des_g;
	}
}else{
	desli = des_n;
}

velv = lerp(velv, vel_v, desli);
velh = lerp(velh, vel_h, desli);

#region COLISAO PAREDE
//Checando colisao horizontal
if(place_meeting(x + velh, y, obj_wall)){
	//Se estou colidindo
	while(!place_meeting(x + sign(velh), y, obj_wall)){
		x += sign(velh);
	}
	velh = 0;
	move = false;
	image_speed = 0;
}

//Checando colisao vertical
if(place_meeting(x, y + velv, obj_wall)){
	//Se estou colidindo
	while(!place_meeting(x, y + sign(velv), obj_wall)){
		y += sign(velv);
	}
	velv = 0;
	move = false;
	image_speed = 0;
}
#endregion

#region COLISAO CAIXA
//Checando colisao horizontal
if(place_meeting(x + velh, y, obj_box)){
	//Se estou colidindo
	while(!place_meeting(x + sign(velh), y, obj_box)){
		x += sign(velh);
	}
	velh = 0;
	move = false;
	image_speed = 0;
}

//Checando colisao vertical
if(place_meeting(x, y + velv, obj_box)){
	//Se estou colidindo
	while(!place_meeting(x, y + sign(velv), obj_box)){
		y += sign(velv);
	}
	velv = 0;
	move = false;
	image_speed = 0;
}
#endregion

x += velh;
y += velv;