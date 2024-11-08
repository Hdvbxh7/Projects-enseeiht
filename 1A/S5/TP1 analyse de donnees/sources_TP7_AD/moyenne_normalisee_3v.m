% fonction moyenne_normalisee_3v (pour l'exercice 1bis)

function x = moyenne_normalisee_3v(I)
      % Conversion en flottants :
    I = single(I);
    centre=[size(I,1)/2,size(I,2)/2];
    ecart =[size(I,1)/12,size(I,2)/12];

    % Calcul des couleurs normalisees :
    somme_canaux = max(1,sum(I,3));
    r = I(:,:,1)./somme_canaux;
    v = I(:,:,2)./somme_canaux;
    r2 = I(centre(1)-ecart(1):centre(1)+ecart(1),centre(2)-ecart(2):centre(2)+ecart(2),1)./somme_canaux(centre(1)-ecart(1):centre(1)+ecart(1),centre(2)-ecart(2):centre(2)+ecart(2));
    r3 = r;
    r(centre(1)-ecart(1):centre(1)+ecart(1),centre(2)-ecart(2):centre(2)+ecart(2))=0;

    % Calcul des couleurs moyennes :
    r_barre = 0;
    v_barre = 1;
    b_barre = 2;
    x = [r_barre v_barre b_barre];


end
