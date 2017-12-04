function skel = imskel(img, kernel)
    skel = zeros(size(img));
    temp = img;
    
    while any(temp(:))
        o = imopen(temp, kernel);
        skel = skel | (temp & (~o));
        temp = imerode(temp, kernel);
    end
end