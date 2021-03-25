function [sur_res] = KRG_ifolds(X,Y,kfolds)
% KRG----------------------------------------------------------------------
op1 = {'dace_regpoly0','dace_regpoly1','dace_regpoly2'};
op2 = {'dace_corrcubic','dace_correxp','dace_corrgauss','dace_corrlin',...
    'dace_corrspherical','dace_corrspline'};
theta = size(X,2);

IdxFolds = srgtsGetKfolds(X, kfolds, 'ClusterBal');

for j = 1:3
    for i = 1:6
        
        krg_res(i,j) = srgtsKRGSetOptions(X, Y , @dace_fit,...
            str2func(strcat('@',op1{j})) , ...
            str2func(strcat('@',op2{i})), 0.1*ones(1,theta), 1e-6*ones(1,theta),...
            100*ones(1,theta));
        [PRESSRMS_KRG_F(i,j)] = srgtsCrossValidation(krg_res(i,j),kfolds, IdxFolds);
        
    end
end

[best_op2_res, best_op1_res] = find(PRESSRMS_KRG_F==min(PRESSRMS_KRG_F(:)));
sur_res = srgtsKRGFit(krg_res(best_op2_res,best_op1_res));
end