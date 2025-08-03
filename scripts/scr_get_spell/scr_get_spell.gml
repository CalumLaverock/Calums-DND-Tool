function get_random_spell(spell_level){
    randomise()
		
    file_grid = load_csv("SpellLists/lvl" + string(spell_level) + ".csv")
    
    if(file_grid != -1)
    {
		num_spells = ds_grid_height(file_grid);
        random_index = irandom_range(0, num_spells - 1)
        
        populate_spell(file_grid, random_index);
    }
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