function recon = backprojection( sinogram )
    
    size_sino = size(sinogram);

    rotating_temp = zeros( size_sino );
    
    recon = zeros( size_sino );
    
    for i = 1:size_sino(1,1)
        for j = 1:size_sino(1,1)
            rotating_temp(j,:) = sinogram(i,:);
        end
        recon = recon + imrotate(rotating_temp, 361 - i, 'crop');        
    end
end