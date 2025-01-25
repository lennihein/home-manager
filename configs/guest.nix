{ config, pkgs, ... }:
{

	home.stateVersion = "24.11";

	imports = [

	];

	home.file = {

		# Make Nix available in fish
		".config/fish/conf.d/nix.fish" = {
				source = ../files/nix.fish;
		};
	};
}