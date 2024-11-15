import java.lang.reflect.*;
import java.util.*;

/** L'objectif est de faire un lanceur simple sans utiliser toutes les clases
  * de notre architecture JUnit.   Il permet juste de valider la comprhension
  * de l'introspection en Java.
  */
public class LanceurIndependant {
	private int nbTestsLances;
	private int nbErreurs;
	private int nbEchecs;
	private List<Throwable> erreurs = new ArrayList<>();

	public LanceurIndependant(String... nomsClasses) {
	    System.out.println();

		// Lancer les tests pour chaque classe
		for (String nom : nomsClasses) {
			try {
				System.out.print(nom + " : ");
				this.testerUneClasse(nom);
				System.out.println();
			} catch (ClassNotFoundException e) {
				System.out.println(" Classe inconnue !");
			} catch (Exception e) {
				System.out.println(" Problme : " + e);
				e.printStackTrace();
			}
		}

		// Afficher les erreurs
		for (Throwable e : erreurs) {
			System.out.println();
			e.printStackTrace();
		}

		// Afficher un bilan
		System.out.println();
		System.out.printf("%d tests lances dont %d echecs et %d erreurs.\n",
				nbTestsLances, nbEchecs, nbErreurs);
	}


	public int getNbTests() {
		return this.nbTestsLances;
	}


	public int getNbErreurs() {
		return this.nbErreurs;
	}


	public int getNbEchecs() {
		return this.nbEchecs;
	}


	private void testerUneClasse(String nomClasse)
		throws ClassNotFoundException, InstantiationException,
						  IllegalAccessException
	{
		// Rcuprer la classe
		Class<?> classe = Class.forName(nomClasse);

		/*
		// Rcuprer les mthodes "preparer" et "nettoyer"
		Method preparer = this.getPreparer(classe);
		Method nettoyer = this.getNettoyer(classe);
		*/

		//Liste des tests à éxécuter
		ArrayList<Method> Tests = new ArrayList<Method>();
		ArrayList<Method> Avants = new ArrayList<Method>();
		ArrayList<Method> Apres = new ArrayList<Method>();

		try{
			// Instancier l'objet qui sera le rcepteur des tests
			Object objet = classe.getConstructor().newInstance();

			// Excuter les mthods de test
			Method[] Methods = classe.getMethods();

			//tri des methodes
			for(Method m: Methods){
				if(m.isAnnotationPresent(Avant.class)){
					Avants.add(m);
				} else if(m.isAnnotationPresent(UnTest.class)){
					UnTest t = m.getAnnotation(UnTest.class);
					if(t.enabled() == true){
						Tests.add(m);
					} 
				} else if(m.isAnnotationPresent(Apres.class)){
					Apres.add(m);
				}
			}

			//Tests
			for(Method t: Tests){
				Invocation(Avants,objet);
				try {
					this.nbTestsLances+=1;
					t.invoke(objet);
					Invocation(Apres,objet);
				} catch	(InvocationTargetException e) {
					if(e.getCause() instanceof Echec){
						this.nbEchecs+=1;
						System.out.println(t.getName() + " : " + e.getCause().getMessage());
					} else {
						this.nbErreurs+=1;
						System.out.println(t.getName() + " : " + e.getCause().getMessage());
					}
				} catch (Exception e) {
					System.out.println(t.getName() + " " + e);
				}
			}

		} catch (Exception e){
			System.out.println(e);
		}

	}

	private void Invocation(ArrayList<Method> a,Object o){
		for(Method p: a){
			try {
				p.invoke(o);
			} catch (Exception e) {
				System.out.println(p.getName() + " " + e);
			}
		}

	}

	/*
	private Method getPreparer(Class<?> class1){
		try{
			return class1.getMethod("preparer");
		} catch(NoSuchMethodException e) {
			return null;
		}
	}

	private Method getNettoyer(Class<?> class1){
		try{
			return class1.getMethod("nettoyer");
		} catch(NoSuchMethodException e) {
			return null;
		}
	}
	*/


	public static void main(String... args) {
		LanceurIndependant lanceur = new LanceurIndependant(args);
	}

}
