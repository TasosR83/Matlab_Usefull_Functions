function [ r_square,apantisi,pval] = r_square_angular_linear_correlation_v3( x_linear,y_angles )

% Or by "Zar's biostatistical analysis" vrs5 page 658
% eg 
% r_square_angular_linear_correlation_v3( [1 2 3],[90 100 110] )
% r_square_angular_linear_correlation_v3( [1 2 3],[110 100 90] )
% r_square_angular_linear_correlation_v3( [1 2 3],[0 300 200] )
% eg by Zah's vrs5 page 658
% [ r_square,apantisi,pval] = r_square_angular_linear_correlation_v3( [48 55 26 23 22 62 64],[190 160 210 225 220 140 120] )
 

%% check given data !!!!
x = x_linear(:);
y_angles = y_angles(:);

if max(y_angles) >360 || min(y_angles) < 0
    error('wrong angles given')
end

if numel(x) ~= numel(y_angles) 
    error('wrong data given')
else 
    n=numel(x);
end


%% Delete NaN's ....
 todelete = find(isnan(x));
 x(todelete)= [];
 y_angles(todelete)= [];
 
 todelete2 = find(isnan(y_angles));
 x(todelete2)= [];
 y_angles(todelete2)= [];
 
 if length(x) ~= length(x_linear(:))
     fprintf(['Deleted ' , num2str(length(x_linear(:))-length(x)) ,...
         ' NaN elements from given vectors',10,10])
 end
 


%%
% by the http://www.mathworks.com/help/matlab/ref/corrcoef.html
y_angles_radians = ( y_angles/360)*2*pi;
r_xc = corrcoef(x,cos(y_angles_radians));
r_xc  = r_xc(1,2);
r_xs = corrcoef(x,sin(y_angles_radians));
r_xs = r_xs(1,2);
r_cs = corrcoef(cos(y_angles_radians),sin(y_angles_radians));
r_cs = r_cs(1,2);



r_square = (r_xc^2+r_xs^2-2*r_xc*r_xs*r_cs)/(1-r_cs^2);
if r_square > 1 || r_square < 0
    error('Re-write this function, MALAKA!')
end

%% by http://www.mathworks.com/help/stats/fcdf.html
%  by Zah's vrs5 page 658
% %  95% statistic (a=0.05)
alpha=0.05;
nr_all_square = r_square*n;
fprintf(['H_0 :no correlation (r=0)',10,...
    'H_1 : correlation (r~=0)',10,...
    'á = ',num2str(alpha)])
statistic = chi2inv(1-alpha,2); % eg chi2inv(0.95,2)

if nr_all_square>statistic
    apantisi = 'Reject H_0';
    fprintf([10,apantisi])
    
    
else
   apantisi = 'Dont Reject H_0';
    fprintf([10,apantisi])
    
end

% compute pvalue
pval = 1 - chi2cdf(n*r_square,2);
fprintf([10,'p-value of this test = ',num2str(pval)])
end

