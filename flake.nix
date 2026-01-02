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

	outputs = { self, nixpkgs, nixpkgs-stable, pwndbg, home-manager }: {
		nixosModules.default = { ... }: {
			imports = [
				./common/default.nix
				./configs/dev.nix
				./configs/desktop.nix
		   ];
		};  
		
		homeConfigurations = {
			debianwsl = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { 
					pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; 
					pwndbg = pwndbg.packages.x86_64-linux.pwndbg;
				};
				modules = [
					./common/default.nix
					./configs/dev.nix
					./configs/guest.nix
					./configs/wsl.nix
					./configs/debian.nix
				];
			};
			archwsl = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { 
					pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; 
					pwndbg = pwndbg.packages.x86_64-linux.pwndbg;
				};
				modules = [
					./common/default.nix
					./configs/dev.nix
					./configs/guest.nix
					./configs/wsl.nix
					./configs/arch.nix
					./configs/archwsl.nix
				];
			};
			debian-headless = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { 
					pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; 
					pwndbg = pwndbg.packages.x86_64-linux.pwndbg;
				};
				modules = [
					./common/default.nix
					./configs/guest.nix
					./configs/debian.nix
				];
			};
			nixos = home-manager.lib.homeManagerConfiguration {
				pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
				extraSpecialArgs = { 
					pkgsStable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; }; 
					pwndbg = pwndbg.packages.x86_64-linux.pwndbg;
				};
				modules = [
					./common/default.nix
					./configs/dev.nix
					./configs/desktop.nix
				];
			};
		};
	};
}
