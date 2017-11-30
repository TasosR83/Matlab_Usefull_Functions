function [ degrees ] = Compass_directions_to_degrees( directions,varargin )
% from
% http://en.wikipedia.org/wiki/Points_of_the_compass
% EXAMPLES:
% Compass_directions_to_degrees('N')
% Compass_directions_to_degrees('NNE')
% Compass_directions_to_degrees( {'N','W','NW'} )
% Compass_directions_to_degrees( {'N','W','NW','tsapou'} )
% Compass_directions_to_degrees( {'N','W','NW'},'Random',1)
% Compass_directions_to_degrees( 'W','Random',1)
% Compass_directions_to_degrees( 'N','Random',1)




% ======= ERRORS CHECKING ==============%
if ~ischar(directions) && ~iscell(directions)
    error('Directions given are not STRING neither CELL')
end
%=========================================%



% % ========= check if head properties are given==========%
% random_degrees = 0 ;
% if ~isempty( varargin )
%     for c = 1:floor(length(varargin)/2)
%         try
%             switch lower(varargin{c*2-1})
%                 % head properties - do nothing, since handled above already
%                 case 'random',
%                     %random_degrees = max( min( varargin{c*2},1 ),0.01 )
%                     random_degrees =  varargin{c+1}
%                     if random_degrees ~= 0 && random_degrees ~= 1
%                         error( 'unrecognized property or value for: %s\n',varargin{c*2-1} );
%                     end
%             end
%         catch
%             %fprintf( 'unrecognized property or value for: %s\n',varargin{c*2-1} );
%             error( 'unrecognized property or value for: %s\n',varargin{c*2-1} );
%         end
%     end
% end
% % ========= END OF  check if head properties are given






all_dirs = {'N';'NbE';'NNE';'NEbN';'NE';'NEbE';'ENE';'EbN';'E';'EbS';'ESE';'SEbE';'SE';'SEbS';'SSE';'SbE';'S';'SbW';'SSW';'SWbS';'SW';'SWbW';'WSW';'WbS';'W';'WbN';'WNW';'NWbW';'NW';'NWbN';'NNW';'NbW';};
% lowest_all_dirs = [354.380000000000;5.63000000000000;16.8800000000000;28.1300000000000;39.3800000000000;50.6300000000000;61.8800000000000;73.1300000000000;84.3800000000000;95.6300000000000;106.880000000000;118.130000000000;129.380000000000;140.630000000000;151.880000000000;163.130000000000;174.380000000000;185.630000000000;196.880000000000;208.130000000000;219.380000000000;230.630000000000;241.880000000000;253.130000000000;264.380000000000;275.630000000000;286.880000000000;298.130000000000;309.380000000000;320.630000000000;331.880000000000;343.130000000000;];
% middle_all_dirs = [0;11.2500000000000;22.5000000000000;33.7500000000000;45;56.2500000000000;67.5000000000000;78.7500000000000;90;101.250000000000;112.500000000000;123.750000000000;135;146.250000000000;157.500000000000;168.750000000000;180;191.250000000000;202.500000000000;213.750000000000;225;236.250000000000;247.500000000000;258.750000000000;270;281.250000000000;292.500000000000;303.750000000000;315;326.250000000000;337.500000000000;348.750000000000;];
% highest_all_dirs = [5.62000000000000;16.8700000000000;28.1200000000000;39.3700000000000;50.6200000000000;61.8700000000000;73.1200000000000;84.3700000000000;95.6200000000000;106.870000000000;118.120000000000;129.370000000000;140.620000000000;151.870000000000;163.120000000000;174.370000000000;185.620000000000;196.870000000000;208.120000000000;219.370000000000;230.620000000000;241.870000000000;253.120000000000;264.370000000000;275.620000000000;286.870000000000;298.120000000000;309.370000000000;320.620000000000;331.870000000000;343.120000000000;354.370000000000;];
pressision = 32;
middle_all_dirs = 0:(pressision-1);
tmp = 360/pressision; %=22.5;
middle_all_dirs=tmp .* middle_all_dirs;
lowest_all_dirs = middle_all_dirs - (tmp/2);
lowest_all_dirs = mod(lowest_all_dirs,360);
highest_all_dirs = middle_all_dirs + (tmp/2);

 
    if ischar(directions)
        pou = strcmp(directions,all_dirs);
        pou2 = find(pou==1);
        degrees = middle_all_dirs(pou2);
        
        
    elseif iscell(directions)
        
        directions = directions(:);
        degrees=NaN(length(directions),1);
        for kk=1:length(directions)
            stoixeio = directions{kk,1};
            pou = strcmp(stoixeio,all_dirs);
            
            if sum(pou)==0
                % error([10,num2str(kk),'-th Element given is not a compass angle'])
                fprintf([10,num2str(kk),'-th Element given is not a compass angle'])
            else
                
                pou2 = find(pou==1);
                degrees(kk) = middle_all_dirs(pou2);
            end
            
        end
        
        
    end
    
% elseif random_degrees==1
%     % NOW FOR EACH DIRECTION WE GIVE AS OUTPUT RANDOM COMPASS DEGREES LIKE
%     % WE HAD A REAL METEO STATION
%     % EDITs:
%     % 1) CHOOSING AKRIBEIA TOY METEO STATIONS
%     % 2) CHOOSING COMPASS QUALITY (4 8 16 OR 32 DIRECTIONS)
%     
%     if ischar(directions)
%         pou = strcmp(directions,all_dirs);
%         pou2 = find(pou==1);
%         if strcmp('N',directions);
%             a = lowest_all_dirs(pou2);
%             b = highest_all_dirs(pou2) + 360;
%             degrees = a + (b-a).*rand ;
%             degrees = mod(degrees,360);
%             
%         else
%             a = lowest_all_dirs(pou2);
%             b = highest_all_dirs(pou2);
%             degrees = a + (b-a).*rand ;
%         end
%     elseif iscell(directions)
%         
%         
%         
%     end
%     
    
end


