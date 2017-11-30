function [ Mode1, Mode_frequency,all_frequencies2 ] = Mode_Direction_v_2_0( directions_degrees,Spliting_cases )
% Version 2.0 finds multiple modes(if exist) and returns Indexing in the 
% 'all_frequencies' variables
% example:

% % Mode_Direction( [5:10,5,90] )
% % directions_degrees = [5:10,270,90:100]; Mode_Direction( directions_degrees,16 )
% % directions_degrees = [5:10,270,90:100]; [ Mode1, Mode_frequency ]  = Mode_Direction( directions_degrees,16 )
% % [ Mode1, Mode_frequency,all_frequencies ]  = Mode_Direction( [5:10,270,90:100,(180+22.5):0.01:(180+22.8)],16 )
% % directions_degrees =  [5:10,270,90:100,(180+22.5):0.01:(180+22.8)];Spliting_cases = 16; [ Mode1, Mode_frequency,all_frequencies ]  = Mode_Direction(directions_degrees,Spliting_cases )

% directions_degrees =  [355 0 10 2 90 89 88 92 180 181 192];Spliting_cases = 16; [ Mode1, Mode_frequency,all_frequencies ]  = Mode_Direction_v_2_0(directions_degrees,Spliting_cases )
% By Tasos Rigos, 5-Jul-2014

if nargin ==1
    Spliting_cases = 8;
end


 directions = Compass_degrees_directions( directions_degrees,Spliting_cases); %eg {'SE','N'}
 
% find and remove empty cells
emptyCells = cellfun(@isempty,directions);
directions(emptyCells) = [];

 
 
 
[unique_strings, ~, string_map]=unique(directions);

if 0 % workn only if dataset is not multimodal
    [mode_here,modes_frequency] = mode(string_map);
    most_common_string = unique_strings(mode_here);
    
    Mode1 = most_common_string;
    Mode_frequency = modes_frequency;
end


tmp1 = unique(string_map);
H=histc(string_map,tmp1);
mode_s = tmp1(H==max(H));
Mode1 = unique_strings(mode_s);

% Mode_frequency = H;

% Mode_frequency = NaN([length(mode_s) 1]);
% for ii=1:numel(Mode1);
%     
%      Mode_frequency(ii) = strcmp(directions,Mode1{ii});
% end

[~,Mode_frequency] = mode(string_map);

%% CREATE THE all_frequencies Cell
Headers = {'Value','Frequency','Frequency_Percent','Index In given Data'};
all_frequencies = cell([size(unique_strings,1)+1 length(Headers)]);
all_frequencies(1,:) = Headers;
for ii=2:size(all_frequencies,1)
    all_frequencies{ii,1} = unique_strings{ii-1};
    all_frequencies{ii,2} = sum(string_map == ii-1);
    
    all_frequencies{ii,3} = (all_frequencies{ii,2} *100) / numel(string_map);
    
    all_frequencies{ii,4} = find(string_map == ii-1);
end
%% SORT THE all_frequencies Cell DOESNT WORK !!!!
tmp_freqs = all_frequencies(2:end,2);
[~,sorted_tmp_idx1] = sort(cell2mat(tmp_freqs));


sorted_tmp_idx2 = sorted_tmp_idx1(end:-1:1);
sorted_tmp_idx3 = sorted_tmp_idx2 + 1;



all_frequencies2 = all_frequencies;
all_frequencies2(2:end,:) = all_frequencies(sorted_tmp_idx3,:);

end

