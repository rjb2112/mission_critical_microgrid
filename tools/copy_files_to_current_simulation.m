<<<<<<< HEAD
% copy files to current simulation

function copy_files_to_current_simulation(use_case_id, alternative_id)

directory_source = strcat("use_cases/use_case_",use_case_id,"/",alternative_id);
file_source = "x_T_1s.csv" ;
filename_source = strcat(directory_source,"/",file_source) ;

directory_destination = strcat("current_simulation");
file_destination = "x_T_1s.csv" ;
filename_destination = strcat(directory_destination,"/",file_destination) ;

copyfile(filename_source, filename_destination)

end
=======
% copy files to current simulation  THIS IS THE MOST RECENT, and ONLY IN PATH

function copy_files_to_current_simulation(use_case_id, alternative_id)

directory_source = strcat("use_cases/use_case_",use_case_id,"/",alternative_id);
file_source = "x_T_1s.csv" ;
filename_source = strcat(directory_source,"/",file_source) ;

directory_destination = strcat("current_simulation");
file_destination = "x_T_1s.csv" ;
filename_destination = strcat(directory_destination,"/",file_destination) ;

copyfile(filename_source, filename_destination) ;
>>>>>>> 665c4c871ba1ea1e7faa6b67bbb1426da676ba25
