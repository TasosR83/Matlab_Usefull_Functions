clc
clear all
close all

saveplots = 0;
%% Method 1 = DIY Function
figure;
wind_dir = [0 90];
win_velocity = [20,10];
earth_compass_Rigos_v_0_4(wind_dir,win_velocity);
title('Winds have been plotted')


%% Method 2  = MATLAB's rose function
% winds normally distributed in angle about 90º.
figure;
angle_vector_degrees  = (angle(exp(i*randn(1, 500))) + pi/2).*(360/(2*pi));
angle_vector_Compass_Directions = mod(90-angle_vector_degrees,360);
angle_vector_rads = angle_vector_Compass_Directions .* (2*pi/360);
rose(angle_vector_rads)


%% Method 3  = wind_rose function

D = 20:10:90;
V = 1:numel(D);

% plot wind if D = source of the wind
D_wind = 180-30:10:180;
figure
D_wind_source = mod(90-D_wind+180,360);
wind_rose(D_wind_source,V)
title('winds coming from the SE-S')

% plot if D = beach Orientation
figure
D_orientation = mod(90-D,360);
wind_rose(D_orientation,V)
title('Beach Orientations');

figure
wind_rose(D,V,'iflip',1)

sxima = figure
wind_rose(D,V,'ci',[1 2 7],'dtype','meteo')
if saveplots
set(gcf,'color','w'); 
set(gca,'color','w'); 
set(sxima,'PaperPositionMode','auto', 'inverthardcopy','on')
print('-dtiff','-r600',['Fig_6','.tif'])
end

wind_dir = 30:1:130;
wind_speed = 1:length(wind_dir);
wind_speed = 20.*(wind_speed./max(wind_speed)) ; % realistic values in mps in the [0,20]
sxima = figure;
D_wind_2plot = mod(90-wind_dir ,360);
wind_speed_bft = floor(Wind_convertor( wind_speed,'mps','Beaufort' ));
wind_rose(D_wind_2plot,wind_speed_bft,'n',16,'di',[1:nanmax(wind_speed_bft)])
title('winds of Kalo Livadi (Beauforts)')
if saveplots
set(gcf,'color','w'); 
set(gca,'color','w'); 
set(sxima,'PaperPositionMode','auto', 'inverthardcopy','on')
print('-dtiff','-r600',['Windrose_BFT','.tif'])
end
% % place it on a previous axes:
% ax=axes;
% plot(lon,lat)
% wind_rose(D,V,'ax',[ax x y 1/3])


%% Method 3 = WindRose wih deleted winds_peeds

prosanatolismoi = [ 5 10 15 5 5 5 270]; % beach orientations (in degrees)

prosanatolismoi =  360 - prosanatolismoi +90;
% ============ function 1
[figure_handle,count,speeds,directions,Table] = WindRose(prosanatolismoi,ones(size(prosanatolismoi)),...
    'ndirections' ,16,'titlestring',{'Beach Orientations';' '},'legendtype',2 );


%% Method 4 = wind_rose with deleted the wind_speeds !!!

fig1 = figure;

[handles1 ,plotted_data1]=wind_rose(prosanatolismoi,ones(size(prosanatolismoi)),'quad',2);

% edit shit of this plot
items = get(gca, 'Children');
delete(items(3:22));

if saveplots
    set(gcf,'PaperPositionMode','auto', 'inverthardcopy','off')
    print(fig1,'-dtiff','-r600',['Rose1','.tif'])
    print(fig1,'-djpeg','-r300',['Rose1','.jpg']);
end
