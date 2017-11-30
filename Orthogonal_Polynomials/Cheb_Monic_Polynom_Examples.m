%%
clc;clear;close all;
x= 0:0.01:0.9; y = x.^2+20 +exp(x)+3* x.^5; points = [x(:) y(:)];


n=5;
[A_polyn,A_polyn_values,A_more_stuff ] = Cheb_Monic_Polynom( n,points, 1 );
figure; plot(x,y,'b');hold on;plot(x,A_polyn_values,':r')
legend({'Original Data';'approximation of our data'})


%% example 2
clc;clear;close;

x= 0:0.01:0.9; y = rand(size(x)); points = [x(:) y(:)];
n=30;
[A_polyn,A_polyn_values,A_more_stuff ] = Cheb_Monic_Polynom( n,points, 1 );
figure; plot(x,y,'b');hold on;plot(x,A_polyn_values,':r')
legend({'Original Data';'approximation of our data'})
