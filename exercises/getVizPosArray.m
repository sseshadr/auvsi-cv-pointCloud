function [linePos,markerPos] = getVizPosArray(hLines)
% Copyright 2015-2016 The MathWorks, Inc.
% Get line and marker positions (output) of houghlines (input) formatted to
% use directly with insertShape and insertObjectAnnotation functions.

linePos = [];
markerPos = [];
markerSize = 5;

for lidx = 1:length(hLines)
    
    linePos = [linePos;...
               hLines(lidx).point1 hLines(lidx).point2];  
    % Get linePos in [x1 y1;x2 y2...] format. 
    markerPos = [markerPos;...
                [hLines(lidx).point1 markerSize];...
                [hLines(lidx).point2 markerSize]];
    % Get markerPos in [x1 markerSize;y1 markerSize...] format. 
    
end

end