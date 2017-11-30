function [ abs_diff_degrees ] = Angles_abs_difference_v2( angle1,angle2,plot_results )
% finds absolute difference on angles in degrees

% eg
% angle1=30; angle2=350;  Angle_difference_degress( angle1,angle2 )
% Angles_abs_difference_v2( 30,350,1 )
% Angles_abs_difference_v2( -30,50,1 )
% Angles_abs_difference_v2( -30,-270,1 )
% Angles_abs_difference_v2( -90,90,1 )
% Angles_abs_difference_v2( -180,180,1 )

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

%%
angle1 = mod(angle1,360);
angle2 = mod(angle2,360);
diff_degrees = mod(angle1 - angle2 , 360);
diff_degrees = mod(diff_degrees,360);
diff_degrees = min(diff_degrees, 360 - diff_degrees);
abs_diff_degrees = abs(diff_degrees);

%% PLOTTING
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
    title(['Angles with difference = ABS(Angle2-Angle1) = ',num2str(diff_degrees),10],... 
     'FontWeight','bold')
    
end

end

