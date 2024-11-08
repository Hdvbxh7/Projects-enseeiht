% fonction modelisation_vraisemblance (pour l'exercice 1)

function modele_V = modelisation_vraisemblance(X,mu,Sigma)
    modele_V=[]
    for i=1:size(X,1)
        modele_V(i,:)=exp((-1/2)*(X(i,:)-mu)*inv(Sigma)*(X(i,:)-mu)')/((2*pi)*sqrt(det(Sigma)));
    end
end