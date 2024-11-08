Require Import Naturelle.
Section Session1_2023_Logique_Exercice_2.

Variable A B : Prop.

Theorem Exercice_2_Naturelle : ((A -> B) -> A) -> A.
Proof.
I_imp H.
absurde H1.
E_non(A).
E_imp(A->B).
Hyp H.
I_imp H2.
E_antiT.
E_non(A).
Hyp H2.
Hyp H1.
Hyp H1.
Qed.

Theorem Exercice_2_Coq : ((A -> B) -> A) -> A.
Proof.
intros.
cut (A \/ ~A).
intro Hgng.
destruct Hgng as [Ha |Hb].
exact Ha.
cut (A->B).
exact H.
intros.
absurd (A).
exact Hb.
exact H0.
apply (classic A).
Qed.

End Session1_2023_Logique_Exercice_2.

