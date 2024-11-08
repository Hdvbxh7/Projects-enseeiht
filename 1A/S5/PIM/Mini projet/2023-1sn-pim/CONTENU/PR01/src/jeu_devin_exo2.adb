with Text_Io;              use Text_Io;
with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;

-- Auteur : Timothée KLEIN

-- Faire deviner l'ordinateur un nombre choisi par l'utilisateur
procedure Jeu_Devin_Exo2 is
    Demarrer : Character; -- Caractère rentré par l'utilisateur quand il lance la partie
    Compteur : Integer := 0; -- Compteur de tentatives
    Deb : Integer :=1; -- Borne inférieure des valeurs possibles pour le nombre deviné
    Fin : Integer := 999; -- Borne supérieure des valeurs possibles pour le nombre deviné
    Etat : Character := 'z'; -- Caractérise le nombre proposé par l'ordi (petit, grand, trouvé)
    Proposition : Integer; -- Stocke le nombre que va proposer l'ordi
begin
    --Initialiser la partie
    
    --Demander à l’utilisateur s’il a choisi son nombre
    loop
        Put("Avez-vous choisi un nombre compris entre 1 et 999 (o/n) ? ");
        Get(Demarrer);
        Skip_Line;
        
        -- Traiter le choix de l'utilisateur	
        if not(Demarrer='o' or Demarrer='O') then
            Put_Line("J'attends...");
        else
            null;
        end if;
        
        exit when Demarrer='o' or Demarrer='O';
    end loop;
    
    loop
        Compteur := Compteur +1;
        
        --Proposer un nombre plausible
        case Etat is
            when 'g'|'G' => Fin:=(Deb+Fin)/2 - 1;
            when 'p'|'P' => Deb:=(Deb+Fin)/2 + 1;
            when others  => Null;
        end case;
        Proposition := (Deb+Fin)/2;
        
        Put("Proposition ");
        Put(Compteur,1);
        Put(" : ");
        Put(Proposition,1);
        New_Line;
        
        --Demander à l'utilisateur une indication
        loop
            Put("Trop (g)rand, trop (p)etit ou (t)rouvé ? ");
            Get(Etat);
            Skip_Line;
            
            --Afficher du texte si l’utilisateur a entré un caractère illégal
            case Etat is
                when 'g' | 'G' | 'T' | 't' | 'p' | 'P' => Null;
                when others => Put_Line("Je n'ai pas compris. Merci de répondre :");
                    Put_Line("g si ma proposition est trop grande");
                    Put_Line("p si ma proposition est trop petite");
                    Put_Line("t si j'ai trouvé le nombre");
            end case;
                                                    
            exit when Etat='g' or Etat='G' or Etat='t' or Etat='T' or Etat='p' or Etat = 'P';
        end loop;
     
     exit when Etat ='T' or Etat='t' or Deb=Fin or (Proposition = Deb and (Etat='g' or Etat='G')) or (Proposition=Fin and (Etat='p' or Etat='P'));
     end loop;
    
    --Afficher l’état final de la partie
    if Etat='T' or Etat='t' then
        Put("J'ai trouvé ");
        Put(Proposition,1);
        Put(" en ");
        Put(Compteur,1);
        Put_Line(" essais");
    else
        Put_Line("Vous trichez. J’arrête cette partie.");
    end if;
                            
end Jeu_Devin_Exo2;
