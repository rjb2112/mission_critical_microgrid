% trim_timeseries

% expects file to have date vector (6 fields) first,
% then a 7th column of y data
% t1 and t2 are datetime values

function trim_timeseries_and_copy(t1,t2,d1,f1,d2,f2)

directory_source = d1 ;
directory_target = d2 ;
file_source      = f1 ;
file_target      = f2 ;

filename = strcat(directory_source,"/",file_source);
fileid = fopen(filename);
X = textscan(fileid,'%d %d %d %d %d %d %f ',...
  'Delimiter',',');
fclose(fileid);

% convert datevec to datetime array

YY = double(X{1}) ;
MM = double(X{2}) ;
DD = double(X{3}) ;
hh = double(X{4}) ;
mm = double(X{5}) ;
ss = double(X{6}) ;
y1 = double(X{7}) ;

% find indices to trim timeseries at

X_D = [ YY MM DD hh mm ss ];
% clear YY MM DD hh mm ss

D = datetime( X_D );
D.Format = "yyyy-MM-dd HH:mm:ss";
t_earliest = min(D) ;
t_latest   = max(D) ;
assert(t1 >= t_earliest) ;
assert(t2 <= t_latest  ) ;
i1 = find(D == t1)
i2 = find(D == t2)


% generate trimmed timeseries and dataset

X_Y = [ YY MM DD hh mm ss y1 ] ;

Y = X_Y(i1:i2,:) ;


% now write file



tic
filename = strcat(directory_target,"/",file_target);
writematrix(Y,filename);
fprintf("  wrote %s in %.1f seconds.\n", filename, toc);

end
