import java.rmi.*;

public class CarnetImpl implements Carnet{
    String name;
    HashTable<String, SFiche> donnees = new HashTable<String,SFiche>();

    CarnetImpl(String name){
        this.name = name;
    }

	public void Ajouter(SFiche sf) throws RemoteException{
        donnees.put(sf.getNom(),sf);
    }

	public RFiche Consulter(String n, boolean forward) throws RemoteException{
        SFiche sf = donnees.get(n);
        if(sf!=null){
            return RFiche(sf.getNom(),sf.getEmail());
        } else {
            return null;
        }
    }

    public static void main(String args[]){
        try{
            CarnetImpl carnet = new CarnetImpl(args[0]);
            Naming.rebind("//localhost:4000/"+args[0]);
            System.out.println("carnet bound to registry");
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
