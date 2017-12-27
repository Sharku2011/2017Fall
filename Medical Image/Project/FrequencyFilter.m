clear; close all hidden; clc;

img = im2double(imread('hw2.1.bmp'));

fft_img = fft2(img);

LPF1 = lbutter(img, 23, 2);

temp1 = fft_img .* fftshift(LPF1);

result1 = ifft2(temp1);

subplot(1,2,1), imshow(result1), title('FFT');



dct_img = dct2(img);

LPF2 = lbutter(img, 50, 2);

temp2 = dct_img .* fftshift(LPF2);

result2 = idct2(temp2);

subplot(1,2,2),imshow(result2), title('DCT');
