

module type Iter = 
sig
  type 'a t

  val vide : 'a t
  val cons : 'a -> 'a t -> 'a t
  val uncons : 'a t -> ('a * 'a t) option
  val apply : ('a -> 'b) t -> ('a t -> 'b t)
  val unfold : ('b -> ('a * 'b) option)-> ('b -> 'a t)
  val filter : ('a -> bool) -> 'a t -> 'a t
  (* monade additive des flux *)
  val map : ('a -> 'b) -> 'a t -> 'b t
  val (>>=) : 'a t -> ('a -> 'b t) -> 'b t
  (* return a = cons a vide *)
  val return : 'a -> 'a t
  (*zero = vide*)
  val zero : 'a t
  (* f1 ++ f2 = append f1 f2 *)
  val (++) : 'a t -> 'a t -> 'a t
end

type 'a result : 'a Flux.t Solution.t

type 'a parser : 'a Flux.t -> 'a result

let pnul flux =
  Solution.return flux
  (* reconnait empty partout*)

let perreur flux =
  Solution.zero

let pvide flux =
  (* ne reconnait que le mot vide *)
  match Flux.uncons flux with
    | None -> Solution.return flux
    | Some _ -> Solution.zero


let ptest p flux = 
  match Flux.uncons flux with
    |None -> Solution.zero
    |Some(t,q) -> if p t then Solution.return q else Solution.zero

(*Exercice 1*)
let psequence p1 p2 flux = 
  Solution.(p1 flux >>= p2 )

let pchoice p1 p2 flux =
  Solution.(p1 flux ++ p2 flux)

type 'a language =
  | Nothing (* vide *)
  | Empty (* empty (EOF par ex)*)
  | Letter of 'a
  | Sequence of 'a language *'a language
  | Choice of 'a language *'a language
  | Repeat of 'a language

(* Exercice 2*)
let rec eval : 'a language -> 'a Flux.t -> 'a parser
  fun lang flux -> match lang with
    | Nothing -> perreur flux
    | Empty -> pnul flux
    | Letter l -> ptest ((=)l) flux
    | Sequence (l1,l2) -> psequence (eval l1) (eval l2) flux
    | Choice (l1,l2) -> pchoice (eval p1) (eval p2) flux
    | Repeat plang -> eval (Choice (Empty, Sequence (l,Repeat l))) flux (*<- faux sans flux car recursion infini* devient possible car le flux est fini*)
    
let rec belongs : 'a language -> 'a Flux.t -> bool
  fun lang flux ->
    (Solution.filter (fun f -> Flux.uncons f=None) (eval lang flux))<>None
  
(* 3 *)
let pchoice_n l = 
  List.fold_right pchoice l perreur
let psequence_n l = 
  List.fold_right psequence l pnul
let paro = ptest ((=) '(')
let parf = ptest ((=) ')')
let div = ptest ((=) '/')
let var = ptest (fun v -> v >= 'a' && v <= 'z')

let rec expr flux =
  pchoice_n [psequence_n [var]; psequence_n [paro; expr; div; expr; parf]] flux

  module Mate(L_sig type t end) =
  struct(*write*)
    let return b = (fun f -> Solution.return (b,f))
    let (>>=)  : ('a, 'b) parser -> ('b -> ('a,'c) parser) ->('a,'c) parser = 
    fun parse dep_parse f -> Solution.(parsef >>= fun (b,f') -> dep_parse b f')
  end
=======================================================================================================================================================================
(*EXERCICE 3*)
let ('a, 'b) result = ('b * 'a Flux.t) Solution.t
let ('a,'b) parser = 'a Flux.t -> ('a, 'b) result

let pnul flux = return ()
  (* reconnait empty partout*)

let perreur = zero

let pvide flux =
  (* ne reconnait que le mot vide *)
  match Flux.uncons flux with
    | None -> Solution.return flux
    | Some _ -> Solution.zero


let ptest p flux = 
  match Flux.uncons flux with
    |None -> Solution.zero
    |Some(t,q) -> if p t then Solution.return (t,q) else Solution.zero

let ( *> ) p1 p2  = 
  p1 >>=  fun b ->
  p2 >>= fun c ->
    return (b,c)

let pchoice = (++)

type ast = Div of ast *ast | Var of char

let rec expr flux =
  var >>= fun v -> return (var v)
   ++
  paro *> expr *> div *> expr *> parf




