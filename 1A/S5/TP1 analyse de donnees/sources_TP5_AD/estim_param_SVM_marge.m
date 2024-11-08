% fonction estim_param_SVM_marge (pour l'exercice 3)

function [X_VS,w,c,code_retour] = estim_param_SVM_marge(X,Y,lambda)
    taille=length(X);
    f=ones(taille,1);
    H=(Y*Y').*(X*X');
    [alpha,~,code_retour]=quadprog(H,-f,[],[],Y',0,zeros(1,taille),ones(1,taille)*lambda);
    w=(alpha.*Y).*X;
    
    thr = 1e-6;
    idx_VS = alpha>thr;

    filter = repmat(idx_VS,1,size(X,2));
    w = sum(reshape(w(filter),sum(idx_VS),2));
    
    X_VS = reshape(X(filter),sum(idx_VS),2);
    Yi = Y(idx_VS);
    c = X_VS(1,:)*w' - Yi(1,:);
end