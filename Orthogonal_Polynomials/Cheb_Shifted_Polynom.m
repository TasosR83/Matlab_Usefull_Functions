function [ polun ] = Cheb_Shifted_Polynom( degree,kind )
%CHEB_SHIFTED_POLYNOM Summary of this function goes here
% Gives a Chebychev Shifted Polynomial (valid in range [0,1] of 1rst,2nd,3rd,4rth 
% kind of a specific degree
%
% eg
%[ polun ] = Cheb_Shifted_Polynom(3 ,1 )
%[ polun ] = Cheb_Shifted_Polynom(4 ,1 )
% By chapter 1, book of MASON-HANDSCOMB


%% error checking
if ~exist('kind','var')
    kind = 1 ; % if no kind selected, then the T* polunomials will be used ....
end


%% lets go !!!

if kind == 1 %T*-polunomials
    polun_all=zeros(degree+1);
    polun_all(1,end) = 1; %degree 0 polynom
    if degree==0
        polun  = 1;
        return
    end
    
    polun_all(2,end-1:end) = [2 -1];
    if degree==1
        polun  = [2 -1];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        
        new_pol = 4*pol_previous; %*2
        new_pol(1) = []; new_pol(end+1)=0; %*x
        %
        new_pol = new_pol-2*pol_previous;
        new_pol = new_pol - pol_pre_previous;
        polun_all(ii,:) = new_pol;
    end
    
    polun  = polun_all(end,:);
    
elseif kind ==2
    % by http://www.mymathlib.com/functions/orthogonal_polynomials/shifted_chebyshev_second_kind.html
    
    polun_all=zeros(degree+1);
    polun_all(1,end) = 1; %degree 0 polynom
    if degree==0
        polun  = 1;
        return
    end
    
    polun_all(2,end-1:end) = [4 -2];
    if degree==1
        polun  = [4 -2];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        
        new_pol = 4*pol_previous; %
        new_pol(1) = []; new_pol(end+1)=0; %*x
        %
        new_pol = new_pol-2*pol_previous;
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
    
    polun_all(2,end-1:end) = [4 -3];
    if degree==1
        polun  = [4 -3];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        
        new_pol = 4*pol_previous; %
        new_pol(1) = []; new_pol(end+1)=0; %*x
        %
        new_pol = new_pol-2*pol_previous;
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
    
    polun_all(2,end-1:end) = [4 -1];
    if degree==1
        polun  = [4 -1];
        return
    end
    
    for ii=3:degree+1
        pol_previous = polun_all(ii-1,:);
        pol_pre_previous = polun_all(ii-2,:);
        
        new_pol = 4*pol_previous; %
        new_pol(1) = []; new_pol(end+1)=0; %*x
        %
        new_pol = new_pol-2*pol_previous;
        new_pol = new_pol - pol_pre_previous;
        polun_all(ii,:) = new_pol;
    end
    
    polun  = polun_all(end,:);
else
    error('kind of polynomial should be 1 or 2 or 3 or 4');
end

end


