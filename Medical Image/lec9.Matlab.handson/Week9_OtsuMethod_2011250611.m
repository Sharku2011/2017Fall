close all hidden; clear; clc;

img = imread('ultrasound.jpg');

norm_thres = otsuMethod(img);

timg = graythresh(im2double(img));

figure('name', 'Otsu''s method');
subplot(1,2,1), imshow(imbinarize(img, norm_thres)), title('My Method');
subplot(1,2,2), imshow(imbinarize(img, timg)), title('Built-In Method');
