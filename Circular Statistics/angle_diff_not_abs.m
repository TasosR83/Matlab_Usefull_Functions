function [ diff_degrees ] = angle_diff_not_abs( angle1,angle2,plot_results )
% finds  difference of angles in degrees for angle2-angle1

% e.g.
% angle_diff_not_abs(10,20,1)
% angle_diff_not_abs(40,10,1)
% angle_diff_not_abs(20,210,1)
% angle_diff_not_abs(220,210,1)
% angle_diff_not_abs(220,10,1)
% angle_diff_not_abs(20,310,1)
% angle_diff_not_abs(350,10,1)


if nargin ==2
    plot_results=0;
end

if nargin ==3
   if  plot_results~=0 && plot_results~=1
      error('Wrong plot_results option given') 
   end
end


if ~isnumeric(angle1) || ~isnumeric(angle2)
    error('Not Angles in degrees given')
end

angle1 = mod(angle1,360);
angle2 = mod(angle2,360);


% %% FIND ABS DIFFERENCE
% 
% abs_diff_degrees = mod(angle1 - angle2 , 360);
% abs_diff_degrees = mod(abs_diff_degrees,360);
% abs_diff_degrees = min(abs_diff_degrees, 360 - abs_diff_degrees);
% abs_diff_degrees = abs(abs_diff_degrees);

%% FIND  DIFFERENCE
diafora = angle2 - angle1;
%diafora = -diafora; % because direction in compass degrees is clockwise
if diafora>=0 && diafora <=180
    diff_degrees = diafora;
elseif diafora >= -180 && diafora<=0
    diff_degrees = diafora;
elseif diafora > 180
    diff_degrees = - (360-diafora);
elseif diafora < -180
    diff_degrees = 360+diafora;
else
    error('Programmatistiko lathos')
end



%% PLOTTING RESULTS
if plot_results==1
    gwnies_compass(1)=angle1 ;
    gwnies_compass(2)=angle2 ;
    degrees_angles_cartesian = -gwnies_compass+90 ;
    degrees_angles_cartesian = mod(degrees_angles_cartesian,360);
        
    degr_radians = (degrees_angles_cartesian /180)*pi;
    
    into_complex_numbers = 1 *exp(1i *degr_radians);
    metro_complex_sum = max(abs(into_complex_numbers));
    
    
    figure,
    plot(real(into_complex_numbers),imag(into_complex_numbers),'.')
    etiketa ={['angle1 (',num2str(angle1),')'];...
        ['angle2 (',num2str(angle2),')']};
    text(real(into_complex_numbers),imag(into_complex_numbers),etiketa)
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
    %plot(real(complex_sum),imag(complex_sum),'x')
    title(['Angles with difference = Angle2-Angle1 = ',num2str(diff_degrees),10,...
        'OR Angle2 = Angle1 + (',num2str(diff_degrees),')'],... 
     'FontWeight','bold')
end

end

