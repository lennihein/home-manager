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
		".config/fastfetch/config.jsonc".source = ../files/fastfetch.jsonc;
	};
}
