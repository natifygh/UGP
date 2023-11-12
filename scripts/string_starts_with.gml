///string_starts_with(str1, str2)

var str1;
var str2;
var len;
var comp;

str1 = argument0;
str2 = argument1;

if(string_length(str2) < string_length(str1))
    return false;
    
len = string_length(str2);
comp = string_copy(str, 0, len);

if(comp == str2)
    return true;
else
    return false;

