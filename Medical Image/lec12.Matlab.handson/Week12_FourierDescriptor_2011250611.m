close all hidden; clear; clc;

mat = ...
      [1 1 1 1 1 1 1;
       1 0 0 0 0 0 1;
       1 0 0 0 0 0 1;
       1 0 0 0 0 0 1;
       1 0 0 0 0 0 1;
       1 0 0 0 0 0 1;
       1 1 1 1 1 1 1];

%     [0 0 0 0 0 0 0;
%      0 0 0 1 0 0 0;
%      0 0 1 0 1 0 0;
%      0 1 0 0 0 1 0;
%      0 0 1 0 1 0 0;
%      0 0 0 1 0 0 0;
%      0 0 0 0 0 0 0];

   
[x,y] = find(mat==1);

pos = [x,y];

comp = complex(pos(:,1),pos(:,2));

ft = fft(comp);



figure;
for i=2:15
    ft1 = complex(zeros(size(ft)));
    ft1(1:i,:) = ft(1:i,:);
    ift = ifft(ft1);
    subplot(4,4,i-1), plot(ift,'o'), title(sprintf('%d coeffs', i));
end

figure; plot(ifft(ft),'o'); axis([1.5,6.5,1.5,6.5]);