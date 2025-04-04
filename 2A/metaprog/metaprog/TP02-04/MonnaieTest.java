/** Classe regroupant les tests unitaires de la classe Monnaie.  */
public class MonnaieTest extends TestDefaut{

	protected Monnaie m1;
	protected Monnaie m2;

	@Avant
	public void config() {
		this.m1 = new Monnaie(5, "euro");
		this.m2 = new Monnaie(7, "euro");
	}

	@UnTest
	public void testAjouter() throws DeviseInvalideException {
		m1.ajouter(m2);
		Assert.assertTrue(m1.getValeur() == 12);
	}
	
	@UnTest
	public void testRetrancher() throws DeviseInvalideException {
		m1.retrancher(m2);
		Assert.assertTrue(m1.getValeur() == -2);
	}

}
