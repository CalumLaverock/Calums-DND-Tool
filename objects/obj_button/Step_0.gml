var spellinfo_node = layer_get_flexpanel_node("UILayer_1");
var button_node = flexpanel_node_get_child(spellinfo_node, "Button");

if(button_node != pointer_null)
{
    var display_type = obj_spell.name != "" ? flexpanel_display.flex : flexpanel_display.none;
    flexpanel_node_style_set_display(button_node, display_type);
}