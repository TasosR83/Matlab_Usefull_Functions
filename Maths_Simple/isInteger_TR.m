function [ res ] = isInteger_TR( number )
% because isinteger of matlab returns True only for uint8 inputs...
%
% EXAMPLES:
% isInteger_TR( 4.00 )
% isInteger_TR( -4.00 )
% isInteger_TR( -4.0010 )
% isInteger_TR( 'skata' )
% isInteger_TR( 6+eps )   %----------->PROBLEM HERE !!!!!
% isInteger_TR( 6-eps )
% isInteger_TR(inf)

%% method 1
if false
res = 0;
if isnumeric(number) && number==floor(number)
    res=1;
end
end

%% method 2
res = 0;
if isnumeric(number) && mod(number,1)==0
    res=1;
end

end

