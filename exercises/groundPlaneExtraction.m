% Copyright 2015-2016 The MathWorks, Inc.
%%
close all
clear
clc
%% Load point cloud
load ptCloudCar

%% View point cloud
figure
pcshow(ptCloud,'VerticalAxis','Y','VerticalAxisDir','Down')
title('Point Cloud');

%% Fit ground plane
maxDistance = 1;
referenceVector = [0 1 0];
maxAngularDistance = 30*pi/180;
[model,inlierIdx,outlierIdx] = pcfitplane(ptCloud,maxDistance,referenceVector,maxAngularDistance);

% Show extracted ground plane for visualization purposes
ptCloudGround = select(ptCloud,inlierIdx);
figure
pcshow(ptCloudGround,'VerticalAxis','Y','VerticalAxisDir','Down')
title('Extracted Ground Plane Point Cloud');

%% Ground plane image extraction 
% Extract image from point cloud
frame = ptCloud.Color;
figure
imshow(frame)
title('Color Image');

% Create binary mask where ground pixels are true
nr = size(frame,1);
nc = size(frame,2);
bm = false(nr,nc);
bm(inlierIdx) = true; 
bm = imclose(bm,strel('disk',20));

% View binary mask
figure
imshow(bm);
title('Binary Mask for Ground Points');

% Use mask to set pixels in image to zero
mask = repmat(bm,[1 1 3]);
frame(~mask) = 0;
figure;
imshow(frame);
title('Extracted Ground Plane Image');   