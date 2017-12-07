clear; clc;

mat = inf(6);

mat(2:5,3) = 0; mat(3,4) = 0; mat(5,2:5) = 0;

PAD = inf(8);
PAD(2:7,2:7) = mat;

while any(any(isinf(mat)))
    for i=2:7
        for j=2:7
            mat(i-1,j-1) = min( [PAD(i,j), PAD(i+1,j)+1, PAD(i,j+1)+1, PAD(i-1,j)+1, PAD(i,j-1)+1] );
        end
    end

    PAD(2:7,2:7) = mat;
end

imshow(mat,[]);