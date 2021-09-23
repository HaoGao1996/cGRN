function m = bMM_TC(A,TN)
% FUNCTION: return the matching of associated bipartite networks
% Input: 
% A is the directed network,
% where aij represents that node i points to node j; !!!!!!!!!!!!!
% TN: Target Node
% Output: 
% m: maxmum matching

% Construct bipartite graph
num = length(A);
num_TN = length(TN);
B = zeros(num+num_TN);
A = full(A);

for i = 1:num
    for j = 1:num_TN
        if A(i, TN(j)) %i->j
            % symmetric
            B(i, j+num) = 1;
            B(j+num, i) = 1;
        end
    end
end

B = sparse(B);
m0 = edmonds_maximum_cardinality_matching(B);
m = m0(num+1:num+num_TN); % the maximum mathcing in B


end