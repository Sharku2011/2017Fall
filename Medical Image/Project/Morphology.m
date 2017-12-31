clear; close all hidden; clc;

img = imread('hw5.1.bmp');
subplot(2,2,1), imshow(img);

SE1 = [1 0 1; 0 1 0; 1 0 1];
SE2 = [0 1 0; 1 1 1; 0 1 0];

a = imerode(img, SE1);

edge = img-a;


subplot(2,2,2), imshow(edge);

disk = strel('disk', 7).Neighborhood;

subplot(2,2,3), imshow(imclose(edge, disk));

% skeleton 을 통해서 원의 중심들을 잇는다. 이어주고 나면 skeleton이 이루는
% 다각형 안에 hole들이 위치하게 된다. 주변의 끊긴 선분들을 제거하기 위해
% shrink를 수행한다.
temp = bwmorph( bwmorph(img, 'skel', Inf), 'shrink', Inf) ;
% skeleton이 이루는 다각형을 채우기 위해서 disk의 반지름을 점점 키워가면서
% close를 수행한다.
temp = imclose(temp, strel('disk', 18).Neighborhood);
% 다각형 사이의 선분을 끊어주기 위해서 open을 수행한다.
temp = imopen(temp, disk);
% 각각의 다각형을 내부의 하나의 점으로 수렴시키기 위해서 shrink를 수행한다
temp = bwmorph(temp, 'shrink', Inf);

% 각 점을 기준으로 Region Filling을 수행한다.

current = imdilate(temp, SE2);

while any(current(:) ~= temp(:))
    temp = current;
    current = imdilate(temp, SE2) & ~img;
    subplot(2,2,4), imshow(current);
end

% Region Filling의 결과물과 Edge를 합쳐서 최종 결과물을 출력한다.
result = edge + current;

subplot(2,2,4), imshow( result );

