///tokenize(string,sep):(global.token)

var str,sep,sepl,c,p;

str=argument0
sep=argument1
sepl=string_length(sep)
c=0
do {
    c+=1
    p=string_pos(sep,str)
    if (p=0) global.token[c]=str
    else {
        global.token[c]=string_copy(str,1,p-1)
        str=string_delete(str,1,p-1+sepl)
    }
} until (p=0)

global.token[0]=c


