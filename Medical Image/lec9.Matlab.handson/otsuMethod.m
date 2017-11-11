function result = otsuMethod(image, method)
    
    pixels = numel(image);
    [cnt, bin] = imhist(image);
    [m, n] = size(cnt);
    p = cnt / pixels;
    
    if method == 1
        p1 = zeros([m,n]);
        m = zeros([m,n]);
        for i=1:m
            p1(i) = sum(p(1:i));
            m(i) = sum(i*p(1:i));
        end
        
        
    else
        
    end
    
    result = 0;
end