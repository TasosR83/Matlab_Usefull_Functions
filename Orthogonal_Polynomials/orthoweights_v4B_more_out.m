function [yout,polu,params] = orthoweights_v4B_more_out(x,y,n)

%ORTHOFIT Fit orthogonal chebyshev polynomials to data.
%working 100% CORRECT

% Resize %
x = x(:);
y = y(:);

if size(x) ~= size(y)
    error('ERROR dimension(x) ~= dimension(y)');
end


% Matrix with Coefficients of the orthogonal polynomials %
p = zeros(3,n+1);
% matrix p should contain:
% 1st row: the ci Coefficients
% 2nd row: the án Coefficients
% 3rd row: the ân Coefficients

%the vector with the weights
wk=(1-x.^2).^(-1/2); %weight for Chebyshev T (1rst kind Cheb.polunomial)
% %for other Chebyshev polunomials use:
% wk=(1-x.^2).^(1/2); %2nd kind Chebyshev
% wk=((1+x).^(1/2)).*((1-x).^(-1/2)); %3nd kind Chebyshev
% wk=((1+x).^(-1/2)).*((1-x).^(1/2)); %4nd kind Chebyshev
% wk=wk(:);
wk=wk(:);


sum1 = sum(wk.*x);
sum2 = sum(wk);
p(2,2) = sum1/sum2; %the á1 Coefficient


%%oi upoloipoi suntelestes
N = length(x);
fi = ones(N,n+1);   %now ö0=1
fi(:,2) = x-p(2,2); %to ö1


for i = 3:n+1
    p(2,i) = sum(wk.*x.*fi(:,i-1).^2)/sum(wk.*fi(:,i-1).^2); %ta án
    p(3,i) = sum(wk.*x.*fi(:,i-2).*fi(:,i-1))/sum(wk.*fi(:,i-2).^2); %ta ân
    fi(:,i) = (x-p(2,i)).*fi(:,i-1)-p(3,i)*fi(:,i-2); %ôá öí
end
p(1,:) = sum(bsxfun(@times,fi,wk.*y))./sum(bsxfun(@times,fi.^2,wk)); %ta ci

%predicted values of output(not predicted polunomial)
%(Relation 4.69 of Mason)
yout = sum(bsxfun(@times,fi,p(1,:)),2);


% Coefficients of the polynomial %
yi = zeros(n+1);
yi(1,n+1) = 1;
yi(2,n:n+1) = [1 -p(2,2)];
for i = 3:n+1
   yi(i,:) = [yi(i-1,2:end) 0]-p(2,i).*yi(i-1,:)-p(3,i)*yi(i-2,:);
end
polu = sum(bsxfun(@times,p(1,:).',yi),1);

%%
params.a = p(2,:);
params.c = p(1,:);
params.b = p(3,:);
params.wk=wk;
params.fi = fi;

return
