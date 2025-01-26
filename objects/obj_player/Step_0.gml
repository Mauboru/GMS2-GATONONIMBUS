//Iniciando as variaveis
var up, down, left, right, active, vel_h, vel_v, magic, restart;

//V de colisao com objetos parede
col = collision_rectangle(x - 10, y - 10, x + 10, y + 10, obj_box, false, true);

up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
active = keyboard_check(vk_space);
magic = keyboard_check_pressed(ord("R"));
restart = keyboard_check_pressed(vk_enter);

depth = - (y + sprite_height);

#region Relógio
if(stop == false){
	segundos -= .01;
}
if(segundos <= 0 && minutos > 0){
	minutos--;
	segundos = 60;
}
if(minutos <= 0 && segundos <= 0){
	segundos = 0;
	stop = true;
	game_over = true;
	estado = "Dead";
}
#endregion

#region Config
if(vida_atual <= 0){
	game_over = true;
	estado = "Dead";
}
if(magic_t <= 0 && estado != "Magic"){
	magic_t = 1 * room_speed;
}

if(magic_t <= 0 && estado == "Magic"){
	magic_t = 0;
}

//Controlando game over
if (game_over){
	if(restart) game_restart();
	global.vel_mult = .5;
}else{
	global.vel_mult = 1;
}

//Configurando a opção dos poderes
if(magic){
	magic_b++;
}
if(magic_b > 4){
	magic_b = 1;
}
#endregion

//Controles para debug
#region Opções
if(keyboard_check_pressed(vk_f1)){
	game_restart();
}else if(keyboard_check_pressed(vk_f2)){
	obj_player.mostra_estado = !obj_player.mostra_estado;
}else if(keyboard_check_pressed(vk_f3)){
	if (window_get_fullscreen()){
		window_set_fullscreen(false);
	}else{
		window_set_fullscreen(true);
	}
}
#endregion

//Código de movimentação
#region Movimentação
vel_h = (right - left) * vel;
vel_v = (down - up) * vel;

//Se colidir com gelo ou chao a velocidade muda
if(place_meeting(x, y, obj_water)){
	if(obj_water.sprite_index == spr_ice){
		desli = des_g;
	}
}else{
	desli = des_n;
}

//Caso n esteja em nenhum dos estado o jogador pode se mover
if(estado != "Magic" && estado != "Dead" && estado != "Save"){
	if(place_meeting(x + vel_h, y, obj_box) || place_meeting(x + vel_h, y, obj_iceblock)){
		velh = 0;
	}else{
		velh = lerp(velh, vel_h, desli);
	}
	if(place_meeting(x, y + vel_v, obj_box) || place_meeting(x, y + vel_v, obj_iceblock)){
		velv = 0;
	}else{
		velv = lerp(velv, vel_v, desli);
	}
}

#region COLISAO BLOCOS
inst = instance_place(x + vel_h, y + vel_v, obj_box);

//Se coli com algo que da pra empurrar o jogo espera um pouco ate empurrar
if(inst && inst.move == false){
	wait = true;
}else{
	wait = false;
	wait_timer = room_speed/2;
}
if(wait){
	wait_timer--;
}
if(wait_timer < 0){
	push_box = true;
	scr_colisor(inst);
	wait_timer = room_speed/2;
}

#endregion

#region COLISAO PAREDE
//Checando colisao horizontal
if(place_meeting(x + velh, y, obj_wall)){
	//Se estou colidindo
	while(!place_meeting(x + sign(velh), y, obj_wall)){
		x += sign(velh);
	}
	velh = 0;
}

//Checando colisao vertical
if(place_meeting(x, y + velv, obj_wall)){
	//Se estou colidindo
	while(!place_meeting(x, y + sign(velv), obj_wall)){
		y += sign(velv);
	}
	velv = 0;
}

x += velh;
y += velv;

#endregion

//Configurando a dir para fins de sprites
if(down) dir = 0;
else if(up) dir = 1;
else if(right) dir = 2;
else if(left) dir = 3;

#endregion

