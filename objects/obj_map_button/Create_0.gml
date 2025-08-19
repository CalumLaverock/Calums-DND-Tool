selected_map = spr_region_map;

var toggle_text = selected_map == spr_region_map ? "Terrain Map" : "Region Map";
layer_text_text(layer_text_get_id("MapLayer", "ToggleText"), "Switch To " + toggle_text);

layer_text_text(layer_text_get_id("MapLayer", "RegionText"), "Select A Region");

object_set_sprite(obj_map, selected_map);