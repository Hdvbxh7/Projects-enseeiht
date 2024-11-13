import java.util.HashMap;
/** Afficheur infixe, completement parenthese, d'une expression arithmetique.
  *
  * @author	Xavier Cregut
  * @version	$Revision$
  */

public class EvaluateurExpression implements VisiteurExpression<Integer> {

	protected HashMap<String, Integer> environnement;
	RuntimeException UnknownOperand = new RuntimeException("OPération inconnue");

	public EvaluateurExpression (HashMap<String, Integer> env){
		this.environnement=env;
	}
	public Integer visiterAccesVariable(AccesVariable v) {
		Integer val;
		if((val=environnement.get(v.getNom()))!=null){
			return val;
		}else{
			throw new RuntimeException("variable inexistante");
		}
	}

	public Integer visiterConstante(Constante c) {
		return c.getValeur() ;
	}

	public Integer visiterExpressionBinaire(ExpressionBinaire e) {
		switch (e.getOperateur().accepter(this)) {
			case 1:
				return e.getOperandeGauche().accepter(this) + e.getOperandeDroite().accepter(this);
			case 2:
				return e.getOperandeGauche().accepter(this) - e.getOperandeDroite().accepter(this);
			case 3:
				return e.getOperandeGauche().accepter(this) * e.getOperandeDroite().accepter(this);
			default:
				throw UnknownOperand;
		}
	}

	public Integer visiterAddition(Addition a) {
		return 1;
	}

	public Integer visiterSoustraction(Soustraction a) {
		return 2;
	}

	public Integer visiterMultiplication(Multiplication m) {
		return 3;
	}

	public Integer visiterExpressionUnaire(ExpressionUnaire e) {
		switch (e.getOperateur().accepter(this)) {
			case 1:
				return - e.getOperande().accepter(this); 
			default:
				throw UnknownOperand;
		}
	}

	public Integer visiterNegation(Negation n) {
		return 1;
	}

}
