function result = MyDilate(image, se)
    
    % validateattributes(se, {'numeric'}, {'square'});

    size_se = size(se);
    size_image = size(image);
    
    %% �е� ���� - zero-padding
    % �� �ȼ��� �ֺ��� Ȯ��Ǵ� �����̱� ������ mirror padding�� �ϸ� padding
    % �� �κ��� ���꿡 ������ ���� �ʵ��� zero padding�� ���־�� �Ѵ�
    
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