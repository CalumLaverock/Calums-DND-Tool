function populate_shop_info(info_grid, shop_name) {
	if(ds_exists(info_grid, ds_type_grid) == false)
		info_grid = load_csv(shop_name);
	
	var UILayer = layer_get_flexpanel_node(shop_name + "Layer");
	var itemNamePanel = flexpanel_node_get_child(UILayer, "ItemPanel");
	var itemNameStruct = flexpanel_node_get_struct(itemNamePanel);
	
	var textId = itemNameStruct.layerElements[0].elementId;
	
	var itemNames = [];
	
	for (var i = 0; i < ds_grid_height(info_grid); i++) {
		array_push(itemNames, string(info_grid[# 0, i]));
	}
	
	var itemNamesString = string_join_ext("\n", itemNames);
	
	layer_text_text(textId, itemNamesString);
}