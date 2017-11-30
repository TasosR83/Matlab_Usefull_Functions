function [ value ] = polyval_TR( polynom,X )
% A Faster Polyval made by Tasos Rigos

if min(size(polynom))~=1 || numel(X)~=1
    error('Programmed only for a single polynomial and singlevalue')
end

value = 0;

polynom = polynom(end:-1:1); 
%reverse order, NOW: 1rst element= constant, 2nd= ceef. of x, 3rd of x^2 ETC
for ii = 1:numel(polynom)
    value = value + polynom(ii) * X^(ii-1);
end


end

