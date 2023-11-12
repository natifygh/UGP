///encode_name_part(name, version)

var name;
var version;

var total;
var multi;

var i;
var c;

name = argument0;
version = argument1;

total = 0;
multi = 1;
for(i = 1; i <= string_length(name); i+=1) {
    c = ord(string_char_at(name, i));
    
    total += (c - 64) * multi;
    multi *= 30;
}
total += version * multi 
return total 
