{ pkgs }:

pkgs.writeShellScriptBin "run-waybar" ''
  pid=$(pidof waybar)
  kill $pid

  ${pkgs.waybar}/bin/waybar &
''

