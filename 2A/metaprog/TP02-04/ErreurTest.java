/** ErreurTest est un programme de test qui dfinit trois mthodes de test
  * dont une provoque une erreur.
  */
public class ErreurTest extends TestDefaut {
	
	public void tester1() {
	}

	public void tester2() {
		Assert.assertTrue(false);
	}

	public void tester3() {
		Assert.assertTrue(true);
	}

}