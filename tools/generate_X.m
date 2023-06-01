  tic;
  code_section_number = 300;
  code_section_string = "generate_X";
  fprintf("%3d     %-40s",code_section_number,code_section_string);

alternative_id = "a0";

directory_source = "system_under_study/model_environment";
d1 = directory_source

directory_destination = strcat("use_cases/use_case_",use_case_id,"/",alternative_id);
d2 = directory_destination

f1 = "model_environment_annual_T_1s.csv";
f2 = "x_Temp.csv";
trim_timeseries_and_copy(t1,t2,d1,f1,d2,f2);


f1 = "model_environment_annual_GHI_1s.csv";
f2 = "x_Irr.csv";
trim_timeseries_and_copy(t1,t2,d1,f1,d2,f2);

copy_files_to_current_simulation(use_case_id,alternative_id);  % use case id already known

load_x_into_workspace      % load all x_input .csv files into Simulink timeseries



  fprintf("%.2f",toc);

