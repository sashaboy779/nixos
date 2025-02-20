{ pkgs, ... }:
let
  run-wayland-script = (import ./run-waybar-script.nix { inherit pkgs; }); 
in
{
  home.packages = [
    run-wayland-script
  ];
}
