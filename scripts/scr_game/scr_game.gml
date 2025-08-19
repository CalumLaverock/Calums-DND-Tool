function toggle_layer(layer_name) {
    var all_layers = layer_get_all();
    array_foreach(all_layers, hide_ui_layer);
    
    layer_set_visible(layer_name, true);
    
    if(layer_name == "CharacterLayer") {
        populate_character_info();
    }
}

function hide_ui_layer(value, index) {
    if (layer_get_type(value) == layer_type_ui_display) {
        layer_set_visible(value, false);
    }
}