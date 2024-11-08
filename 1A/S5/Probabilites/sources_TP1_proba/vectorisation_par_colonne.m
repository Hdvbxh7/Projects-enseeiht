% Fonction vectorisation_par_colonne (exercice_1.m)

function [Vg,Vd] = vectorisation_par_colonne(I)
    M=I(1:end,2:end);
    N=I(1:end,1:end-1);
    Vd=N(:);
    Vg=M(:);
end