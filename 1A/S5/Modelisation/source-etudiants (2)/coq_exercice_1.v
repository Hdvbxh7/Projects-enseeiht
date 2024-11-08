Require Import Naturelle.
Section Session1_2019_Logique_Exercice_1.

Variable A B C : Prop.

Theorem Exercice_1_Naturelle :  (A -> B -> C) -> ((A /\ B) -> C).
Proof.
I_imp H.
I_imp R.
E_imp (B).
E_imp (A).
Hyp H.
E_et_g (B).
Hyp R.
E_et_d (A).
Hyp R.
Qed.

Theorem Exercice_1_Coq :  (A -> B -> C) -> ((A /\ B) -> C).
Proof.
intros.
cut B.
cut A.
exact H.
destruct H0 as (Ha, Hb).
exact Ha.
destruct H0 as (Ha, Hb).
exact Hb.
Qed.

End Session1_2019_Logique_Exercice_1.

