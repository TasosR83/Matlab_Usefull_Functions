clc
clear

A = [1,2,3,3,5,2,7,7];
U = unique(A);
H=histc(A,U);
mode_s = U(H==max(H))