% Setup

clear;clc; close all hidden;

img = im2double(imread('arm.png'));
 
%% Edge detection with sobel filter

sobel_v = fspecial('sobel');
sobel_h = sobel_v';

SobelImgs = cell(2,6);

SobelImgs{1,1} = filter2(sobel_v, img); %sobel_vertical
SobelImgs{1,2} = filter2(-sobel_v, img); %sobel_inverse vertical
SobelImgs{1,4} = filter2(sobel_h,img); %sobel_horizontal
SobelImgs{1,5} = filter2(-sobel_h, img); %sobel_inverse horizontal
SobelImgs{1,3} = abs(SobelImgs{1,1}); %sobel_vertical absolute
SobelImgs{1,6} = abs(SobelImgs{1,4}); %sobel_horizontal absolute

NameTag = {'sobel/vertical', 'sobel/inverse vertical', 'sobel/vertical absolute', ...
    'sobel/horizontal', 'sobel/inverse horizontal', 'sobel/horizontal absolute'};

figure('name', 'sobel processing');
for i=1:6
    subplot(2,3,i), imshow(SobelImgs{1,i}), title(NameTag{1,i}, 'fontsize', 12);
end

figure('name', 'Combined sobel');
subplot(1,2,1), imshow(img), title('original', 'fontsize', 14);
subplot(1,2,2), imshow(SobelImgs{1,3}+SobelImgs{1,6}), title('sobel', 'fontsize', 14);

%% Edge detection with sobel filter - average filtered

af = ones(5) / 25;

img_aver = filter2(af, img);

SobelImgs{2,1} = filter2(sobel_v, img_aver);
SobelImgs{2,2} = filter2(-sobel_v, img_aver);
SobelImgs{2,4} = filter2(sobel_h,img_aver);
SobelImgs{2,5} = filter2(-sobel_h, img_aver);
SobelImgs{2,3} = abs(SobelImgs{2,1});
SobelImgs{2,6} = abs(SobelImgs{2,4});


figure('name', 'averaged sobel processing');
for i=1:6
    subplot(2,3,i), imshow(SobelImgs{2,i}), title(NameTag{1,i}, 'fontsize', 12);
end

figure('name', 'Combined averaged sobel');
subplot(1,2,1), imshow(img_aver), title('original', 'fontsize', 14);
subplot(1,2,2), imshow(SobelImgs{2,3}+SobelImgs{2,6}), title('sobel', 'fontsize', 14);

threshold = max(max(SobelImgs{2,5}+SobelImgs{2,6})) * 0.1;

BinImg = img>threshold;
figure, imshow(BinImg);

%% Edge detection with LoG filter - average filtered

LoGf = fspecial('LoG', 5);
LoGImg = conv2(LoGf, img_aver);
figure, imshow(LoGImg,[]);

LoGBinImg = LoGImg > (max(max(LoGImg))*0.01);
figure, imshow(LoGBinImg);
