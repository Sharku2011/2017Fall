function g = movingaverage(f, n, K)
f = double(f);
[M, N] = size(f);

if(n<1) || (rem(n,1) ~=0)
     error('n must be an integer >= 1');
end

if K<0 || K>1
    error('K must be a fraction in the range [0,1].'); 
end

% 짝수번째 줄을 좌우 반전
f(2:2:end, :) = fliplr(f(2:2:end, :));

f = f';
% 열을 따라 1열로 쭉 나열한 것 전치.
%[1 2 3 4;5 6 7 8; 9 10 11 12] -> [1; 5; 9; 2; 6; 10; 3; 7; 11; 4; 8; 12]';
f = f(:)';

maf = ones(1,n)/n;  % 1D moving average filter
ma = filter(maf, 1, f);  % compute moving average

g = f> K*ma;
g = reshape(g, N, M)';
g(2:2:end, :) = fliplr(g(2:2:end, :));
