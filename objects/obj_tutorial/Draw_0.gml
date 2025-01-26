if(tutorial){
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_font(fnt_padrao);
	draw_text(x + sprite_width/2, y - 20, texto);
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
}
if(room == rm_creditos){
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_font(fnt_game);
	draw_text(x + sprite_width/2, y - 20, texto);
	draw_set_font(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
}