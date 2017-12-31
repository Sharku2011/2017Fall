clear; close all hidden; clc;

img = imread('hw6.1.bmp');

cm = zeros(256,3);

cm(129:256,1) = 1;
cm(65:160,2) = 1;
cm(225:256,2) = 1;
cm(33:96,3) = 1;
cm(193:256,3) = 1;

imshow(img, colormap(cm));