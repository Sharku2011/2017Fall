function result = MyConv1(a,b)
% �� ���͸� �ϳ��� �������Ѽ� ���������� ��ĭ�� �Űܼ� �������� �κг��� 
% �����ִ� ��
% ���� ��ũ
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
    
% ���� ���������� if������ �б⸦ ����ϴ� ��� �� ���� length(b)-1��ŭ 0�� 
% �е��ؼ� ���� �������� �ʴ� �κ��� ���� 0�� �������� ���õǵ��� �����Ͽ���
    padding = zeros(1,len_a + 2*(len_b-1));
    padding(len_b:len) = fliplr(a);
    
    for i=1:len
        result(i) = dot(padding(len+1-i:len+len_b-i), b(:));
    end
    
    
end