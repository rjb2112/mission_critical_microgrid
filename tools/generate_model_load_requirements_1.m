% generate model for load requirements for 1s data
% given 24 hours cycle
% model is ideal, no variation

directory_source = "system_under_study/model_microgrid";
file_source = "model_load_1_ideal_24h.csv";


directory_destination = "system_under_study/model_microgrid";
file_destination = "load_E_req_1.csv";

filename = strcat(directory_source,"/",file_source);
fileid = fopen(filename);
fprintf("opening %s\nfor ideal daily load 1 E requirements, breaks...\n",filename);

X = textscan(fileid,'%s %d %d %f','Delimiter',',');
fclose(fileid);
fprintf("data read, file closed.\n");

L.name  = X{1};
L.t1    = X{2};
L.t2    = X{3};
L.req_E = X{4};
n       = size(L.name,1);

L.req_partial = zeros(24*60*60,n);

for i = 1:n
run_t1 = 3600*L.t1(i) + 1;
run_t2 = 3600*L.t2(i) - 0;
run_n  = run_t2 - run_t1 + 1;
assert(run_n <= 86400);
L.req_partial(run_t1:run_t2,i) = L.req_E(i) * ones(run_n,1);
end

L.req_total = transpose(sum(transpose(L.req_partial)));

load_E_req_1 = zeros(60*60*24*366,1);

for i = 1:366
i1 = ((60*60*24)*(i-1))+1 ;
i2 = i1 + (60*60*24) - 1 ;
load_E_req_1(i1:i2,1) = L.req_total;
end

filename = strcat(directory_destination,"/",file_destination);
writematrix([dv load_E_req_1],filename);
fprintf("  wrote %s in %.1f seconds.\n", filename, toc);












