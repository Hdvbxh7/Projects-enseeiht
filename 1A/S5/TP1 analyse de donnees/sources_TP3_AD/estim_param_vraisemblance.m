% fonction estim_param_vraisemblance (pour l'exercice 1)

function [mu,Sigma] = estim_param_vraisemblance(X)
    mu=zeros(1,2);
    mu(1,1)=mean(X(:,1));
    mu(1,2)=mean(X(:,2));
    taille=size(X,1);
    X(:,1)=X(:,1)-mu(1,1);
    X(:,2)=X(:,2)-mu(1,2);
    Sigma=(1/taille)*X'*X;
end