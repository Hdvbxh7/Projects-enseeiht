public aspect CompteObserver {

    // Define a Pointcut is
    // collection of JoinPoint call sayHello of class HelloAspectJDemo.
    pointcut callComptCourant(): call(void CompteCourant.*(..));
    pointcut callComptSimple(): call(void CompteSimple.*(..));

    before() : callComptCourant() {
    	thisJoinPoint.getSignature();
    }

    after() : callComptCourant()  {
        System.out.println("After comptecourant");
    }

    before() : callComptSimple() {
        System.out.println("Before CompteSimple");
    }

    after() : callComptSimple()  {
        System.out.println("After CompteSimple");
    }
    
}