function result = MyConv2(f,g)
    [row_f, col_f] = size(f);
    [row_g, col_g] = size(g);
    
    temp = zeros(row_f + 2*(row_g-1), col_f + 2*(col_g-1));
    temp(row_g:row_g+row_f-1,col_g:col_g+col_f-1) = f;
    
    for i1=1:row_f
        for i2=1:col_f
            
            target = [i1,i2];
            
            for i3=1:row_g
                for i4=1:col_g
                    
                    
                    
                end
            end
        end
    end

end