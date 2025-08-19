if(keyboard_key >= ord("0") and keyboard_key <= ord("9")) {
    get_random_spell(keyboard_lastchar);

    layer_text_text(layer_text_get_id("SpellLayer", "NameText"), name);
    layer_text_text(layer_text_get_id("SpellLayer", "TypeText"), type);
    layer_text_text(layer_text_get_id("SpellLayer", "ClassText"), class);
    layer_text_text(layer_text_get_id("SpellLayer", "CastTimeText"), cast_time);
    layer_text_text(layer_text_get_id("SpellLayer", "RangeText"), range);
    layer_text_text(layer_text_get_id("SpellLayer", "ComponentText"), component);
    layer_text_text(layer_text_get_id("SpellLayer", "DurationText"), duration);
}