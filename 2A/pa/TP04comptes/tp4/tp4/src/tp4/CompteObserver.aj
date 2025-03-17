package tp4;
public class CompteObserver{
	
	// Define a Pointcut is
    // collection of JoinPoint call sayHello of class HelloAspectJDemo.
    pointcut callCompteCourant(): call(void CompteCourant.crediter(double));
	
	 before() : callSayHello() {
	        System.out.println("Before call sayHello");
	    }

	 after() : callSayHello()  {
	        System.out.println("After call sayHello");
	   }
	
}