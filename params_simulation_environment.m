warning('off', 'MATLAB:MKDIR:DirectoryExists');

cd tools

% ---------- DATA WRANGLING

handle_build_source_datasets = @build_source_datasets   ;
handle_interpolate_solar     = @interpolate_solar       ;
handle_load_x_into_workspace = @load_x_into_workspace   ;

% ---------- USE CASE, TIME HORIZON, DECISION MAKING

handle_ingest_use_case       = @ingest_use_case         ;
handle_set_time_horizon      = @set_time_horizon        ;


% ---------- FILE HANDLING

handle_trim_timeseries_and_copy         = @trim_timeseries_and_copy          ;
handle_copy_files_to_current_simulation = @copy_files_to_current_simulation  ;


% ---------- SIMULATION

handle_simulate_microgrid_and_mission_coupled_modelset = @simulate_microgrid_and_mission_coupled_modelset




cd ../


