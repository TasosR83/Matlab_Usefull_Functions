function [ pinakas ] = integerAsProducts( number )
%e.g. integerAsProducts( 8 )
% should return the pairs of integers that have product=8
%e.g. integerAsProducts( 60 )
% integerAsProducts( 24 )
%
%


if ~isInteger_TR( number ) || number<=0
    error('Give me a positive integer as an input')
end


tmp1 = divisors(number);
tmp1 = tmp1(:);


tmp2 = number./tmp1;

pinakas = [tmp1,tmp2];
end

