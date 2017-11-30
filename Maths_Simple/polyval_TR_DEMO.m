clc
clear all

%% 1rst experiment
poly = [ 1 2 5 7]; X =0.3;

tic;
polyval(poly,X)
toc

tic;
polyval_TR(poly,X)
toc
%% 2nd experiment

poly = rand([100,1]); X =0.3;

tic;
polyval(poly,X)
toc

tic;
polyval_TR(poly,X)
toc