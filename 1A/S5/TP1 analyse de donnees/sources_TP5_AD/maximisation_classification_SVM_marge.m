% fonction maximisation_classification_SVM_marge (pour l'exercice 3)

function [pourcentage_meilleur_classification_SVM_test, lambda_opt_test, ...
          vecteur_pourcentages_bonnes_classifications_SVM_app, ...
          vecteur_pourcentages_bonnes_classifications_SVM_test] = ...
          maximisation_classification_SVM_marge(X_app,Y_app,X_test,Y_test,vecteur_lambda)
    n=length(vecteur_lambda);
    pourcentage_meilleur_classification_SVM_test=0;
    vecteur_pourcentages_bonnes_classifications_SVM_app=[];
    vecteur_pourcentages_bonnes_classifications_SVM_test=[];
    for i=1:n
        [X_VS_app,w_app,c_app,~] = estim_param_SVM_marge(X_app,Y_app,vecteur_lambda);
        X_pred_app = classification_SVM(X_app,w_app,c_app);
        [vecteur_pourcentages_bonnes_classifications_SVM_app(i,:),~,~] = qualite_classification(X_pred_app,X_VS_app)
    end
    for i=1:n
        [X_VS_test,w_test,c_test,~] = estim_param_SVM_marge(X_app,Y_app,vecteur_lambda);
        Y_pred = classification_SVM(X,w,c);                                                                                           
        [vecteur_pourcentages_bonnes_classifications_SVM_test(i,:),~,~] = qualite_classification(X_pred,X_VS)
    end
end