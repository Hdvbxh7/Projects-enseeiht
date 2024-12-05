// Time-stamp: <06 jui 2023 11:58 Philippe Queinnec>

import CSP.*;

/** Réalisation de la voie unique avec des canaux JCSP. */
/* Version par automate d'états */
public class VoieUniqueAutomate implements VoieUnique {

    enum ChannelId { EntrerNS, EntrerSN, Sortir };
    
    private Channel<ChannelId> entrerNS;
    private Channel<ChannelId> entrerSN;
    private Channel<ChannelId> sortir;
    
    public VoieUniqueAutomate() {
        this.entrerNS = new Channel<>(ChannelId.EntrerNS);
        this.entrerSN = new Channel<>(ChannelId.EntrerSN);
        this.sortir = new Channel<>(ChannelId.Sortir);
        (new Thread(new Scheduler())).start();
    }

    public void entrer(Sens sens) {
        System.out.println("In  entrer " + sens);
        switch (sens) {
          case NS:
            entrerNS.write(true);
            break;
          case SN:
            entrerSN.write(true);
            break;
        }
        System.out.println("Out entrer " + sens);
    }

    public void sortir(Sens sens) {
        System.out.println("In  sortir " + sens);
        sortir.write(true);
        System.out.println("Out sortir " + sens);
    }

    public String nomStrategie() {
        return "Automate";
    }

    /****************************************************************/
    enum Etat {Libre, SN, NS};
    class Scheduler implements Runnable {
        private Etat etatvoie = Etat.Libre;
        private int nbTrainsSurVoie;
        public void run() {
            while (true) {
                var altLibre = new Alternative<>(entrerNS,entrerSN);
                var altSN = new Alternative<>(sortir,entrerSN);
                var altNS = new Alternative<>(entrerNS,sortir);
                if (etatvoie == Etat.Libre) {
                    switch (altLibre.select()){
                        case EntrerNS:
                            entrerNS.read();
                            etatvoie = Etat.NS;
                            nbTrainsSurVoie++;
                            break;
                        case EntrerSN:
                            entrerSN.read();
                            etatvoie = Etat.SN;
                            nbTrainsSurVoie++;
                            break;
                    }
                } else if (etatvoie == Etat.NS) {
                    switch (altNS.select()) {
                        case EntrerNS:
                            entrerNS.read();
                            nbTrainsSurVoie++;
                            break;
                        case Sortir:
                            sortir.read();
                            nbTrainsSurVoie--;
                            if(nbTrainsSurVoie == 0){etatvoie = Etat.Libre;} 
                            break;
                    }
                } else if (etatvoie == Etat.SN){
                    switch (altSN.select()) {
                        case EntrerSN:
                            entrerSN.read();
                            nbTrainsSurVoie++;
                            break;
                        case Sortir:
                            sortir.read();
                            nbTrainsSurVoie--;
                            if(nbTrainsSurVoie == 0){etatvoie = Etat.Libre;} 
                            break;
                    }
                }
            }
        }
    } // class Scheduler
}

