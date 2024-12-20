import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
import java.util.Hashtable;


public class CarnetImpl extends UnicastRemoteObject implements Carnet{
    String name;
    Hashtable<String, RFiche> donnees;

    public CarnetImpl(String name)throws RemoteException{
        this.name = name;
    }

	public void Ajouter(SFiche sf) throws RemoteException{
        donnees.put(sf.getNom(),new RFicheImpl(sf.getNom(),sf.getEmail()));
    }

	public RFiche Consulter(String n, boolean forward) throws RemoteException{
        RFiche rf = donnees.get(n);
        try{
        if(rf!=null){
            return rf;
        }else if(forward){
            Carnet carnet = (Carnet)Naming.lookup("//localhost:4000/Carnet2");
            return carnet.Consulter(n,false);
        } else{ return null;}
    }catch(Exception e){
        e.printStackTrace();
        return null;
    }
    }

    public static void main(String args[]){
        try{
            CarnetImpl carnet = new CarnetImpl(args[0]);
            Naming.rebind("//localhost:4000/"+args[0], carnet);
            System.out.println("carnet bound to registry");
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
