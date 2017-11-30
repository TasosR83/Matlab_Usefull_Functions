function [ final_angle_compass_degrees ] = Weigthed_Mean_Of_Compass_Angles( degrees_angles,weigths, draw_results )
% EXAMPLE:
% addpath(genpath([cd,'\NEEDED FUNCTIONS']))
% Weigthed_Mean_Of_Compass_Angles( [ 0 90],[1 2], 1 )
% Weigthed_Mean_Of_Compass_Angles( [ 0 90 180],[1 2 3], 1 )
% Zah's book example of page 614:
% Weigthed_Mean_Of_Compass_Angles( [45 75 105 135 165 195 225 255 285],[6 9 13 15 22 17 12 8 3], 1 )
% Weigthed_Mean_Of_Compass_Angles( [45 75 105 135 165 195 225 255 285],[6 9 13 15 22 17 12 8 3] )
 
 
if min(size(degrees_angles))~=1
    error('Given data dont have vector format')
end

if size(degrees_angles) ~= size(weigths)
    error(['Something is going wrong with the degrees with their repsecting WEIGHTS',10,...
        'They have different sizes',10])
end

if min(weigths)<0
   error('Negative  Weights NOT accepted')
end

if sum(isnan(degrees_angles)) == numel(degrees_angles) || sum(weigths) == 0
    final_angle_compass_degrees = NaN;
    return
end


tmp = isnan(degrees_angles);
degrees_angles(tmp)=[];
weigths(tmp)=[];

if nargin==2
    draw_results=0;
end

%% transform from compass to cartesian system degrees
degrees_angles_cartesian = -degrees_angles+90 ;

degrees_angles_cartesian = mod(degrees_angles_cartesian,360);

degr_radians = (degrees_angles_cartesian /180)*pi;

%% transform each angle to complex numbers with |z|=weigth and corresponding angle
%into_complex_numbers = 1 *exp(i *degr_radians);
into_complex_numbers = NaN(size(degrees_angles));
for ii=1:length(degrees_angles)
    into_complex_numbers(ii) = weigths(ii) *exp(1i *degr_radians(ii));
end


complex_sum = sum(into_complex_numbers);
metro_complex_sum = abs(complex_sum);

final_angle_radians = atan2(imag(complex_sum),real(complex_sum));

final_angle_cartesian_degrees = (final_angle_radians/pi)*180;
final_angle_cartesian_degrees = mod(final_angle_cartesian_degrees,360);

final_angle_compass_degrees = - (final_angle_cartesian_degrees-90);
final_angle_compass_degrees = mod(final_angle_compass_degrees,360);

%% DRAWING
if draw_results==1
    figure,
    plot(real(into_complex_numbers),imag(into_complex_numbers),'.',...
        'MarkerSize',20)
    hold on
    
    
    oria = floor(metro_complex_sum)+1;
    set(gca,'ylim',[-oria oria],'xlim',[-oria oria])
    
    xlabel('East');
    ylabel('North')
    %thicklines(2);
    opt.fontname = 'helvetica';
    opt.fontsize = 8;
    centeraxes(gca,opt);
    %centeraxes(gca,[]);
    plot(real(complex_sum),imag(complex_sum),'x','MarkerSize',20)
    plot_arrow( 0,0,real(complex_sum),imag(complex_sum) )
    
end






end

