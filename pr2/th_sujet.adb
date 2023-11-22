with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with TH;

procedure TH_Sujet is
    function hachage_String_length(Cle: in Unbounded_String) return Integer is
         begin
            return Length(Cle);
    end hachage_String_length;
   
	package TH_String_Integer is
		new TH (T_Cle => Unbounded_String, T_Valeur => Integer, hachage =>hachage_String_length,Borne_Max => 11);
	use TH_String_Integer;

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

    procedure Afficher_TH is new TH_String_Integer.Pour_ChaqueTH(Afficher);
    Sda: T_TH;
    
begin
    InitialiserTH(Sda);
    EnregistrerTH(Sda,+"un",1);
    EnregistrerTH(Sda,+"deux",2);
    Afficher_TH(Sda);
    DetruireTH(Sda);
end TH_Sujet;