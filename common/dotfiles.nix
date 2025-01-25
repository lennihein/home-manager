{ config, pkgs, ... }:
{
  home.file = {
    
    ".gdbinit".text = ''
      source /usr/share/pwndbg/gdbinit.py
    '';

    ".config/bat/config".text = ''
      --theme="Dracula"
      --style="numbers,changes,header"
    '';

    ".config/starship.toml" = {
        source = ../files/starship.toml;
    };

    ".vimrc" = {
        source = ../files/vimrc;
    };

    # ".config/ranger/rc.conf".text = ''

    # '';
    # ".config/neofetch/config.conf".text = ''

    # '';
  };
}
