-- Définition de structures de données associatives sous forme d'une liste
-- chaînée associative  (LCA) avec une fonction de hachage qui trie.
with LCA;

generic
	type T_Cle is private;
	type T_Valeur is private;
	Borne_Max: Integer;
	with function hachage(Cle: in T_Cle) return Integer;

package TH is

	type T_TH is limited private;

	-- Initialiser une Sda.  La Sda est vide.
	procedure InitialiserTH(Sda: out T_TH) with
		Post => Est_VideTH (Sda);


	-- Détruire une Sda.  Elle ne devra plus être utilisée.
	procedure DetruireTH (Sda : in out T_TH);


	-- Est-ce qu'une Sda est vide ?
	function Est_VideTH (Sda : T_TH) return Boolean;


	-- Obtenir le nombre d'éléments d'une Sda. 
	function TailleTH (Sda : in T_TH) return Integer with
		Post => TailleTH'Result >= 0
			and (TailleTH'Result = 0) = Est_VideTH (Sda);


	-- Enregistrer une valeur associée à une Clé dans une Sda.
	-- Si la clé est déjà présente dans la Sda, sa valeur est changée.
	procedure EnregistrerTH (Sda : in out T_TH ; Cle : in T_Cle ; Valeur : in T_Valeur) with
		Post => Cle_PresenteTH (Sda, Cle) and (La_ValeurTH (Sda, Cle) = Valeur)   -- valeur insérée
				and (not (Cle_PresenteTH (Sda, Cle)'Old) or TailleTH (Sda) = TailleTH(Sda)'Old)
				and (Cle_PresenteTH (Sda, Cle)'Old or TailleTH (Sda) = TailleTH (Sda)'Old + 1);

	-- Supprimer la valeur associée à une Clé dans une Sda.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Sda
	procedure SupprimerTH (Sda : in out T_TH ; Cle : in T_Cle) with
		Post =>  TailleTH (Sda) = TailleTH (Sda)'Old - 1 -- un élément de moins
			and not Cle_PresenteTH (Sda, Cle);         -- la clé a été supprimée


	-- Savoir si une Clé est présente dans une Sda.
	function Cle_PresenteTH (Sda : in T_TH ; Cle : in T_Cle) return Boolean;


	-- Obtenir la valeur associée à une Cle dans la Sda.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans l'Sda
	function La_ValeurTH (Sda : in T_TH ; Cle : in T_Cle) return T_Valeur;


	-- Appliquer un traitement (Traiter) pour chaque couple d'une Sda.
	generic
		with procedure Traiter (Cle : in T_Cle; Valeur: in T_Valeur);
	procedure Pour_ChaqueTH (Sda : in T_TH);

	-- Afficher la Sda en révélant sa structure interne.
	-- Voici un exemple d'affichage.
	-- -->["un" : 1]-->["deux" : 2]-->["trois" : 3]-->["quatre" : 4]--E
	generic
		with procedure Afficher_Cle (Cle : in T_Cle);
		with procedure Afficher_Donnee (Valeur : in T_Valeur);
	procedure Afficher_DebugTH (Sda : in T_TH);


private
	package THLCA is
		new LCA (T_Cle =>T_Cle, T_Valeur=>T_Valeur);
	use THLCA;

    type T_TH is array (1..Borne_Max) of T_LCA; 

end TH;
