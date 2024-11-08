% function ACP (pour exercice_2.m)

function [C,bornes_C,coefficients_RVG2gris] = ACP(X)
    taille=size(X,2);
    XA=X-mean(X);
    Sigma=(1/taille)*transpose(XA)*XA;
    [W,D] = eig(Sigma);
    Vp=sort(diag(D),1,'descend');
    W1=W;
    for i=1:taille
        for j=1:taille
            if Vp(1,i)==D(j,j)
                W(:,i)=W1(:,j);
                W1
                W
            end
        end
    end

end
