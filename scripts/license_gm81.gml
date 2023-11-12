///license_gm81(name, key, do_libeay32)
var name;
var key;
var machineGuid;
var plistPath;

name = argument0;
key = argument1;

if(argument2)
{
    dll_path = global.APPDATA+"\GameMaker\libeay32.dll";
    if(file_exists(dll_path))
        file_delete(dll_path);
    //export_include_file_location("libeay32.dll", dll_path);
    file_copy("libeay32.dll", dll_path);
}

guid = external_call(global.getMachineGuid);
tokenize(guid, "-");
sz = global.token[0]
xmlNames[0] = "Name";
xmlNames[1] = "Pass Phrase";
xmlNames[2] = "Product";
xmlNames[3] = "Signature";

xmlData[0] = name;
xmlData[1] = key;
xmlData[2] = "GameMaker for Windows";
xmlData[3] = chr($0a)+chr($09)+'rvunnwPVsFRMqCuuQ0u3cifBmlwEdRNvZZW3G6gYYEb1/Qs4p3PTUPmewyVck8YrhLZA'+chr($0a)+chr($09)+'Dc70u0IEX03KrCwz8RsQLITCa4iDJ6bkn+PjtUQeGNAr3haNpmPw0/v/v9K6haLXMaVy'+chr($0a)+chr($09)+'4QbSG4+JX5uqefP12xCvJGMMI+dkHDEgOBk='+chr($0a)+chr($09);
plistPath = global.LOCALAPPDATA+"\GameMaker8.1\license.plist";
plistFile = file_text_open_write(plistPath);

//datetime_str = string_replace(string_format(current_day,2,0)," ","0")+"/"+string_replace(string_format(current_month,2,0)," ","0")+"/"+string(current_year mod 100);

datetime_str = "01/01/30"; // very far away date, (Cant be over 32 bit epoch time...)

file_text_write_string(plistFile,'<?xml version="1.0" encoding="UTF-8"?>'+chr($0a));
file_text_write_string(plistFile,'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'+chr($0a));
file_text_write_string(plistFile,'<plist version="1.0">'+chr($0a));
file_text_write_string(plistFile,'<dict>'+chr($0a));

file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[0]+'</key>'+chr($0a));
file_text_write_string(plistFile,chr($09)+'<string>'+ xmlData[0] +'</string>'+chr($0a));
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1], xmlNames[0], xmlData[0]);
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1], global.token[1], datetime_str);

file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[1]+'</key>'+chr($0a));
file_text_write_string(plistFile,chr($09)+'<string>'+ xmlData[1] +'</string>'+chr($0a));
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1]+"\"+global.token[2], xmlNames[1], xmlData[1]);
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1]+"\"+global.token[2], global.token[2], datetime_str);

file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[2]+'</key>'+chr($0a));
file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[2]+'</string>'+chr($0a));
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], xmlNames[2], xmlData[2]);
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], global.token[3], datetime_str);


file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[3]+'</key>'+chr($0a));
file_text_write_string(plistFile,chr($09)+'<data>'+xmlData[3]+'</data>'+chr($0a));
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4], xmlNames[3], xmlData[3]);
registry_write_string_ext("SOFTWARE\Game Maker\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4], global.token[4], datetime_str);


file_text_write_string(plistFile,'</dict>'+chr($0a)); 
file_text_write_string(plistFile,'</plist>'+chr($0a));

file_text_close(plistFile);

external_call(global.setBinKey, "SOFTWARE\Game Maker", "dt", "c7711cc7515ae840"); // IDK How this datetime format works, but this is around the same time as the datetime str specified
