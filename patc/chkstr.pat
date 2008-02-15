% chkstr.pat
%
% History:
%   21-NOV-1995 Created (Jeroen Hellingman)

@patterns 0

"\""    1 "\""
"\\\""  p "\\""
"\\\\"  p "\\\\"

@patterns 1
"\""    0 "\""
"\\\""  p "\\\""
"\\\\"  p "\\\\"
"\n"    0 "%%% ERROR: STRING TERMINATION\n"

@end
