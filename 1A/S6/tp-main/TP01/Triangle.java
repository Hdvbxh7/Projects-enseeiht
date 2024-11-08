import java.awt.Color;

/** Calcul du triangle et son barycentre
 *
 * @author	Gutierrez Tom
 */
 
 public class Triangle {
 	private Segment s12;
 	private Segment s23;
 	private Segment s31;
 	private Point Bary;
 	
 	/** construire un triangle à partir de ces 3 sommets
 	*@param p1 premier sommet
 	*@param p2 second sommet
 	*@param p3 troisiéme sommet
 	*/
 	public Triangle(Point pt1,Point pt2,Point pt3){
 		this.s12=new Segment(pt1,pt2);
 		this.s23=new Segment(pt2,pt3);
 		this.s31=new Segment(pt3,pt1);
 		this.Bary=new Point((pt1.getX()+pt2.getX()+pt3.getX())/3,(pt1.getY()+pt2.getY()+pt3.getY())/3);
 	}
 	
	/** construire un triangle à partir de ces 3 sommets
 	*@param s12 premier cotes
 	*@param s23 second cotes
 	*@param s31 troisiéme cotes
 	*@param Bary Barycentre
 	*/
 	public void afficher(){
 		this.s12.afficher();
 		this.s23.afficher();
 		this.s31.afficher();
 		this.Bary.afficher();
 	}
}

