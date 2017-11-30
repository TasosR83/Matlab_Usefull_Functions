function [dist_km,heading_degrees_2] = distance_heading_on_earth(loc1, loc2)
% HAVERSINE    +   HEADING DEGREES 
% Computes distance between locations using Haversine formula
% Also computed headind from point A to point B
%
%   Example
%     lat1 =  39.106831; lon1 =  26.557457; %Mutilini, Lesvos Island
%     lat2 =   37.925633; lon2 =   23.690294; % Floisvos Square,P.Faliro,Athens,Greece
%     loc1 =[lat1 lon1]; loc2=[lat2 lon2];
%    [dist_km,heading_degrees_2] = distance_heading_on_earth(loc1, loc2)


%       This program was created using equations found on the website
%       http://www.movable-type.co.uk/scripts/latlong.html
%     edited by Tasos Rigos 2014


%% Check user inputs

if ~isequal(nargin, 2)
    error('User must supply two location inputs')
end    

lat1 = loc1(1) ; lon1 = loc1(2) ; 
lat2 = loc2(1) ; lon2 = loc2(2) ; 
 
% to radians
lat1 = lat1*(2*pi/360); lon1 = lon1*(2*pi/360);
lat2 = lat2*(2*pi/360); lon2 = lon2*(2*pi/360);

%% Begin calculation of HAVERSINE
% Haversine
% formula: 	a = sin²(Äö/2) + cos(ö1).cos(ö2).sin²(Äë/2)
% c = 2.atan2(?a, ?(1?a))
% d = R.c
% ======= JAVA WAS:
% var R = 6371; // km
% var dLat = (lat2-lat1).toRad();
% var dLon = (lon2-lon1).toRad();
% var lat1 = lat1.toRad();
% var lat2 = lat2.toRad();
% 
% var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
%         Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
% var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
% var d = R * c;
R = 6371;                                   % Earth's radius in km
delta_lat = lat2-lat1;        % difference in latitude
delta_lon = lon2-lon1;        % difference in longitude
a = sin(delta_lat/2)^2 + cos(lat1) * cos(lat2) * ...
    sin(delta_lon/2)^2;
c = 2 * atan2(sqrt(a), sqrt(1-a));
dist_km = R * c;                                 % distance in km


%% LETS FIND THE ANGLE OF THE 2 POINTS
% Formula: 
% è = atan2( sin(Äë).cos(ö2), cos(ö1).sin(ö2) ? sin(ö1).cos(ö2).cos(Äë) )

% JavaScript: 	
% var y = Math.sin(dLon) * Math.cos(lat2);
% var x = Math.cos(lat1)*Math.sin(lat2) -
%         Math.sin(lat1)*Math.cos(lat2)*Math.cos(dLon);
% var brng = Math.atan2(y, x).toDeg();
% 
% Excel: 	=ATAN2(COS(lat1)*SIN(lat2)-SIN(lat1)*COS(lat2)*COS(lon2-lon1),
%        SIN(lon2-lon1)*COS(lat2)) 

% lat1 = (pi/180) *loc1(2);
% lon1 = (pi/180) *loc1(1);
% lat2 = (pi/180) * loc2(2);
% lon2 = (pi/180) *loc2(1);

% delta_lat = locs{2}(1) - locs{1}(1);        % difference in latitude
% delta_lon = locs{2}(1) - locs{1}(1);        % difference in latitude
%gwnia_radians = atan2( sin(delta_lon) * cos(locs{2}(1)),...
%    cos(locs{1}(1))*sin(locs{2}(1)) - sin(locs{1}(1))*cos(locs{2}(1))*cos(delta_lon) );


% IS THE SAME AS MATLAB'S
% azimuth(lat1,lon1,lat2,lon2)

gwnia_radians = atan2(sin(lon2-lon1)*cos(lat2),...
    cos(lat1)*sin(lat2)-sin(lat1)*cos(lat2)*cos(lon2-lon1));

heading_degrees = gwnia_radians*(180/pi);

heading_degrees_2 = mod(heading_degrees+360,360);


