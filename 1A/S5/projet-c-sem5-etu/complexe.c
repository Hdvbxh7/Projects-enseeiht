#include "complexe.h"
#include <math.h>           // Pour certaines fonctions trigo notamment

// Implantations de reelle et imaginaire
double reelle(complexe_t Nbr){
    return Nbr.Re;
}
double imaginaire(complexe_t Nbr){
    return Nbr.Im;
}

void set_reelle(complexe_t* Nbr, double Re){
    (*Nbr).Re = Re;
}

void set_imaginaire(complexe_t* Nbr, double Im){
    (*Nbr).Im = Im;
}

void init(complexe_t* Nbr,double Re, double Im){
    set_reelle(Nbr ,Re);
    set_imaginaire(Nbr ,Im);
}
// Implantation de copie
void copie(complexe_t* resultat, complexe_t autre){
    set_reelle(resultat ,autre.Re);
    set_imaginaire(resultat ,autre.Im);
}

// Implantations des fonctions algébriques sur les complexes
/** PROCÉDURE conjugue **/
void conjugue(complexe_t* resultat, complexe_t op){
    *resultat=op;
    (*resultat).Im =- op.Im;
}
/** PROCÉDURE ajouter **/
void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    (*resultat).Re = gauche.Re + droite.Re;
    (*resultat).Im = gauche.Im + droite.Im;
}

/** PROCÉDURE soustraire **/
void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    (*resultat).Re = gauche.Re - droite.Re;
    (*resultat).Im = gauche.Im - droite.Im;
}
/** PROCÉDURE multiplier **/
void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    (*resultat).Re = gauche.Re*droite.Re - gauche.Im*droite.Im;
    (*resultat).Im = gauche.Im*droite.Re + gauche.Re*droite.Im;
}
/** PROCÉDURE echelle **/
void echelle(complexe_t* resultat, complexe_t op, double facteur){
    (*resultat).Re = op.Re*facteur;
    (*resultat).Im = op.Im*facteur;
}
/** PROCÉDURE puissance **/
void puissance(complexe_t* resultat, complexe_t op, int exposant){
    init(resultat,1,0);
    for(int i=1;i<=exposant;i++){
        multiplier(resultat,op,*resultat);
        }
}
// Implantations du module et de l'argument
/** FONCTION module_carre **/
double module_carre(complexe_t op){
    complexe_t conj;
    conjugue(&conj,op);
    complexe_t produit;
    multiplier(&produit ,conj ,op);
    return produit.Im + produit.Re;
} 

/** FONCTION module **/
double module(complexe_t op){
    double resultat=module_carre(op);
    return sqrt(resultat);
}

/** FONCTION argument **/

double argument(complexe_t op){
    if (op.Im == 0){
        if (op.Re < 0) {
            return M_PI;
        }
        else {
            return 0;
        }
    }
    else{
        double modul;
        modul=module(op);
        return 2*atan((op.Im)/(op.Re+modul));
        }   
}
