function [A_mn, nodes_mn, edges_mn, D] = get_merged_network(A, D, Thr)
% FUNCTION: Merge original graph by the maximum similarity
% INPUT: 
% A: adjacency matrix of original network
% norexpdata: gene express data
% Thr: threshold
% OUTPUT:
% A_mn: adjacency matrix of merged graph 
% nodes_mn: nodes is merged graph
% edges_mn: edges is merged graph

% if and only if mn1 and mn2 are co-expressed.
num_gen = length(A);

nodes_mn = cell(num_gen, 1);
for i = 1:num_gen
    nodes_mn{i} = i;
end
clear i

[row, col] = find(A);
edges_mn = [row, col];
clear row col
mvv = get_maxmvv(nodes_mn, edges_mn, D);

mvv(sum(mvv, 2)==0, :) = [];
while(1)    
%     length(D)
    [maxmvv, loc] = max(mvv(:,4));

    if maxmvv < Thr
        %if max merged value is less than threshold, break
        break;
    end
    [nodes_mn, edges_mn, mvv, D] = maxcombine(mvv(loc, :), nodes_mn, edges_mn, mvv, D);
end

% construct adjacency matrix
num_mn = length(nodes_mn);
A_mn = zeros(num_mn);

for i = 1:length(edges_mn)
    A_mn(edges_mn(i, 1), edges_mn(i, 2)) = 1;
end

end

