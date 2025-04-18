(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | mk_ref : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments mk_ref {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | mk_ref x => x
  end.

Parameter a: Z.

Parameter b: Z.

Axiom H : (0%Z < a)%Z.

Axiom H1 : (0%Z < b)%Z.

Parameter r: Z.

Parameter i: Z.

Axiom H2 : (r = (a * (b - i)%Z)%Z).

Axiom H3 : (0%Z <= i)%Z.

Axiom H4 : (0%Z < i)%Z.

Parameter i1: Z.

Axiom H5 : (i1 = (i - 1%Z)%Z).

Parameter r1: Z.

Axiom H6 : (r1 = (a + r)%Z).

(* Why3 goal *)
Theorem VC_produit : (r1 = (a * (b - i1)%Z)%Z) /\ (0%Z <= i1)%Z.
Proof.


Qed.

