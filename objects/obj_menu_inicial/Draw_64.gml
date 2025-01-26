var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var tam_menu = array_length(menu_inicial);

for(var i = 0; i < tam_menu; i++){
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	
	var _hstr = string_height("I");
	var _wstr = string_width(menu_inicial[i]);

	var x1 = _wgui/2 - _wstr/2; 
	var y1 = _hgui/2 - _hstr/2 + _hstr * i;
	
	var x2 = _wgui/2 + _wstr/2; 
	var y2 = _hgui/2 + _hstr/2 + _hstr * i;	
	
	draw_set_color(c_black);
	
	if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)){
		esc[i] = lerp(esc[i], 1.4, .015);
		
		if(mouse_check_button_pressed(mb_left)){
			switch(menu_inicial[i]){
				case menu_inicial[0]:{
					room_goto(rm_scenes);
					break;
				}
				case menu_inicial[1]:{
					room_goto(rm_creditos);
					break;
				}
				case menu_inicial[2]:{
					game_end();
					break;
				}				
			}
		}
	}else{
		esc[i] = lerp(esc[i], 1, .015);
	}
	
	draw_text_ext_transformed(_wgui/2, _hgui/2 + _hstr * i, menu_inicial[i], 1, 50, esc[i], esc[i], 0);
	draw_set_color(-1);
}
	
for(var i = 0; i < tam_menu; i++){
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	
	var _hstr = string_height("I");
	var _wstr = string_width(menu_inicial[i]);

	var x1 = _wgui/2 - _wstr/2; 
	var y1 = _hgui/2 - _hstr/2 + _hstr * i;
	
	var x2 = _wgui/2 + _wstr/2; 
	var y2 = _hgui/2 + _hstr/2 + _hstr * i;	
	
	draw_set_color(c_white);
	
	if(point_in_rectangle(_mx, _my, x1, y1, x2, y2)){
		esc[i] = lerp(esc[i], 1.4, .015);
		
		if(mouse_check_button_pressed(mb_left)){
			switch(menu_inicial[i]){
				case menu_inicial[0]:{
					room_goto(rm_scenes);
					break;
				}
				case menu_inicial[1]:{
					room_goto(rm_creditos);
					break;
				}
				case menu_inicial[2]:{
					game_end();
					break;
				}				
			}
		}
	}else{
		esc[i] = lerp(esc[i], 1, .015);
	}
	
	draw_text_ext_transformed(_wgui/2, _hgui/2 + _hstr * i + 1, menu_inicial[i], 1, 50, esc[i], esc[i], 0);
	draw_set_color(-1);
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);