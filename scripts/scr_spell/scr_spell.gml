function get_random_spell(spell_level){
    var selected_list = obj_spell.spell_lists[string_digits(spell_level)];
    
    if(selected_list == -1) {
		obj_spell.spell_lists[string_digits(spell_level)] = load_csv("SpellLists/lvl" + spell_level + ".csv");
        selected_list = obj_spell.spell_lists[string_digits(spell_level)];
    }
    
    if(selected_list == -1) {
        return;
    }
    
    var num_spells = ds_grid_height(selected_list);
    var random_index = irandom_range(0, num_spells - 1)
        
    populate_spell(selected_list, random_index);
}

function populate_spell(spell_list, index){
    if(ds_exists(spell_list, ds_type_grid)) {
        obj_spell.name = spell_list[# 0, index];
        obj_spell.type = spell_list[# 1, index];
        obj_spell.class = spell_list[# 2, index];
        obj_spell.cast_time = spell_list[# 3, index];
        obj_spell.range = spell_list[# 4, index];
        obj_spell.component = spell_list[# 5, index];
        obj_spell.duration = spell_list[# 6, index];
    }
}

function populate_spell_lists(value, index) {
    var spell_list = load_csv("SpellLists/lvl" + string(index) + ".csv");
    
    if(spell_list != -1) {
        value = spell_list;
    }
}