/** Afficheur infixe, completement parenthese, d'une expression arithmetique.
  *
  * @author	Xavier Cregut
  * @version	$Revision$
  */
public class CalculHauteur implements VisiteurExpression<Integer> {

	public Integer visiterAccesVariable(AccesVariable v) {
		return 1 ;
	}

	public Integer visiterConstante(Constante c) {
		return 1 ;
	}

	public Integer visiterExpressionBinaire(ExpressionBinaire e) {
		return e.getOperateur().accepter(this)
			+ Math.max(e.getOperandeDroite().accepter(this),e.getOperandeGauche().accepter(this));
	}

	public Integer visiterAddition(Addition a) {
		return 1;
	}

	public Integer visiterSoustraction(Soustraction a) {
		return 1;
	}

	public Integer visiterMultiplication(Multiplication m) {
		return 1;
	}

	public Integer visiterExpressionUnaire(ExpressionUnaire e) {
		return e.getOperande().accepter(this) + e.getOperateur().accepter(this);
	}

	public Integer visiterNegation(Negation n) {
		return 1;
	}

}
