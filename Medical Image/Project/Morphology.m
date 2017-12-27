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

% skeleton �� ���ؼ� ���� �߽ɵ��� �մ´�. �̾��ְ� ���� skeleton�� �̷��
% �ٰ��� �ȿ� hole���� ��ġ�ϰ� �ȴ�. �ֺ��� ���� ���е��� �����ϱ� ����
% shrink�� �����Ѵ�.
temp = bwmorph( bwmorph(img, 'skel', Inf), 'shrink', Inf) ;
% skeleton�� �̷�� �ٰ����� ä��� ���ؼ� disk�� �������� ���� Ű�����鼭
% close�� �����Ѵ�.
temp = imclose(temp, strel('disk', 18).Neighborhood);
% �ٰ��� ������ ������ �����ֱ� ���ؼ� open�� �����Ѵ�.
temp = imopen(temp, disk);
% ������ �ٰ����� ������ �ϳ��� ������ ���Ž�Ű�� ���ؼ� shrink�� �����Ѵ�
temp = bwmorph(temp, 'shrink', Inf);

% �� ���� �������� Region Filling�� �����Ѵ�.

current = imdilate(temp, SE2);

while any(current(:) ~= temp(:))
    temp = current;
    current = imdilate(temp, SE2) & ~img;
    subplot(2,2,4), imshow(current);
end

% Region Filling�� ������� Edge�� ���ļ� ���� ������� ����Ѵ�.
result = edge + current;

subplot(2,2,4), imshow( result );

