Random.self_init ()

let width = ref 1000
let height = ref 1000

let set_projection ()  =
  GlMat.mode `projection ;
  GlMat.load_identity () ;
  GlMat.ortho ~x:(0., 1.) ~y:(0., 1.) ~z:(0., 1.) ;
  GlMat.mode `modelview

let render () =
  GlClear.color(1., 1., 1.) ;
  GlClear.clear [`color] ;
  GlDraw.color (0., 0., 0.) ;
  GlDraw.begins `points ;
  let rec iterate n x y =
    GlDraw.vertex ~x:x ~y:y () ;
    let next = iterate (n - 1) in
    match n with
    | 0 -> ()
    | _ ->
        begin
          match Random.int 3 with
          | 0 -> next (x /. 2.) (y /. 2.)
          | 1 -> next ((1. +. x) /. 2.) (y /. 2.)
          | 2 -> next (x /. 2.) ((1. +. y) /. 2.)
          | _ -> failwith "The random number is too random."
        end in
  iterate (50 * (max !width !height)) (Random.float 1.) (Random.float 1.) ;
  GlDraw.ends () ;
  Gl.flush ()

;;

ignore (Glut.init Sys.argv) ;
Glut.initDisplayMode () ;
Glut.initWindowSize ~w:!width ~h:!height ;
ignore (Glut.createWindow ~title:"Seprinski") ;
set_projection () ;
let reshape ~w ~h =
  GlDraw.viewport 0 0 w h ;
  width := w ;
  height := h ;
  render () in
Glut.reshapeFunc ~cb:(reshape) ;
Glut.displayFunc ~cb:(render) ;
Glut.mainLoop ()
(*
 vim:sw=2
 *)
