import java.awt.Color;
import afficheur.Ecran;
import afficheur.AfficheurSVG;

/** Un segment est défini pas ses deux points qui constituent ses
 * extrémités.  Un segment peut être affiché et translaté.
 *
 * @author	Xavier Crégut
 * @version	1.9
 */
 public Afficheurtexte{
 public AfficherLigne(Segment s, Point ext1, Point ext2){
 	System.out.println("Ligne {");
 	System.out.println("x1 =" + ext1.getX());
 	System.out.println("y1 =" + ext1.getY());
 	System.out.println("x2 =" + ext2.getX());
 	System.out.println("y2 =" + ext2.getY());
 	System.out.println("couleur =" + s.Color);
 	System.out.println("}");
 }
 public AfficherCercle(Point p,double rayon){
 	System.out.println("Cercle {");
 	System.out.println("x =" + p.getX());
 	System.out.println("y =" + p.getY());
 	System.out.println("rayon =" + rayon);
 	System.out.println("couleur =" + p.Color);
 	System.out.println("}");
 }
 public AfficherPoint(Point p){
 	System.out.println("Point {");
 	System.out.println("x =" + p.getX());
 	System.out.println("y =" + p.getY());
 	System.out.println("couleur =" + p.Color);
 	System.out.println("}");
 }
 public AfficherTexte(java.lang.String args, Point p,Color couleur){
 	System.out.println("Point {");
 	System.out.println("x =" + p.getX());
 	System.out.println("y =" + p.getY());
 	System.out.println("valeur =" + args);
 	System.out.println("couleur =" + couleur);
 	System.out.println("}");
 }
 }
