function [ degrees ] = Compass_directions_to_degrees_random( directions,n_dirs,pressision )
%COMPASS_DIRECTIONS_TO_DEGREES_RANDOM Summary of this function goes here
%   Detailed explanation goes here

% Compass_directions_to_degrees_random( {'N','W','NW','tsapou'},4,1 )
% Compass_directions_to_degrees_random( {'N','W','NW'},8,0.1)
% Compass_directions_to_degrees_random( 'W',32,1)
% Compass_directions_to_degrees_random( 'N',32,1)
% Compass_directions_to_degrees_random( 'N',4,0.1)
% Compass_directions_to_degrees_random( 'W',4,0.1)
% Compass_directions_to_degrees_random( {'N','W','S','E'},4,0.2)
% Compass_directions_to_degrees_random( {'N','W','S','E','EWE','N'},4,0.2)
% Compass_directions_to_degrees_random( {'NE','W','S','E','EWE','N'},8,0.2)
% Compass_directions_to_degrees_random( {'NE','W','S','E','ENE','N'},16,0.01)
% Compass_directions_to_degrees_random( {'NE','W','S','E','ENE','N'},16,0.3)
% Compass_directions_to_degrees_random( {'NE','W','S','E','ENE','N'},16,3)


%n= 4 OR 8 OR 16 OR 32

% ======= ERRORS CHECKING ==============%
if ~ischar(directions) && ~iscell(directions)
    error('Directions given are not STRING neither CELL')
end

if n_dirs ~= 4 && n_dirs ~= 8 && n_dirs ~= 16 && n_dirs ~= 32
    error('Works only with 4 OR 8 OR 16 OR 32 directions')
    
end

% checking accepted precisions
% de mporoume px na exoume akribeia =0.3
tmp  = divisors( 10^3 ); %akribeia ws 1/10^3
tmp2=1./tmp;
tmp2(end:end+10) = 0:10;
 
if ~ismember(pressision,tmp2)
    error('wrong preicision given')
end

%=========================================%

