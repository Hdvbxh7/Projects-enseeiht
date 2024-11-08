% fonction estim_param_MC (pour exercice_1.m)

function parametres = estim_param_MC(d,x,y)
    yi=y-y(1,1)*vecteur_bernstein(x,d,0);
    ainf=zeros(size(x,1),d);
    for i=1:d
        colonnei = vecteur_bernstein(x,d,i);
        ainf(:,i)=colonnei;
    end
    ainf
    parametres =mldivide(ainf,yi);  
end
