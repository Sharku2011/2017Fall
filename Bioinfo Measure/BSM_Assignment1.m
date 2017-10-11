clear;clc;

W = [0.3; 3; 4; 15; 35; 80; 600; 1100];
V = [0.01; 0.3; 0.4; 2; 6; 7; 10; 100];
T = V/10;

S = [0 0; 0 0; 0 0];

% Y = AX + B
% 
% S=[A;B];
% 
% XS=Y

logW = log10(W);
logW(:,2) = 1;

% log V = b logW + log a
% log V -> Y, logW -> X, b = a', log a = b'
% Y = a'X + B
%
% A*S = Y
% S = (A'*A)\A'*Y

S(1,:) = ((logW'*logW)\logW'*log10(V))';
Sol1 = [10^S(1,2), S(1,1)];

MatW = W;
MatW(:,2) = 1;

S(2,:) = ((MatW'*MatW)\MatW'*V)';

Sol2 = S(2,:);

S(3,:) = ((logW'*logW)\logW'*log10(T))';

Sol3 = [10^S(3,2), S(3,1)];


X = W';

Y1 = Sol1(1)*(X.^Sol1(2));
Y2 = Sol2(1)*X + Sol2(2);
Y3 = Sol3(1)*(X.^Sol3(2));

subplot(2,2,1), plot(X,Y1);
subplot(2,2,2), plot(X,Y2);
subplot(2,2,3), plot(X,Y3);