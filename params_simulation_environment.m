% params_simulation_environment
  tic;
  code_section_number = 100;
  code_section_string = "params_simulation_environment";
  fprintf("%3d     %-40s",code_section_number,code_section_string);



% Start of script.

datetimeFormatSpec = 'yyyy-MM-dd HH:mm:ss';

warning('off', 'MATLAB:MKDIR:DirectoryExists');

cd tools

% ---------- DATA WRANGLING

handle_build_source_datasets = @build_source_datasets   ;
handle_interpolate_solar     = @interpolate_solar       ;
handle_generate_X            = @generate_X              ;
handle_load_x_into_workspace = @load_x_into_workspace   ;

% ---------- USE CASE, TIME HORIZON, DECISION MAKING

handle_ingest_use_case       = @ingest_use_case         ;
handle_set_time_horizon      = @set_time_horizon        ;


% ---------- FILE HANDLING

handle_trim_timeseries_and_copy           = @trim_timeseries_and_copy           ;
handle_copy_files_to_current_simulation   = @copy_files_to_current_simulation   ;
handle_generate_model_load_requirements_1 = @generate_model_load_requirements_1 ;
handle_generate_model_load_requirements_2 = @generate_model_load_requirements_2 ;
handle_generate_model_load_priority_1     = @generate_model_load_priority_1     ;
handle_generate_model_load_priority_2     = @generate_model_load_priority_2     ;
handle_generate_model_load_connected_1    = @generate_model_load_connected_1     ;
handle_generate_model_load_connected_2    = @generate_model_load_connected_2     ;


% ---------- SIMULATION

handle_simulate_microgrid_and_mission_coupled_modelset = @simulate_microgrid_and_mission_coupled_modelset ;




cd ../

fprintf("%.2f\n",toc);
