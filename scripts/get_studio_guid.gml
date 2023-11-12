///get_studio_guid(answer)

answer = argument0;

guid = external_call(global.getMachineGuid);
userName = environment_get_variable("USERNAME");
numProcessor = environment_get_variable("NUMBER_OF_PROCESSORS");
arch = environment_get_variable("PROCESSOR_ARCHITECTURE");
identifier = environment_get_variable("PROCESSOR_IDENTIFIER");
level = environment_get_variable("PROCESSOR_LEVEL");
revision = environment_get_variable("PROCESSOR_REVISION");
answerSeed = "md_" + answer + "_rk";

uniqueIdStr = userName + identifier + level + guid + numProcessor + arch + revision + answerSeed;
studioGuid = external_call(global.MD5, uniqueIdStr);
//show_error(uniqueIdStr+" : "+studioGuid, false);

pt1 = string_copy(studioGuid,1,8);
pt2 = string_copy(studioGuid,9,4);
pt3 = string_copy(studioGuid,13,4);
pt4 = string_copy(studioGuid,17,4);
pt5 = string_copy(studioGuid,21,12);

finalGuid = pt1+":"+pt2+":"+pt3+":"+pt4+":"+pt5;
return string_upper(finalGuid);
