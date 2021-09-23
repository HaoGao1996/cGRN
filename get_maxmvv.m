function [mvv] = get_maxmvv(nodes_mn, edges_mn, D)
% FUNCTION: get maximum maerged network value vector
% INPUT:
% nodes_mn: nodes is merged network
% edges_mn: edges is merged network
% D: distance matrix
% OUTPUT:
% mvv: maximum maerged network value vector

num_node = length(nodes_mn);
mvv = zeros(num_node, 4);
for i = 1:num_node
    fni = edges_mn(edges_mn(:, 2)==i, 1); % father nodes of ith node    
    for j = 1:length(fni)
        fnicj = edges_mn(edges_mn(:, 1)==fni(j), 2); % child nodes of jth father node;
        fnicj(fnicj==i) = [];  
        [val, loc] = max(D(fnicj, i));
        if mvv(i,4) < val
            mvv(i, 1) = i; % target node
            mvv(i, 2) = fni(j); % shared father node
            mvv(i, 3) = fnicj(loc); % maximum PCC child node
            mvv(i, 4) = val; % val
        end
    end   
end

end