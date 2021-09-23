function D = get_distance(norexpdata)
% FUCNTION: get distance through PCC
% INPUT:
% norexpdata: gene express data
% OUTPUT:
% D: distance matrix

num_node = size(norexpdata, 1);
D = zeros(num_node);
for i = 1:num_node
    expi = norexpdata(i, :);
    if ~min(sum(expi, 2))
        continue;
    end
    for j = i:num_node
        expj = norexpdata(j, :);
        if ~min(sum(expj, 2))
            continue;
        end
        
        x = abs(corrcoef(expi, expj));
        D(i, j) = x(1, 2);
        D(j, i) = x(1, 2);
             
    end
end

end