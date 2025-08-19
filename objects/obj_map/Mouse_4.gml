var mousex = device_mouse_x_to_gui(0);
var mousey = device_mouse_y_to_gui(0);
if(position_meeting(mousex, mousey, self))
{
    var col = draw_getpixel(mousex, mousey);
    
    if(!ds_exists(map_states_grid, ds_type_grid)) {
    	map_states_grid = load_csv("World Map Regions.csv");
    }
    
    find_region(map_states_grid, col);
}