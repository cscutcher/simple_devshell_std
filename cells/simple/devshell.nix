{ inputs
, cell
}:
let
  inherit (inputs.std) std;
  inherit (inputs) nixpkgs;
in
{
  default = std.lib.mkShell {
    name = "Simple Test Devshell";
    imports = [
      std.devshellProfiles.default
    ];
    packages = with nixpkgs; [
      hello
    ];
  };
}
