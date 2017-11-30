function [ timi ] = Hermite_orthonormal_derivate_value( n,x )
%HERMITE_ORTHONORMAL_DERIVATE_VALUE Summary of this function goes here
% By equations (8),(9) of the paper ...
% EXAMPLES
% Hermite_orthonormal_derivate_value( 1,2 )
% Hermite_orthonormal_derivate_value( 0,2 )

if ~isInteger_TR(degree)
    error('Asked for Not Integer Degree')
end


if n==0
    timi = -x *  Hermite_orthonormal_value( n,x ) ; 
else
    timi = ((2*n)^(1/2)) *Hermite_orthonormal_value( n-1,x )-...
        x*Hermite_orthonormal_value( n,x ) ; 
    
end


end

