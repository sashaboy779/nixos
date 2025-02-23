{ config, pkgs, ... }:
let 
  rose-pine-hyprcursor = import ../../packages/rose-pine-hyprcursor.nix { inherit pkgs; };
in
{
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home.username = "sunset";
  home.homeDirectory = "/home/sunset";

  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userEmail = "sashaboychuk779@gmail.com";
    userName = "Oleksandr Boichuk";           
  };

  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.rose-pine-cursor;
  gtk.cursorTheme.name = "BreezeX-RosePine-Linux"; 

  gtk.theme.package = pkgs.everforest-gtk-theme;
  gtk.theme.name = "Everforest-Dark-BL";

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
	      color-scheme = "prefer-dark"; # force dark theme system wide
      };
    };
  };

  gtk.iconTheme.package = pkgs.everforest-gtk-theme;
  gtk.iconTheme.name = "everforest_light";

  #qt = {
  #  enable = false;
  #  platformTheme = "gtk";
  #  style = {
  #    name = "adwaita-dark";
  #    package = pkgs.adwaita-qt;
  #  };
  #};

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    xfce.thunar
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # required for hyprcursor to work
    ".local/share/icons/rose-pine-hyprcursor".source = "${rose-pine-hyprcursor}";

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
