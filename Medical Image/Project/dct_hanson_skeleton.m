%
% Hands-on for 1d dct
% skeleton code by Kisung Lee

g = [8 9 2 3 7 6 5 2 3 1 3 0 3 3 3 8 9 1 2 3 8];

% length of input vector g
n = length(g);

% prepare output array T : use zeros()
T = zeros(1,n)

% prepare intermediate array r : use zeros()
r = zeros(1,n)

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
    T(u+1)= 
    
    % for each value of x, calculate r and accumulate the
    % value onto T
    for x = 0:n-1,
        r(x+1) = % FILL HERE
        T(u+1) = % FILL HERE
    end
    
end

