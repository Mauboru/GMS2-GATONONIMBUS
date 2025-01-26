event_inherited();

//Se estou em cima de gelo mudo meu move
var ice = instance_place(x + sprite_width/2, y + sprite_height/2, obj_water);

if(ice && ice.sprite_index == spr_ice){
	move = false;
}