///start_cracked_updater()

location = environment_get_variable("TEMP")+"\updater";
if(!directory_exists(location)){
    directory_create(location);
}
else{
    file_delete(location+"\ModuleDownloader.exe");
}

//export_include_file_location("ModuleDownloader.exe", location+"\ModuleDownloader.exe");
file_copy("ModuleDownloader.exe", location+"\ModuleDownloader.exe");
execute_program(location+"\ModuleDownloader.exe","",false);

game_end()

