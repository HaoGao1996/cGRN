function OC = CtrOC(A, isON)
% FUNCTION: Out put control
% According to the article proposed by Wu et al.
% 
% INPUT:
% A:  is the directed network, where aij represents that node j
% points to node i; (!!!!!!!!!!!!!!!!Note that A can be a sparse matrix)
% isON: is output nodes???
% Output:
% OC: the driver nodes of output control

A = full(A);
B = constructCostMat_tc(A, isON);

[col4row,row4col,gain,u,v]=assign2D(B, true);

m = row4col(length(row4col)/2+1:end);
m(m==0) = [];
OC = m;


end