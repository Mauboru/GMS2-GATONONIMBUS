scr_collision(obj_wall);
scr_collision(obj_pushPull);
scr_collision(obj_player);

//Configurando a profundidade
depth = -y;

x += hspd;
y += vspd;

//Verificando se o jogador está dentro do raio
var collision = noone;
switch(string_lower(collision_type)) {
	case "circle":{
		collision = collision_circle(x, y, interaction_radius, obj_player, false, true)
		break;
	}
	case "rectangle":{
		collision = collision_rectangle(x - interaction_radius, y - interaction_radius, x + interaction_radius, y + interaction_radius, obj_player, false, true);
		break;
	}
}

if(collision == noone) {
	hspd = 0;
	vspd = 0;
}