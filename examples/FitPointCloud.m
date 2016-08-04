% Copyright 2015-2016 The MathWorks, Inc.
%% Load the point cloud.
load('object3d.mat')

%% Display and label the point cloud.
subplot(1,3,1)
pcshow(ptCloud)
xlabel('X(m)')
ylabel('Y(m)')
zlabel('Z(m)')
title('Original Point Cloud')

%% Set up general plane extraction input parameters
maxDist = 0.02;

refVector = [0 0 1];

maxAngDist = 5;

%% Extract and view the ground plane
[model, inlierIdx, outlierIdx] = pcfitplane(ptCloud, maxDist, refVector, maxAngDist);

plane = select(ptCloud,inlierIdx);

subplot(1,3,2)
pcshow(plane)
title('Inlier point cloud')

%% Extract and view the remaining point cloud
remainPtCloud = select(ptCloud,outlierIdx);

subplot(1,3,3)
pcshow(remainPtCloud)
title('Outlier point cloud')

%% Extract image from point cloud and view it
I = ptCloud.Color;
imshow(I)
title('Original Image')

%% Create and view binary mask
[rows, cols, ~] = size(I);

binMask = false(rows,cols);
binMask(outlierIdx) = true;

figure
imshow(binMask)
title('Binary Mask')

%% Ground plane image extraction 
mask = repmat(binMask,[1 1 3]);

I(mask) = 0;

figure
imshow(I)
title('Extracted Ground Plane Image')