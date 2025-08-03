if(keyboard_key >= ord("0") and keyboard_key <= ord("9")) {
    get_random_spell(keyboard_lastchar);


    layer_text_text(layer_text_get_id("UILayer_1", "NameText"), name);
    layer_text_text(layer_text_get_id("UILayer_1", "TypeText"), type);
    layer_text_text(layer_text_get_id("UILayer_1", "ClassText"), class);
    layer_text_text(layer_text_get_id("UILayer_1", "CastTimeText"), cast_time);
    layer_text_text(layer_text_get_id("UILayer_1", "RangeText"), range);
    layer_text_text(layer_text_get_id("UILayer_1", "ComponentText"), component);
    layer_text_text(layer_text_get_id("UILayer_1", "DurationText"), duration);
}