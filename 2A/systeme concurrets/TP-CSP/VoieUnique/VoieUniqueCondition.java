// Time-stamp: <06 jui 2023 11:59 Philippe Queinnec>

import CSP.*;

/** Réalisation de la voie unique avec des canaux JCSP. */
/* Version avec condition d'acceptation */
public class VoieUniqueCondition implements VoieUnique {

    enum ChannelId { EntrerNS, EntrerSN, Sortir };
    
    private Channel<ChannelId> entrerNS;
    private Channel<ChannelId> entrerSN;
    private Channel<ChannelId> sortir;
    
    public VoieUniqueCondition() {
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

    public String nomStrategie () {
        return "Condition";
    }

    /****************************************************************/

    class Scheduler implements Runnable {
        private int nbTrainsSurVoieNS = 0;
        private int nbTrainsSurVoieSN = 0;
        public void run() {
            var gentrerNS = new GuardedChannel<>(entrerNS,() -> ((nbTrainsSurVoieSN == 0) && (nbTrainsSurVoieNS <= 3)));
            var gentrerSN = new GuardedChannel<>(entrerSN,()->((nbTrainsSurVoieNS == 0) && (nbTrainsSurVoieSN <= 3)));
            var gsortir = new GuardedChannel<>(sortir, Predicate::True);
            var alt = new Alternative<>(gentrerNS,gentrerSN,gsortir);
        
        while (true) {
            switch(alt.select()){
                case EntrerNS:
                    entrerNS.read();
                    nbTrainsSurVoieNS++;
                    break;
                case EntrerSN:
                    entrerSN.read();
                    nbTrainsSurVoieSN++;
                    break;
                case Sortir:
                    sortir.read();
                    if(nbTrainsSurVoieSN > 0){
                        nbTrainsSurVoieSN--;
                    } else {
                        nbTrainsSurVoieNS--;
                    }
                    break;
            }
        }
        }
    } // class Scheduler
}

