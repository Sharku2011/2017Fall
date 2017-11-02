function sinogram = projection( image )
    
    img_size = size(image);
    rot_temp = zeros( img_size );
    sinogram = zeros( [360, img_size(2)] );
    
    % 1도씩 회전하면서 sinogram을 만드는 부분
    
    for i=0:359
        rot_temp = imrotate(image,i,'crop');
        sinogram(i+1,:) = sum(rot_temp, 1);
    end
end

