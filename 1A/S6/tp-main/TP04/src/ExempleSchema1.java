import afficheur.Ecran;
import afficheur.AfficheurSVG;
/** Construire le schéma proposé dans le sujet de TP avec des points,
  * et des segments.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.7 $
  */
public class ExempleSchema1 {

	/** Construire le schéma et le manipuler.
	  * Le schéma est affiché.
	  * @param args les arguments de la ligne de commande
	  */
	public static void main(String[] args)
	{
	
		//créer l'écran
		Afficheurtexte a = new Afficheurtexte();
		Ecran e1 = new Ecran("Schema 1",600,400,20);
		AfficheurSVG e2 = new AfficheurSVG("Schema1", "translation d'un triangle'", 600, 400);
		// Créer les trois segments
		Point p1 = new Point(3, 2);
		Point p2 = new Point(6, 9);
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		Segment s23 = new Segment(p2, p3);
		Segment s31 = new Segment(p3, p1);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new Point(sx / 3, sy / 3);

		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		s12.afficher();		System.out.println();
		s23.afficher();		System.out.println();
		s31.afficher();		System.out.println();
		barycentre.afficher();	System.out.println();
		p1.dessiner(e1);
		p2.dessiner(e1);
		p3.dessiner(e1);
		s12.dessiner(e1);
		s23.dessiner(e1);
		s31.dessiner(e1);
		barycentre.dessiner(e1);
		p1.dessinerSVG(e2);
		p2.dessinerSVG(e2);
		p3.dessinerSVG(e2);
		s12.dessinerSVG(e2);
		s23.dessinerSVG(e2);
		s31.dessinerSVG(e2);
		barycentre.dessinerSVG(e2);
		e1.dessinerAxes();
		AfficherLigne(s12, p1, p2);
		AfficherLigne(s23, p2, p3);
		AfficherLigne(s31, p3, p1);	
		AfficherPoint(p1);
		AfficherPoint(p2);
		AfficherPoint(p3);
		s12.translater(4,-3);
		s23.translater(4,-3);
		s31.translater(4,-3);
		s12.afficher();		System.out.println();
		s23.afficher();		System.out.println();
		s31.afficher();		System.out.println();
		barycentre.afficher();	System.out.println();
		p1.dessiner(e1);
		p2.dessiner(e1);
		p3.dessiner(e1);
		s12.dessiner(e1);
		s23.dessiner(e1);
		s31.dessiner(e1);
		barycentre.dessiner(e1);
		p1.dessinerSVG(e2);
		p2.dessinerSVG(e2);
		p3.dessinerSVG(e2);
		s12.dessinerSVG(e2);
		s23.dessinerSVG(e2);
		s31.dessinerSVG(e2);
		barycentre.dessinerSVG(e2);	
		e2.ecrire("schéma1");
		AfficherLigne(s12, p1, p2);
		AfficherLigne(s23, p2, p3);
		AfficherLigne(s31, p3, p1);	
		AfficherPoint(p1);
		AfficherPoint(p2);
		AfficherPoint(p3);
		
	}

}
