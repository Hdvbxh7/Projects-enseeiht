open Delimcc
type programme = unit -> unit

module GreenThreads =
  struct 
    (* à compléter/modifier *)
    type res = 
    |Yield of continuation
    |Fork of programme * continuation
    |Done
    and continuation = unit -> res

    let scheduler proc_init = 
      let p = new_prompt () in
      let procs :continuation Queue.t = Queue.create () in 
        let rec spawn prog =
          loop (push_prompt p (fun  _ -> prog();Done)); 
          and loop = function
            | Done -> if Queue.is_empty procs then () else loop (Queue.pop procs ())
            | Yield k -> (Queue.push k procs;loop (Queue.pop procs ()))
            | Fork (p,c) -> (Queue.push c procs;spawn p)
        in
          spawn proc_init
      ;;

    let yield (): unit = let p = new_prompt () in shift p (fun k -> Yield k) ;;
    let fork prog = let p = new_prompt () in shift p (fun k -> Fork (prog,k));;
    let exit () : unit = let p = new_prompt () in shift p (fun _ -> Done);;

  (*programme ping*)
   let ping () =
    let p = new_prompt () in 
     begin
       for i = 1 to 10
     do
       print_endline "ping !";
       (*on stop le processus et on renvoi la balise (où on a stopper le processus)*)
       yield ()
     done;
     exit ()
   end;;
 
  (*programme pong*)
   let pong () =
    let p = new_prompt () in
     begin
       for i = 1 to 10
       do
         print_endline "pong !";
         (*on stop le processus et on renvoi la balise (où on a stopper le processus)*)
         yield()
     done;
     exit ()
   end;;

   let ping_pong () =
    fork ping ;
    fork pong ;;

  end
let () = GreenThreads.(scheduler ping_pong);


(*
module type Channel =
  sig
    val create : unit -> ('a -> unit) * (unit -> 'a)
  end

module GTChannel : Channel =
  struct
    (* à compléter/modifier *)
    let create () = assert false;;
  end
    
let sieve () =
  let rec filter reader =
    GreenThreads.(
      let v0 = reader () in
      if v0 = -1 then exit () else
      Format.printf "%d@." v0;
      yield ();
      let (writer', reader') = GTChannel.create () in
      fork (fun () -> filter reader');
      while true
      do
        let v = reader () in
        yield ();
        if v mod v0 <> 0 then writer' v;
        if v = -1 then exit ()
      done
    ) in
  let main () =
    GreenThreads.(
      let (writer, reader) = GTChannel.create () in
      fork (fun () -> filter reader);
      for i = 2 to 1000
      do
        writer i;
        yield ()
      done;
      writer (-1);
      exit ()
    ) in
  GreenThreads.scheduler main;;*)
