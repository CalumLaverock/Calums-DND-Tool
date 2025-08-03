image_blend = c_grey;

if(obj_spell.name != "")
{
    var spell_name = string_replace_all(obj_spell.name, " ", "-");
    
    var url = string_concat("http://dnd2024.wikidot.com/spell:", spell_name)
    url_open(url);
}