clc
clear all; close all;

m = 100; 

%creates a square n x m matrix, as specifed above.
n = m; r = 10;
M = CreateMatrixLowRank(m, n, r);

%this gives the indeces in wrap around fashion. it looks like 1,2,3,4... or something like this
nonZeros = find(M ~= 0);

num = 5000;       % n = 100

% num = 15000;        % n = 200

% num = 40000;        % n = 500

%returns a vector of size num, sampled uniformly at random without replacement from nonZeros
Omega = randsample(nonZeros, num);

%returns the data that is in nonZeros but not in Omega
%thus, this gives the indeces which are in nonZeros but not in Omega 
TestSet = setdiff(nonZeros, Omega);

%saves the main set
Base = P_oper(M, Omega);
%saves the set to test against. 
Test = P_oper(M, TestSet);

%returns matimum singualr vale of Base
mu = norm(Base);

%makes my very small
mu = mu*1e-3;

% mu = mu*1e-4;

tau = 1;        % Lipchizt constant

ran = 0; r = 0; l = 5;

%threshold error stopage. 
tol = 1e-6;
X = Base; X_old = X; Y = X;
tic 

Iter = 10000;
for k=1:Iter
        

    Y = Y - (P_oper(Y, Omega) - Base);
     
     %SVD of Y. S is the diag matrix which entries are the singular values of Y.
    [U, S, V] = svd(Y);


    r = length(find(S > mu));
    ran(k) = r;

    %this is prox as outlined in the algorithm
    X = U*sinkage_sigma(S, mu)*V';
    

    %this is exactly the y^{(n)} calc as in the algorithm
    Y = X + (k - 1)/(k + 2)*(X - X_old);

    % n = norm(X,'fro'): Frobenius [norm sqrt(sum(diag(X'X))]
        
    stop1 = norm(X - X_old, 'fro')/max(norm(X, 'fro'), 1) < tol;

    %our error is good enought to stop
    if (stop1)
        break;
    end
    
    X_old = X;

end

toc

plot(1:k, ran(1:k))

m = 5; n = 8;
disp('Reference Matrix:');
M(1:m, 1:n)
disp('Completed Matrix:');
X(1:m, 1:n)
disp('Incomple Matrix:');
Base(1:m, 1:n) 

error_relative = norm(X - M, 'fro')/norm(M, 'fro')

error_test = norm(P_oper(X - M, TestSet), 'fro')/sqrt(length(TestSet))




