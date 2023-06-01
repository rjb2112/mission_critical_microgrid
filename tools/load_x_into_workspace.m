% load x into workspace
% for each x timeseries input in the current_simulation folder,
% convert to a time series that is usable by Simulink

% future BATCH this by looking through directory? (not necessary for scope)




% FIRST need to make a timeseries column based on t1, t2

clear sim_duration sim_clock

sim_duration = seconds( t2 - t1 ) +1         ;
sim_clock    = transpose( 1:1:sim_duration ) ;
T            = sim_clock                     ;
X = struct ;


directory_source = "current_simulation";

file_source = "x_Irr_1s.csv";
filename = strcat(directory_source,"/",file_source);
fileid = fopen(filename);
A = textscan(fileid,'%d %d %d %d %d %d %f','Delimiter',',');
fclose(fileid);
Y = double(A{7}); % first 6 are datevec [ YY MM DD hh mm ss ]
X.Irr = [ T Y ] ;
clear A Y


file_source = "x_T_1s.csv";
filename = strcat(directory_source,"/",file_source);
fileid = fopen(filename);
A = textscan(fileid,'%d %d %d %d %d %d %f','Delimiter',',');
fclose(fileid);
Y = double(A{7}); % first 6 are datevec [ YY MM DD hh mm ss ]
X.Temp = [ T Y ] ;
clear A Y






% assert that all data aligns ? (not necessary )
