with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with LCA;

procedure LCA_Sujet is

	package LCA_String_Integer is
		new LCA (T_Cle => Unbounded_String, T_Valeur => Integer);
	use LCA_String_Integer;

    function "+" (Item : in String) return Unbounded_String
		renames To_Unbounded_String;
    
    function Avec_Guillemets (S: Unbounded_String) return String is
	begin
		return '"' & To_String (S) & '"';
	end;

    procedure Afficher(Cle : in Unbounded_String; Valeur: in Integer) is
    begin
        Put(Avec_Guillemets(Cle));
        Put(" : ");
        Put(valeur,1);
        New_Line;  
    end Afficher;

    procedure Afficher_Sda is new LCA_String_Integer.Pour_Chaque(Afficher);
    Sda: T_LCA;
    
begin
    Initialiser(Sda);
    Enregistrer(Sda,+"un",1);
    Enregistrer(Sda,+"deux",2);
    Afficher_Sda(Sda);
    Detruire(Sda);
end LCA_Sujet;

