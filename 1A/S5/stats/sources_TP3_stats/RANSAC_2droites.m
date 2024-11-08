% Fonction RANSAC_2droites (exercice_2.m)

function [rho_F_estime,theta_F_estime] = RANSAC_2droites(rho,theta,parametres)

    % Parametres de l'algorithme RANSAC :
    S_ecart = parametres(1); % seuil pour l'ecart
    S_prop = parametres(2); % seuil pour la proportion
    k_max = parametres(3); % nombre d'iterations
    n_donnees = length(rho);
    ecart_moyen_min = Inf;
    for i=1:k_max
        t=randperm(n_donnees,2);
        rho_pt=[rho(t(1)) rho(t(2))];
        theta_pt=[theta(t(1)) theta(t(2))];
        [rho_F,theta_F,~] = estim_param_F(rho_pt',theta_pt');
        conforme=abs(rho-rho_F*cos(theta-theta_F))<=S_ecart;
        if mean(conforme)>S_prop 
            [rho_F2,theta_F2,ecart_moyen] = estim_param_F(rho(conforme),theta(conforme));
            if ecart_moyen_min>ecart_moyen
                ecart_moyen_min=ecart_moyen;
                rho_F_estime=rho_F2;
                theta_F_estime=theta_F2;
            end
        end
    end
end