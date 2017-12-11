close all hidden; clear; clc;

pet = imread('PET.jpg');

figure;
subplot(2,2,4), imshow(pet);
for i=1:3
    subplot(2,2,i), imshow(pet(:,:,i));
end

pet_noise = imnoise(pet,'salt & pepper');

figure;
subplot(2,2,4), imshow(pet_noise);
for i=1:3
    subplot(2,2,i), imshow(pet_noise(:,:,i));
end

pet_med = zeros(size(pet));

figure;
temp = [];
for i=1:3
    temp = cat(3, temp, medfilt2(im2double(pet_noise(:,:,i))));
end
imshow(temp);