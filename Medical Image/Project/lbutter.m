function out = lbutter(im, d, n)
% LBUTTER(IM,D,N) creates a low-pass Butterworth filter
% of the same size as image IM, with cut off D, and order N
% D 는 cut off(차단해줄) 주파수, 
    [height, width] = size(im);
    [x, y] = meshgrid(-floor(width/2):floor((width-1)/2), -floor(height/2):floor((height-1)/2));
    
    out = 1./(1+(sqrt(2)-1)*((x.^2 + y.^2)/d^2).^n);
end