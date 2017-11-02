% clear;clc;
% 
% CT = imread('CT.jpg');
% 
% Comp = ones(size(CT)) / 2.0;
% 
% CT_double = im2double(CT);
% Min = min(min(CT_double));
% Max = max(max(CT_double - Min));
% CT_double = CT_double / Max;
% 
% CT_gaussian = imnoise(CT_double, 'gaussian');
% CT_snp = imnoise(CT_double, 'salt & pepper');
% Comp_gaussian = imnoise(Comp, 'gaussian');
% Comp_snp = imnoise(Comp, 'salt & pepper');
% 
% Noise = { Comp, Comp_gaussian, Comp_snp };
% Hist = cell(1,3);
% 
% 
% for i=1:3
%     figure;
%     imhist(Noise{i});
% %     h.BinLimits = [-1.1, 1.1];
% end
% 
% filter_mean = ones([3,3])/9.0;
% 
% CT_gaussian_mean = conv2(CT_gaussian, filter_mean);
% CT_gaussian_med = medfilt2(CT_gaussian);
% 
% CT_snp_mean = conv2(CT_snp, filter_mean);
% CT_snp_med = medfilt2(CT_snp);
% 
% figure;
% subplot(2,2,1), imshow(CT_gaussian_mean); title('gauss mean', 'fontsize', 12);
% subplot(2,2,2), imshow(CT_snp_mean); title('s&p mean', 'fontsize', 12);
% subplot(2,2,3), imshow(CT_gaussian_med); title('gauss med', 'fontsize', 12);
% subplot(2,2,4), imshow(CT_snp_med); title('s&p med', 'fontsize', 12);
% 
% 
% CT_wiener_snp = wiener2(CT_snp,[19, 19]);
% figure('name', 'gaussian wiener');
% for i = 1:9
%     CT_wiener_gauss = wiener2(CT_gaussian, [2*i+1, 2*i+1]);
%     subplot(3,3,i), imshow(CT_wiener_gauss); title(sprintf('%d * %d',2*i+1, 2*i+1), 'fontsize', 12);
% end
% 
% figure('name', 'S&P wiener');
% for i = 1:9
%     CT_wiener_snp = wiener2(CT_snp, [2*i+1, 2*i+1]);
%     subplot(3,3,i), imshow(CT_wiener_snp); title(sprintf('%d * %d',2*i+1, 2*i+1), 'fontsize', 12);
% end

%%
clear; clc;

img = im2double(imread('whatIsThis.png'));
figure, imshow(img);
gf = fspecial('gaussian', 15, sqrt(0.9));

% inverse filter는 필터를 가해준 방법을 반대로 적용(푸리에 변환 후 element-wise곱 -> element-wise 나눗셈) 

pad = zeros(512);
pad(1:15,1:15) = gf;

im_fft = fft2(img);
gf_fft = fft2(pad);

% gf_t(gf_t > threshold) = 1;

restore_t = im_fft ./ gf_fft;

inv_restore = ifft2(restore_t);

figure, imshow(inv_restore);

wiener_restore = wiener2(img, [15, 15], 0.0001);
figure, imshow(wiener_restore,[]);