function [ answer ] = isStrictMonotonically( vector )
%  EXAMPLES:
% xx = 1:100; isStrictMonotonically(xx)
% xx = 1000:-5:200; isStrictMonotonically(xx)
% xx = [0,0]; xx(3:5)=3:5; isStrictMonotonically(xx)
answers = [isMonotonicallyIncreasing(vector),isMonotonicallyDecreasing(vector)];
if any(answers)
    answer = boolean(1);
else
    answer = boolean(0);
end

end

