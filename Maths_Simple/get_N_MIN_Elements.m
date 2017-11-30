function [smallestNElements smallestNIdx] = get_N_MIN_Elements(A, n)
%GET_N_MIN_ELEMENTS Summary of this function goes here
%   Detailed explanation goes here
% EXAMPLE:
% B = [48.4766 47.3743 59.5736 59.7450 55.0489 58.2620 63.3865 50.1101];
% [Bsort Bidx] = getNElements(B, 4);
% BSort =
%     47.3743   48.4766   50.1101   55.0489
% Bidx =
%     2 1 8 5


[ASorted AIdx] = sort(A);
smallestNElements = ASorted(1:n);
smallestNIdx = AIdx(1:n);

end

