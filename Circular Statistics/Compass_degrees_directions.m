function [ directions ] = Compass_degrees_directions( degrees,n)
%INPUTS:
% n =4 OR 8 OR 16 how many output directions you need to cluster the data

% EXAMPLES:
% Compass_degrees_directions([ 0 30 180 350 92 260],4)
% Compass_degrees_directions([ 0 30 180 350 92 260 140],8)
% degrees = [0:10:360]; directions = Compass_degrees_directions(degrees,16  )
% degrees = [0:0.20:360]; directions = Compass_degrees_directions(degrees,16  ); Result = tabulate(directions)



degrees = degrees(:);

if max(degrees)>360 || min(degrees)<0
    error('Wrong degrees given')
end


switch n
    case 4
        directions  = Compass_degrees_to_4_Directions( degrees );
    case 8
        directions = Compass_degrees_to_8_Directions( degrees );
    case 16
        directions  = Compass_degrees_to_16_Directions( degrees );
    otherwise
        error('Supporting transofmation to 4 or 8 or 16 directions only')
end

end

%% 1RST function
function [ directions ] = Compass_degrees_to_4_Directions( degrees )
%COMPASS_DEGREES_TO_4_DIRECTIONS Summary of this function goes here
%   Detailed explanation goes here
% EXAMPLE
% Compass_degrees_to_4_Directions([ 0 30 180 350 92 260])
degrees = degrees(:);

if max(degrees)>360 || min(degrees)<0
    error('Wrong degrees given')
end

directions = cell(numel(degrees),1);

moires_quant = (360 / 4); %--->ana 90 moires
moires_start = 45;

for ii=1:length(degrees)
    tmp=degrees(ii);
    if tmp>moires_start && tmp<=moires_start+moires_quant
        directions{ii}='E';
    elseif  tmp>moires_start+moires_quant && tmp<=moires_start+2*moires_quant
        directions{ii}='S';
    elseif  tmp>moires_start+2*moires_quant && tmp<=moires_start+3*moires_quant
        directions{ii}='W';
    elseif  tmp>moires_start+3*moires_quant || tmp<=moires_start
        directions{ii}='N';
        
    end
    
end

end

%% SECOND FUNCTION
function [ directions ] = Compass_degrees_to_8_Directions( degrees )
% EXAMPLE
% Compass_degrees_to_8_Directions([ 0 30 180 350 92 260 140])



degrees = degrees(:);

if max(degrees)>360 || min(degrees)<0
    error('Wrong degrees given')
end

directions = cell(numel(degrees),1);

moires_quant = (360 / 8); %--->ana 45 moires
moires_start = 22.5;

for ii=1:length(degrees)
    tmp=degrees(ii);
    if tmp>moires_start && tmp<=moires_start+moires_quant
        directions{ii}='NE';
    elseif  tmp>moires_start+moires_quant && tmp<=moires_start+2*moires_quant
        directions{ii}='E';
    elseif tmp>moires_start+2*moires_quant && tmp<=moires_start+3*moires_quant
        directions{ii}='SE';
    elseif tmp>moires_start+3*moires_quant && tmp<=moires_start+4*moires_quant
        directions{ii}='S';
        
    elseif tmp>moires_start+4*moires_quant && tmp<=moires_start+5*moires_quant
        directions{ii}='SW';
        
    elseif tmp>moires_start+5*moires_quant && tmp<=moires_start+6*moires_quant
        directions{ii}='W';
        
    elseif tmp>moires_start+6*moires_quant && tmp<=moires_start+7*moires_quant
        directions{ii}='NW';
        
        
    elseif  tmp>moires_start+7*moires_quant || tmp<=moires_start
        directions{ii}='N';
        
    end
    
end

end

%% 3RD FUNCTION
function [ directions ] = Compass_degrees_to_16_Directions( degrees )
% from :
% http://climate.umn.edu/snow_fence/components/winddirectionanddegreeswithouttable3.htm
%
% EXAMPLE:
% degrees = [0:10:360]; directions = Compass_degrees_to_16_Directions(degrees  );
% degrees = [0:0.20:360]; directions = Compass_degrees_to_16_Directions(degrees  );


degrees = degrees(:);

if max(degrees)>360 || min(degrees)<0
    error('Wrong degrees given')
end

directions = cell(numel(degrees),1);

dirs_all={'N';'NNE';'NE';'ENE';'E';'ESE';'SE';'SSE';'S';'SSW';'SW';'WSW';'W';'WNW';'NW';'NNW';};
dirs_from = [348.750000000000;11.2500000000000;33.7500000000000;56.2500000000000;78.7500000000000;101.250000000000;123.750000000000;146.250000000000;168.750000000000;191.250000000000;213.750000000000;236.250000000000;258.750000000000;281.250000000000;303.750000000000;326.250000000000;];
dirs_to = [11.2500000000000;33.7500000000000;56.2500000000000;78.7500000000000;101.250000000000;123.750000000000;146.250000000000;168.750000000000;191.250000000000;213.750000000000;236.250000000000;258.750000000000;281.250000000000;303.750000000000;326.250000000000;348.750000000000;];

% dirs_from_to = dirs_from;
% dirs_from_to(:,2) = dirs_to;


for kk=1:length(degrees)
    gwnia = degrees(kk);
    if gwnia>dirs_from(1) || gwnia<=dirs_to(1)
        directions{kk,1}= dirs_all{1,1};
    else
      idx1 = (gwnia>dirs_from);  
      idx2 = (gwnia<=dirs_to);  
       skt= idx1+idx2;
       [ pou ~]=find(skt==2);
       directions{kk,1}=dirs_all{pou,1};
    end
    
    
end

end



