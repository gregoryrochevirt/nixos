echo "nano /home/greg/.bashrc

nix-channel --list
nix-channel --add https://nixos.org/channels/channel-name nixos
nix-channel --add https://some.channel/url my-alias
nix-channel --remove channel-alias
nix-channel --update channel-alias
nix-channel --update

sudo nano /etc/nixos/configuration.nix
sudo nixos-rebuild switch

sudo systemctl start/stop/status docker.socket

sudo shutdown -r
 
ctrl+k ctrl +s shortcut management
ctrl+b sides menu
ctrl+alt+b center panels
ctrl+n full screen
ctrl+alt+n Split editor/terminal"
