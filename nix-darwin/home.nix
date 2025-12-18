{ config, inputs, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.username = "rleblic";
  home.homeDirectory = "/Users/rleblic";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    GIT_EDITOR = "hx";
    SHELL = "fish";
  };
}
