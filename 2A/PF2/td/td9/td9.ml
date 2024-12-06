
(* DEBUT *)

  (*factorielle*)
  let rec fact n = 
    if n = 0 then 1 else n * fact (n-1);;
  (* k fact : int -> (int -> 'a ) -> 'a *)
  let rec kfact n k = 
    if n = 0 then k 1 else kfact (n-1) (fun fact_n_1 -> k (n * fact_n_1));;

  let fact' n = kfact n (fun fact_n -> fact_n);;

  (*fibonacci*)
  let rec fibo n =
    match n with
    | 0 | 1 -> 1
    | _ -> fibo (n-1) + fibo (n-2)
    (* kfibo : int -> (int -> 'a ) -> 'a *)
    let rec kfibo n k =
      | 0 | 1 -> k 1
      | _ -> kfibo (n-2)
              (fun fib_n_2 -> kfibo (n-1)
              (fun fib_n_1 -> k (fib_n_2 + fib_n_1)));;

  let fibo' n = kfibon (fun fib_n -> fib_n);;

.
(* 3 *)


(*MARQUEUR DE LA PILE*)
  (* le type de marqueurs de la pile *)
  type 'r prompt 
  val new_prompt : unit -> 'r prompt (* pose des marqueurs sur la pile *) (* try *)
  val push_prompt : 'r prompt -> (unit -> 'r) -> 'r (* commence à espionner la pile *) (*catch*)
  val shift : 'r prompt -> (('s -> 'r) -> 'r) -> 's (* arrête un programme et execute le code passer en argument *) (* raise *)
              (* î pile qui  contient le code des récurssions précédentes pas encore éxécuter *)


.
(* EXEMPLE *)
  push_prompt p (fun () -> string_of_int( shift p (fun k -> "x" ^ (k 42) ) ) )
  (* k = string of int car il s'agit de l'opération entre le push et le shift *)
  (* qui est dans la pile*)(* on obtient donc "x42" *)

.
(* EXERCICE 1 *)

  (* programme de base *)
  let rec prod_int_list l = 
    match l with
    | [] -> 1
    | t::q -> t * prod_int_list q;; 

  (*on s'arrete quand il y a un 0 mais on fait quand même les produits précedents*)
  let rec prod_int_list l = 
    match l with
    | [] -> 1
    | 0::_ -> 0
    | t::q -> t * prod_int_list q;;

  (*avec shift pour interrompre avec 0*)
  let rec prod_int_list l = 
    let p = new_prompt () in (* toujours avoir bien un nouveau new prompt à chaque fois*)
    (* comme new _prompt à des effets de bord on peut avoir des erreurs de types un peu incompréhensible *)
      let rec loop = 
        match l with
        | [] -> 1
        | 0::_ -> shift p (fun k -> 0) (*interruption avec shift*)
        | t::q -> t * prod_int_list q;;
      in
      push_prompt p (fun () -> loop l)

.
(* EXERCICE 2 *)
  Sys.file_exists : string -> bool
  open_in : string -> in_channel
  read_line : unit -> string 
  input_line : in_channel -> string
  close_in : in_channel -> unit

  type res =
  | Done of string
  | Request of (string -> res)


  (* programme d'ouverture du fichier avec continuation*)
  let p = new_prompt () in
      (*string -> res*)
      let cas_nominal nom =
        let f = open_in 
          (if Sys.file_exists nom then nom else shift p (fun k -> Request k (* on fait appel au cas d'erreur *))) in 
            let l = input_line f in
              close_in f;
              Done l (* tout se termine bien *)

  (* Cas de redemande du nom*)    
  (*string -> 'r prompt -> ('r prompt -> string) *)        
  let redemande nom k =
    Format.printf "%s n'existe pas; entrer un nouveau nom" nom;
    let nom read_line () in 
      k nom(* ici open_in nom*)

  (* appel des fonctions et catch des erreurs*)
  let handler nom =
    match push_prompt p (fun () -> cas_nominal nom) with
      | Done l -> l
      | Request k -> match redemande nom k with
                      | Done l -> l
                      | Request k -> assert false
. 
(* EXERCICE 3_4 *)

  type res =
  | Done of 'r
  | Yield of ('s -> res);;

  (*programme ping*)
  let p = new_prompt () in 
  let ping () =
    begin
      for i = 1 to 10
    do
      print_endline "ping !";
      (*on stop le processus et on renvoi la balise (où on a stopper le processus)*)
      shift p (fun k -> Yield k)
    done;
    Done
  end;;

  (*programme pong*)
  let p = new_prompt () in
  let pong () =
    begin
      for i = 1 to 10
      do
        print_endline "pong !";
        (*on stop le processus et on renvoi la balise (où on a stopper le processus)*)
        shift p (fun k -> Yield k)
    done;
    Done
  end;;

  (*programme qui s'occupe de gérer les try catch*)
  let scheduler : unit -> unit
    fun -> 
      let rec loop ps =
          (*on filtre la liste de processus*)
          match ps with
          (*il n'y a plus aucun processus qui tourne*)
            | [] -> ()

            (*toujours des processus dans la liste*)
            | p::ps2 -> match ( push_prompt prompt (fun () -> p()) ) (*on lance le processus ici*) with

                          (*si le processus est terminé il disparait de la liste*)
                          | Done -> ( loop ps2 ) 

                          (*si il n'est pas terminé on le rajoute à la fin de la liste*)
                          | Yield kp -> ( loop (ps'@[kp]) ) 

      in loop [ping, pong] (* on  lance la boucle pour ping pong*)
.
(*EXERCICE 5*)
  type tree = 
  |Node of tree * int * tree | Empty;;

  let rec iter t =
    match t with
    | Node (l, i ,r) -> (iter_tree l; yield i; iter_tree r)
    | Empty          -> ();;

  let print t = foreach (fun i -> print_int i) iter_tree t;;

  type res =
  |Done
  | Yield of int * (unit -> res)

  let p = new_prompt () in
  let yield i = shift p (fun k -> yield (i,k)) in
    let foreach f iter t = 
      let rec loop = function
        | Done -> ()
        | Yield (i,k) -> let () = f i in k ()
      in loop (push_prompt p (fun () -> iter t;Done)) 