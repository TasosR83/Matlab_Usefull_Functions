clc
clear all
close all

X = 7;

polynom = [0 0 0 1; 0 0 1 1; 0 1 -1 1];

%% polyval doesnt work here .....
tic
[ value ] = polyval2_TR( polynom,X )
toc 


tic
[ value ] = polyval( polynom,X )
toc 


%% polyval doesnt work here .....
tic
[ value ] = polyval2_TR( polynom(3,:),X )
toc 


tic
[ value ] = polyval( polynom(3,:),X )
toc 