% Copyright 2015-2016 The MathWorks, Inc.
%% Transform Point Cloud
% Load the point cloud mat file
load livingRoom

% Extract 1 point cloud 
ptCloud = livingRoomData{1};

% View the point cloud
subplot(1,3,1)
pcshow(ptCloud,'VerticalAxis','Y','VerticalAxisDir','Down')
zlim([1 10])
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
title('Original')

%% Translate the point cloud along z axis
A = [1, 0, 0, 0;...
     0, 1, 0, 0;...
     0, 0, 1, 0;...
     0, 0, 3, 1];
 
 tform = affine3d(A);
 
 ptCloudTrans = pctransform(ptCloud,tform);
 
subplot(1,3,2)
pcshow(ptCloudTrans,'VerticalAxis','Y','VerticalAxisDir','Down')
zlim([1 10])
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
title('Translated')

%% Rotate the point cloud down parallel to the x-y plane
a = -pi/4;

A = [1, 0, 0, 0;...
    0, cos(a), sin(a), 0;...
    0, -sin(a), cos(a), 0;...
    0, 0, 0, 1];

tform = affine3d(A);
 
 ptCloudRot = pctransform(ptCloud,tform);
 
subplot(1,3,3)
pcshow(ptCloudRot,'VerticalAxis','Y','VerticalAxisDir','Down')
zlim([1 10])
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
title('Rotated')