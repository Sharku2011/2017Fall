%
% Hands-on for 1d dct
% skeleton code by Kisung Lee

g = [8 9 2 3 7 6 5 2 3 1 3 0 3 3 3 8 9 1 2 3 8];

G = [+1 +1 +1 +1 +1 +1 +1 +1; ...
     +1 -1 +1 -1 +1 -1 +1 -1];


% length of input vector g
n = length(g);

% prepare output array T : use zeros()
T = zeros(1,n);

% prepare intermediate array r : use zeros()
r = zeros(1,n);

% get alpha(u) for u = 0 and u = 1,2,...,n-1 separately
alpha_0 = sqrt(1.0/n); % for u = 0
alpha_n = sqrt(2.0/n); % for u = 1,2,...,n-1

% for each value of u, calculate T

for u = 0:n-1,
    
    % put alpha value into alpha
    if u == 0, alpha = alpha_0;
    else alpha = sqrt(2.0/n);
    end

    % initialize T before accumulating the values through sigma operation
    T(u+1)= 0;
    
    % for each value of x, calculate r and accumulate the
    % value onto T
    for x = 0:n-1,
        r(x+1) = alpha * cos(pi * (2*x+1) * u / (2*n));
        T(u+1) = T(u+1) + r(x+1) * g(x+1);
    end
    
end

N = length(G);
t = zeros(2,8);
R = zeros(2,8);

ALPHA_0 = sqrt(1.0/N);

for U = 0:N-1
    
    if U == 0
        ALPHA = ALPHA_0;
    else
        ALPHA = sqrt(2.0/N);
    end
    
    t(:,U+1) = 0;
    
    for x=0:N-1
        for i=1:2
        R(i,x+1) = ALPHA * cos(pi*(2*x+1)*U/(2*N));
        t(i,U+1) = t(i,U+1)+R(i,x+1)*G(i,x+1);
        end
    end
    
end

fprintf('\ndct(g1) : '); T
fprintf('\ndct(g2) : '); t(1,:)
fprintf('\ndct(g3) : '); t(2,:)