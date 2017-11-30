function [ value ] = polyval3_TR( polynom,X )
% Version 2 Supports many POLYNOMIALS and equla number of values X
% polynom : each line should be ONE polynomial
% JUST muliplies the Vandermonde matrix (=Values of power of X's)
% each one with each given polynomial ....
%
% EXAMPLES:
% Look or the demo file ....
%
X = X(:);
if  size(X,1) ~= size(polynom,1)
    error('You should give an equal number of polynomials and values X''s')
end

% value = 0;
% Similar to Vandermonde matrix...
powers_of_x = ones(size(polynom));
for clm = 2:size(powers_of_x,2)
    powers_of_x(:,clm) = X.^(clm-1);
end
powers_of_x = fliplr(powers_of_x);

value = powers_of_x.*polynom;

value = sum(value,2);

end

