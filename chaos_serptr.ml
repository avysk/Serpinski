Random.self_init ()

let window_size = 1000

let rec iterate x y = 
  let () = Graphics.plot x y in
  match Random.int 3 with
  | 0 -> iterate (x / 2) (y / 2)
  | 1 -> iterate ((window_size + x) / 2) (y / 2)
  | 2 -> iterate (x / 2) ((window_size + y) / 2)
  | _ -> failwith "Strange random number, ergh?"

let () =
  let size = string_of_int window_size in
  let () = Graphics.open_graph (" " ^ size ^ "x" ^ size) in
  iterate (Random.int window_size) (Random.int window_size)

(*
 vim:sw=2
 *)
