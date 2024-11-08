#include "complexe.h"
#include <math.h>           // Pour certaines fonctions trigo notamment

// Implantations de reelle et imaginaire
int reelle(complexe_t* complexe){
    return (*complexe).reelle;
}
int imaginaire(complexe_t* complexe){
    return (*complexe).imaginaire;
}

// Implantations de set_reelle et set_imaginaire
void set_reelle(complexe_t* complexe, int reelle){
    (*complexe).reele=reelle;
}
void set_imaginaire(complexe_t* complexe, int imaginaire){
    (*complexe).imaginaire=imaginaire;
}
void init(complexe_t* complexe, int imaginaire, int reelle){
    set_imaginaire(complexe, imaginaire);
    set_reelle(complexe, reelle);
}

// Implantation de copie
void copie(complexe_t* resultat, complexe_t autre){
    (*resultat).reelle=autre.reelle;
    (*resultat).imaginaire=autre.imaginaire;
}

// Implantations des fonctions algébriques sur les complexes
void conjugue(complexe_t* resultat, complexe_t op){
    (*resultat).reelle = op.reelle;
    (*resultat).imaginaire = - op.imaginaire;
}
void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    (*resultat).reelle = gauche.reelle+droite.reelle;
    (*resultat).imaginaire = gauche.imaginaire+droite.imaginaire;
}
void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    (*resultat).reelle = gauche.reelle-droite.reelle;
    (*resultat).imaginaire = gauche.imaginaire-droite.imaginaire;
}
void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    (*resultat).reelle = gauche.reelle*droite.reelle-gauche.imag
/** PROCÉDURE puissance À IMPLANTER **/
    (*resultat).imaginaire = - op.imaginaire*facteur;
}
void puissance(complexe_t* resultat, complexe_t op, int exposant){

}

// Implantations du module et de l'argument
/** FONCTION module_carre À IMPLANTER **/
/** FONCTION module À IMPLANTER **/
/** FONCTION argument À IMPLANTER **/


