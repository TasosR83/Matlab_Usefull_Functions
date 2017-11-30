function out = Weighted_Average (U10s_here, weights)
% example
% out = Weighted_Average ([2 3 4], [1 1 0])

U10s_here = U10s_here(:);
weights = weights(:);

if numel(weights) ~= numel (U10s_here)
    error('Malaka')
end

arithmitis = sum(U10s_here .* weights);
paranomastis = sum(weights);

out = arithmitis/paranomastis;



end