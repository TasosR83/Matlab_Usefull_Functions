function [ divisorss ] = divisors( number )
%DIVISORS Summary of this function goes here
%  divisors(8)

tmp=1:number;
divisorss = tmp(rem(number,tmp)==0);

end

