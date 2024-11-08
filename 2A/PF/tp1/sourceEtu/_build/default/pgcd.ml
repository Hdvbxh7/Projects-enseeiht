(*  Exercice à rendre **)
(*
pgcd : int -> int -> int
renvoi le pgcd de deux nombres
parametre a,b: int, les nombres dont on veut le pgcd
Resultat : int, le pgcd de a et b
Précondition: a et b strictement positif 
*)
let rec pgcd a b = if a=b then a else if a>b then pgcd (a-b) b else pgcd a (b-a)

let%test _ = pgcd 10 5 = 5
let%test _ = pgcd 5 10 = 5
let%test _ = pgcd 6 9 = 3
let%test _ = pgcd 5 4 = 1
let%test _ = pgcd 4 5 = 1

(*
oui on peut le faire avec une fonction local qui vérifie que a et b sont positif
*)
