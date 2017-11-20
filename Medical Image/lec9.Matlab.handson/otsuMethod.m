function result = otsuMethod(image)
    
    cnt = imhist(image,256);

    CNT = cumsum(cnt);
    pixels = CNT(end,1);

    p = [cnt, pixels - cnt] / pixels;
    omega = [CNT, pixels - CNT] / pixels;

    mu = (1:256)' .* p(:,1);

    mu_total = mu(end,1);

    var = omega(:,1) .* omega(:,2) .* ((mu - (mu_total - mu)).^2);

    thres = find(var == max(var));

    result = (thres-1) / 255;
end