switch n_dirs
    case 4
        all_dirs = {'N';'E';'S';'W';};
        middle_all_dirs = 0:(n_dirs-1);
        tmp = 360/n_dirs; %=90;
        middle_all_dirs = tmp .* middle_all_dirs;
        lowest_all_dirs = middle_all_dirs - (tmp/2);
        lowest_all_dirs = mod(lowest_all_dirs,360);
        highest_all_dirs = middle_all_dirs + (tmp/2);
        
        
        
        if ischar(directions)
            pou = strcmp(directions,all_dirs);
            pou2 = find(pou==1);
            if strcmp('N',directions);
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2) + 360;
                degrees = a + (b-a).*rand ;
                degrees = mod(degrees,360);
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
                
            else
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2);
                degrees = a + (b-a).*rand ;
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
            end
        elseif iscell(directions)
            directions = directions(:);
            degrees = NaN(length(directions),1);
            for ll=1:numel(directions);
                stoixeio = directions{ll,1};
                pou = strcmp(stoixeio,all_dirs);
                
                if sum(pou)==0
                    % error([10,num2str(kk),'-th Element given is not a compass angle'])
                    fprintf([10,num2str(ll),'-th Element given is not a compass angle',10,...
                        'with desired compass directions'])
                else
                    pou2 = find(pou==1);
                    %degrees(kk) = middle_all_dirs(pou2);
                    if pou2==1 %NOERTh
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2) + 360;
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = mod(degrees(ll),360);
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        
                        
                    else % not North Direction given
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2);
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                    end
                end
            end
        end
        
        
        
        
    case 8
        all_dirs = {'N';'NE';'E';'SE';'S';'SW';'W';'NW';};
        middle_all_dirs = 0:(n_dirs-1);
        tmp = 360/n_dirs; %=45;
        middle_all_dirs=tmp .* middle_all_dirs;
        lowest_all_dirs = middle_all_dirs - (tmp/2);
        lowest_all_dirs = mod(lowest_all_dirs,360);
        highest_all_dirs = middle_all_dirs + (tmp/2);
        
        
        
        
        if ischar(directions)
            pou = strcmp(directions,all_dirs);
            pou2 = find(pou==1);
            if strcmp('N',directions);
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2) + 360;
                degrees = a + (b-a).*rand ;
                degrees = mod(degrees,360);
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
                
            else
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2);
                degrees = a + (b-a).*rand ;
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
            end
        elseif iscell(directions)
            directions = directions(:);
            degrees = NaN(length(directions),1);
            for ll=1:numel(directions);
                stoixeio = directions{ll,1};
                pou = strcmp(stoixeio,all_dirs);
                
                if sum(pou)==0
                    % error([10,num2str(kk),'-th Element given is not a compass angle'])
                    fprintf([10,num2str(ll),'-th Element given is not a compass angle',10,...
                        'with desired compass directions'])
                else
                    pou2 = find(pou==1);
                    %degrees(kk) = middle_all_dirs(pou2);
                    if pou2==1 %NOERTh
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2) + 360;
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = mod(degrees(ll),360);
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        
                        
                    else % not North Direction given
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2);
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                    end
                end
            end
        end
        
        
        
        
    case 16
        all_dirs = {'N';'NNE';'NE';'ENE';'E';'ESE';'SE';'SSE';'S';'SSW';'SW';'WSW';'W';'WNW';'NW';'NNW';};
        middle_all_dirs = 0:(n_dirs-1);
        tmp = 360/n_dirs; %=22.5;
        middle_all_dirs=tmp .* middle_all_dirs;
        lowest_all_dirs = middle_all_dirs - (tmp/2);
        lowest_all_dirs = mod(lowest_all_dirs,360);
        highest_all_dirs = middle_all_dirs + (tmp/2);
        
        
        
        
        
        if ischar(directions)
            pou = strcmp(directions,all_dirs);
            pou2 = find(pou==1);
            if strcmp('N',directions);
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2) + 360;
                degrees = a + (b-a).*rand ;
                degrees = mod(degrees,360);
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
                
            else
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2);
                degrees = a + (b-a).*rand ;
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
            end
        elseif iscell(directions)
            directions = directions(:);
            degrees = NaN(length(directions),1);
            for ll=1:numel(directions);
                stoixeio = directions{ll,1};
                pou = strcmp(stoixeio,all_dirs);
                
                if sum(pou)==0
                    % error([10,num2str(kk),'-th Element given is not a compass angle'])
                    fprintf([10,num2str(ll),'-th Element given is not a compass angle',10,...
                        'with desired compass directions'])
                else
                    pou2 = find(pou==1);
                    %degrees(kk) = middle_all_dirs(pou2);
                    if pou2==1 %NOERTh
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2) + 360;
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = mod(degrees(ll),360);
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        
                        
                    else % not North Direction given
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2);
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                    end
                end
            end
        end
        
        
    case 32
        all_dirs = {'N';'NbE';'NNE';'NEbN';'NE';'NEbE';'ENE';'EbN';'E';'EbS';'ESE';'SEbE';'SE';'SEbS';'SSE';'SbE';'S';'SbW';'SSW';'SWbS';'SW';'SWbW';'WSW';'WbS';'W';'WbN';'WNW';'NWbW';'NW';'NWbN';'NNW';'NbW';};
        % lowest_all_dirs = [354.380000000000;5.63000000000000;16.8800000000000;28.1300000000000;39.3800000000000;50.6300000000000;61.8800000000000;73.1300000000000;84.3800000000000;95.6300000000000;106.880000000000;118.130000000000;129.380000000000;140.630000000000;151.880000000000;163.130000000000;174.380000000000;185.630000000000;196.880000000000;208.130000000000;219.380000000000;230.630000000000;241.880000000000;253.130000000000;264.380000000000;275.630000000000;286.880000000000;298.130000000000;309.380000000000;320.630000000000;331.880000000000;343.130000000000;];
        % middle_all_dirs = [0;11.2500000000000;22.5000000000000;33.7500000000000;45;56.2500000000000;67.5000000000000;78.7500000000000;90;101.250000000000;112.500000000000;123.750000000000;135;146.250000000000;157.500000000000;168.750000000000;180;191.250000000000;202.500000000000;213.750000000000;225;236.250000000000;247.500000000000;258.750000000000;270;281.250000000000;292.500000000000;303.750000000000;315;326.250000000000;337.500000000000;348.750000000000;];
        % highest_all_dirs = [5.62000000000000;16.8700000000000;28.1200000000000;39.3700000000000;50.6200000000000;61.8700000000000;73.1200000000000;84.3700000000000;95.6200000000000;106.870000000000;118.120000000000;129.370000000000;140.620000000000;151.870000000000;163.120000000000;174.370000000000;185.620000000000;196.870000000000;208.120000000000;219.370000000000;230.620000000000;241.870000000000;253.120000000000;264.370000000000;275.620000000000;286.870000000000;298.120000000000;309.370000000000;320.620000000000;331.870000000000;343.120000000000;354.370000000000;];
        
        middle_all_dirs = 0:(n_dirs-1);
        tmp = 360/n_dirs; %=22.5;
        middle_all_dirs=tmp .* middle_all_dirs;
        lowest_all_dirs = middle_all_dirs - (tmp/2);
        lowest_all_dirs = mod(lowest_all_dirs,360);
        highest_all_dirs = middle_all_dirs + (tmp/2);
        
        
        
        
        if ischar(directions)
            pou = strcmp(directions,all_dirs);
            pou2 = find(pou==1);
            if strcmp('N',directions);
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2) + 360;
                degrees = a + (b-a).*rand ;
                degrees = mod(degrees,360);
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
                
            else
                a = lowest_all_dirs(pou2);
                b = highest_all_dirs(pou2);
                degrees = a + (b-a).*rand ;
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                % aplly desired precision
                degrees = degrees / pressision;
                degrees = round(degrees);
                degrees = degrees * pressision;
                
            end
        elseif iscell(directions)
            directions = directions(:);
            degrees = NaN(length(directions),1);
            for ll=1:numel(directions);
                stoixeio = directions{ll,1};
                pou = strcmp(stoixeio,all_dirs);
                
                if sum(pou)==0
                    % error([10,num2str(kk),'-th Element given is not a compass angle'])
                    fprintf([10,num2str(ll),'-th Element given is not a compass angle',10,...
                        'with desired compass directions'])
                else
                    pou2 = find(pou==1);
                    %degrees(kk) = middle_all_dirs(pou2);
                    if pou2==1 %NOERTh
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2) + 360;
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = mod(degrees(ll),360);
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        
                        
                    else % not North Direction given
                        a = lowest_all_dirs(pou2);
                        b = highest_all_dirs(pou2);
                        degrees(ll) = a + (b-a).*rand ;
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                        % aplly desired precision
                        degrees(ll) = degrees(ll) / pressision;
                        degrees(ll) = round(degrees(ll));
                        degrees(ll) = degrees(ll) * pressision;
                    end
                end
            end
        end
        
        
end








end

