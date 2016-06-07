function sig = sinkage_sigma(sigma, tk)

% ^
% |
% |
% |
% tk is the step constant as specified in the algorithm. 


[n1, n2] = size(sigma);
sig = zeros(n1, n2);

% sigma(sigma < 0.5) = 0;

%calculates the number of non-zero entries in sigma. 
%i.e. in thecase where sigma is a diag matrix whos entries are the singular values, 
%n is just the number of non-zero singular values 

	n = length(find(sigma > 0));


%NOTE: this section is calculating the shrinkage of sigma. Refer to example in slideshow,
%that is it is proximal mapping:
%---------------------------------------------------
for i=1:n
    if sigma(i, i) >= tk
        sig(i, i) = sigma(i, i) - tk;
          %sig(i, i) = 1;
        
    elseif sigma(i, i) <= -tk
        sig(i, i) = sigma(i, i) + tk;
    else
        sig(i, i) = 0;
    end
end
%--------------------------------------------------
