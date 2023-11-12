///pad(h, len, c)

var h;
var c;
var len;

h = argument0;
len = argument1;
c = argument2;

while(string_length(h) < len){
    h = c + h;
}

return h;
