function populate_character_info() {
    var character_grid = load_csv("Characters/Characters.csv");
    
    if(character_grid != -1) {
        for(var i = 0; i < instance_number(obj_character); i++) {
            var inst = instance_find(obj_character, i);
            
            var panel_num = i + 1;
            var grid_row = ds_grid_value_y(character_grid, 0, 0, 0, ds_grid_height(character_grid), inst.char_name);
            
            inst.sprite_index = asset_get_index("spr_" + inst.char_name);
            
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "CharacterName"), inst.char_name);
            
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "Str"), character_grid[# 1, grid_row]);
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "Dex"), character_grid[# 2, grid_row]);
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "Con"), character_grid[# 3, grid_row]);
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "Int"), character_grid[# 4, grid_row]);
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "Wis"), character_grid[# 5, grid_row]);
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "Cha"), character_grid[# 6, grid_row]);
            
            var mods = calculate_modifiers(character_grid, grid_row);
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "StrMod"), string(mods[0]));
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "DexMod"), string(mods[1]));
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "ConMod"), string(mods[2]));
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "IntMod"), string(mods[3]));
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "WisMod"), string(mods[4]));
            layer_text_text(layer_text_get_id("CharacterLayer", inst.char_name + "ChaMod"), string(mods[5]));
        }
    }
}

function calculate_modifiers(character_info, index) {
    var modifiers = array_create(6, "+0");
    
    for(var i = 0; i < 6; i++) {
        var mod_val = floor((real(character_info[# i + 1, index]) - 10) / 2);
        modifiers[i] = mod_val < 0 ? string(mod_val) : "+" + string(mod_val);
    }
    
    return modifiers;
}