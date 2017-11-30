function [ new_points ] = seperate_nearby_points( points )
% points = [2.56389790268494 2.37606412644083;1.96606047813115 1.90149885154855;2.19928303873608 2.50907673772332;2.16205058166164 2.20221550388693;1.64125242216959 2.32493367952545;2.10541765033603 2.13322729510642;2.44660279973020 1.87228516996953;2.41530937626502 2.09399705656938;2.44675345656452 1.87178724517796;2.28757792383919 1.43551177204804;]
% new_points = seperate_nearby_points( points);
% figure;subplot(1,2,1);plot(points(:,1),points(:,2);title('old points');
% subplot(1,2,2);plot(new_points(:,1),new_points(:,2);title('new points');
epsilon = 2e-2;

D = pdist(points) ;
[poso,pou]=min(D);
distance_matrix = squareform(D);
[row,col]  = find(distance_matrix==poso);

new_points = points;
new_points(row(1),:) = new_points(row(1),:) +epsilon;
end

