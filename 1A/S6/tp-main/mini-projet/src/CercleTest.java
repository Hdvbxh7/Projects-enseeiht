import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;


/**
  * L'objectif de cette classe est de vérifier les exigences E12,E13,E14
  *
  * @author	Tom Gutierrez
  * @version	v1
  */

public class CercleTest {
	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;
	
	// Les points du sujet
	private Point A, B, C, D, E,F;

	// Les cercles du sujet
	private Cercle C1, C2,C3,C4,C5,C6;

	@Before public void setUp() {
		// Construire les points
		A = new Point(1, 2);
		B = new Point(1, 4);
		C = new Point(1, 0);
		D = new Point(1, -1);
		E = new Point(-3, -1);
		F = new Point(-1,-1);
		// Construire les cercles
		C1 = new  Cercle(B,C);
		C2 = new  Cercle(C,B);
		C3 = new  Cercle(D,E);
		C4 = new  Cercle(E,D);
		C5 = new Cercle(C,B,Color.green);
		C6 = Cercle.creerCercle(B,C);
	}
	
	/** Vérifier si deux points ont mêmes coordonnées.
	  * @param p1 le premier point
	  * @param p2 le deuxième point
	  */
	static void memesCoordonnees(String message, Point p1, Point p2) {
		assertEquals(message + " (x)", p1.getX(), p2.getX(), EPSILON);
		assertEquals(message + " (y)", p1.getY(), p2.getY(), EPSILON);
	}
	
	//test E12
	@Test public void testerE12() {
		memesCoordonnees("E12 : Centre de C1 incorrect", A, C1.getCentre());
		assertEquals("E12 : Rayon de C1 incorrect",
				2, C1.getRayon(), EPSILON);
		memesCoordonnees("E12 : Centre de C2 incorrect",A , C2.getCentre());
		assertEquals("E12 : Rayon de C2 incorrect",
				2, C2.getRayon(), EPSILON);
		memesCoordonnees("E12 : Centre de C3 incorrect",F , C3.getCentre());
		assertEquals("E12 : Rayon de C3 incorrect",
				2, C3.getRayon(), EPSILON);
		memesCoordonnees("E12 : Centre de C4 incorrect",F , C4.getCentre());
		assertEquals("E12 : Rayon de C4 incorrect",
				2, C4.getRayon(), EPSILON);
		assertEquals(Color.blue, C1.getCouleur());
	}
	
	//test E13
	@Test public void testerE13() {
		memesCoordonnees("E13 : Centre de C5 incorrect", A, C5.getCentre());
		assertEquals("E13 : Rayon de C5 incorrect",
				2, C5.getRayon(), EPSILON);
		assertEquals(Color.green, C5.getCouleur());
	}
	
	//test E14
	@Test public void testerE14() {
		memesCoordonnees("E14 : Centre de C6 incorrect", B, C6.getCentre());
		assertEquals("E14 : Rayon de C6 incorrect",
				4, C6.getRayon(), EPSILON);
	}
	
}
