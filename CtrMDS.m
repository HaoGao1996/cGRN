function MDS = CtrMDS(A)
% FUNCTION: return the matching of associated bipartite networks
% Input: 
% A is the directed network, where aij: i->j
% Output: 
% MDS: minimum set of driver nodes

% Construct bipartite graph
A = A'; %aij: j->i
num = length(A);
B = zeros(2 * num);
A = full(A);

for i = 1:num
    for j = 1:num
        if A(i, j)
            % symmetric
            B(i, j+num) = 1;
            B(j+num, i) = 1;
        end
    end
end

B = sparse(B);
m0 = edmonds_maximum_cardinality_matching(B);
m = m0(1:num);
m(find(m==0)) = num;
m = m - num;

% Unmatched nodes are driver nodes
MDS = find(m==0); 

end