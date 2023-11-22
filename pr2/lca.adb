with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Unchecked_Deallocation;
with Ada.Text_IO;           use Ada.Text_IO;

package body LCA is

	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);


	procedure Initialiser(Sda: out T_LCA) is
	begin
		Sda:=null;	
	end Initialiser;


	procedure Detruire (Sda : in out T_LCA) is
	begin
		if Sda/=null then
			if Sda.all.suivant/=null then
				Detruire(Sda.all.suivant);
			end if;
			Free(Sda);
		else
			null;
		end if;	
	end Detruire;

	procedure Afficher_Debug (Sda : in T_LCA) is
	begin
		if Sda/=null then
			Put("-->[");
			Afficher_Cle(Sda.all.cle);
			Put(" : ");
			Afficher_Donnee(Sda.all.valeur);
			Put("]");
			if Sda.all.suivant/=Null then
				Afficher_Debug(Sda.all.suivant);
			end if;
		end if;
		Put("--E");
	exception
		when others => Afficher_Debug(Sda.all.suivant);
	end Afficher_Debug;

	function Est_Vide (Sda : T_LCA) return Boolean is
	begin
		if Sda=null then
			return True;	
		else
			return False;
		end if;
	end;


	function Taille (Sda : in T_LCA) return Integer is
	begin
		if Sda/=null then
			return Taille(Sda.all.suivant)+1;
		else
			return 0;	
		end if;
	end Taille;


	procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Valeur : in T_Valeur) is
	begin
		if Sda=null then
			Sda:=new T_Cellule;
			Sda.all.cle:=Cle;
			Sda.all.valeur:=Valeur;
			Sda.all.suivant:=null;
		elsif Sda.all.cle=Cle then
			Sda.all.valeur:=valeur;
		else
			Enregistrer(Sda.all.suivant,Cle,Valeur);
		end if;
	end Enregistrer;


	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
	begin
		if Sda.all.cle=Cle then
			return True;
		elsif Sda.all.suivant=null then
			return False;
		else
			return Cle_Presente(Sda.all.suivant,Cle);
		end if;
	end;


	function La_Valeur (Sda : in T_LCA ; Cle : in T_Cle) return T_Valeur is
	begin
		if Sda.all.cle=cle then
			return Sda.all.valeur;
		elsif Sda.all.suivant=null then
			raise Cle_Absente_Exception;
		else 
			return La_Valeur (Sda.all.suivant,Cle);
		end if;
	end La_Valeur;


	procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
	S: T_LCA;
	begin
		if Sda=null then
			raise Cle_Absente_Exception;
		elsif Sda.all.cle=Cle then
			if Sda.all.suivant=null then
				Sda:=null;
			else
				Sda:=Sda.suivant;
			end if;
		elsif Sda.all.suivant.all.cle=Cle then
			S:=new T_Cellule;
			S:=Sda.all.suivant.all.suivant;	
			Sda.all.suivant:=S;
		elsif Sda.all.suivant=null then
			raise Cle_Absente_Exception;
		else
			Supprimer(Sda.all.suivant,Cle);
		end if;
	end Supprimer;


	procedure Pour_Chaque (Sda : in T_LCA) is
	begin
		if Sda/=null then
			traiter(Sda.all.cle,Sda.all.valeur);
			if Sda.all.suivant/=null then
				Pour_Chaque(Sda.all.suivant);
			end if;
		else 
			null;
		end if;
	exception
		when others => Pour_Chaque(Sda.all.suivant);
	end Pour_Chaque;

end LCA;
