//Desenhando a vida
draw_sprite(spr_hud, vida_atual, view_wport[0] - view_wport[0], view_yport[0]);

//Desenhando as opções de poder
draw_sprite(spr_magics, magic_b - 1, view_wport[0] - 33, view_yport[0])

//Desenhando o tempo descorrido
draw_set_font(fnt_hud);
draw_set_color(c_white);
draw_text_transformed(view_xport[0] + 30, view_yport[0] + 35, string(minutos) + ":" + string(ceil(segundos)), .5, .5, 0);

//Criando a tela de game over
#region GAME OVER
if (game_over){
	//Pegando algumas informações X
	var x1 = view_xport[0];
	var w = view_wport[0];
	var x2 = x1 + w;
	var meio_w = x1 + (w/ 2);
	
	//Pegando algumas informações Y
	var y1 = view_yport[0];
	var h = view_hport[0];
	var y2 = y1 + h;
	var meio_h = y1 + (h/ 2);
	
	var qtd = h * .15;
	valor = lerp(valor, 1, .01);
	
	//Escurecendo a tela
	draw_set_color(c_black);
	draw_set_alpha(valor - .3);
	draw_rectangle(x1, y1, x2, y2, false)
	
	//Desenhando o retangulo de cima
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2, y1 + qtd * valor, false);
	
	//Desenhando o retangulo de baixo
	draw_set_alpha(1);
	draw_rectangle(x1, y2, x2, y2 - qtd * valor, false);
	
	//Dando um delay no game over
	if (valor >= .85){
		contador = lerp(contador, 1, .01);
		
		//Escrevendo game over
		draw_set_alpha(contador)
		draw_set_valign(1);
		draw_set_halign(1);
		//Sombra
		draw_set_color(c_purple);
		draw_text(meio_w +1, meio_h +1, "G a m e - O v e r");
		//Texto
		draw_set_color(c_white);
		draw_text(meio_w, meio_h, "G a m e - O v e r");
		draw_set_font(-1);
		
		draw_set_font(fnt_gameover);
		draw_text(meio_w, meio_h + 40, "Pressione ENTER para reiniciar!");
	
		draw_set_font(-1);
		draw_set_valign(-1);
		draw_set_halign(-1);
	}	
}
#endregion

//Desenhando save na tela
if(estado == "Save"){
	draw_set_font(fnt_save);
	draw_text(view_xport[0], view_hport[0] - 15, "Salvando");
	draw_set_font(-1);
}

//Resetando as proporções
draw_set_color(-1);
draw_set_alpha(1);