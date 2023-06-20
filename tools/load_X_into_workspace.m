  tic;
  code_section_number = 301;
  code_section_string = "load_x_into_workspace";
  fprintf("%3d     %-40s",code_section_number,code_section_string);


% FIRST need to make a timeseries column based on t1, t2


directory_source = "current_simulation";

X = struct ;

i=1; X(i).name = "Irr";
i=2; X(i).name = "Temp";
i=3; X(i).name = "load_E_req_1";
i=4; X(i).name = "load_E_req_2";
i=5; X(i).name = "load_priority_1";
i=6; X(i).name = "load_priority_2";


for i=1:size(X,2)
 X(i).filename = strcat("x_",X(i).name,".csv") ;
file_source = X(i).filename;
filename = strcat(directory_source,"/",file_source);
fileid = fopen(filename);
A = textscan(fileid,'%d %d %d %d %d %d %f','Delimiter',',');
fclose(fileid);
Y = double(A{7}); % first 6 are datevec [ YY MM DD hh mm ss ]
X(i).value = [ T.clock Y ];
clear A Y
end




% X.Irr = [ T Y ] ;


% assert that all data aligns ? (not necessary )

  fprintf("%.2f\n",toc);
