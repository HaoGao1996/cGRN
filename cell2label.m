function iscell = cell2label(cell)
% FUNCTION: GET THE LABEL OF EACH NODE,
% THE NUMBER REPRESENTS THE NUMBER OF cell
% ZERO REPRESENTS THE NODE DOES NOT BELONG TO cell
% INPUT:
% cell: cell matrix
% num: the max num in cell
% OUTPUT:
% iscell: label

allcell = [];
for i = 1:length(cell)
    cell_i = cell{i};
    
    allcell = [allcell; [cell_i, i * ones(length(cell_i),1)]];
end

[~, loc] = sort(allcell(:, 1), 'ascend');
iscell = allcell(loc, 2);

end