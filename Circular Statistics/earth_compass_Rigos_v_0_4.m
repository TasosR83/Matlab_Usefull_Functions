function earth_compass_Rigos_v_0_4(degrees,velocity, varargin)

% from the "EARTH_COMPASS" file of matlab exchange central, 
% Modified By Tasos Rigos
% You give the source of the wind e.g. 0degrees = wind coming from the North

% v0.4 works with multiple directions/velocities given

% EXAMPLES:
% earth_compass_Rigos_v_0_4([0 90],[9 2])
% degrees = [0 90 100] ; velocity = [9 2 3]; earth_compass_Rigos_v_0_4(degrees,velocity)


%% edits by Rigos
% degrees = fun(u,v)
if numel(degrees)~= numel(velocity) || max(degrees)>360 || min(degrees)<0
    error('Wrong Input Data given!!!')
end

% % transform from compass degrees  to plotting degrees
%     degrees = -degrees; %to be plotted good!!!
%     degrees = mod(degrees,360);
    
% transform degrees from compass(north heading)  to cartesian
degrees_compass = degrees-90;
degrees_compass = - degrees_compass;
degrees_compass = mod(degrees_compass,360);

% transformation of "North (=0 degrees) wind should be a vector heading South"
degrees_compass = 180 + degrees_compass;
degrees_compass2plot = mod(degrees_compass,360);

% transform to (U,V)
u = velocity .* cos(degrees_compass2plot*(2*pi/360));
v = velocity .* sin(degrees_compass2plot*(2*pi/360));

%% original file
%figure, 
compass(u, v, varargin{:});

hHiddenText = findall(gca,'type','text');
Angles = 0 : 30 : 330;
hObjToDelete = zeros( length(Angles)-4, 1 );
k = 0;
for ang = Angles
   hObj = findall(hHiddenText,'string',num2str(ang));
   switch ang
   case 0
      set(hObj,'string','East','HorizontalAlignment','Left');
   case 90
      set(hObj,'string','North','VerticalAlignment','Bottom');
   case 180
      set(hObj,'string','West','HorizontalAlignment','Right');
   case 270
      set(hObj,'string','South','VerticalAlignment','Top');
   otherwise
      k = k + 1;
      hObjToDelete(k) = hObj;
   end
end
delete( hObjToDelete(hObjToDelete~=0) );


end
