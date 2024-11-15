import java.net.ServerSocket;
import java.net.Socket;
import java.util.*;

public class LoadBalancer{

public static void main(String args[]){
    try {
        ServerSocket ss = new ServerSocket(8080);

        while (true){
            Socket sock = ss.accept();
            Thread t = new Slave(sock);
            t.run();
        }
    } catch (Exception e){
        e.printStackTrace();
    }
}
}

