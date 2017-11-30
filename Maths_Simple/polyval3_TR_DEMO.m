clc
clear all
close all

X = [3;5;8];

polynom = [0 0 0 1; 0 0 1 1; 0 1 -1 1];

%% polyval doesnt work here .....
tic
[ value ] = polyval3_TR( polynom,X );
toc 