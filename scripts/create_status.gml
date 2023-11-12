///create_status(text)
text = argument0;

global.direction = 1;
instance_create(centerX-510, centerY+250, obj_back);
draw_text_obj = instance_create(centerX, centerY, obj_status_draw);
draw_text_obj.text = text;
