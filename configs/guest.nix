{ config, pkgs, ... }:
{

	imports = [

	];

	home.file = {

		# Make Nix available in fish
		".config/fish/conf.d/nix.fish" = {
				source = ../files/nix.fish;
		};
	};
    nix = {
      package = lib.mkDefault pkgs.nix;  # Lower priority
      settings.experimental-features = [ "nix-command" "flakes" ];
    };
}
