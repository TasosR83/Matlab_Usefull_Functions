function [ yes_no ] = are_the_same_indexings( vector1,vector2 )
%ARE_THE_SAME_INDEXINGS Summary of this function goes here
% e.g. the
% vector1 =[3;3;3;2;2;2;3;1;3;3;]; vector2=[1;1;1;2;2;2;1;3;1;1;];
% [ yes_no ] = are_the_same_indexings( vector1,vector2 )
% should return yes
%
% vector1 =[3;3;3;2;2;2;3;1;3;3;]; vector2=[2;1;1;2;2;2;1;3;1;1;];
% [ yes_no ] = are_the_same_indexings( vector1,vector2 )
% should return NO
%
% WONT WORK WITH COMPLEX NUMBERS !!!!!!!

appeared_unique1 = unique_unsorted( vector1 );

vector1_new =NaN(size(vector1));
for ii=1:length(appeared_unique1)
    old_element_pou =  find(vector1==appeared_unique1(ii));
    vector1_new(old_element_pou) = ii*1i;
end



appeared_unique2 = unique_unsorted( vector2 );
vector2_new =NaN(size(vector2));
for ii=1:length(appeared_unique2)
    old_element_pou =  find(vector2==appeared_unique2(ii));
    vector2_new(old_element_pou) = ii*1i;
end

if all(vector1_new==vector2_new)
    yes_no=1;
else
    yes_no = 0;
end


end

