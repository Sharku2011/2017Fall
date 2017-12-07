close all hidden; clear; clc;

lung = imread('lung.tif');
lung_b = lung >= 128;

kernel = reshape(2.^(0:8), [3,3])';

temp = filter2(kernel, lung_b);


LUT1 = zeros([1,512]);
LUT2 = zeros([1,512]);

for i = 1:512
    LUT1(i) = (bitget(i-1, 5) && (bitget(i-1, 2) + bitget(i-1, 4) + bitget(i-1,6) + bitget(i-1,8) < 4));
end

figure;
result1 = LUT1(temp+1);
subplot(1,2,1), imshow(result1);

for i = 1:512
    LUT2(i) = (bitget(i-1,5) && (bitget(i-1,2) + bitget(i-1,8) < 2));
end

result2 = LUT2(temp+1);
subplot(1,2,2), imshow(result2);