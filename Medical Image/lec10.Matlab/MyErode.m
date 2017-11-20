function result = MyErode(image, se)

    size_se = size(se);
    size_image = size(image);

    %% 패딩 과정 - one padding 혹은 mirror padding
    
%     temp = ones(size(image) + floor(size(se) / 2) * 2);
%     temp( ...
%         floor(size_se(1) / 2) + 1 : floor(size_se(1) / 2) + size_image(1),...
%         floor(size_se(2) / 2) + 1 : floor(size_se(2) / 2) + size_image(2)...
%         ) = image;
%     
    temp = image;
    
    for i=1:floor(size_se(1) / 2)
        temp = padding(temp, 'row');
    end
    for j=1:floor(size_se(2) / 2)
        temp = padding(temp, 'column');
    end
    
%     assignin('base', 'test', temp2);
    
    %%
    
    result = zeros(size(image));
    
    for i=floor(size_se(1) / 2) + 1 : floor(size_se(1) / 2) + size_image(1)
        for j=floor(size_se(2) / 2) + 1 : floor(size_se(2) / 2) + size_image(2)
            
            kernel = temp(i-floor(size_se(1)/2):i+floor(size_se(1)/2),j-floor(size_se(2)/2):j+floor(size_se(2)/2));
            se_temp = se / sum(sum(se));
            
            result(i - floor(size_se(1) / 2), j - floor(size_se(2) / 2)) = floor(sum(dot(kernel, se_temp)));
        end
    end

    
end

