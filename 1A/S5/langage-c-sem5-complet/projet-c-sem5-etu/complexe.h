#ifndef COMPLEX_H
#define COMPLEX_H

struct complexe_t{
    double reelle;
    double imaginaire;
}
typedef struct complexe_t complexe_t;
// Fonctions reelle et imaginaire
/**
 * reelle
 * Renvoi la partie réelle d'un nombre complexe
 *
 * Paramètres :
 *   complexe    [in] nombre complexe
 *
 * Retour: un double qui est la partie reele du complexe
 * Pré-conditions : NUll
 * Post-conditions : *resultat = complexe_t.reelle
 */
double reelle(complexe_t* complexe);
/**
 * imaginaire
 * Renvoi la partie imaginaire d'un nombre complexe
 *
 * Paramètres :
 *   complexe    [in] nombre complexe
 *
 * Retour: un double qui est la partie imaginaire du complexe
 * Pré-conditions : NUll
 * Post-conditions : *resultat = complexe_t.imaginaire
 */
double imaginaire(complexe_t* complexe);

// Procédures set_reelle, set_imaginaire et init
/**
 * set_reelle
 * Modifie la partie réelle du nombre complexe donné avec le nombre réel donné
 *
 * Paramètres :
 *   complexe       [in out] Complexe dont on change la partie reelle
 *   reelle          [in]  nouvelle valeur de la partie reelle
 *
 * Pré-conditions : complexe est de type t_complexe
 * Post-conditions : complexe.reelle=reelle
 */
void set_reelle(complexe_t* complexe, double reelle);

/**
 * set_imaginaire
 * Modifie la partie imaginaire du nombre complexe donné avec le nombre imaginaire donné
 *
 * Paramètres :
 *   complexe       [in out] Complexe dont on change la partie imaginaire
 *   imaginaire          [in]  nouvelle valeur de la partie imaginaire
 *
 * Pré-conditions : complexe est de type t_complexe
 * Post-conditions : complexe.imaginaire=imaginaire
 */
void set_imaginaire(complexe_t* complexe, double imaginaire);
/**
 * init
 * Modifie la partie reelle et la partie imaginaire du nombre complexe donné avec le nombre reelle et le nombre imaginaire donnés
 *
 * Paramètres :
 *   complexe       [in out] Complexe dont on change la partie imaginaire
 *   imaginaire     [in]  nouvelle valeur de la partie imaginaire
 *   reelle          [in]  nouvelle valeur de la partie reelle
 *
 * Pré-conditions : complexe est de type t_complexe
 * Post-conditions : complexe.imaginaire=imaginaire
 *                   complexe.reelle=reelle
 */
void init(complexe_t* complexe, double imaginaire, double reelle);

// Procédure copie
/**
 * copie
 * Copie les composantes du complexe donné en second argument dans celles du premier
 * argument
 *
 * Paramètres :
 *   resultat       [out] Complexe dans lequel copier les composantes
 *   autre          [in]  Complexe à copier
 *
 * Pré-conditions : resultat non null
 * Post-conditions : resultat et autre ont les mêmes composantes
 */
void copie(complexe_t* resultat, complexe_t autre);

// Algèbre des nombres complexes
/**
 * conjugue
 * Calcule le conjugué du nombre complexe op et le stocke dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe dont on veut le conjugué
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : reelle(*resultat) = reelle(op), complexe(*resultat) = - complexe(op)
 */
void conjugue(complexe_t* resultat, complexe_t op);

/**
 * ajouter
 * Réalise l'addition des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche + droite
 */
void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * soustraire
 * Réalise la soustraction des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche - droite
 */
void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * multiplier
 * Réalise le produit des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche * droite
 */
void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * echelle
 * Calcule la mise à l'échelle d'un nombre complexe avec le nombre réel donné (multiplication
 * de op par le facteur réel facteur).
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe à mettre à l'échelle
 *   facteur        [in]  Nombre réel à multiplier
 *     

    Implanter la procédure copie spécifiée dans complexe.h, qui modifie le nombre complexe donné de f
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = op * facteur
 */
void echelle(complexe_t* resultat, complexe_t op, double facteur);

/**
 * puissance
 * Calcule la puissance entière du complexe donné et stocke le résultat dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe dont on veut la puissance
 *   exposant       [in]  Exposant de la puissance
 *
 * Pré-conditions : resultat non-null, exposant >= 0
 * Post-conditions : *resultat = op * op * ... * op
 *                                 { n fois }
 */
void puissance(complexe_t* resultat, complexe_t op, int exposant);

// Module et argument
/**
 * module_carre
 *
 * CONTRAT À COMPLETER
 */
/** FONCTION À DÉCLARER **/

/**
 * module
 *
 * CONTRAT À COMPLETER
 */
/** FONCTION À DÉCLARER **/

/**
 * argument
 *
 * CONTRAT À COMPLETER
 */
/** FONCTION À DÉCLARER **/


#endif // COMPLEXE_H



