{ config, pkgs, ... }:

{
  home.username = "pablo";
  home.homeDirectory = "/home/pablo";

  # set cursor size and dpi for 1080p monitor
  xresources.properties = {
    "Xcursor.size" = 24;
  # "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    beeper
    neofetch
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    # misc
    cowsay # Whimsy!
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
