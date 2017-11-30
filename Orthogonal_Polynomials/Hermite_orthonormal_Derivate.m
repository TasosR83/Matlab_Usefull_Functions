function [ timi ] = Hermite_orthonormal_Derivate( n ,x  )
%HERMITE_ORTHONORMAL_DERIVATE Summary of this function goes here
% value of orthonormal hermite derivate,
% by the equatiosn (8)-(9) of the paper:
%'Constructive Feedforward Neural Networks Using Hermite Polynomial Activation Functions,
% Liying Ma and K. Khorasani'


if n==0
    timi =  - x * polyval(Hermite_orthonormal_h(n,x)) ;  % equation (8) of paper
elseif isInteger_TR(n) && n>0
    % equation (9) of paper:
    timi = ((2*n)^(1/2)) * polyval(Hermite_orthonormal_h(n-1,x)) - ...
        x * polyval(Hermite_orthonormal_h(n,x));
else
    error('not accepted value of n(degree)')
end

end

