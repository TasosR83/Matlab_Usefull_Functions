function [ one_polynom_derivate ] = Hermite_polyn_DERIV( degree,probabilists )
% Gives the DERIVATE Hermite  Polynomial of desired degree
% by http://mathworld.wolfram.com/HermitePolynomial.html
% By DEFAULT it gives the Physists Hermites, not the propabilistic( read
% wikipedia)
%
%
% Uses the Function 'Hermite_polyn.m'
% EXAMPLES:
% [ one_polynom ] = Hermite_polyn(2)
% [ one_polynom ] = Hermite_polyn(10)
% [ one_polynom ] = Hermite_polyn(2,1)

if ~exist('probabilists','var') || probabilists ~= 1
    probabilists = 0; % DEFAULT : PHYSISTS HERMITEs POLYNOMIALS
end

if ~isInteger_TR(degree) || degree<0
    error('Asked for Not Positive Integer Degree')
end

hermite_polunomal = Hermite_polyn( degree,probabilists );
one_polynom_derivate = polyder(hermite_polunomal);

end