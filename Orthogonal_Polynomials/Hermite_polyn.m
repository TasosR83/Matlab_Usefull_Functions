function [ one_polynom ] = Hermite_polyn( degree,probabilists )
% Gives the Hermite  Polynomial of desired degree
% by http://mathworld.wolfram.com/HermitePolynomial.html
% By DEFAULT it gives the Physists Hermites, not the propabilistic( read
% wikipedia)
%
%
% EXAMPLES:
% [ one_polynom ] = Hermite_polyn(2)
% [ one_polynom ] = Hermite_polyn(10)
% [ one_polynom ] = Hermite_polyn(2,1)

if ~exist('probabilists','var') || probabilists ~= 1
    probabilists = 0;
end

if ~isInteger_TR(degree)
    error('Asked for Not Integer Degree')
end

%%  create physists(according to Wikipedia) Hermite
if probabilists==0
    polunom = zeros([degree+1 degree+1]);
    polunom(1,end) = 1; %H0
    if degree==0
        one_polynom = polunom(end,:);
        return
    end
    polunom(2,end-1:end) = [2 0]; %H1
    if degree==1
        one_polynom = polunom(end,:);
        return
    end
    for ii=3:degree+1 % create H2,H3,...,Hn
        polunom(ii,:) = -2*(ii-2) *polunom(ii-2,:);
        prev=polunom(ii-1,:);
        polunom(ii,:) = polunom(ii,:) + 2*[prev(2:end) 0];
    end
    one_polynom = polunom(end,:);
end

%%  create probabilists Hermite
if probabilists==1
    polunom = zeros([degree+1 degree+1]);
    polunom(1,end) = 1; %H0
    if degree==0
        one_polynom = polunom(end,:);
        return
    end
    polunom(2,end-1:end) = [1 0]; %H1
    if degree==1
        one_polynom = polunom(end,:);
        return
    end
    for ii=3:degree+1 % create H2,H3,...,Hn
        polunom(ii,:) = -(ii-2) *polunom(ii-2,:);
        prev=polunom(ii-1,:);
        polunom(ii,:) = polunom(ii,:) + [prev(2:end) 0];
    end
    one_polynom = polunom(end,:);
end


end

