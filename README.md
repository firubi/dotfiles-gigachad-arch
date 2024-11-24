For a simple Arch Linux installation using an XFS-filesystem, look here: 

# Dotfiles for GIGACHADS
This is the dotfiles for GIGACHADS.
> Hyprland
> ![2024-11-22_21-42-07](https://github.com/user-attachments/assets/159c4ac3-74a4-436c-90f8-f4f5ed9ee123)
> KDE
> ![image](https://github.com/user-attachments/assets/4c9083bb-e61c-4002-8571-0325d2b05947)

# Programs
- Distro - Arch with [CachyOS repos](https://wiki.cachyos.org/features/optimized_repos/)
- Shell - bash
- Terminal - alacritty
- WM - Hyprland/KDE
- Launcher - rofi-wayland
- File manager - dolphin
- Image viewer - oculante
- Document viewer - zathura
- Video player - mpv

![image](https://github.com/user-attachments/assets/1effbaf1-3585-4884-8189-b72af41dcfe7)

Minimal KDE:
```
yay -S --needed plasma-desktop kscreen plasma-pa plasma-nm bluedevil ark dolphin breeze-gtk kde-gtk-config 
```

## Various tips
### Fcitx5
Add in /etc/environment
```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```
### SDDM-refresh-rate
You can change the refresh rate and primary monitor in SDDM. Edit the file /usr/share/sddm/scripts/Xsetup as sudo and add in the lines:
```
xrandr --output DP-0 --primary --mode 2560x1440 --rate 180 # or whatever your monitor settings are
```
You can get the numbers from running `xrandr | grep -w connected` while in an **X-session**.

### Anki
After an update, the audio in Anki is low. You need to specify ao=pulse in mpv.conf, and put it in ~/.local/share/Anki2/ so Anki reads it.

## Basic maintenance
- `sudo pacman -Syu` - to update
- `sudo pacman -Rns` - to remove package
- `pacman -Qq | wc -l` - to show package count
- `sudo pacman -Rns $(pacman -Qdtq)` - to remove orphans (does also remove some make dependencies for AUR and tkg)
- `paccache -r` - to remove previous versions of packages, but keep the latest 3
- `paccache -ruk0` - to remove previous versions of uninstalled packages
