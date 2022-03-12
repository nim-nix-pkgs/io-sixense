{
  description = ''Obsolete - please use sixense instead!'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."io-sixense-master".dir   = "master";
  inputs."io-sixense-master".owner = "nim-nix-pkgs";
  inputs."io-sixense-master".ref   = "master";
  inputs."io-sixense-master".repo  = "io-sixense";
  inputs."io-sixense-master".type  = "github";
  inputs."io-sixense-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."io-sixense-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}