function [ polunom ] = Hermite_polyn_many( degree )
% Gives the Hermite  Polynomial's of  degrees = 0,1,2,....,n
% by http://mathworld.wolfram.com/HermitePolynomial.html
%
% EXAMPLES:
% [ one_polynom ] = Hermite_polyn_many(2)
% [ one_polynom ] = Hermite_polyn_many(10)



if ~isInteger_TR(degree)
    error('Asked for Not Integer Degree')
end

%%  create  Hermite

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




end

