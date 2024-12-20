import java.rmi.*;

public class RFicheImpl implements RFiche {
    private String email;
    private String name;

    RFicheImpl(String Name, String Email){
        this.name = Name;
        this.email =Email;
    }

	public String getNom () throws RemoteException{
        return this.name;
    }
	public String getEmail () throws RemoteException{
        return this.email;
    }
}
