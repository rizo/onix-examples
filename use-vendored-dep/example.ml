
let print pp = Format.printf "%a@." Pp.to_fmt pp


let () =
  print (Pp.enumerate (List.init 10 Fun.id) ~f:(Pp.textf "%d"));;
