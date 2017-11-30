function [ values ] = Hermite_orthonormal_h( n,x )
%HERMITE_ORTHONORMAL_H Summary of this function goes here
% Gives the orthonormal hermite polynomials 
% described in the equation (5) of the paper
% 'Constructive Feedforward Neural Networks Using Hermite Polynomial Activation Functions,
% Liying Ma and K. Khorasani'
% AKA 'Hermite basis functions'
% by the
% 'MULTIPLE NEURAL NETWORK INTEGRATION USING A BINARY DECISION TREE TO IMPROVE THE ECG SIGNAL RECOGNITION ACCURACY,
% HOAI LINH TRAN, VAN NAM PHAM, HOANG NAM VUONG'
%
% EXAMPLE:
% value = Hermite_orthonormal_h( 5,1 )
%
% VERSION HISTORY
% fixed to work with multiple x's as inputs...
% but not with many degrees n's

if numel(n) ~= 1 || ~isnumeric(n)
   error('desired degree doesnt have one element OR not a number');
end


% create a_n by equation (6)
a_n = ((factorial(n))^(-1/2)) * (pi^1/4)* (2^((-n+1)/2)); % number

% create f(x)
f_x = ((2*pi)^(-1/2)) * exp((-x .^ 2) / 2); %vector

tmp = Hermite_polyn( n,0 );
polyon_value = polyval(tmp,x);
values = a_n * (polyon_value .* f_x);


end

