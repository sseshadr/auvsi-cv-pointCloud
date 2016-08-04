% Copyright 2015-2016 The MathWorks, Inc.
%%
close all
clear
clc
%% Ground plane extraction
groundPlaneExtraction;
    
%% Obtain mask of lines 
% Convert colorspace from rgb to grayscale
grayFrame = rgb2gray(frame);

% Perform edge detection
edgeFrame = edge(grayFrame);

% View edges
figure;
imshow(edgeFrame)
title('Thin lines')

%% Hough Transform
% Perform Hough Transform
[H,T,R] = hough(edgeFrame);

% Identify Peaks in Hough Transform
hPeaks  = houghpeaks(H,50,'threshold',ceil(0.3*max(H(:))));

% Extract lines from hough transform and peaks
hLines = houghlines(edgeFrame,T,R,hPeaks,'FillGap',80,'MinLength',7);
    
% Remove horizontal lines
theta = [hLines.theta];
thetaHorizontal = (theta > 80 & theta < 100) | (theta < -70 & theta > -100);
hLines = hLines(~thetaHorizontal);
    
% Overlay lines and view results
[linePos,markerPos] = getVizPosArray(hLines);

lineFrame = insertShape(frame,'Line',linePos,...
            'Color','blue','LineWidth',5);
outFrame = insertObjectAnnotation(lineFrame,...
            'circle',markerPos,'','Color','yellow','LineWidth',5);
% View image
figure;
imshow(outFrame)
title('Detected Lines')