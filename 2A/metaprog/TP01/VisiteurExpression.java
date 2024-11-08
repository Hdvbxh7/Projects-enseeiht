/**
  * Visiteur sur une expression arithmetique.
  *
  * @author	Xavier Cregut
  * @version	$Revision$
  */
public interface VisiteurExpression<R> {

	/** Visiter un acces e une variable.
	  * @param v l'acces e une variable e visiter
	  */
	R visiterAccesVariable(AccesVariable v);

	/** Visiter une constante.
	  * @param c la constante e visiter
	  */
	R visiterConstante(Constante c);

	/** Visiter une expression binaire.
	  * @param e l'expression binaire e visiter
	  */
	R visiterExpressionBinaire(ExpressionBinaire e);

	/** Visiter l'operateur binaire addition.
	  * @param a l'operateur e visiter
	  */
	R visiterAddition(Addition a);

	/** Visiter l'operateur binaire soustraction.
	  * @param a l'operateur e visiter
	  */
	  R visiterSoustraction(Soustraction a);

	/** Visiter l'operateur binaire multiplication.
	  * @param m l'operateur e visiter
	  */
	R visiterMultiplication(Multiplication m);

	/** Visiter une expression unaire.
	  * @param v l'expression unaire e visiter
	  */
	R visiterExpressionUnaire(ExpressionUnaire e);

	/** Visiter un operateur unaire negation.
	  * @param n l'operateur unaire e visiter
	  */
	R visiterNegation(Negation n);

}
