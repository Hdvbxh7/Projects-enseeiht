#ifndef COMPLEX_H
#define COMPLEX_H

// Type utilisateur complexe_t
struct complexe_t {
    double Re;
    double Im;
};

typedef struct complexe_t complexe_t;


// Fonctions reelle et imaginaire
/**
* reelle
* Cette procedure permet de fixer la valeur de la partie reelle d'un nombre complexe.
*
* Paramètres :
*  Nbr       [in out]    complexe_t le nombre complexe à modifier
*  Re        [in]        double     la valeur de la partie reelle que l'on veut fixer
*
* Retour : null
*
* Pré-conditions : 
*   - Nbr existe
*
* Post-conditions :
*   - Nbr.Re = Re
* 
*/
double reelle(complexe_t Nbr);

/**
* imaginaire
* Cette procedure permet de fixer la valeur de la partie imaginaire d'un nombre complexe.
*
* Paramètres :
*  Nbr       [in out]    complexe_t le nombre complexe à modifier
*  Im        [in]        double     la valeur de la partie imaginaire que l'on veut fixer
*
* Retour : null
*
* Pré-conditions : 
*   - Nbr existe
*
* Post-conditions :
*   - Nbr.Im = Im
* 
*/
double imaginaire(complexe_t Nbr);

/**
* set_reelle
* Cette procedure permet de modifier la valeur de la partie réelle d'un nombre complexe.
*
* Paramètres :
*  Nbr       [in out]    complexe_t le nombre complexe à modifier
*  Re        [in]        double     la valeur de la partie réelle que l'on veut fixer
*
* Retour : null
*
* Pré-conditions : 
*   - Nbr existe
*
* Post-conditions :
*   - Nbr.Re = Re
* 
*/
void set_reelle(complexe_t* Nbr, double Re);

/**
* set_imaginaire
* Cette procedure permet de fixer la valeur de la partie imaginaire d'un nombre complexe.
*
* Paramètres :
*  Nbr       [in out]    complexe_t le nombre complexe à modifier
*  Im        [in]        double     la valeur de la partie imaginaire que l'on veut fixer
*
* Retour : null
*
* Pré-conditions : 
*   - Nbr existe
*
* Post-conditions :
*   - Nbr.Im = Im
* 
*/
void set_imaginaire(complexe_t* Nbr, double Im);

 /**
* init
* Cette procedure permet de fixer la valeur de la partie imaginaire et de la partie réelle d'un nombre 
* complexe.
*
* Paramètres :
*  Nbr       [in out]     complexe_t le nombre complexe à modifier
*  Re        [in]         la valeur de la partie réelle que l'on veut fixer
*  Im        [in]         la valeur de la partie imaginaire que l'on veut fixer
*
* Retour : null
*
* Pré-conditions : 
*   - Nbr existe
*
* Post-conditions :
*   - Nbr.Re = Re
*   - Nbr.Im = Im
*/
void init(complexe_t* Nbr,double Re, double Im);
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
 * Calcule le conjugué du nombre complexe op et le sotocke dans resultat.
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
* Cette procedure calcule le module carré d'un nombre complexe.
*
* Paramètres :
*  resultat   [out]    double     Ont y stocke le module carré du complexe
*  op         [in]     complexe_t Le nombre complexe dont on veut calculer le module carré
*
* Pré-conditions : 
*   - resultat non-null 
*   - op non-null
*
* Post-conditions :
*   - resultat= op.Im^2+op.Re^2
*
*/
double module_carre(complexe_t op);

/**
* module
* Cette procedure calcule le module d'un nombre complexe.
*
* Paramètres :
*  resultat   [out]    double     Ont y stocke le module du complexe
*  op         [in]     complexe_t Le nombre complexe dont on veut calculer le module 
*
* Pré-conditions : 
*   - resultat non-null 
*   - op non-null
*
* Post-conditions :
*   - resultat= racine(op.Im^2+op.Re^2)
*
*/
double module(complexe_t op);

/**
* argument
* Cette procedure calcule l'argument d'un nombre complexe (il renvoie une valeur compris entre [0 et 2pi].
*
* Paramètres :
*  resultat   [out]    double     Ont y stocke l'argument du complexe
*  op         [in]     complexe_t Le nombre complexe dont on veut calculer l'argument 
*
* Pré-conditions : 
*   - resultat non-null 
*   - op =/= 0 +i*0
*   - op non-null
*
* Post-conditions :𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊𓅊
*   - resultat = arg(op)
*   - 0 <= resultat < 2pi
*
*/
double argument(complexe_t op);

#endif // COMPLEXE_H