//Configurando os estados do player
switch(estado){
	case "Idle":{
		magic_t = 1 * room_speed;
		image_speed = 0.5;
		//Vendo em que direção parou de olhar
		if(dir == 0){//0 - DOWN
			//Adicionando a sprite
			if(sprite_index != spr_player_idle_down){
				sprite_index = spr_player_idle_down;
			}
		}else if(dir == 1){//1 - UP
			//Adicionando a sprite
			if(sprite_index != spr_player_idle_up){
				sprite_index = spr_player_idle_up;
			}
		}else if(dir == 2){//2 - RIGHT
			//Adicionando a sprite
			if(sprite_index != spr_player_idle_right){
				sprite_index = spr_player_idle_right;
			}
		}else if(dir == 3){//3 - LEFT
			//Adicionando a sprite
			if(sprite_index != spr_player_idle_left){
				sprite_index = spr_player_idle_left;
			}
		}
		//Condição para troca de estado
		if(right || left || up || down){
			estado = "Walk";
			image_index = 0;
		}else if(active){
			estado = "Magic";
			image_index = 0;
		}
		break;
	}
	
	case "Walk":{
		//Vendo em que direção parou de olhar e se esta encostado ou nao na caixa
		if(wait){
			//Vendo em que direção parou de olhar
			if(dir == 0){//0 - DOWN
				//Adicionando a sprite
				if(sprite_index != spr_player_push_down){
					sprite_index = spr_player_push_down;
				}
			}else if(dir == 1){//1 - UP
				//Adicionando a sprite
				if(sprite_index != spr_player_push_up){
					sprite_index = spr_player_push_up;
				}
			}else if(dir == 2){//2 - RIGHT
				//Adicionando a sprite
				if(sprite_index != spr_player_push_right){
					sprite_index = spr_player_push_right;
				}
			}else if(dir == 3){//3 - LEFT
				//Adicionando a sprite
				if(sprite_index != spr_player_push_left){
					sprite_index = spr_player_push_left;
				}
			}
		}else{
			if(dir == 0){//0 - DOWN
				//Adicionando a sprite
				if(sprite_index != spr_player_walk_down){
					sprite_index = spr_player_walk_down;
				}
			}else if(dir == 1){//1 - UP
				//Adicionando a sprite
				if(sprite_index != spr_player_walk_up){
					sprite_index = spr_player_walk_up;
				}
			}else if(dir == 2){//2 - RIGHT
				//Adicionando a sprite
				if(sprite_index != spr_player_walk_right){
					sprite_index = spr_player_walk_right;
				}
			}else if(dir == 3){//3 - LEFT
				//Adicionando a sprite
				if(sprite_index != spr_player_walk_left){
					sprite_index = spr_player_walk_left;
				}
			}
		}
		
		//Condição para troca de estado
		if(!right && !left && !up && !down){
			estado = "Idle";
			image_index = 0;
		}else if(!col){
			push_box = false;
		}
		
		break;
	}
		
	case "Magic":{
		magic_t--;
		velv = 0;
		velh = 0;
		
		//Adicionando a asprite
		if(sprite_index != spr_player_magic){
			sprite_index = spr_player_magic;
		}
		
		if(!instance_exists(obj_transicao)){
			instance_create_depth(0, 0, 0, obj_transicao);
		}
		if(!instance_exists(obj_particles)){
			instance_create_layer(x + sprite_width/2, y + sprite_height/2, "Particles", obj_particles);
		}
		if(!active){
			image_index = 1;
			draw_set_alpha(1);
			draw_set_color(-1);
			instance_destroy(obj_particles);
			instance_destroy(obj_transicao);
			estado = "Idle";
		}		
		break;
	}
		
	case "Fall":{
		//Vendo em qual estou colidindo
		var inst = instance_place(x, y, obj_fall);
		
		if(inst){
			x = inst.x;
			y = inst.y;
			
			if(inst.tipo == "Buraco"){
				sprite_index = spr_player_fall;
			}else if(inst.tipo == "Water"){
				sprite_index = spr_player_drowning;
			}
			
			//Saindo do sprite
			if(image_index > image_number - 1){
				vida_atual--;
				
				//teletransporta pro ultimo checkpoint
				x = xx;
				y = yy;
				
				estado = "Idle";
			}
		}
		
		break;
	}
		
	case "Save":{
		velh = 0;
		velv = 0;
		
		var inst = instance_place(x, y, obj_leafs);
		
		x = inst.x;
		y = inst.y;
		
		//Definindo a sprite
		if(sprite_index != spr_leafs){
			sprite_index = spr_leafs;
		}		

		//Saindo do sprite
		if(image_index > image_number - 1){
			//teletransporta pro ultimo checkpoint
			sprite_index = spr_player_idle_down;
			estado = "Idle";
			x = inst.xx;
			y = inst.yy;
		}

		break;
	}
		
	case "Dead":{
		velh = 0;
		velv = 0;
		
		instance_destroy(obj_particles);
		instance_destroy(obj_transicao);
		
		if(!audio_is_playing(snd_lose)){
			audio_stop_all();
			audio_play_sound(snd_lose, 1, false);
		}
		
		//Definindo a sprite
		if(sprite_index != spr_player_dead){
			sprite_index = spr_player_dead;
		}
		
		break;
	}
}