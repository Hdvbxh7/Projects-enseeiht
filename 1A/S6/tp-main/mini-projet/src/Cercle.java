import java.awt.Color;

/** Cercle modélise un cercle, c''est une courbe plane fermée constituée des points situés à égale distance d’un point
 * nommé centre. La valeur de cette distance est appelée rayon du cercle. On appelle diamètre la
 * distance entre deux points diamétralement opposés. La valeur du diamètre est donc le double de
 * la valeur du rayon.
 *
 * @author  Gutierrez Tom
 * @version 1
 */
public class Cercle  implements Mesurable2D {
	private Point centre;		// centre
	private double rayon;		//rayon
	private Color couleur;	// couleur du point
	public static final double PI=Math.PI;
	
	/** Translater le Cercle.
	* @param dx déplacement suivant l'axe des X
	* @param dy déplacement suivant l'axe des Y
	*/
	public void translater(double dx, double dy) {
		this.centre.translater(dx,dy);
	}

	/** Obtenir le centre du cercle
	 * @return point qui est le centre du cercle
	 */
	public Point getCentre() {
		Point p = new Point(this.centre.getX(),this.centre.getY());
		return p;
	}

	/** Obtenir le rayon du cercle
	 * @return rayon du cercle
	 */
	public double getRayon() {
		return this.rayon;
	}
	
	/** Diamétre du cercle
	 * @return diamétre du cercle
	 */
	public double getDiametre() {
		return 2*this.rayon;
	}

//Données Géométrique
	
	/** Cercle contient point 
	 * @param p point à tester
	 * @return Vrai si à l'intérieur faux sinon
	 */
	public boolean contient(Point p) {
		assert p!=null;
		return this.centre.distance(p)<=this.rayon;
	}
	
	/** perimetre du cercle
	 * @return perimetre du cercle
	 */
	public double perimetre() {
		return 2*this.PI*this.rayon;
	}
	
	/** aire du cercle
	 * @return aire du cercle
	 */
	public double aire() {
		return this.PI*Math.pow(this.rayon,2);
	}

//Couleur
	
	/** Obtenir la couleur du cercle.
	 * @return la couleur du cercle
	 */
	public Color getCouleur() {
		return this.couleur;
	}

	/** Changer la couleur du cercle.
	  * @param nouvelleCouleur nouvelle couleur
	  */
	public void setCouleur(Color nouvelleCouleur) {
		assert nouvelleCouleur!=null;
		this.couleur = nouvelleCouleur;
	}

//Constructeur
	
	/** Construire un Cercle à partir de son centre et de son rayon 
	 * @param c centre du cercle
	 * @param r rayon du cercle
	 */
	public Cercle(Point c, double r) {
		assert c!=null;
		assert r>0;
		this.centre = new Point(c.getX(),c.getY());
		this.rayon = r;
		this.couleur = Color.blue;
	}
	
	/** Construire un Cercle à partir de deux points diamétralement opposé
	 * @param ext1 éxtrémité 1 du cercle
	 * @param ext2 éxtrémité 2 du cercle
	 */
	public Cercle(Point ext1,Point ext2) {
		assert ext1!=null;
		assert ext2!=null;
		assert ext1.getX()!=ext2.getX() && ext1.getY()!=ext2.getY();
		this.centre = new Point((ext2.getX()+ext1.getX())/2,(ext2.getY()+ext1.getY())/2);
		this.rayon = ext1.distance(ext2)/2;
		this.couleur = Color.blue;
	}
	
	/** Construire un Cercle à partir de deux points diamétralement opposé e de sa couleur
	 * @param ext1 éxtrémité 1 du cercle
	 * @param ext2 éxtrémité 2 du cercle
	 * @param couleur couleur du cercle
	 */
	public Cercle(Point ext1,Point ext2,Color couleur) {
		assert ext1!=null;
		assert ext2!=null;
		assert ext1.getX()!=ext2.getX() && ext1.getY()!=ext2.getY();
		assert couleur!=null;
		this.centre = new Point((ext2.getX()+ext1.getX())/2,(ext2.getY()+ext1.getY())/2);
		this.rayon = ext1.distance(ext2)/2;
		this.couleur = couleur;
	}
	
	/** Construire un Cercle à partir de son centre et d'un point sur son extrémité
	 * @param c centre du cercle
	 * @param ext point à l'extremité du cercle
	 */
	public static Cercle creerCercle(Point c, Point ext) {
		assert c!=null;
		assert ext!=null;
		assert c.getX()!=ext.getX() && c.getY()!=ext.getY();
		return new Cercle(c,c.distance(ext));
	}
	
	
	/** Changer le rayon du cercle.
	  * @param r nouveau rayon
	  */
	public void setRayon(double r) {
		assert r>0;
		this.rayon = r;
	}

	/** Changer le diamétre du cercle.
	  * @param d nouveau diamétre
	  */
	public void setDiametre(double d) {
		assert d>0;
		this.rayon = d/2;
	}


	/** Afficher le point. */
	public String toString() {
		return "C"+this.rayon+"@"+"("+this.centre.getX()+", "+this.centre.getY()+")";
	}


}
