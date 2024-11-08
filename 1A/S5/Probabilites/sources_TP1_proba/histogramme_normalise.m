% Fonction histogramme_normalise (exercice_2.m)

function [vecteur_Imin_a_Imax,vecteurs_frequences] = histogramme_normalise(I)
    Imin=min(min(I));
    Imax=max(max(I));
    vecteur_Imin_a_Imax=[Imin:Imax];
    vecteurs_frequences=histcounts(I,[Imin:Imax+1]);
end