//Criando a camera
var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;

//Variaveis de vida
vida_max = 7;
vida_atual = vida_max;

//Variaveis de estado
estado = "Idle";
mostra_estado = false;

//Variaveis de logica
push_box = false;

//V de velocidade
des_n = .15;
des_g = .02;
desli = des_n;
vel = 1;
dir = 0;
velv = 0;
velh = 0;

//Definindo veocidade de animação
image_speed = 0.5;

//V de interação dos poderes
interaction_radius = 35 * image_xscale;
magic_b = 1;
magic_t = 1 * room_speed;
magic_t_atual = magic_t;

//V do seila
col = noone;
wait = false;
wait_timer = room_speed/2;

//V do relogio
segundos = room_speed;
minutos = (9 * segundos) / 60;
stop = false;

//V do game over
game_over = false;
valor = 0;
contador = 0;