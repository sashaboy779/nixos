{ config, lib, pkgs, ... }:
let 
  cfg = config.sunset.programs.fish;
in
{
  options = {
    sunset.programs.fish.enable = lib.mkOption {
      default = false;
      description = ''
          Whether to configure fish as a default shell 
        '';
      type = lib.types.bool; 
    }; 
  };

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;

    programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
    };
  };
}
