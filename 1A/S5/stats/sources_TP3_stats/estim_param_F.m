% Fonction estim_param_F (exercice_1.m)

function [rho_F,theta_F,ecart_moyen] = estim_param_F(rho,theta)
    n=length(rho);
    B=[cos(theta) sin(theta)];
    X=B\rho;
    rho_F=sqrt(X(1)^2+X(2)^2);
    theta_F=atan2(X(2),X(1));
    ecart_moyen=(1/n)*sum(B*X-rho);
end