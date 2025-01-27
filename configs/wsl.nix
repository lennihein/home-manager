{ config, pkgs, ... }:
{

	home.stateVersion = "24.11";

	imports = [

	];

	home.file = {

		# WSL specific configuration
		".config/fish/conf.d/wsl.fish" = {
				source = ../files/wsl.fish;
		};
		home.file.".config/neofetch/config.conf".source = ../files/neofetch_wsl.conf;
	};
}
