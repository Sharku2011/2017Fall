%% 이미지 축소

clear; close all hidden; clc;

img = im2double(imread('hw1.1.bmp'));

met1 = img(1:4:end,1:4:end);

met2 = zeros(size(img) / 4);

[x, y] = size(met2);

for i=1:x
    for j=1:y
       met2(i,j) = mean(mean(img(4*(i-1)+1:4*i, 4*(j-1)+1:4*j)));
    end
end

figure('name', '원본 영상');
imshow(img);

figure('name', '축소 영상');
subplot(1,2,1), imshow(met1), title('point sampling');
subplot(1,2,2), imshow(met2), title('calculate mean');


%% 이미지 복원

% nearest neighbor method

[r,c] = size(img);
res1 = zeros([r,c]);

m = floor([r,c] ./ [x,y]);
mx = m(1); my = m(2);

tic;
for i=1:x
    for j=1:y
        res1(m(1)*(i-1)+1:m(1)*i, m(2)*(j-1)+1:m(2)*j) = met2(i,j);
    end
end
toc;
% bilinear method

res2 = zeros([r,c]);
% padding for out of boundary
temp = zeros(x+1,y+1);
temp(1:x,1:y) = met2;

tic;
for i=1:x
    for j=1:y
        res2(mx*(i-1)+1:mx*i, my*(j-1)+1:my*j) = ...
            temp(i,j)*[1:-1/(mx-1):0]'*[1:-1/(my-1):0] + ...
            temp(i,j+1)*[1:-1/(mx-1):0]'*[0:1/(my-1):1] + ...
            temp(i+1,j)*[0:1/(mx-1):1]'*[1:-1/(my-1):0] + ...
            temp(i+1,j+1)*[0:1/(mx-1):1]'*[0:1/(my-1):1];
    end
end
toc;

figure('name', '복원 영상');
subplot(1,2,1), imshow(res1), title('nearest neighbor');
subplot(1,2,2), imshow(res2), title('bilinear');