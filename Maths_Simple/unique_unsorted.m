function [ appeared_unique ] = unique_unsorted( vector1 )
% example:
% vector1=[9 3 6 2 7 1 2 1 1 1 9 9 3 3];
% b= unique_unsorted(vector1) 
 
[shit,I]=unique(vector1,'first');
appeared_unique=vector1(sort(I));
end