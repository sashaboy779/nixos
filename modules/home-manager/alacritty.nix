{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;
        padding = {
          x = 10;
          y = 10;
        };
      };
      scrolling.multiplier = 5;
      font = { 
        size = 12;
      };
      general.import = [
        "${pkgs.alacritty-theme}/everforest_dark.toml"
      ];
    };
  };

  home.packages = [
    pkgs.alacritty-theme
  ];
}
