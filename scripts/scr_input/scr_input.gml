function scr_input(){
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));

	key_use = vk_space;
	key_magic = keyboard_check_pressed(ord("K"));
	
	key_pause = keyboard_check_pressed(vk_enter);
}