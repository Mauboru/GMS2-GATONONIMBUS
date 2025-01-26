//Desenhando um retangulo na tela toda
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(room_width - room_width, room_height - room_height, room_width, room_height, false);
draw_set_color(-1);
draw_set_alpha(1);