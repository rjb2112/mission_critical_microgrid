  tic;
  code_section_number = 102;
  code_section_string = "build_source_datasets";
  fprintf("%3d     %-40s",code_section_number,code_section_string);



if (option_generate_datetime_vector)
  t1 = datetime(2020, 1, 1, 0, 0, 0);
  t2 = datetime(2020,12,31,23,59,59);
  T.dv = datevec(t1:seconds(1):t2);
  clear t1 t2
end
 

% -----   G E N E R A T I O N   -----


if (interpolate_solar_source_data)
interpolate_solar
end




% -----   L O A D   -----

%generate_model_load_requirements_1
%generate_model_load_requirements_2
generate_model_load_priority_1
generate_model_load_priority_2

  fprintf("%.2f\n",toc);


