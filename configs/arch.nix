{ config, pkgs, ... }:
{

	home.stateVersion = "24.11";

	imports = [

	];

	home.file = {
		".config/fish/conf.d/arch.fish".source = ../files/arch.fish;
	};
}
