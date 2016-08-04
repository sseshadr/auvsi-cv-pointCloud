% Copyright 2015-2016 The MathWorks, Inc.
%% load point cloud from mat file
load teapot

% Reads in point cloud from PLY file
% ptCloud = pcread('teapot.ply');

%% View 1-time visualization of point cloud
disp('pcshow method')
tic
pcshow(ptCloud)
toc

%% View a point cloud with the pcplayer method
player = pcplayer(ptCloud.XLimits,ptCloud.YLimits,ptCloud.ZLimits);
disp('pcplayer method')
tic
view(player,ptCloud)
toc