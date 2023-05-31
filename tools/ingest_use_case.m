
fprintf("_______________________________________\n");
fprintf("Ingest use case.\n");
fprintf("_______________________________________\n");

directory_source = strcat("use_cases/use_case_",use_case_id);
file_source = "use_case_definition.csv";
filename = strcat(directory_source,"/",file_source);

fileid = fopen(filename);
fprintf("opening %s\nfor use case definition...\n",filename);

X = textscan(fileid,'%s %s',...
  'Delimiter',',');
fclose(fileid);

fprintf("data read, file closed.\n");

use_case_id_str        = string(X{2}{1});
assert(use_case_id_str == use_case_id);

time_horizon_start_str = string(X{2}{2});
time_horizon_end_str   = string(X{2}{3});

formatSpec = "yyyy-MM-dd HH:mm:ss";
time_horizon_start_dt  = datetime(time_horizon_start_str,'InputFormat',formatSpec);
time_horizon_end_dt    = datetime(time_horizon_end_str,  'InputFormat',formatSpec);


fprintf("  use case id %s\n",use_case_id_str);
fprintf("  t_start %s\n",time_horizon_start_str);
fprintf("  t_end   %s\n",time_horizon_end_str);

clear directory_source file_source fileid filename

fprintf("complete ingest use case.\n\n");

