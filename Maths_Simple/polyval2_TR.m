function [ value ] = polyval2_TR( polynom,X )
% Version 2 Supports many POLYNOMIALS
% polynom : each line should be ONE polynomial
%
% EXAMPLES:
% Look or the demo file ....
%

if  numel(X)~=1
    error('Programmed only for a single polynomial and singlevalue')
end

% value = 0;
% Similar to Vandermonde matrix...
powers_of_x = ones(size(polynom));
for clm = 2:size(powers_of_x,2)
    powers_of_x(:,clm) = X^(clm-1);
end
powers_of_x = fliplr(powers_of_x);

value = powers_of_x.*polynom;

value = sum(value,2);

end

