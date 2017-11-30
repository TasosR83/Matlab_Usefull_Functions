function A = Combinations( varargin )
% Gives ALL possible compinations 
% of the input vectors
% modification of the 'allcomb.m' of File Exchange Central
% EXAMPLES:
% pinakas = Combinations( [1;2], [ 5,3] )
% pinakas = Combinations( [1;2], [ 5,3],6 )
% pinakas = Combinations( [1;2], [ 5,3],[10:12] )
%
%
%% error checking
N = nargin;
for ii=1:N 
   inputI = varargin{ii};
   if ~isnumeric(inputI)
       error(['Not numeric input given as input #',num2str(ii)])
   end
   if min(size((inputI))) ~=1
       error(['Not Nx1 OR 1xN input given as input #',num2str(ii)])
   end 
end
clear ii;
%% 
%A = NaN([
ii = N:-1:1;
if N == 1   
    A = varargin{1}(:) ; % nothing to combine
elseif N ==0;
     A = NaN([1 1]);
       
else
     [A{ii}] = ndgrid(varargin{ii});
        
     A = reshape(cat(N+1,A{:}),[],N);
end


end

