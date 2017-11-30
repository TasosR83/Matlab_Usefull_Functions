function [ final_angle_compass_degrees ] = Mean_Of_Compass_Angles( degrees_angles, draw_results )
%


% EXAMPLE:
% Mean_Of_Compass_Angles( [0 90 270 350], 0 )
% Mean_Of_Compass_Angles( [0 90 30 200 190 0 0 ], 1 )
% Mean_Of_Compass_Angles( [0 180], 1 ) %megali aporia, ti na dwsei auto
% arage ???
% Zah's Book 5th editoin page 613 % WORKING !!!!
% Mean_Of_Compass_Angles( [45 55 81 96 110 117 132 154 ], 1 ) 




if min(size(degrees_angles))~=1
   error('Something ig going wrong with the degrees given') 
end

if sum(isnan(degrees_angles)) == numel(degrees_angles)
    final_angle_compass_degrees = NaN;
    return
end

tmp = isnan(degrees_angles);
degrees_angles(tmp)=[];

%% transform from compass to cartesian system degrees
degrees_angles_cartesian = -degrees_angles+90 ;

degrees_angles_cartesian = mod(degrees_angles_cartesian,360);

degr_radians = (degrees_angles_cartesian /180)*pi;

%% transform each angle to complex numbers with |z|=1 and corresponding angle
into_complex_numbers = 1 *exp(i *degr_radians);
complex_sum = sum(into_complex_numbers);
metro_complex_sum = abs(complex_sum);

final_angle_radians = atan2(imag(complex_sum),real(complex_sum));

final_angle_cartesian_degrees = (final_angle_radians/pi)*180;
final_angle_cartesian_degrees = mod(final_angle_cartesian_degrees,360);

final_angle_compass_degrees = - (final_angle_cartesian_degrees-90);
final_angle_compass_degrees = mod(final_angle_compass_degrees,360);


if draw_results==1
    figure,
    plot(real(into_complex_numbers),imag(into_complex_numbers),'.')
    hold on
    oria = floor(metro_complex_sum)+1;
    set(gca,'ylim',[-oria oria],'xlim',[-oria oria],...
        'xtick',-oria:oria,'ytick',-oria:oria)
    xlabel('East');
    ylabel('North')
    %thicklines(2);
    opt.fontname = 'helvetica';
    opt.fontsize = 8;
    centeraxes(gca,opt);
    %centeraxes(gca,[]);
    plot(real(complex_sum),imag(complex_sum),'x')
    
end

end

