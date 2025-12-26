{ config, pkgs, ... }:
{
	
	imports = [
    
	];

	home.sessionVariables = {
		GIT_SSH_COMMAND = "ssh -F ${config.home.homeDirectory}/.ssh/config";
	};
}
