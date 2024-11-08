% Fonction parametres_correlation (exercice_1.m)

function [r,a,b] = parametres_correlation(Vd,Vg)
    Int_1=ones(1,size(Vg,1));
    %calcul sur vg
    Vg_moy=(Int_1*Vg)/size(Vg,1);
    Int_2_Vg=Vg-ones(size(Vg,1),1)*Vg_moy;    
    Int_3_Vg=reshape(Int_2_Vg,1,size(Vg,1))*Int_2_Vg;
    V_Vg=Int_3_Vg/size(Vg,1);
    E_t_Vg=sqrt(V_Vg);
    %calcul sur vd
    Vd_moy=(Int_1*Vd)/size(Vd,1);
    Int_2_Vd=Vd-ones(size(Vd,1),1)*Vd_moy;
    Int_3_Vd=reshape(Int_2_Vd,1,size(Vd,1))*Int_2_Vd;
    V_Vd=Int_3_Vd/size(Vd,1);
    E_t_Vd=sqrt(V_Vd);
    %covariance
    cov=reshape(Int_2_Vd,1,size(Vd,1))*Int_2_Vg/size(Vd,1);
    r=cov/(E_t_Vd*E_t_Vg);
    a=cov/(E_t_Vd*E_t_Vd);
    b=-a*Vd_moy+Vg_moy;
end