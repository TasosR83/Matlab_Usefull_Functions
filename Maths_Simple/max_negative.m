function [ meg,pou_meg ] = max_negative( vector )
% Finds the maximum negative value and its index
% Example:
% vector = [ -7,-10, 2 ,0.5,0,-0.1,10,190];
% [ meg,pou_meg  ] = max_negative( vector )

where_non_negative = find(vector>=0);
vector(where_non_negative) = - Inf;

[meg,pou_meg ] = max(vector);
end

