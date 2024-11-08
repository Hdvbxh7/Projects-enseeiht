with Text_Io;              use Text_Io;
with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;
with Alea;

-- Auteur : Gutierrez Tom

--Faire deviner à l’utilisateur un nombre généré par ordinateur
procedure Jeu_Devin_Exo1 is
   nb_a_dev: Integer; -- nombre a deviner generé par l'ordinateur
   nb_essai: Integer; -- nombre d'essai pour deviner le nombre
   nb_prop: Integer;  -- nombre proposé par le joueur
    
    package Mon_Alea is
            new Alea (1, 999); -- générateur de nombre dans l'intervalle [5, 15]
    use Mon_Alea;
    
begin
   --Initialiser le jeu
    
   --Générer un nombre aléatoire entre 1 et 999
    Get_Random_Number (nb_a_dev);
    nb_essai := 0;
    Put_Line("J'ai choisi un nombre compris entre 1 et 999.");
    
    --Faire deviner le nombre au joueur
    loop
        nb_essai := nb_essai+1;
        
        --Demander un nombre au joueur
        Put("Proposition ");
        Put(nb_essai,1);
        Put(" : ");
        Get(nb_prop);
        
        --donner un indice à l'utilisateur
        if nb_prop>nb_a_dev then
            Put_Line("Trop grand.");
        elsif nb_prop<nb_a_dev then
            Put_Line("Trop petit.");
        else
            Put_Line("Trouvé.");
        end if;
    exit when nb_a_dev=nb_prop;
    end loop;
    
    --Annoncer au joueur sa victoire
    Put("Bravo. Vous avez trouvé ");
    Put(nb_a_dev,1);
    Put(" en ");
    Put(nb_essai,1);
    Put_Line(" essais.");
end Jeu_Devin_Exo1;

