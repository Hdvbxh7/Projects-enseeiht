(* Evaluation des expressions simples *)


(* Module abstrayant les expressions *)
module type ExprSimple =
sig
  type t
  val const : int -> t
  val plus : t -> t -> t
  val mult : t-> t -> t
end

(* Module réalisant l'évaluation d'une expression *)
module EvalSimple : ExprSimple with type t = int =
struct
  type t = int
  let const c = c
  let plus e1 e2 = e1 + e2
  let mult e1 e2 = e1 * e2
end


(* Solution 1 pour tester *)
(* A l'aide de foncteur *)

(* Définition des expressions *)
module ExemplesSimples (E:ExprSimple) =
struct
  (* 1+(2*3) *)
  let exemple1  = E.(plus (const 1) (mult (const 2) (const 3)) )
  (* (5+2)*(2*3) *)
  let exemple2 =  E.(mult (plus (const 5) (const 2)) (mult (const 2) (const 3)) )
end

module PrintSimple : ExprSimple with type t=string=
struct
  type t = string
  let const c = string_of_int(c)
  let plus e1 e2 = "("^e1^"+"^e2^")"
  let mult e1 e2 = "("^e1^"*"^e2^")"
end 

module CompteSimple : ExprSimple with type t=int=
struct
  type t = int
  let const c = 0
  let plus e1 e2 = e1 +1+ e2
  let mult e1 e2 = e1 +1+ e2
end

module type ExprVar =
sig
  type t
  val def : string->t->t->t
  val var : string->t
end

module type Expr =
sig
  include ExprSimple
  include (ExprVar with type t:=t)
end

module PrintVar : ExprVar with type t=string=
struct
  type t=string
  let def name e1 e2 = "let "^name^" = "^e1^" in "^e2
  let var name = name
end

module Print : Expr with type t=string=
struct
  include PrintSimple
  include PrintVar
end

(* Définition des expressions *)
module Exemplescomplexes (E:Expr) =
struct
  (* 1+(2*3) *)
  let exemple1  = E.(plus (const 1) (mult (const 2) (const 3)) )
  (* (5+2)*(2*3) *)
  let exemple2 =  E.(mult (plus (const 5) (const 2)) (mult (const 2) (const 3)) )
  (* let x = 1+2 in x*3*)
  let exemple3 = E.(def "x" (plus (const 1) (const 2)) (mult (var "x") (const 3)) )
end

(* Module d'évaluation des exemples *)
module EvalExemples =  ExemplesSimples (EvalSimple)
module EvalExemples2 =  ExemplesSimples (PrintSimple)
module EvalExemples3 =  ExemplesSimples (CompteSimple)
module EvalExemples4 =  Exemplescomplexes (Print)

let%test _ = (EvalExemples.exemple1 = 7)
let%test _ = (EvalExemples.exemple2 = 42)
let%test _ = (EvalExemples2.exemple1 = "(1+(2*3))")
let%test _ = (EvalExemples2.exemple2 = "((5+2)*(2*3))")
let%test _ = (EvalExemples3.exemple1 = 2)
let%test _ = (EvalExemples3.exemple2 = 3)
let%test _ = (EvalExemples4.exemple3 = "let x = (1+2) in (x*3)")