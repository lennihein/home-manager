## Installation

### DebianWSL

```bash
sudo apt update -y
sudo apt install curl git -y
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
git clone https://github.com/lennihein/home-manager.git
nix-shell -p home-manager
home-manager switch --flake home-manager/#debianwsl
sudo sh -c 'echo "/home/lenni/.nix-profile/bin/fish" >> /etc/shells'
chsh -s /home/lenni/.nix-profile/bin/fish
# reload
```

#### Further Steps

- add to `/etc/wsl.conf`:

    ```bash
    [interop]
    appendWindowsPath = false
    ```

-  install doas and add `permit nopass <USER>` to `/etc/doas.conf`