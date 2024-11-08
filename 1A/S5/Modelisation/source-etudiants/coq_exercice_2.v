Require Import Naturelle.
Section Session1_2018_Logique_Exercice_2.

Variable A B : Prop.

Theorem Exercice_2_Naturelle : ~(A /\ B) -> (~A \/ ~B).
Proof.
I_imp H.
E_ou (A)(~A).
TE.
I_imp HA.
I_ou_d.
I_non H1.
I_antiT (A/\B).
I_et.
Hyp HA.
Hyp H1.
Hyp H.
I_imp HA.
I_ou_g.
I_non H2.
I_antiT (A).
Hyp H2.
Hyp HA.
Qed.

Theorem Exercice_2_Coq : ~(A /\ B) -> (~A \/ ~B).
Proof.
intros.
assert (A\/~A).
apply (classic A).
destruct H0 as [HA|HB].
right.
intro HB.
absurd(A/\B).
exact H.
split.
exact HA.
exact HB.
left.
intro H1.
absurd(A).
exact HB.
exact H1.
Qed.

End Session1_2018_Logique_Exercice_2.


