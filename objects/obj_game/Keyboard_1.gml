if(keyboard_check_pressed(vk_escape))
{
    game_end();
}

if (keyboard_check_pressed(ord("O")))
{
    global.debug = !global.debug;
    show_debug_overlay(global.debug);
}