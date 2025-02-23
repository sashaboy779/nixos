{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status-position top
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.power-theme;
        extraConfig = ''
          set -g @tmux_power_theme 'everforest'
        '';
      }
    ];
    keyMode = "vi";
    mouse = true;
    newSession = true;
    prefix = "C-s";
    resizeAmount = 5;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";
  };
}
