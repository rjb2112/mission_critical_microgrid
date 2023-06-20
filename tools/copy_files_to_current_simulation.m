% copy files to current simulation

function copy_files_to_current_simulation(use_case_id, alternative_id)

directory_source      = strcat("use_cases/use_case_",use_case_id,"/",alternative_id);
directory_destination = strcat("current_simulation");

Z = dir;



for i=1:size(Z,1)
if (contains(Z(i).name,"x_")
file_source      = Z(i).name;
file_destination = Z(i).name
filename_source      = strcat(directory_source,"/",file_source) ;
filename_destination = strcat(directory_destination,"/",file_destination) ;
copyfile(filename_source, filename_destination) ;
end
end
