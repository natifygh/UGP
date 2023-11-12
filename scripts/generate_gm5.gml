///generate_gm5(name, version)

var name;
var version;
var new_name;

var start;

var part_1;
var part_2;

var encoded_name_1;
var encoded_name_2;

var key_part_1;
var key_part_2;
var key_part_3;

var checksum;
var key;

var ename;

name = argument0;
version = argument1;


// Pad name out with "X" (if its < 5 chars long)
new_name = string_upper(pad(name, 5, "X"));

// Remove " " from the name
new_name = string_replace_all(new_name, " ", "");

// Start 5 characters from the end
start = (string_length(new_name) - 5)+1;


if(version == 6){ // For GameMaker 6.0
    ename = string_copy(new_name, start, 5);
    return external_call(global.generateGM6Key, ename);
}


// Extract last 5 characters, into a 2 char and 3 char string
part_1 = string_copy(new_name, start, 2);
part_2 = string_copy(new_name, start+2, 3);


// Encode the name with base 0x1E
encoded_name_1 = encode_name_part(part_1, version);
encoded_name_2 = encode_name_part(part_2, 0);

// Generate a random key_part_1
key_part_1 = floor(random_range(0, 32767));

// Calculate key_part 2 and 3
key_part_2 = encoded_name_2 + key_part_1;
key_part_3 = encoded_name_1 + key_part_1;

// Calculate checksum
checksum = key_part_1 + encoded_name_1 + encoded_name_2;

// Append all the key_part to construct the key.
key = pad(dectohex(key_part_1), 4, "0") + "-" + pad(dectohex(key_part_2), 4, "0") + "-" +  pad(dectohex(key_part_3), 4, "0") + "-" + pad(dectohex(checksum), 4, "0");

// If key is blacklisted, regenerate.
while(check_blacklist(key)){
    key = generate_gm5(name, version);
}

return key;
