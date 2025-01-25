{ config, pkgs, ... }:
{
		programs.fish = {
		enable = true;

		interactiveShellInit = ''
      set fish_greeting
    '';

		functions = {
			pls = "doas (which $argv[1]) $argv[2..-1]";
			squash = "git reset (git commit-tree 'HEAD^{tree}' -m $argv)";
		};

		shellAbbrs = {
			
		};
	};

		programs.starship = {
		enable = true;
	};
}
