{ config, pkgs, ... }:
{

	imports = [
		./hidpi.nix
	];

	home.file = {

		# WSL specific configuration
		".config/fish/conf.d/wsl.fish" = {
				source = ../files/wsl.fish;
		};
		".config/neofetch/config.conf".source = ../files/neofetch_wsl.conf;
	};
}
