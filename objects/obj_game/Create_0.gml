font_enable_effects(fnt_outline, true, {
    outlineEnable: true,
    outlineDistance: 2,
    outlineColour: c_black
});

font_enable_effects(fnt_outline_big, true, {
    outlineEnable: true,
    outlineDistance: 3,
    outlineColour: c_black
});

font_enable_effects(fnt_outline_small, true, {
    outlineEnable: true,
    outlineDistance: 1,
    outlineColour: c_black
});

display_set_gui_maximise();

toggle_layer("MapLayer");

character_info = load_csv("Characters/Characters.csv");