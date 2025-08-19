function populate_region_info(map_regions, index){
    for(var i = 0; i < ds_grid_width(map_regions); ++i) {
        
    }
}

function hexcode_to_color(_hexcodeString, _default = c_black)
{
    if (not is_string(_hexcodeString))
    {
        //Let numbers through, presumably they're RGB colors already
        return is_numeric(_hexcodeString)? _hexcodeString : _default;
    }

    try
    {
        var _color = int64(ptr(string_replace(_hexcodeString, "#", "")));
        _color = ((_color & 0xFF0000) >> 16) | (_color & 0x00FF00) | ((_color & 0x0000FF) << 16);
        return _color;
    }
    catch(_exception)
    {
        return _default;
    }
}

function find_region(map_grid, col) {
    var region_text = layer_text_get_id("MapLayer", "RegionText");
    
    for(var i = 0; i < ds_grid_height(map_grid); ++i) {
        var region_colour = hexcode_to_color(map_grid[# 4, i]);
        
        if(region_colour == col) {
            layer_text_text(region_text, map_grid[# 1, i]);
            layer_text_blend(region_text, col);
            //populate_region_info(map_states_grid, i);
        }
    }
}