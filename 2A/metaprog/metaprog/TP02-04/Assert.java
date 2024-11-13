/** La classe Assert dfinit des mthodes de vrification.  Pour l'instant, la
 * seule mthode de vrification est assertTrue mais d'autres pourraient tre
 * dfinies (voir JUnit).
 *
 * @author	Xavier Crgut
 * @version	$Revision: 1.1 $
 */
abstract public class Assert {

	/** Vrifier que la condition est vraie.
	 * @param condition la condition  vrifier
	 */
	static public void assertTrue(boolean condition) {
		if (! condition) {
			throw new Echec();
		}
	}

}
