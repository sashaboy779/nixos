{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;
        padding = {
          x = 0;
          y = 0;
        };
        dynamic_padding = false;
      };
      scrolling.multiplier = 5;
      font = { 
        size = 13;
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
