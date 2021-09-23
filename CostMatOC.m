function B = CostMatOC(A, isON)
% Function: construct weighed bipartite network 
% INPUT:
% A: the adjacency matrix 
% isON: is output nodes???
% OUTPUT:
% B: bipartite graph

A = A';
num = length(A);
B = zeros(num, num);

alpha = 2;
beta = 1;
sigma = 1+0.1/num;
episo = 0.1/num;

for i = 1:num
    for j = 1:num
        aij = A(i, j);
        if isON(i)
           if aij
               B(i, j) = alpha;
           end
        else
            if aij
                B(i, j) = beta;
            else
                if i==j
                    B(i, j) = beta;
                end
            end
        end
    end
end

wru = zeros(num, 1);
wru(isON==1) = sigma;
wru(isON==0) = episo;

Wru = diag(wru);
B = [B, Wru];

end