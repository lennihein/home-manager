{ config, pkgs, ... }:
{

	home.stateVersion = "24.11";

	imports = [

	];
  
  home.file.".config/neofetch/config.conf".source = ../files/neofetch_archwsl.conf;
}
