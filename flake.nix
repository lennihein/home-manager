{
	description = "Home configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-stable, home-manager }: {
		nixosModules.default = { ... }: {
			imports = [
				./common/default.nix
				./configs/dev.nix
				./configs/nixos.nix
		   ];
		};  
		
		homeConfigurations = {
			archwsl = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; };
				modules = [
					./common/default.nix
					./configs/dev.nix
					./configs/guest.nix
					./configs/wsl.nix
					./configs/arch.nix
					./configs/archwsl.nix
				];
			};
			debianwsl = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; };
				modules = [
					./common/default.nix
					./configs/dev.nix
					./configs/guest.nix
					./configs/wsl.nix
					./configs/debian.nix
				];
			};
			debian-headless = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; };
				modules = [
					./common/default.nix
					./configs/guest.nix
					./configs/debian.nix
				];
			};
			nixos = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; };
				modules = [
					./common/default.nix
					./configs/dev.nix
					./configs/nixos.nix
				];
			};
		};
	};
}
