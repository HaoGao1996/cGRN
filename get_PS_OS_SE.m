function [isPS, isOS, isSE] = get_PS_OS_SE(nodes_mn, isDrugTarget, isCancerGenes, isSideEffect)
% INPUT:
% nodes_mn: node list
% isDrugTarget
% isCancerSpecificGene
% isSideEffect
% OUTPUT:
% isPS: is preferential set
% isOS: is output set
% isSE: is side effect gene

num_node = length(nodes_mn);
isPS = zeros(num_node, 1);
isOS = zeros(num_node, 1);
isSE = zeros(num_node, 1);

for i = 1:num_node
    node_i = nodes_mn{i};
    
    % if all genes are drug target, the node is drug target
    if all(isDrugTarget(node_i))
        isPS(i) = 1;
    end
    
    % if any gene is cancer gene, the node is cancer gene
    if any(isCancerGenes(node_i))
        isOS(i) = 1;
    end
    
    % if any gene is side effect gene, the node is cancer gene
    if any(isSideEffect(node_i))
        isSE(i) = 1;
    end
    
end

end