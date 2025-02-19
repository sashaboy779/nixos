{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.8;
      scrolling.multiplier = 5;
      font = { 
        size = 12;
      };
      general.import = [
        "${pkgs.alacritty-theme}/gruvbox_dark.toml"
      ];
    };
  };

  home.packages = [
    pkgs.alacritty-theme
  ];
}
