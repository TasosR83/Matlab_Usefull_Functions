function [elaxisto,pou_elaxisto ] = min_positive( vector )
% Finds the minimum positive value and its index
% Example:
% vector = [ -7,-10, 2 ,0.5,10 190];
% [elaxisto,pou_elaxisto ] = min_positive( vector )

where_non_positive = find(vector<=0);
vector(where_non_positive) = Inf;

[elaxisto,pou_elaxisto ] = min(vector);

end

