function M = CreateMatrixLowRank(m, n, r)


% A
% |
% |
% |
% r specifies the rank of the matrix
% m,n are both the dimension of the incomming matrix size


% n = 100;
% r = 6;      % rank of the matrix

% Mm = round(4*rand(m, r)) + 1;        % matrix with elements from 1 -> 5
% Mn = round(4*rand(n, r)) + 1; 

%randn calls a radom scalr drawn from the standard normal distrubution of numbers
%the specification of the ordered pair returns the matrix with that dimention
%In reference to APG_Berekely, Mn, is a m by 10 and Mn is n by 10
% |
% |
% |
% V

Mm = round(randn(m, r));        % matrix with elements from 1 -> 5
Mn = round(randn(n, r)); 


% Mm_missing = randsample(m*r, round(m*r*0.6));
% Mm(Mm_missing) = 0;                 % make the matrix sparse
% 
% Mn_missing = randsample(n*r, round(n*r*0.6));
% Mn(Mn_missing) = 0;                 % make the matrix sparse

%transpose of Mn is taken so that the matrix multiplication works out.
M = Mm*Mn';

% Mref = round(4*rand(m, n)) + 1; 
% M(M > 0) = Mref(M > 0);
