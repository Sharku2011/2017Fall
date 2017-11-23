function result = MyRegionFilling(img, pos, kernel)

    last = zeros(size(img));
    last(pos(1), pos(2)) = 1;

    current = imdilate(last, kernel) & (~img);

    while any(current(:) ~= last(:))
        last = current;
        current = imdilate(last, kernel) & ~img;
%         imshow(current);
    end

    result = current;
end