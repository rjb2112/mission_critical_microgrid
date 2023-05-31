
fprintf("_______________________________________\n");
fprintf("Interpolating solar environmental data.\n");
fprintf("_______________________________________\n");

clear X YY MM DD hh mm y1 y2 y3 y4 Y i i1 i2 n
clear step_x step_y1 step_y2 step_y3 step_y4 step_t
clear directory_source file_source filename
clear directory_target file_target fileid



directory_source = "system_under_study/model_environment";
file_source = "6752174_-27.26_135.07_2020.csv" ;

directory_target = "system_under_study/model_environment";

filename = strcat(directory_source,"/",file_source);
fileid = fopen(filename);
fprintf("opening %s\nfor 10 minute solar environmental data...\n",filename);

X = textscan(fileid,'%d %d %d %d %d %f %f %f %f',...
  'Delimiter',',');
fclose(fileid);
fprintf("data read, file closed.\n");


tic
step_x = 10*60;
step_t = [1:600]';

YY = X{1} ;
MM = X{2} ;
DD = X{3} ;
hh = X{4} ;
mm = X{5} ;
y1 = X{6} ;
y2 = X{7} ;
y3 = X{8} ;
y4 = X{9} ;

% add final element so that loop has final value to interpolate between

n = size(X{1},1);
YY(n+1) = 2021;
MM(n+1) = 01;
DD(n+1) = 01;
hh(n+1) = 00;
mm(n+1) = 00;
y1(n+1) = y1(n) ;
y2(n+1) = y2(n) ;
y3(n+1) = y3(n) ;
y4(n+1) = y4(n) ;

Y = zeros(366*24*60*60,1) ;

for i=1:size(X{1},1)

  i1 = step_x * (i-1) + 1  ;
  i2 = step_x + i1 - 1     ;
  step_y1 = ( y1(i) - y1(i+1)) / step_x ;
  step_y2 = ( y2(i) - y2(i+1)) / step_x ;
  step_y3 = ( y3(i) - y3(i+1)) / step_x ;
  step_y4 = ( y4(i) - y4(i+1)) / step_x ;
  Y(i1:i2,1) = y1(i) + (step_t.*step_y1)   ;
  Y(i1:i2,2) = y2(i) + (step_t.*step_y2)   ;
  Y(i1:i2,3) = y3(i) + (step_t.*step_y3)   ;
  Y(i1:i2,4) = y4(i) + (step_t.*step_y4)   ;

end

fprintf("interpolated in %2.1f seconds.\n", toc);














% generating datetime array, separate from other data


n = size(X{1},1);
YY(n+1) = 2021;
MM(n+1) = 01;
DD(n+1) = 01;
hh(n+1) = 00;
mm(n+1) = 00;
y1(n+1) = y1(n) ;
y2(n+1) = y2(n) ;
y3(n+1) = y3(n) ;
y4(n+1) = y4(n) ;

Y = zeros(366*24*60*60,1) ;

for i=1:size(X{1},1)

  i1 = step_x * (i-1) + 1  ;
  i2 = step_x + i1 - 1     ;
  step_y1 = ( y1(i) - y1(i+1)) / step_x ;
  step_y2 = ( y2(i) - y2(i+1)) / step_x ;
  step_y3 = ( y3(i) - y3(i+1)) / step_x ;
  step_y4 = ( y4(i) - y4(i+1)) / step_x ;
  Y(i1:i2,1) = y1(i) + (step_t.*step_y1)   ;
  Y(i1:i2,2) = y2(i) + (step_t.*step_y2)   ;
  Y(i1:i2,3) = y3(i) + (step_t.*step_y3)   ;
  Y(i1:i2,4) = y4(i) + (step_t.*step_y4)   ;

end


% could just generate datetime series, but will use source data
% to ensure alignment between datetimes and data

step_mm = 10 ;
step_ss = 60 ;
array_ss = [0:1:59]';

D = zeros(366*24*60*60,6) ; % 6 fields for datevec

for i=1:size(X{1},1)

  for m=0:step_mm-1

    i1 = (step_ss * step_mm * (i-1)) + (step_ss * (m)) + 1 ;
    i2 = i1 + step_ss - 1 ;

    D(i1:i2,1) = YY(i);
    D(i1:i2,2) = MM(i);
    D(i1:i2,3) = DD(i);
    D(i1:i2,4) = hh(i);
    D(i1:i2,5) = mm(i) + m ;
    D(i1:i2,6) = array_ss ;
  end
end

M_D   = [ D(:,1) D(:,2) D(:,3) D(:,4) D(:,5) D(:,6) ];
M_T   = [ M_D Y(:,1) ];
M_DNI = [ M_D Y(:,2) ];
M_GHI = [ M_D Y(:,3) ];
M_DHI = [ M_D Y(:,4) ];

tic
file_target = "model_environment_annual_T_1s.csv" ;
filename = strcat(directory_target,"/",file_target);
writematrix(M_T,filename);
fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

tic
file_target = "model_environment_annual_DNI_1s.csv" ;
filename = strcat(directory_target,"/",file_target);
writematrix(M_DNI,filename);
fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

tic
file_target = "model_environment_annual_GHI_1s.csv" ;
filename = strcat(directory_target,"/",file_target);
writematrix(M_GHI,filename);
fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

tic
file_target = "model_environment_annual_DHI_1s.csv" ;
filename = strcat(directory_target,"/",file_target);
writematrix(M_DHI,filename);
fprintf("  wrote %s in %.1f seconds.\n", filename, toc);



clear X YY MM DD hh mm y1 y2 y3 y4 Y i i1 i2 n ans
clear step_x step_y1 step_y2 step_y3 step_y4 step_t
clear directory_source file_source filename
clear directory_target file_target fileid
clear D M_D M_T M_DNI M_GHI M_DHI


fprintf("complete with interpolating solar dataset.\n\n");






% if the future need to use the Table format arises
% (perhaps due to including datetime as text values)
% use these commands and files

% T_D   = table(D(:,1),D(:,2),D(:,3),D(:,4),D(:,5),D(:,6));
% T_T   = table(D(:,1),D(:,2),D(:,3),D(:,4),D(:,5),D(:,6),Y(:,1));
% T_DNI = table(D(:,1),D(:,2),D(:,3),D(:,4),D(:,5),D(:,6),Y(:,2));
% T_GHI = table(D(:,1),D(:,2),D(:,3),D(:,4),D(:,5),D(:,6),Y(:,3));
% T_DHI = table(D(:,1),D(:,2),D(:,3),D(:,4),D(:,5),D(:,6),Y(:,4));





% if future need for the data without associated datetimes

% tic
% file_target = "model_environment_T_1s_dateless.csv" ;
% filename = strcat(directory_target,"/",file_target);
% writematrix(Y(:,1),filename);
% fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

% tic
% file_target = "model_environment_DNI_1s_dateless.csv" ;
% filename = strcat(directory_target,"/",file_target);
% writematrix(Y(:,2),filename);
% fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

% tic
% file_target = "model_environment_GHI_1s_dateless.csv" ;
% filename = strcat(directory_target,"/",file_target);
% writematrix(Y(:,3),filename);
% fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

% tic
% file_target = "model_environment_DHI_1s_dateless.csv" ;
% filename = strcat(directory_target,"/",file_target);
% writematrix(Y(:,4),filename);
% fprintf("  wrote %s in %.1f seconds.\n", filename, toc);
