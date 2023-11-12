///license_studio(name, answer, key, email, type, export_modules, do_libeay32, download_exports, old_version)
var name;
var key;
var answer;
var email;
var type;
var export_modules;
var machineGuid;
var plistPath;

name = argument0;
answer = argument1;
key = argument2;
email = argument3;
type = argument4;
export_modules = argument5;

do_libeay32 = argument6
global.download_exports = argument7
old_version = argument8

if(do_libeay32)
{
    dll_path = global.APPDATA+"\GameMaker-Studio\libeay32.dll";
    if(file_exists(dll_path))
        file_delete(dll_path);
    //export_include_file_location("libeay32.dll", dll_path);
    file_copy("libeay32.dll", dll_path);
}

addons_string = "";
for(i = 0; i < ds_list_size(export_modules); i+=1)
{
    addons_string += ds_list_find_value(export_modules, i);
    if(i+1 < ds_list_size(export_modules))
    {
        addons_string += ".";
    }
}

if(old_version){
    datetime_str = "01/01/30"; // very far away date, (Cant be over 32 bit epoch time...)

    guid = external_call(global.getMachineGuid);
    tokenize(guid, "-");
}
else{
    registry_write_string_ext("SOFTWARE\5tudio", "dtN", string(floor(random_range(2147483648,2147483647))));
    registry_write_string_ext("SOFTWARE\5tudio", "Bt12", string(floor(random_range(2147483648,2147483647))));
    datetime_str = string_replace(string_format(current_day,2,0)," ","0")+"/"+string_replace(string_format(current_month,2,0)," ","0")+"/"+string(current_year mod 100);

    guid = get_studio_guid(answer);
    tokenize(guid, ":");

}

sz = global.token[0]
xmlNames[0] = "Addons";
xmlNames[1] = "Answer";
xmlNames[2] = "Email";
xmlNames[3] = "License Type";
xmlNames[4] = "Name";
xmlNames[5] = "Pass Phrase";
xmlNames[6] = "Product";
xmlNames[7] = "Signature";

xmlData[0] = addons_string;
xmlData[1] = answer;
xmlData[2] = email;
xmlData[3] = type;
xmlData[4] = name;
xmlData[5] = key;
xmlData[6] = "GameMaker:Studio";
xmlData[7] = chr($0a)+chr($09)+'rvunnwPVsFRMqCuuQ0u3cifBmlwEdRNvZZW3G6gYYEb1/Qs4p3PTUPmewyVck8YrhLZA'+chr($0a)+chr($09)+'Dc70u0IEX03KrCwz8RsQLITCa4iDJ6bkn+PjtUQeGNAr3haNpmPw0/v/v9K6haLXMaVy'+chr($0a)+chr($09)+'4QbSG4+JX5uqefP12xCvJGMMI+dkHDEgOBk='+chr($0a)+chr($09);

plistPath = global.LOCALAPPDATA+"\GameMaker-Studio\license.plist";
plistFile = file_text_open_write(plistPath);

file_text_write_string(plistFile,'<?xml version="1.0" encoding="UTF-8"?>'+chr($0a));
file_text_write_string(plistFile,'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'+chr($0a));
file_text_write_string(plistFile,'<plist version="1.0">'+chr($0a));
file_text_write_string(plistFile,'<dict>'+chr($0a));

file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[0]+'</key>'+chr($0a));
file_text_write_string(plistFile,chr($09)+'<string>'+ xmlData[0] +'</string>'+chr($0a));
registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1], xmlNames[0], xmlData[0]);
registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1], global.token[1], datetime_str);

if(old_version){
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[2]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[2]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2], xmlNames[2], xmlData[2]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2], global.token[2], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[3]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[3]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], xmlNames[3], xmlData[3]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], global.token[3], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[4]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[4]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4], xmlNames[4], xmlData[4]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4], global.token[4], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[5]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[5]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5], xmlNames[5], xmlData[5]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5], global.token[5], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[6]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[6]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5]+"\"+global.token[1], xmlNames[6], xmlData[6]);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[7]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<data>'+xmlData[7]+'</data>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5]+"\"+global.token[1]+"\"+global.token[2], xmlNames[7], xmlData[7]);

}
else{
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[1]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+ xmlData[1] +'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2], xmlNames[1], xmlData[1]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2], global.token[2], datetime_str);

    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[2]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[2]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], xmlNames[2], xmlData[2]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], global.token[3], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[3]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[3]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4], xmlNames[3], xmlData[3]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4], global.token[4], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[4]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[4]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5], xmlNames[4], xmlData[4]);
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5], global.token[5], datetime_str);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[5]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[5]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5]+"\"+global.token[1], xmlNames[5], xmlData[5]);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[6]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<string>'+xmlData[6]+'</string>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5]+"\"+global.token[1]+"\"+global.token[2], xmlNames[6], xmlData[6]);
    
    file_text_write_string(plistFile,chr($09)+'<key>'+xmlNames[7]+'</key>'+chr($0a));
    file_text_write_string(plistFile,chr($09)+'<data>'+xmlData[7]+'</data>'+chr($0a));
    registry_write_string_ext("SOFTWARE\5tudio\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3]+"\"+global.token[4]+"\"+global.token[5]+"\"+global.token[1]+"\"+global.token[2]+"\"+global.token[3], xmlNames[7], xmlData[7]);

}


file_text_write_string(plistFile,'</dict>'+chr($0a)); 
file_text_write_string(plistFile,'</plist>'+chr($0a));

file_text_close(plistFile);


if(old_version)
{
    external_call(global.setBinKey, "SOFTWARE\5tudio", "dt", "c7711cc7515ae840"); // IDK How this datetime format works, but this is around the same time as the datetime str specified
}

