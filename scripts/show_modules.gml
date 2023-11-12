///show_modules(pos)

with(obj_lstbox_entry_module){
    instance_destroy();
}

pos = argument0;
global.current_pos = pos;
max_entries = 16;

for(i = 0; i < ds_list_size(global.export_modules)-(max_entries*pos); i+=1)
{
    entry = instance_create(obj_draw.centerX-770, obj_draw.centerY-330 + (40*i+10), obj_lstbox_entry_module)
    entry.text = ds_list_find_value(global.export_modules, (i + (max_entries*pos)))
    entry.index = (i + (max_entries*pos));
    if(i >= max_entries)
    {
        entry.text = "Next Page";
        entry.index = -1; 
        break;  
    }
}

if(i == 0 && pos > 0)
{
    show_modules(0);
}

if(i < max_entries && pos > 0)
{
   entry = instance_create(obj_draw.centerX-770, obj_draw.centerY-330 + (40*i+10), obj_lstbox_entry_module)
   entry.text = "Next Page";
   entry.index = -1;
 
}
