with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Text_IO;           use Ada.Text_IO;

package body TH is

    
	procedure InitialiserTH(Sda: out T_TH) is
	begin
        for i in 1..Borne_Max loop
		    Initialiser(Sda(i));	
        end loop;
	end InitialiserTH;


	procedure DetruireTH(Sda : in out T_TH) is
	begin
        for i in 1..Borne_Max loop
		    Detruire(Sda(i));		
        end loop;
	end DetruireTH;

	procedure Afficher_DebugTH (Sda : in T_TH) is
    procedure Afficherlca is new Afficher_Debug(Afficher_Cle,Afficher_Donnee);
	begin
        for i in 1..Borne_Max loop
		    Afficherlca(Sda(i));	
        end loop;
	end Afficher_DebugTH;

	function Est_VideTH (Sda : T_TH) return Boolean is
	begin
        for i in 1..Borne_Max loop
            if Est_Vide(Sda(i))=False then
                return False;
            end if;
        end loop;
        return True;
    end Est_VideTH;

	function TailleTH (Sda : in T_TH) return Integer is
    T:Integer;
	begin
        T:=0;
        for i in 1..Borne_Max loop
		    T:= T + Taille(Sda(i));
        end loop;	
        return T;
	end TailleTH;


	procedure EnregistrerTH (Sda : in out T_TH ; Cle : in T_Cle ; Valeur : in T_Valeur) is
    i: Integer;
	begin
        i:=hachage(Cle);
        i:=i mod Borne_Max;
        if i=0 then
            i:=11;
        end if;
		Enregistrer(Sda(i),Cle,Valeur);
	end EnregistrerTH;


	function Cle_PresenteTH (Sda : in T_TH ; Cle : in T_Cle) return Boolean is
    i: Integer;
	begin
        i:=hachage(Cle);
        i:=i mod Borne_Max;
        if i=0 then
            i:=11;
        end if;
	    return Cle_Presente(Sda(i),Cle);
	end Cle_PresenteTH;


	function La_ValeurTH (Sda : in T_TH ; Cle : in T_Cle) return T_Valeur is
    i: Integer;
	begin
        i:=hachage(Cle);
        i:=i mod Borne_Max;
        if i=0 then
            i:=11;
        end if;
        return La_Valeur(Sda(i),Cle);
	end La_ValeurTH;


	procedure SupprimerTH (Sda : in out T_TH ; Cle : in T_Cle) is
    i: Integer;
	begin
        i:=hachage(Cle);
        i:=i mod Borne_Max;
        if i=0 then
            i:=11;
        end if;
        Supprimer(Sda(i),Cle);
	end SupprimerTH;


	procedure Pour_ChaqueTH (Sda : in T_TH) is
    procedure Pour_Chaquelca is new Pour_Chaque(Traiter);
	begin
        for i in 1..Borne_Max loop
		    Pour_Chaquelca(Sda(i));	
        end loop;
	end Pour_ChaqueTH;

end TH;

