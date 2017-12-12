clear; close all hidden; clc;

a = 1:480000;

pre1 = tic;
fft_a = fft(a);
pre1end = toc(pre1);

fft_a(240001:end) = 0;

post1 = tic;
ift_a = ifft(fft_a);
post1end = toc(post1);

pre2 = tic;
dct_a = dct(a);
pre2end = toc(pre2);

dct_a(240001:end) = 0;

post2 = tic;
ict_a = idct(dct_a);
post2end = toc(post2);

elap1 = post1end+pre1end;
elap2 = post2end+pre2end;

elap2/elap1

abs_a = cat(1,abs(ift_a),abs(ict_a));

names = {'FFT','DCT'};

figure;
for i=1:2
    subplot(1,2,i), plot(abs_a(i,:),'.'), title(names{i});
end

RMSE = sqrt(sum((abs_a-a).^2,2)/100);