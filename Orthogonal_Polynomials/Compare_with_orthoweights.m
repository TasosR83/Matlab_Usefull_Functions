clc;clear;close all; x= 0:0.01:0.9; y = x.^2+20; points = [x(:) y(:)];

%%
n=5;
[A_polyn,A_polyn_values,A_more_stuff ] = Cheb_Monic_Polynom( n,points, 1 );
figure; plot(x,y,'o');hold on;plot(x,A_polyn_values,'r')

%%
%addpath(genpath([cd,'\OLD2']))
[B_yout,B_poly_v4B,B_params]=orthoweights_v4B_more_out(x,y,n);
figure; plot(x,y,'o');hold on;plot(x,B_yout,'r')

clear x y
%% check a's
fprintf('a = ')
A_more_stuff.a(:)
B_params.a(:)

A_more_stuff.b(:)
B_params.b(:)