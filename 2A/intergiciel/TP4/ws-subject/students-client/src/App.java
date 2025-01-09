import javax.ws.rs.core.UriBuilder;

import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyWebTarget;

public class App {
    public static void main(String[] args) throws Exception {
        final String path = "http://localhost:8080";
        ResteasyClient client = new ResteasyClientBuilder().build();
        ResteasyWebTarget target = client.target(UriBuilder.fromPath(path));
        FacadeInterface proxy = target.proxy(FacadeInterface.class);
        Student stud;
        stud = proxy.getStudent("Daniel","Hagimont"); 
        System.out.println(stud.getBirthdate());
        Record rec;
        rec = proxy.getRecord("1111111111"); 
        System.out.println(rec.getMathematics());
    }
}
