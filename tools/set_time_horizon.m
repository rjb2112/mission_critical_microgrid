  tic;
  code_section_number = 201;
  code_section_string = "set_time_horizon";
  fprintf("%3d     %-40s",code_section_number,code_section_string);

% values

t1  = time_horizon_start_dt         ;
t2  = time_horizon_end_dt           ;
tn  = seconds(t2 - t1) + 1          ;

% string representations

t1s = string(t1,datetimeFormatSpec) ;
t2s = string(t2,datetimeFormatSpec) ;

% arrays

t   = 1:1:tn                        ;
T   = transpose(t1:seconds(1):t2)   ;
Ts  = string(T,datetimeFormatSpec)  ;

  fprintf("%.2f",toc);

fprintf(" ━ %s → %s\n",t1s,t2s);
