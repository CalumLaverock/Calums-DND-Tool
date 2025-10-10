global.statStruct = {
		Str: "Strength",
		Dex: "Dexterity",
		Con: "Constitution",
		Int: "Intelligence",
		Wis: "Wisdom",
		Cha: "Charisma",
		Perception: "Perception",
		AC: "Armour Class"
		}

global.character_grid = load_csv("Characters/Characters.csv");

function populate_character_info() {
    if(global.character_grid == -1) 
		load_csv("Characters/Characters.csv");
	
	for(var panel_num = 0; panel_num < instance_number(obj_character); panel_num++) {
		var charName = global.character_grid[# 0, panel_num];
		
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
		var portraitPanel = flexpanel_node_get_child(charPanel, "CharImage");
		var portraitStruct = flexpanel_node_get_struct(portraitPanel);
		var portraitId = portraitStruct.layerElements[0].elementId;
		var portraitInst = layer_instance_get_instance(portraitId);
		
		portraitInst.sprite_index = asset_get_index("spr_" + charName);
		#endregion
		
		#region set character Stats
		var mods = calculate_modifiers(global.character_grid, panel_num);
		
		var statNames = struct_get_names(global.statStruct);
		for(var j = 0; j < array_length(statNames); j++) {
			var statPanel = flexpanel_node_get_child(charPanel, statNames[j]);
			var statNamePanel = flexpanel_node_get_child(statPanel, "Name");
			var scorePanel = flexpanel_node_get_child(statPanel, "ScoreText");
			var modPanel = flexpanel_node_get_child(statPanel, "Modifier");
			
			var statNameStruct = flexpanel_node_get_struct(statNamePanel);
			var statNameTextId = statNameStruct.layerElements[0].elementId;
			
			layer_text_text(statNameTextId, struct_get(global.statStruct, statNames[j]))
			
			var scoreStruct = flexpanel_node_get_struct(scorePanel);
			var scoreTextId = scoreStruct.layerElements[0].elementId;
			
			layer_text_text(scoreTextId, global.character_grid[# j + 1, panel_num])
			
			if(!is_undefined(modPanel)) {
				var modStruct = flexpanel_node_get_struct(modPanel);
				var modTextId = modStruct.layerElements[0].elementId;
				
				layer_text_text(modTextId, mods[j]);
			}
		}
		#endregion
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

function populate_expanded_character() {
	var charName = global.selected_char;
	
	if(charName != "") {
		if(global.character_grid == -1)
			global.character_grid = load_csv("Character/Characters.csv");
		
		var charNum = ds_grid_value_y(global.character_grid, 0, 0, 0, ds_grid_height(global.character_grid), charName);
		
		var charInfoGrid = load_csv("Characters/" + charName + "Info.csv");
		
		var UILayer = layer_get_flexpanel_node("ExpandedCharacterLayer");
		var charPanel = flexpanel_node_get_child(UILayer, "Character");
		
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
		var mods = calculate_modifiers(global.character_grid, charNum);
		
		var statNames = struct_get_names(global.statStruct);
		for(var j = 0; j < array_length(statNames); j++) {
			//if (statNames[j] == "Perception")
				//continue;
			
			var statPanel = flexpanel_node_get_child(charPanel, statNames[j]);
			var statNamePanel = flexpanel_node_get_child(statPanel, "Name");
			var scorePanel = flexpanel_node_get_child(statPanel, "ScoreText");
			var modPanel = flexpanel_node_get_child(statPanel, "Modifier");
			
			var statNameStruct = flexpanel_node_get_struct(statNamePanel);
			var statNameTextId = statNameStruct.layerElements[0].elementId;
			
			layer_text_text(statNameTextId, struct_get(global.statStruct, statNames[j]))
			
			var scoreStruct = flexpanel_node_get_struct(scorePanel);
			var scoreTextId = scoreStruct.layerElements[0].elementId;
			
			layer_text_text(scoreTextId, global.character_grid[# j + 1, charNum])
			
			if (!is_undefined(modPanel)) {
				var modStruct = flexpanel_node_get_struct(modPanel);
				var modTextId = modStruct.layerElements[0].elementId;
				
				layer_text_text(modTextId, mods[j]);
			}
		}
		#endregion
	}
}