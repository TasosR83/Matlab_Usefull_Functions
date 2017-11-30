function [ answer ] = isMonotonicallyDecreasing( vector )
%EXAMPLES:
% xx=100:-1:1;isMonotonicallyDecreasing(xx)
% xx=100:-1:1;xx(101)=1; isMonotonicallyDecreasing(xx)

if min(size(vector)) ~=1
    error('Input should be a vector')
end


temp  = vector(2:end) -vector(1:end-1);

if all(temp<0)
    answer = boolean(1);
else
    answer = boolean(0);
end

end

