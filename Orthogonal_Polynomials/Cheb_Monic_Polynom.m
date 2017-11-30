function [ polyn,polyn_values,more_stuff ] = Cheb_Monic_Polynom( n,points, kind )
% CHEB_MONIC_POLYNOM 
% creates the system of the monic Polynomials (for specific x's of points )
% descibed at theorem 4.3 of Pargraph 4.4
% of the book 
% Chebyshev polynomials,J C Mason; D C Handscomb, Chapman & Hall/CRC, ©2003.
% after that, it creates the polynomial of the equation (4.69) [Forsythe's Method]
%
% INPUTS:
% n = desired degree ofthe polynomial
% points = the points we need to approximate, matrix Nx2
% kind = 1 or 2 or 3 or 4 (blank=1rst) chebychev of 1rst,2nd etc kind (changes the weight functions w
%
% EXAMPLES:
% clc;clear;close; x= 0:0.01:0.9; y = exp(x) + 5*sin(x); points = [x(:) y(:)];
% [ polyn,polyn_values,more_stuff ] = Cheb_Monic_Polynom( 5,points, 1 );
% figure; plot(x,y);hold on;plot(x,polyn_values,'o')
%
%
% clc;clear;close; x= 0:0.01:0.9; y = x.^2+20; points = [x(:) y(:)];
% [ polyn,polyn_values,more_stuff ] = Cheb_Monic_Polynom( 2,points, 1 );
% figure; plot(x,y);hold on;plot(x,polyn_values,'o')
%
% clc;clear;close; x= 0:0.01:0.9; y = x.^2+20; points = [x(:) y(:)];
% [ polyn,polyn_values,more_stuff ] = Cheb_Monic_Polynom( 5,points, 1 );
% figure; plot(x,y);hold on;plot(x,polyn_values,'o')

%% error checking
if ~exist('kind','var')
    kind = 1 ; % if no kind selected, then the T Chebychev polunomials will be used ....
end

if size(points,2) ~= 2 
    error('Wrong input points, they should have Nx2 size')
end

%% fix input data and Inline Functions ....
x = points(:,1);
y = points(:,2);
datasize = size(points,1);

if max(x)>=1 || min(x)<=-1
    error('This algorith work only for points with -1<x<1')
end
% the equation (4.68) of the book:
cheb_in_prod = inline('sum(wk(:) .* fun1(:) .* fun2(:))', 'wk', 'fun1', 'fun2');




if n==0;
    pol=1;
    return
end

switch kind %weight functions
    case 1
        wk=(1-x.^2).^(-1/2);
    case 2
        wk=(1-x.^2).^(1/2);
    case 3
        wk=((1+x).^(1/2)).*((1-x).^(-1/2));
    case 4
        wk=((1+x).^(-1/2)).*((1-x).^(1/2));
    otherwise
        error ('Desired CHebychev kind not available, try kind=1OR2OR3OR4')
end
more_stuff.wk = wk;
%% the algorithm to create the monic polynomials ö_i and ö_i(x_k)


f = zeros([n+1 n+1]); % the monic polynomials of (4.21)
a = NaN([n 1]); % by the (4.21) relation of Mason
b = NaN([n 1]); b(1)=0;
f_xk = NaN([n+1 datasize]);

%create ö0 by(4.70) and (4,21)
ii=1; %we go to 
f(ii,end) = 1; %the ö0 as polynomial
f_xk(ii,:) = polyval(f(ii,:),x); %the values of ö0 on x_k pints, needed for (4.70) 

%create ö1 by(4.70) and (4,21)
ii=2;
a(ii-1) = (cheb_in_prod(wk, x .* 1 , 1 )) / (cheb_in_prod(wk, 1 , 1 )); %á_1 by (4.21)
f(ii,end-1:end) = [1 -a(1)];   % now ö1=[1 a_1]
f_xk(ii,:) = polyval(f(ii,:),x); %the values of ö1 on x_k pints, needed for (4.70) 


for ii=3:n+1 %desired polynomial degree 
    % if ii=3, we create the ö(2) stored as f(3,:)
    % create á_n of (4.21)
    f_i_x_k = f_xk(ii-1,:); f_i_x_k = f_i_x_k(:); %the ö_n-1 (x_k)
    a(ii-1) = cheb_in_prod(wk, x .* f_i_x_k ,f_i_x_k) /...
       cheb_in_prod(wk,f_i_x_k,f_i_x_k); % creates á_2 etc ....
 
       %create â_n of (4.21)
    f_i_x_k_1 = f_xk(ii-2,:); f_i_x_k_1 = f_i_x_k_1(:); %the ö_n-2 (x_k)

    b(ii-1) = cheb_in_prod(wk, f_i_x_k ,f_i_x_k) /...
       cheb_in_prod(wk,f_i_x_k_1,f_i_x_k_1); % creates á_2 etc ....
   
   %create ö_2, ö_3 etc of (4.21)
   % tmp = f(ii-1,:);%previous polynomial
   %tmp = tmp(2:end); tmp(size(tmp)+1) = 0; %multiply with x
   tmp = [f(ii-1,2:end) 0];%multiply previous polynomial with x
   tmp = tmp - (a(ii-1) * f(ii-1,:)); %multiply by -a_n times
   tmp = tmp - (b(ii-1) * f(ii-2,:));
   f(ii,:) = tmp; %the ö(2) stored as f(3,:) etc
   f_xk(ii,:) = polyval(f(ii,:),x); %the ö_i(x_k) of (4.70)
   clear tmp f_i_x_k f_i_x_k_1
end
monic_polynomials = f;
monic_polynomials_values_on_x_k = f_xk;

more_stuff.monic_polynomials = monic_polynomials;
more_stuff.monic_polynomials_values_on_x_k = monic_polynomials_values_on_x_k;
more_stuff.a=a;
more_stuff.b=b;
more_stuff.f_xk = f_xk;
%% the algorithm to create the c_i of (4.70)

c_i = NaN([n+1 1]);
for ii=1:n+1
    tmp = f_xk(ii,:); tmp=tmp(:); 
    arithmitis = cheb_in_prod(wk,  y ,tmp);
    paranomastis = cheb_in_prod(wk,  tmp ,tmp);
    c_i(ii) = arithmitis/paranomastis;
end

more_stuff.c_i=c_i;
%% the algorithm to create the polynomial of (4.69)
polyn = zeros([1 n+1]);
for ii=1:n+1
    polyn = polyn +  c_i(ii)*monic_polynomials(ii,:);
end

%%  approximated y's ....
polyn_values = polyval(polyn,x);


end

