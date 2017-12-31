clear; close all hidden; clc;

img = im2double(imread('hw3.1.bmp'));

logfilt = fspecial('LoG', 6);

result = filter2(logfilt, img);

subplot(1,2,1), imshow(result, []);

result2 = edge(img, 'canny', [0.0902, 0.1765],1);

subplot(1,2,2), imshow(result2, []);

% figure, imhist(img);