//Desenhando os estados
draw_self();

if (mostra_estado){
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_font(fnt_padrao);
	draw_text(x + sprite_width/2, y - sprite_height/3, estado);
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
}

//Desenhando barra de magia
//Definindo as variaveis do especial
var spriteWidth = sprite_get_width(spr_magic_t);
var spriteHeight = sprite_get_height(spr_magic_t);
var especial = spriteWidth * (magic_t_atual / magic_t);

if(estado == "Magic"){
	//Desenhando a barra de special
	draw_sprite_part(spr_magic_t_bar, 0, 0, 0, 32, 19, x - 4, y + sprite_height);
	draw_sprite_part(spr_magic_t, 0, 0, 0, especial, spriteHeight, x - 4, y + sprite_height);
}