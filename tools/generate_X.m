  tic;
  code_section_number = 300;
  code_section_string = "generate_X";
  fprinft("\n");
  fprintf("%3d     %-40s",code_section_number,code_section_string);

alternative_id = "a0";

directory_source = "system_under_study/model_environment";
directory_destination = strcat("use_cases/use_case_",use_case_id,"/",alternative_id);
d1 = directory_source      ;
d2 = directory_destination ;

f1 = "model_environment_annual_T_1s.csv";
f2 = "X_Temp.csv";
trim_timeseries_and_copy(t1,t2,d1,f1,d2,f2);

f1 = "model_environment_annual_GHI_1s.csv";
f2 = "X_Irr.csv";
trim_timeseries_and_copy(t1,t2,d1,f1,d2,f2);




copy_files_to_current_simulation(use_case_id,alternative_id);  % use case id already known

fprintf("%.2f\n",toc);


