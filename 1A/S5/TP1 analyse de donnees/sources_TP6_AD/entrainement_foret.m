% fonction entrainement_foret (pour l'exercice 2)

function foret = entrainement_foret(X,Y,nb_arbres,proportion_individus)
        n=length(Y);
        foret=cell(nb_arbres);
        for i=1:nb_arbres
            tirages=randperm(n,n*proportion_individus);
            foret{i}=fitctree(X(tirages,:),Y(tirages),"NumVariablesToSample",round(sqrt(size(X,2))));
        end
end
