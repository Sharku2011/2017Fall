function sinogram = projection( image )
    
    img_size = size(image);
    rot_temp = zeros( img_size );
    sinogram = zeros( [360, img_size(2)] );
    
    % 1���� ȸ���ϸ鼭 sinogram�� ����� �κ�
    
    for i=0:359
        rot_temp = imrotate(image,i,'crop');
        sinogram(i+1,:) = sum(rot_temp, 1);
    end
end

