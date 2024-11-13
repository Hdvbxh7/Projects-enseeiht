/** L'exception DeviseInvalideException indique des devises incompatibles sur
 * des oprations entre monnaies.
 *
 * @author	Xavier Crgut
 * @version	$Revision: 1.1 $
 */
public class DeviseInvalideException extends Exception {

	public DeviseInvalideException(String message) {
		super(message);
	}

}
