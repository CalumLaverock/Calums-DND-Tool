if(selected_map == spr_region_map)
    selected_map = spr_terrain_map;
else 
	selected_map = spr_region_map;

var toggle_text = selected_map == spr_region_map ? "Terrain Map" : "Region Map";
layer_text_text(layer_text_get_id("MapLayer", "ToggleText"), "Switch To " + toggle_text);

if (selected_map == spr_terrain_map) {
    layer_text_text(layer_text_get_id("MapLayer", "MapControlText"), "");
    
    layer_text_text(layer_text_get_id("MapLayer", "RegionText"), "Terrain");
    layer_text_blend(layer_text_get_id("MapLayer", "RegionText"), c_white);
}
else {
    layer_text_text(layer_text_get_id("MapLayer", "MapControlText"), "Click a region to get its info");
    
	layer_text_text(layer_text_get_id("MapLayer", "RegionText"), "Select A Region");
    layer_text_blend(layer_text_get_id("MapLayer", "RegionText"), c_white);
}

obj_map.sprite_index = selected_map;