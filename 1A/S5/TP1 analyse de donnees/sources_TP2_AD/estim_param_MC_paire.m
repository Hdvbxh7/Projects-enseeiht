% fonction estim_param_MC_paire (pour exercice_2.m)

function parametres = estim_param_MC_paire(d,x,y_inf,y_sup)
    y_infj=y_inf-y_inf(1,1)*vecteur_bernstein(x,d,0);
    y_supj=y_sup-y_sup(1,1)*vecteur_bernstein(x,d,0);
    ainf=zeros(size(x,1),d);
    for i=1:d
        colonnei = vecteur_bernstein(x,d,i);
        ainf(:,i)=colonnei;
    end
    asup=ainf;
    parametres =zeros(size(x,1),2)
    parametres(:,1) =mldivide(ainf,y_supj);
    parametres(:,1) =mldivide(ainf,y_infj);  
end
