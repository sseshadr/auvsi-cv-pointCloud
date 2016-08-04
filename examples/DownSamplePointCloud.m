% Copyright 2015-2016 The MathWorks, Inc.
%% Load a point cloud.
load teapot

% View original point cloud
subplot(2,2,1)
pcshow(ptCloud)
title(['Original: ', num2str(size(ptCloud.Location))])
%% Use the random method to downsample a point cloud
fraction = 0.10;
tic
ptCloudOut = pcdownsample(ptCloud,'random',fraction);
toc
subplot(2,2,2)
pcshow(ptCloudOut)
title(['Random: ', num2str(size(ptCloudOut.Location))])

%% Use the grid method to downsample a point cloud
gridStep = 0.1; % set 3d box size to be (0.1 x 0.1 x 0.1)

tic
ptCloudOut = pcdownsample(ptCloud,'gridAverage',gridStep);
toc

subplot(2,2,3)
pcshow(ptCloudOut)
title(['Uniform Grid Average: ', num2str(size(ptCloudOut.Location))])


%% Use the non-uniform grid method to downsample a point cloud 
maxNumPts = 10;

tic
ptCloudOut = pcdownsample(ptCloud,'nonuniformGridSample',maxNumPts);
toc

subplot(2,2,4)
pcshow(ptCloudOut)
title(['Non-Uniform Grid Sample: ', num2str(size(ptCloudOut.Location))])