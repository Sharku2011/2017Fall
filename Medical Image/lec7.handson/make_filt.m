function filt = make_filt( filt_type )
    filt = ones([1, 256]);
    X = -128:127;
    % 필터 생성
    if filt_type == 1
        filt(1,:) = abs(X)/128;
    elseif filt_type == 2
        filt(1,:) = 0.5*(1-cos(2*pi*X/128));
    else
        
    end

end