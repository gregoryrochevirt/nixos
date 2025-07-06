# nixos

## Modify config
sudo nano /etc/nixos/configuration.nix
## Rebuild config
sudo nixos-rebuild switch --upgrade
## List channel
sudo nix-channel --list
## Add channel
sudo nix-channel --add https://channels.nixos.org/nixos-25.05 nixos

