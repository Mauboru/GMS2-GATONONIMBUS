part_type_speed(part, 1, 4, -0.01, 0);
part_type_direction(part, 0, 180, 0, 10);
part_type_shape(part, pt_shape_smoke);
part_type_size(part, .1, .5, -0.01, 0);
part_type_gravity(part, 0, 180);
part_type_color2(part, c_black, c_aqua);
part_type_blend(part, true);
part_type_life(part, room_speed, room_speed * 2);
part_type_alpha3(part, 1, .7, .2);

part_emitter_region(sys, em, x - 50, x + 50, y - 50, y + 50, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(sys, em, part, 50);