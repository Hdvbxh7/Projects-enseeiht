type zero = private Dummy1
type _ succ = private Dummy2
type nil = private Dummy3
type 'a list = Nil | Cons of 'a * 'a list
type ( _ , _ ) nlist = 
  | Nil : ('a, zero) nlist
  | Cons : 'a * ('a,'n) nlist -> ('a, 'n succ) nlist

(*EXERCICE 1*)
(*1.1*)
let rec map : type n. ('a -> 'b) -> ('a, n) nlist -> ('b, n) nlist = (*type n. pour avoir un n non fixé à zero(quelconque)*)
  fun f -> function (*fun f -> function == fun f l -> match l with (ne fonctionne pas sur les fun vide)*)
  | Nil -> Nil
  | Cons (x , xs) -> Cons(f x, map f xs)
;;

(*1.2*)
let rec snoc : type n. 'a -> ('a, n) nlist -> ('a, n succ) nlist =
  fun s -> function
  | Nil -> Cons(s, Nil)
  | Cons (x , xs) -> Cons(x , snoc s xs)
;;

(*1.3*)
let rec tail : type n. ('a, n succ) nlist -> ('a, n) nlist = (*on utilise n succ en entrée pour respecter le format et cela force une liste non vide en entrée*)
  fun l -> match l with
  | Cons(x,xs) -> xs
;;

(*1.4*)
let rec rev : type n. ('a, n) nlist -> ('a, n) nlist =
  fun l -> match l with 
  | Nil -> Nil
  | Cons(x,xs) -> snoc x (rev xs)
;;

(*EXERCICE 2*)

let rec insert : type n. 'a -> ('a, n) nlist -> ('a, n succ) nlist =
 fun e -> function
  | Nil -> Cons(e , Nil)
  | Cons(x , xs) -> if x < e then Cons(x, insert e xs) else Cons(e,Cons(x,xs))
;;
  
let rec insertion_sort : type n. ('a, n) nlist -> ('a, n) nlist =
  fun l ->
  match l with
  | Nil -> Nil
  | Cons(x , xs) -> insert x (insertion_sort xs)
;;

(*EXERCICE 3*)
(*3.1*)
type _ hlist =
  | Nil : nil hlist
  | Cons : 'a * 'b hlist -> ('a * 'b ) hlist 

(*3.2*)
let rec tail : ('a * 'b) hlist -> 'b hlist =
  fun l ->
    match l with
    | Cons(x , xs) -> xs
;;

(*3.3*)
let rec add : (int * (int * 'a)) hlist -> (int * 'a) hlist =
  fun l -> 
    match l with
    | Cons(x1,Cons(x2,xs)) -> Cons(x1 + x2 , xs)
  ;;

(*EXERCICE 4*)
type 't expr = 
  | Entier : int -> int expr 
  | Booleen : bool -> bool expr
  | Plus : int expr * int expr -> int expr 
  | Egal : 't expr * 't expr -> bool expr

let rec eval : type t. t expr -> t =
  fun exp ->
    match exp with
    | Entier n -> n 
    | Booleen b -> b
    | Plus (a,b) -> (eval a) + (eval b)
    | Egal (a,b) -> a = b
  ;;