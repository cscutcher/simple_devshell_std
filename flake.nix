{
  inputs.std.url = "github:divnix/std";
  inputs.nixpkgs.url = "nixpkgs";

  outputs = { std, ... } @ inputs:
    std.growOn
      {
        inherit inputs;
        cellsFrom = ./cells;
        organelles = [
          (std.devshells "devshell")
        ];
      }
      # soil for compatiblity ...
      {
        # ... with `nix develop` - `default` is a special target for `nix develop`
        devShells = inputs.std.harvest inputs.self [ "simple" "devshell" ];
      };
}
