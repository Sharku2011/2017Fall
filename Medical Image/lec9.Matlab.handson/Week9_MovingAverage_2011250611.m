close all hidden; clear; clc;

img = imread('vessel.jpg');

thres = otsuMethod(img);

figure;
subplot(1,3,1), imshow(img), title('original');
subplot(1,3,2), imshow(imbinarize(img, thres)), title('otsu''s method');

img_ma = movingaverage(img, 20, 0.95);
subplot(1,3,3), imshow(img_ma), title('moving average');


TMP = cell(1,9);

figure('name', 'moving average');
for i=1:9
    TMP{1,i} = movingaverage(img, 20, 0.55 + 0.05*i);
    subplot(3,3,i), imshow(TMP{1,i}), title(0.55+0.05*i);
end