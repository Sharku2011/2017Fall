function filtered = apply_filter( sinogram, filter )
    
    size_sino = size(sinogram);
    filtered = zeros(size_sino);
    
    for i=1:size_sino(1,1)
        fft_sino = fftshift(fft(sinogram(i,:)));
        filtered(i,:) = fft_sino .* filter;
        filtered(i,:) = ifft(ifftshift(filtered(i,:)));
    end
    filtered = real(filtered);
end