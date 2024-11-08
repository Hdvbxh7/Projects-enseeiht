% Fonction estim_param_Dyx_MC2 (exercice_2bis.m)

function [a_Dyx,b_Dyx,coeff_r2] = ...
                   estim_param_Dyx_MC2(x_donnees_bruitees,y_donnees_bruitees)
    x_G=mean(x_donnees_bruitees);
    variance_x=mean(x_donnees_bruitees.^2)-x_G^2;
    Y_G=mean(y_donnees_bruitees);
    variance_y=mean(y_donnees_bruitees.^2)-Y_G^2;
    covariance=mean(x_donnees_bruitees.*y_donnees_bruitees)-x_G*Y_G;
    r=covariance/sqrt(variance_x*variance_y);
    coeff_r2=r^2;
    a_Dyx=r*sqrt(variance_y/variance_x);
    b_Dyx=Y_G-a_Dyx*x_G;
end