{
	description = "Home configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
		pwndbg.url = "github:pwndbg/pwndbg";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-stable, pwndbg, home-manager }:
		let
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
			extraSpecialArgs = {
				pkgsStable = import nixpkgs-stable { inherit system; config.allowUnfree = true; };
				pwndbg = pwndbg.packages.${system}.pwndbg;
			};
			mkHome = modules: home-manager.lib.homeManagerConfiguration {
				inherit pkgs extraSpecialArgs modules;
			};
		in {
			nixosModules.default = { ... }: {
				imports = [
					./common/default.nix
					./configs/dev.nix
					./configs/desktop.nix
				];
			};

			homeConfigurations = {
				debianwsl = mkHome [
					./common/default.nix
					./configs/dev.nix
					./configs/guest.nix
					./configs/wsl.nix
					./configs/debian.nix
				];
				archwsl = mkHome [
					./common/default.nix
					./configs/dev.nix
					./configs/guest.nix
					./configs/wsl.nix
					./configs/arch.nix
					./configs/archwsl.nix
				];
				debian-headless = mkHome [
					./common/default.nix
					./configs/guest.nix
					./configs/debian.nix
				];
				nixos = mkHome [
					./common/default.nix
					./configs/dev.nix
					./configs/desktop.nix
				];
			};
		};
}
