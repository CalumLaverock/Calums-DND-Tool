function populate_character_info() {
    var character_grid = load_csv("Characters/Characters.csv");
	
	var statStruct = {
		Str: "Strength",
		Dex: "Dexterity",
		Con: "Constitution",
		Int: "Intelligence",
		Wis: "Wisdom",
		Cha: "Charisma"
		}
    
    if(character_grid != -1) {
        for(var panel_num = 0; panel_num < instance_number(obj_character); panel_num++) {
			var charName = character_grid[# 0, panel_num];
			
			var UILayer = layer_get_flexpanel_node("CharacterLayer");
			var charPanel = flexpanel_node_get_child(UILayer, "Character_" + string(panel_num + 1));
			
			#region setup correct panel for expansion
			var charObjPanel = flexpanel_node_get_child(charPanel, "CharObj");
			var charObjStruct = flexpanel_node_get_struct(charObjPanel);
			var charObjTextId = charObjStruct.layerElements[0].elementId;
			var charObjInst = layer_instance_get_instance(charObjTextId);
			
			charObjInst.character_name = charName;
			#endregion
			
			#region set character Name
			var namePanel = flexpanel_node_get_child(charPanel, "NameText");
			var nameStruct = flexpanel_node_get_struct(namePanel);
			var nameTextId = nameStruct.layerElements[0].elementId;
			
			layer_text_text(nameTextId, charName)
			#endregion
			
			#region set character Portrait
			var portraitPanel = flexpanel_node_get_child(charPanel, "Portrait");
			var portraitStruct = flexpanel_node_get_struct(portraitPanel);
			var portraitId = portraitStruct.layerElements[0].elementId;
			var portraitInst = layer_instance_get_instance(portraitId);
			
			portraitInst.sprite_index = asset_get_index("spr_" + charName);
			#endregion
			
			#region set character Stats
			var mods = calculate_modifiers(character_grid, panel_num);
			
			var statNames = struct_get_names(statStruct);
			for(var j = 0; j < array_length(statNames); j++) {
				var statPanel = flexpanel_node_get_child(charPanel, statNames[j]);
				var statNamePanel = flexpanel_node_get_child(statPanel, "Name");
				var scorePanel = flexpanel_node_get_child(statPanel, "ScoreText");
				var modPanel = flexpanel_node_get_child(statPanel, "Modifier");
				
				var statNameStruct = flexpanel_node_get_struct(statNamePanel);
				var statNameTextId = statNameStruct.layerElements[0].elementId;
				
				layer_text_text(statNameTextId, struct_get(statStruct, statNames[j]))
				
				var scoreStruct = flexpanel_node_get_struct(scorePanel);
				var scoreTextId = scoreStruct.layerElements[0].elementId;
				
				layer_text_text(scoreTextId, character_grid[# j + 1, panel_num])
				
				var modStruct = flexpanel_node_get_struct(modPanel);
				var modTextId = modStruct.layerElements[0].elementId;
				
				layer_text_text(modTextId, mods[j]);
			}
			#endregion
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