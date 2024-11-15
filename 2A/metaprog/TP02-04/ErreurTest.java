/** ErreurTest est un programme de test qui dfinit trois mthodes de test
  * dont une provoque une erreur.
  */
public class ErreurTest extends TestElementaire {
	
	@UnTest
	public void tester1() {
	}

	@UnTest
	public void tester2() {
		Assert.assertTrue(false);
	}

	@UnTest
	public void tester3() {
		Assert.assertTrue(true);
	}

}
