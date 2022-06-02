module Dir = OpamFilename.Dir
module Filename = OpamFilename

let ( </> ) = OpamFilename.Op.( / )
let ( <//> ) = OpamFilename.Op.( // )
let repo_url = "https://github.com/ocaml/opam-repository.git"
let output_dir = Dir.of_string "./_output"

let find_latest_version_dir pkg_dir =
  let version_dirs = Filename.dirs pkg_dir in
  List.hd (List.rev version_dirs)

let copy_pkg_v_dir ~output_dir pkg_v_dir =
  let basename = Filename.Base.to_string (Filename.basename_dir pkg_v_dir) in
  let dst = output_dir </> basename in
  Filename.mkdir dst;
  Filename.copy ~src:(pkg_v_dir <//> "opam")
    ~dst:(dst <//> String.concat "." [basename; "opam"])

let copy_opams () =
  Fmt.epr "Running...@.";
  let repo_path, _repo_url = Onix.Solver.resolve_repo repo_url in
  let pkgs_dir = repo_path </> "packages" in
  Fmt.epr "Reading packages from: %s@." (Dir.to_string pkgs_dir);
  let pkg_dirs = Filename.dirs pkgs_dir |> List.to_seq in
  let () =
    Filename.mkdir output_dir;
    pkg_dirs
    |> Seq.map find_latest_version_dir
    |> Seq.iter (copy_pkg_v_dir ~output_dir)
  in
  Fmt.epr "Done.@."

let () = copy_opams ()
