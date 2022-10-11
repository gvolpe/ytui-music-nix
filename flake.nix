{
  description = "Flake for ytui-music";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      ytui = pkgs.callPackage drv/ytui.nix { };
      runner = pkgs.writeShellScript "ytui" ''
        ${ytui}/bin/ytui_music run
      '';
    in
    {
      apps.${system}.default = {
        type = "app";
        program = "${runner}";
      };

      packages.${system} = {
        default = ytui;
        ytui-music = ytui;
      };
    };
}
