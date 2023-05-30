% 
use_case_id = "1" ;
directory_source = "system_under_study/" ;
file_source = "6752174_-27.26_135.07_2020.csv" ;

directory_target = strcat("use_cases/use_case_",use_case_id,"/");
file_target = "x_Irr.csv" ;

fprintf("reframing time series from %s\n",strcat(directory_source,file_source));
fprintf("to %s\n",strcat(directory_target,file_target));


