///generate_gm6(name)
var name;
var new_name;
var start;
var encname;

// Pad name out with "X" (if its < 5 chars long)
new_name = string_upper(pad(name, 5, "X"));

// Start 5 characters from the end
start = (string_length(new_name) - 5)+1;

// Extract last 5 characters, into a 2 char and 3 char string
encname = string_copy(new_name, start, 2);

external_call(global.generateGM6Key, argument0);

