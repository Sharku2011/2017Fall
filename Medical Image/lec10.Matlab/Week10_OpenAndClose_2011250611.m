close all hidden; clear; clc;

img = imread('lung.jpg');

img_noise = imnoise(img, 'salt & pepper');

cr = [0 1 0;...
      1 1 1;...
      0 1 0];

Morph = cell(1,2);

Morph{1} = imopen(img_noise, cr);
Morph{2} = imclose(img_noise, cr);

Filtered = cell(1,2);
Filtered{1} = imopen(imclose(img_noise,cr),cr);
Filtered{2} = imclose(imopen(img_noise,cr),cr); 

figure;
subplot(2,2,1), imshow(img_noise); title('noise');
subplot(2,2,3), imshow(Morph{1});title('open');
subplot(2,2,4), imshow(Morph{2}); title('close');

figure;
subplot(1,2,1), imshow(Filtered{1}); title('close-open');
subplot(1,2,2), imshow(Filtered{2}); title('open-close');