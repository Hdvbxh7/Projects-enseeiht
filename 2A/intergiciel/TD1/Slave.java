import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.*;

public class Slave extends Thread{
    static String host[] = {"host1","host2"};
    static int ports[] = {8081,8082};
    static int nbHosts = 2;
    static Random rand = new Random();
    Socket input;
    
    public Slave(Socket s){
        input = s ;
    }

    public void run(){ 
        try {
            System.out.println("receivec new request");
            int i = rand.nextInt(nbHosts);
            System.out.println(i);
            Socket output = new Socket("localhost",ports[i]);
            /*Recuperation output stream */
            //Initialisation du buffer
            byte[] buffer = new byte[24];

            //récupération des streams
            InputStream ip = input.getInputStream();
            OutputStream op = output.getOutputStream();

            //Lecture à l'arivée
            ip.read(buffer);

            //écriture au serveur
            op.write(buffer);

            //fermeture des sockets
            output.close();input.close();
        } catch (Exception e) {
            e.printStackTrace();
        }       
    }

}
