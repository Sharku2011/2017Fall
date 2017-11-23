close all hidden; clear; clc;

pre_lung = imread('lung.jpg');

sq = ones(3);

lung = zeros(size(pre_lung));

lung(pre_lung >= 128) = 1;
lung(pre_lung < 128) = 0;

Morph = cell(1,2);

Morph{1,1} = imdilate(lung, sq);
Morph{1,2} = imerode(lung, sq);

figure('name', 'dilate & erode');
subplot(2,2,1), imshow(lung), title('original');
subplot(2,2,3), imshow(Morph{1,1}), title('dilate');
subplot(2,2,4), imshow(Morph{1,2}), title('erode');

temp1 = MyDilate(lung, sq);
temp2 = MyErode(lung, sq);

figure('name', 'dilate');
subplot(1,2,1), imshow(Morph{1,1}), title('built-in');
subplot(1,2,2), imshow(temp1), title('My dilate');

figure('name', 'erode');
subplot(1,2,1), imshow(Morph{1,2}), title('built-in');
subplot(1,2,2), imshow(temp2), title('My erode');

diff1 = Morph{1,1} - temp1;
diff2 = Morph{1,2} - temp2;

if sum(sum(diff1))
    fprintf('dilate 차이가 있음\n');
else
    fprintf('차이 없음\n');
end

if sum(sum(diff2))
    fprintf('erode 차이가 있음\n');
else
    fprintf('차이 없음\n');
end

morph_grad = Morph{1,1} & (~Morph{1,2});

figure, imshow(morph_grad);