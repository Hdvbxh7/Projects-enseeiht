% fonction calcul_bon_partitionnement (pour l'exercice 1)

function meilleur_pourcentage_partitionnement = calcul_bon_partitionnement(Y_pred,Y)
       v=perms([1,2,3]);
       n=length(Y_pred);
       n2=length(v);
       Y_pred2=[];
       meilleur_pourcentage_partitionnement=0;
       for j=1:n2
            for i=1:n
                switch Y_pred(i,1)
                    case 1 
                        Y_pred2(i,1)=v(j,1);
                    case 2 
                        Y_pred2(i,1)=v(j,2);
                    case 3
                        Y_pred2(i,1)=v(j,3);            
                end        
            end
            if meilleur_pourcentage_partitionnement<=(sum(Y_pred2==Y)*100)/n
                meilleur_pourcentage_partitionnement=(sum(Y_pred2==Y)*100)/n;
            end
       end
end