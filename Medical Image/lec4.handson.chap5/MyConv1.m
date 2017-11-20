function result = MyConv1(a,b)
% 두 벡터를 하나를 반전시켜서 끝에서부터 한칸씩 옮겨서 겹쳐지는 부분끼리 
% 곱해주는 것
% 참고 링크
% http://www.rfwireless-world.com/source-code/MATLAB/convolution-matlab-code.html
% http://toto-share.com/2011/11/cc-convolution-source-code/
%
% [1 2 3 4 5] conv [1/2 1/3 1/4 1/5]
%
% [5   4   3   2   1]
%                [1/4 1/4 1/4 1/4]
% a(1)*b(1)
%
% [5   4   3   2   1]
%            [1/4 1/4 1/4 1/4]
% a(2)*b(1) + a(1)*b(2)
%
% [5   4   3   2   1]
%        [1/4 1/4 1/4 1/4]
% a(3)*b(1) + a(2)*b(2) + a(1)*b(3)
%
% [5   4   3   2   1]
%    [1/4 1/4 1/4 1/4]
% a(4)*b(1) + a(3)*b(2) + a(2)*b(3) + a(1)*b(4)
%
%  [5   4   3   2   1]
% [1/4 1/4 1/4 1/4]
% a(5)*b(1) + a(4)*b(2) + a(3)*b(3) + a(2)*b(4) + a(1)*b(4)
%
%      [5   4   3   2   1]
% [1/4 1/4 1/4 1/4]
% a(5)*b(2) + a(4)*b(3) + a(3)*b(4)
%
%          [5   4   3   2   1]
% [1/4 1/4 1/4 1/4]
% a(5)*b(3) + a(5)*b(2)
%
%              [5   4   3   2   1]
% [1/4 1/4 1/4 1/4]
% a(5)*b(4)

validateattributes(a, {'numeric'}, {'row'});
validateattributes(b, {'numeric'}, {'row'});

    len_a = length(a); len_b = length(b);
    len = len_a+len_b-1;
    result = zeros(1,len);
    
% 실제 구현에서는 if문으로 분기를 사용하는 대신 양 옆에 length(b)-1만큼 0을 
% 패딩해서 서로 겹쳐지지 않는 부분의 곱은 0이 곱해져서 무시되도록 구현하였음
    padding = zeros(1,len_a + 2*(len_b-1));
    padding(len_b:len) = fliplr(a);
    
    for i=1:len
        result(i) = dot(padding(len+1-i:len+len_b-i), b(:));
    end
    
    
end