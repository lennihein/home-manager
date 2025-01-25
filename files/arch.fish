set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

abbr --add -- allpackages 'pacman -Qq | fzf --preview '\''pacman -Qil {}'\'' --layout=reverse --bind '\''enter:execute(pacman -Qil {} | less)'\'''