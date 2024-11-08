with Text_Io;              use Text_Io;
with Ada.Integer_Text_Io;  use Ada.Integer_Text_Io;
with Jeu_Devin_Exo1;
with Jeu_Devin_Exo2;

-- Auteur : Gutierrez Tom

--Jouer au jeu du devin avec l'ordinateur
procedure Jeu_Devin_Exo3 is
    Allume: boolean; -- Etat du jeu (Allumé ou Eteint)
    choix: Integer;  -- Choix de l'utilisateur dans le menu
    begin
        Allume:=True;
        loop
        
   	     	--Proposer les différentes options à l'utilisateur 
   	     	 Put_Line("1- L'ordinateur choisit un nombre et vous le devinez");
             Put_Line("2- Vous choisissez un nombre et l'ordinateur le devine");
             Put_Line("0- Quitter le programme");
             Put("Votre choix : ");
             Get(choix);
        
   	     	--Traiter l'option choisie 	
   	     	case choix is
   	            when 0 => Put_Line("Au revoir...");
   	  	                  Allume:=false;
   	            when 1 => Jeu_Devin_Exo1;
   	            when 2 => Jeu_Devin_Exo2;
   	            when others =>Put_Line("Choix incorrect.");
            end case;	 
   	    exit when Allume=false;
	    end loop;	    
    end Jeu_Devin_Exo3;
