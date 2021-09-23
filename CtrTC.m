function TC = CtrTC(A, isTN)
% FUNCTION: Target control
% target control works bad than output control;
% According to the article proposed by Gao et al.
% 
% INPUT:
% A is the directed network,
% where aij represents that node i points to node j; !!!!!!!!!!!!!
% isTN: is target nodes
% Output:
% TC: the driver nodes of target control

A = full(A);
all_m = {};
all_TN = {};
TN = find(isTN);
all_TN = [all_TN; TN];
TC = [];

while(1)
    m = bMM_TC(A,TN);
    all_m = [all_m; m];
    
    TC = unique([TC; TN(m==0)]);
    TN = m(m~=0);
    
    if isempty(TN)
        break
    end
    all_TN = [all_TN; TN];
end
end