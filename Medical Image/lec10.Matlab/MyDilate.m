function result = MyDilate(image, se)
    
    % validateattributes(se, {'numeric'}, {'square'});

    size_se = size(se);
    size_image = size(image);
    
    %% 패딩 과정 - zero-padding
    % 한 픽셀이 주변에 확산되는 개념이기 떄문에 mirror padding을 하면 padding
    % 된 부분이 연산에 영향을 주지 않도록 zero padding을 해주어야 한다
    
    temp = zeros(size(image) + floor(size(se) / 2) * 2);
    temp( ...
        floor(size_se(1) / 2) + 1 : floor(size_se(1) / 2) + size_image(1),...
        floor(size_se(2) / 2) + 1 : floor(size_se(2) / 2) + size_image(2)...
        ) = image;

    %%
    
    [x, y] = find(temp == 1);
    
    for i=1:length(x)
        temp(x(i) - floor(size_se(1) / 2) : x(i) + floor(size_se(1) / 2),...
        y(i) - floor(size_se(2) / 2) : y(i) + floor(size_se(2) / 2)) = se;
    end
    
    result = temp(floor(size_se(1) / 2) + 1 : floor(size_se(1) / 2) + size_image(1),...
        floor(size_se(2) / 2) + 1 : floor(size_se(2) / 2) + size_image(2));
    
end