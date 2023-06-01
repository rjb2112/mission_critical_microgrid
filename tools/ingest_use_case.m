  tic;
  fprintf("\n");
  code_section_number = 200;
  code_section_string = "ingest_use_case";
  fprintf("%3d     %-40s",code_section_number,code_section_string);



directory_source = strcat("use_cases/use_case_",use_case_id);
file_source = "use_case_definition.csv";
filename = strcat(directory_source,"/",file_source);

fileid = fopen(filename);
% fprintf("opening %s\nfor use case definition...\n",filename);

X = textscan(fileid,'%s %s',...
  'Delimiter',',');
fclose(fileid);

% fprintf("data read, file closed.\n");

use_case_id_str        = string(X{2}{1});
assert(use_case_id_str == use_case_id);

time_horizon_start_str = string(X{2}{2});
time_horizon_end_str   = string(X{2}{3});

% formatSpec = "yyyy-MM-dd HH:mm:ss";
time_horizon_start_dt  = datetime(time_horizon_start_str,'InputFormat',datetimeFormatSpec);
time_horizon_end_dt    = datetime(time_horizon_end_str,  'InputFormat',datetimeFormatSpec);


  fprintf("%.2f",toc);

fprintf(" ━ USE CASE [ %s ]\n",use_case_id_str);
% fprintf("%s to ",time_horizon_start_str);
% fprintf("%s\n",time_horizon_end_str);

clear directory_source file_source fileid filename


