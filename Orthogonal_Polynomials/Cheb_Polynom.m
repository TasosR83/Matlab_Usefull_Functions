function [ polun ] = Cheb_Polynom(degree ,kind )
%CHBE_POLYNOM 
% Gives a Chebychev Polynomial of 1rst,2nd,3rd,4rth kind of a specific
% degree
% x BELONGS in [-1,1]
% eg
%[ polun ] = Cheb_Polynom(2 ,1 )
%
%[ polun ] = Cheb_Polynom(4,1 )
%[ polun ] = Cheb_Polynom(3,2)
%[ polun ] = Cheb_Polynom(3,3)
% [ polun ] = Cheb_Polynom(3,4)
% By chapter 1, book of MASON-HANDSCOMB
if kind == 1
    polun_all=zeros(degree+1);
    polun_all(1,end) = 1; %degree 0 polynom
    if degree==0
        polun  = 1;
        return
    end
    
    polun_all(2,end-1:end) = [ 1 0];
    if degree==1
        polun  = [ 1 0];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        new_pol = 2*pol_previous; %*2
        new_pol(1) = []; new_pol(end+1)=0; %*x
        new_pol = new_pol - pol_pre_previous;
        polun_all(ii,:) = new_pol;
    end
    
    polun  = polun_all(end,:);
    
elseif kind ==2
    polun_all=zeros(degree+1);
    polun_all(1,end) = 1; %degree 0 polynom
    if degree==0
        polun  = 1;
        return
    end
    
    polun_all(2,end-1:end) = [2 0];
    if degree==1
        polun  = [ 1 0];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        new_pol = 2*pol_previous; %*2
        new_pol(1) = []; new_pol(end+1)=0; %*x
        new_pol = new_pol - pol_pre_previous;
        polun_all(ii,:) = new_pol;
    end
    
    polun  = polun_all(end,:);
    
elseif kind ==3
    polun_all=zeros(degree+1);
    polun_all(1,end) = 1; %degree 0 polynom
    if degree==0
        polun  = 1;
        return
    end
    
    polun_all(2,end-1:end) = [2 -1];
    if degree==1
        polun  = [ 1 0];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        new_pol = 2*pol_previous; %*2
        new_pol(1) = []; new_pol(end+1)=0; %*x
        new_pol = new_pol - pol_pre_previous;
        polun_all(ii,:) = new_pol;
    end
    
    polun  = polun_all(end,:);
elseif kind ==4
     polun_all=zeros(degree+1);
    polun_all(1,end) = 1; %degree 0 polynom
    if degree==0
        polun  = 1;
        return
    end
    
    polun_all(2,end-1:end) = [2 1];
    if degree==1
        polun  = [ 1 0];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        new_pol = 2*pol_previous; %*2
        new_pol(1) = []; new_pol(end+1)=0; %*x
        new_pol = new_pol - pol_pre_previous;
        polun_all(ii,:) = new_pol;
    end
    
    polun  = polun_all(end,:);
else
    error('kind of polynomial should be 1or 2 or 3 or 4');
end

end

