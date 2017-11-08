%% Restoration of noise added image

 clear;clc;
 
 CT = imread('CT.jpg');
 
 Comp = ones(size(CT)) / 2.0;
 
 CT_double = im2double(CT);
 Min = min(min(CT_double));
 Max = max(max(CT_double - Min));
 CT_double = CT_double / Max;
 
 CT_gaussian = imnoise(CT_double, 'gaussian');
 CT_snp = imnoise(CT_double, 'salt & pepper');
 Comp_gaussian = imnoise(Comp, 'gaussian');
 Comp_snp = imnoise(Comp, 'salt & pepper');
 
 
 Noise = { CT, CT_gaussian, CT_snp ;Comp, Comp_gaussian, Comp_snp };
 Name = {'CT', 'CT/Gaussian', 'CT/Salt & Pepper', '0.5', '0.5/Gaussian', '0.5, Salt & Pepper'};
 
 h = figure;
 for i=1:2
     for j=1:3
         subplot(2,3, (i-1)*3+j ), imhist(Noise{i,j}), title(Name{1,(i-1)*3+j});
 %         a.BinLimits = [-1.1, 1.1];
     end
 end
 
 filter_mean = ones([3,3])/9.0;
 
 CT_gaussian_mean = conv2(CT_gaussian, filter_mean);
 CT_gaussian_med = medfilt2(CT_gaussian);
 
 CT_snp_mean = conv2(CT_snp, filter_mean);
 CT_snp_med = medfilt2(CT_snp);
 
 figure;
 subplot(2,2,1), imshow(CT_gaussian_mean); title('gaussian / mean', 'fontsize', 12);
 subplot(2,2,2), imshow(CT_snp_mean); title('salt & pepper / mean', 'fontsize', 12);
 subplot(2,2,3), imshow(CT_gaussian_med); title('gaussian / median', 'fontsize', 12);
 subplot(2,2,4), imshow(CT_snp_med); title('salt & pepper / median', 'fontsize', 12);
 
 
 CT_wiener_snp = wiener2(CT_snp,[19, 19]);
 figure('name', 'gaussian wiener');
 for i = 1:9
     CT_wiener_gauss = wiener2(CT_gaussian, [2*i+1, 2*i+1]);
     subplot(3,3,i), imshow(CT_wiener_gauss); title(sprintf('%d * %d',2*i+1, 2*i+1), 'fontsize', 12);
 end
 
 figure('name', 'S&P wiener');
 for i = 1:9
     CT_wiener_snp = wiener2(CT_snp, [2*i+1, 2*i+1]);
     subplot(3,3,i), imshow(CT_wiener_snp); title(sprintf('%d * %d',2*i+1, 2*i+1), 'fontsize', 12);
 end

%% Restoration of degraded image.

clear; clc;

img = im2double(imread('whatIsThis.png'));
figure, imshow(img);

gf = fspecial('gaussian', 15, sqrt(0.9));
% bf = lbutter(img, 25, 2);

pad = zeros(512);
pad(1:15,1:15) = gf;

im_fft = fft2(img);
gf_fft = fft2(pad);

restore_t = fftshift(im_fft) ./ gf_fft;

inv_restore = ifft2(ifftshift(restore_t));

% 필터에 fftshift를 가해주면 짝수번째 픽셀 부호 변경 필요
% 
% inverter = zeros(512);
% for y=1:512
%     for x=1:512
%         inverter(x,y) = (-1)^(x+y);
%     end
% end
% 
% inv_restore = inv_restore .* inverter;

temp = (inv_restore - min(min(inv_restore)));
inv_norm = temp / max(max(temp));

figure, imshow(inv_norm);

wiener_restore = wiener2(img, [15, 15], 0.0001);

temp = (wiener_restore - min(min(wiener_restore)));
wiener_norm = temp / max(max(temp));

figure, imshow(wiener_norm);

diff1 = inv_norm - img;
diff2 = wiener_norm - img;

figure;
subplot(1,2,1), imshow(diff1,[]), title('Inverse filter');
subplot(1,2,2), imshow(diff2,[]), title('Wiener filter');

figure;
subplot(2,2,1), imhist(img), title('given image');
subplot(2,2,3), imhist(inv_norm), title('inverse filtering');
subplot(2,2,4), imhist(wiener_norm), title('wiener filtering');

