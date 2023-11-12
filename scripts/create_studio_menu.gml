global.direction = 1;

instance_create(centerX-250, centerY-150, obj_checkmark_libeay32);
instance_create(centerX-250, centerY-90, obj_checkmark_modules);
instance_create(centerX-290, centerY-30, obj_textinput_name);
instance_create(centerX-290, centerY+15, obj_textinput_key);
instance_create(centerX-290, centerY+60, obj_textinput_email);
instance_create(centerX-290, centerY+105, obj_textinput_answer);
instance_create(centerX-290, centerY+150, obj_textinput_type);

instance_create(centerX+300, centerY+280, obj_checkmark_old);

instance_create(centerX, centerY+250, obj_go_studio);
instance_create(centerX-510, centerY+250, obj_back);

instance_create(centerX-949, centerY+375, obj_textinput_module);

show_modules(0);
