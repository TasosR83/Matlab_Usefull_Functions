function [ answer ] = isMonotonicallyIncreasing( vector )
%EXAMPLES:
% xx=1:100;isMonotonicallyIncreasing(xx)
% xx=1:100;xx(101)=100; isMonotonicallyIncreasing(xx)

if min(size(vector)) ~=1
    error('Input should be a vector')
end


temp  = vector(2:end) -vector(1:end-1);

if all(temp>0)
    answer = boolean(1);
else
    answer = boolean(0);
end

end

