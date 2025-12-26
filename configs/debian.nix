{ config, pkgs, ... }:
{
	
	imports = [
    
	];

	home.sessionVariables = {
		GIT_SSH_COMMAND = "ssh -F ${config.home.homeDirectory}/.ssh/config";
	};

	programs.ssh = {
		enable = true;
		extraConfig = ''
			# Basic SSH configuration to ensure file existence for GIT_SSH_COMMAND
			Host *
				ServerAliveInterval 60
		'';
	};
}
