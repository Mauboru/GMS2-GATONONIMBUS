draw_self();

if(debug) {
	draw_set_color(c_lime);
	
	switch(string_lower(collision_type)) {
		case "circle":
			draw_circle(x, y, interaction_radius + collision_buffer, true);
		break;
		case "rectangle":
			draw_rectangle(x - interaction_radius - (collision_buffer / 2), y - interaction_radius - (collision_buffer / 2), x + interaction_radius + (collision_buffer / 2), y + interaction_radius + (collision_buffer / 2), true);
		break;
	}
}

draw_set_color(c_white);