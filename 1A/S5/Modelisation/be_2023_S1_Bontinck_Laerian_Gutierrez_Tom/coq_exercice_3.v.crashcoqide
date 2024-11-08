Section Session1_2023_Induction_Exercice_3.

(* Déclaration d’un domaine pour les éléments des listes *)
Variable E : Set.

(* Déclaration de l'élément neutre du groupe *)
Variable e : E.

(* Déclaration de l'opérateur binaire interne du groupe *)
Variable o : E -> E -> E.

(* L'opérateur est associatif à gauche et à droite *)
Axiom o_associative : forall (e1 e2 e3 : E), o (o e1 e2) e3 = o e1 (o e2 e3).

(* e est neutre à gauche pour o *)
Axiom e_neutral_left : forall (t : E), o e t = t.

(* e est neutre à droite pour o *)
Axiom e_neutral_right : forall (t : E), o t e = t.


(* type de donnée liste d'élément du groupe *)
Inductive liste : Set :=
Nil : liste
| Cons : E -> liste -> liste.

(* Déclaration du nom de la fonction append *)
Variable append_spec : liste -> liste -> liste.

(* Spécification du comportement de append pour Nil en premier paramètre *)
Axiom append_Nil : forall (l : liste), append_spec Nil l = l.

(* Spécification du comportement de append pour Cons en premier paramètre *)
Axiom append_Cons : forall (t : E), forall (q l : liste),
   append_spec (Cons t q) l = Cons t (append_spec q l).

(* append est associative à gauche et à droite *)
Axiom append_associative : forall (l1 l2 l3 : liste),
   (append_spec l1 (append_spec l2 l3)) = (append_spec (append_spec l1 l2) l3).

(* Déclaration du nom de la fonction foldl *)
Variable foldl_spec : E -> liste -> E.

(* Spécification du comportement de foldl pour Nil en premier paramètre *)
Axiom foldl_Nil : forall(v : E), foldl_spec v Nil = v.

(* Spécification du comportement de foldl pour Cons en premier paramètre *)
Axiom foldl_Cons :  forall(v t : E), forall(q : liste), foldl_spec v (Cons t q) = foldl_spec (o v t) q.

(* Permutation des variables quantifiées par rapport à l'examen pour simplifier la preuve *)
Theorem foldl_append : forall (l1 l2 : liste), forall (v : E),
  (foldl_spec v (append_spec l1 l2)) = (foldl_spec (foldl_spec v l1) l2).
induction l1.
intros.
rewrite append_Nil.
rewrite foldl_Nil.
reflexivity.
intros.
rewrite append_Cons.
rewrite foldl_Cons.
rewrite foldl_Cons.
rewrite IHl1.
reflexivity.
Qed.


(* Implantation de la fonction foldl *)
Fixpoint foldl_impl (v : E) (l : liste) {struct l} : E :=
match l with
Nil => v 
| (Cons t q) => foldl_impl (o v t) q
end.

(* Permutation des variables quantifiées par rapport à l'examen pour simplifier la preuve *)
Theorem foldl_correctness : forall (l : liste), forall (v : E),
   (foldl_spec v l) = (foldl_impl v l).
Proof.
induction l.
intros.
rewrite foldl_Nil.
simpl.
reflexivity.
intros.
rewrite foldl_Cons.
simpl.
rewrite IHl.
reflexivity.
Qed.

(* Déclaration du nom de la fonction foldr *)
Variable foldr_spec : E -> liste -> E.

(* Spécification du comportement de foldr pour Nil en premier paramètre *)
Axiom foldr_Nil : forall(v : E), foldr_spec v Nil = v.

(* Spécification du comportement de foldr pour Cons en premier paramètre *)
Axiom foldr_Cons : forall(v t : E), forall(q : liste), foldr_spec v (Cons t q) = o  v (foldr_spec t q).


(* Permutation des variables quantifiées par rapport à l'examen pour simplifier la preuve *)
Theorem foldl_foldr : forall (l : liste), forall (v : E), (foldl_spec v l) = (foldr_spec v l).
Proof.
induction l.
intros.
rewrite foldr_Nil.
rewrite foldl_Nil.
reflexivity.
intros.
rewrite foldr_Cons.
rewrite foldl_Cons.
Qed.


End Session1_2023_Induction_Exercice_3.
