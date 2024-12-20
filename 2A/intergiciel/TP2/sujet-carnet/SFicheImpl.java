public class SFicheImpl implements SFiche{
    private String email;
    private String name;

    SFicheImpl(String Name, String Email){
        this.name = Name;
        this.email =Email;
    }
    public String getNom(){
        return this.name;
    }
    public String getEmail(){
        return this.email;
    }
}
