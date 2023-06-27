directory_source = strcat("use_cases/use_case_",use_case_id);
file_source = "use_case_definition.csv";
filename = strcat(directory_source,"/",file_source);

fileid = fopen(filename);

X = textscan(fileid,'%s %s',...
  'Delimiter',',');
fclose(fileid);

% fprintf("data read, file closed.\n");

use_case_id_str        = string(X{2}{1});
assert(use_case_id_str == use_case_id);

simulation_time_horizon_start_str = string(X{2}{2});
simulation_time_horizon_end_str   = string(X{2}{3});

decision_time_horizon_start_str = string(X{2}{4});
decision_time_horizon_end_str   = string(X{2}{5});

% values

T.sim_t1  = datetime(simulation_time_horizon_start_str,'InputFormat',datetimeFormatSpec);
T.sim_t2  = datetime(simulation_time_horizon_end_str,'InputFormat',datetimeFormatSpec);
T.sim_tn  = seconds(T.sim_t1 - T.sim_t2) + 1   ;
T.sim_t1s = string(T.sim_t1,datetimeFormatSpec);
T.sim_t2s = string(T.sim_t2,datetimeFormatSpec);
T.sim_tns = string(T.sim_tn);

T.dec_t1  = datetime(decision_time_horizon_start_str,'InputFormat',datetimeFormatSpec);
T.dec_t2  = datetime(decision_time_horizon_end_str,'InputFormat',datetimeFormatSpec);
T.dec_tn  = seconds(T.sim_t1 - T.sim_t2) + 1   ;
T.dec_t1s = string(T.dec_t1,datetimeFormatSpec);
T.dec_t2s = string(T.dec_t2,datetimeFormatSpec);
T.dec_tns = string(T.dec_tn);



% arrays

T.sim_dt_array = transpose(T.sim_t1:seconds(1):T.sim_t2);
T.sim_clock = transpose(1:1:T.sim_tn);

T.dec_dt_array = transpose(T.dec_t1:seconds(1):T.dec_t2);
T.dec_clock = transpose(1:1:T.dec_tn);


fprintf(" ━ USE CASE [ %s ]\n",use_case_id);
% fprintf("%s to ",time_horizon_start_str);
% fprintf("%s\n",time_horizon_end_str);

clear directory_source file_source fileid filename X
clear simulation_time_horizon_start_str
clear simulation_time_horizon_end_str
clear decision_time_horizon_start_str
clear decision_time_horizon_end_str


