% Copyright 2015-2016 The MathWorks, Inc.
%% Load point cloud from .mat file
load cleanTeapot
load noisyTeapot

% View original point cloud
subplot(1,3,1)
pcshow(ptCloud,'MarkerSize',15)
title('Original');

%%  View noisy point cloud
subplot(1,3,2)
pcshow(ptCloudNoisy,'MarkerSize',15)
title('Noisy');

%% Denoise the point cloud
nn = 4;
th = 0.3;
tic
ptCloudOut = pcdenoise(ptCloudNoisy,'NumNeighbors',nn,...
    'Threshold',th);
toc
subplot(1,3,3)
pcshow(ptCloudOut,'MarkerSize',15)
title('Denoised');