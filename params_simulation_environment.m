warning('off', 'MATLAB:MKDIR:DirectoryExists');

cd tools

handle_build_source_datasets = @build_source_datasets
handle_interpolate_solar     = @interpolate_solar
handle_ingest_use_case       = @ingest_use_case
handle_set_time_horizon      = @set_time_horizon

cd ../


