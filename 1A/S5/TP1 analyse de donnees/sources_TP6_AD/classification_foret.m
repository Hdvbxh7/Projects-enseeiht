% fonction classification_foret (pour l'exercice 2)

function Y_pred = classification_foret(foret, X)
    n=length(foret);
    n2=length(X);
    Y_pred_ar=ones(n2,n);
    for i=1:n
        Y_pred_ar(:,i)=classification_arbre(foret{i},X);
    end
    Y_pred=mode(Y_pred_ar, 2);
end
