function [ Mode1, Mode_frequency,all_frequencies ] = Mode_Direction( directions_degrees,Spliting_cases )
% example:

% Mode_Direction( [5:10,5,90] )
% directions_degrees = [5:10,270,90:100]; Mode_Direction( directions_degrees,16 )
% directions_degrees = [5:10,270,90:100]; [ Mode1, Mode_frequency ]  = Mode_Direction( directions_degrees,16 )
% [ Mode1, Mode_frequency,all_frequencies ]  = Mode_Direction( [5:10,270,90:100,(180+22.5):0.01:(180+22.8)],16 )
% directions_degrees =  [5:10,270,90:100,(180+22.5):0.01:(180+22.8)];Spliting_cases = 16; [ Mode1, Mode_frequency,all_frequencies ]  = Mode_Direction(directions_degrees,Spliting_cases )
%
% By Tasos Rigos, 5-Jul-2014

if nargin ==1
    Spliting_cases = 8;
end


 directions = Compass_degrees_directions( directions_degrees,Spliting_cases); %eg {'SE','N'}
 
% find and remove empty cells
emptyCells = cellfun(@isempty,directions);
directions(emptyCells) = [];

 
 
 
[unique_strings, ~, string_map]=unique(directions);

[mode_here,modes_frequency] = mode(string_map);
most_common_string = unique_strings(mode_here);

Mode1 = most_common_string;
Mode_frequency = modes_frequency;

%% CREATE THE all_frequencies Cell
all_frequencies = cell([size(unique_strings,1)+1 3]);
all_frequencies(1,:) = {'Value','Frequency','Frequency_Percent'};
for ii=2:size(all_frequencies,1)
    all_frequencies{ii,1} = unique_strings{ii-1};
    all_frequencies{ii,2} = sum(string_map == ii-1);
    
    all_frequencies{ii,3} = (all_frequencies{ii,2} *100) / numel(string_map);
end
%% SORT THE all_frequencies Cell
tmp_freqs = all_frequencies(2:end,2);
[~,sorted_tmp_idx] = sort(cell2mat(tmp_freqs));


sorted_tmp_idx = sorted_tmp_idx+1;
%sorted_tmp_idx = sorted_tmp_idx(end:1);

all_frequencies(2:end,:) = all_frequencies(sorted_tmp_idx,:);

end

