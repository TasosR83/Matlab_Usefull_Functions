function [ st_deviation ] = STD_Compass_v3( angles_degr )
% According to Zah's book vrs5 equation # 26.21
% eg 
% STD_Compass_v2( [ 2 10 20] )
% STD_Compass_v2( [ 12 12 12] )
% STD_Compass_v2(  [45 55 81 96 110 117 132 154 ])


angles_degr = angles_degr(:);
angles_rad = (angles_degr/360)*2*pi;
n = length(angles_rad);

X = sum(cos( angles_rad));
X=X/n;

Y = sum(sin( angles_rad));
Y=Y/n;

r=sqrt(X^2 + Y^2); %equation 26.8
our_variance = -2 * log(r);   % equation 26.19
if our_variance<0
    error('ksanaprogrammatise to MALAKA')
end

st_deviation_rads = sqrt(our_variance);

st_deviation = (st_deviation_rads)*(360/(2*pi));

end

