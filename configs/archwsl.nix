{ config, pkgs, lib, ... }:
{

	home.stateVersion = "24.11";

	imports = [

	];
  
  home.file.".config/neofetch/config.conf".source = lib.mkForce ../files/neofetch_archwsl.conf;
}
