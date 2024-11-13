/** Tester quelques cas limites.
  * @author	Xavier Crgut
  * @version	$Revision$
  */
public class CasLimitesTest {

	public void testOK() {
		// OK.
	}

	private void testMethodePrivee() {
		throw new RuntimeException("Une mthode prive n'est pas un test !");
	}

	protected void testMethodeProtegee() {
		throw new RuntimeException("Une mthode protected n'est pas un test !");
	}

	void testMethodePaquetage() {
		throw new RuntimeException("Une mthode de droit d'accs paquetage n'est pas un test !");
	}

	public static void testMethodeDeClasse() {
		throw new RuntimeException("Une mthode de classe n'est pas un test !");
	}

	public void testAvecParametre(int a) {
		throw new RuntimeException("Une mthode avec des paramtres n'est pas un test !");
	}

	public void testAvecParametre2(int a) {
		throw new RuntimeException("Une mthode avec des paramtres n'est pas un test !");
	}

}
