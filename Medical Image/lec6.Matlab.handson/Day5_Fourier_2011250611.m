clear; clc;

%% 1. Prepare Input Image

imm = imread('skull.jpg');
imm_d = im2double(imm);

whos('imm');

im = imresize(imm, [226, 187]);

%% 2. Prepare LPF

lpf = fspecial('gaussian', 5, 2.0);

lpfr = imresize(lpf, [100, 100]);

figure, surf(lpfr);

%% 3. Get Fourier spectrums.

% imz : zero-padded image(im)
% lpfz : zero-padded gaussian filter(lpf)

imz = uint8(zeros([256, 256]));
lpfz = zeros(256,256);

imz(1:226, 1:187) = im;
lpfz(1:5,1:5) = lpf;

tic;
IMZ = fft2(imz);
LPFZ = fft2(lpfz);
toc;

IMZ_SC = [IMZ(129:256, 129:256), IMZ(129:256, 1:128);
          IMZ(1:128, 129:256), IMZ(1:128, 1:128)];
          
LPFZ_SC = [LPFZ(129:256, 129:256), LPFZ(129:256, 1:128);
          LPFZ(1:128,129:256), LPFZ(1:128, 1:128)];

% IMZ_SC = fftshift(IMZ);
% LPFZ_SC = fftshift(LPFZ);
      
figure;
subplot(2,1,1), surf(abs(IMZ_SC));
subplot(2,1,2), surf(abs(LPFZ_SC));

%% Perform frequency domain filtering by Convolution Theorem

IML = IMZ.*LPFZ;

iml_f = ifft2(IML);

inverter = ones(256,256);

for y=1:256
    for x=1:256
        inverter(x,y) = (-1)^(x+y);
    end
end

% for i=1:numel(inverter)
%     inverter(i) = (-1)^(i);
% end

iml_fr = iml_f .* inverter;

whos('iml_fr');

iml_fr2 = real(iml_fr);
iml_fr3 = iml_fr2(1:226, 1:187);
temp = iml_fr3 + abs(min(min(iml_fr3)));
iml_fr4 = im2uint8(temp/max(max(temp)));

tic;
iml_conv = conv2(im, lpf);
toc;

figure;
subplot(2,2,1), imshow(imm), title('original', 'fontsize', 14);
subplot(2,2,2), imshow(iml_fr3), title('fr3', 'fontsize', 14);
subplot(2,2,3), imshow(iml_fr4), title('fr4', 'fontsize', 14);
subplot(2,2,4), imshow(iml_conv,[]), title('conv', 'fontsize', 14);