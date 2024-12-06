module type Iter = 
sig
  type 'a t

  val vide : 'a t
  val cons : 'a -> 'a t -> 'a t
  val uncons : 'a t -> ('a * 'a t) option
  val apply : ('a -> 'b) t -> ('a t -> 'b t)
  val unfold : ('b -> ('a * 'b) option)-> ('b -> 'a t)
  val filter : ('a -> bool) -> 'a t -> 'a t
  val append : 'a t -> 'a t -> 'a t 
end
  
end

let rec fold f liste = 
  match liste with 
  | [] -> f None
  | t::q -> f (Some (t,fold f q))
;;

let rec unfold f e =
  match f e with
  | None -> Flux.vide
  | Some(t,e') -> Flux.cons t (unfold f e')
;;

(*exercice 1*)
let constant c =
  Flux.unfold (fun() -> Some(c,())) ()
;;

let map f x =
  Flux.apply (Flux.constant f) x
;;
let map2 f x y =
  Flux.apply (map f x) y
;;

module Flux:Iter with type (Tick of (unit -> ('a * 'a t) option)) = 
struct
  type 'a t = Tick of (unit -> ('a * 'a t) option)

  let vide = Tick (fun() -> None);;

  let cons t q = Tick (fun() -> Some(t,q));;

  let uncons (Tick fflux) = fflux ();;

  let rec apply f x = 
    Tick (fun() ->
      match uncons f, uncons x with
      | None,_ -> None
      | _,None -> None
      | Some(tf,qf),Some(tx,qx) -> Some(tf tx, apply qf qx)
       ) 
     ;;
 
 let rec unfold f e =
   Tick(fun() ->
     match f e with
     |None -> None
     |Some(t,e') -> Some(t,unfold f e');;
     )
 
 let rec filter p flux =
   Tick(fun () -> 
     match uncons flux with
     | None -> None
     | Some(tf,qf) -> if p t then Some (t, filter p q) else uncons (filter p q)
     )
   ;;
 
 let rec append : 'a t 
end
(*exercice 2*)
