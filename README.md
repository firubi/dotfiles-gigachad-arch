For a simple Arch Linux installation, look here: https://github.com/firubi/gigachad-arch-installation

# Dotfiles for GIGACHADS
This is the dotfiles for GIGACHADS.
> ![image](https://github.com/user-attachments/assets/767b4501-aeef-438e-a44c-706e60696aa5)


# Programs
- Distro - Arch, added CachyOS repositories
- Shell - bash
- Terminal - alacritty
- WM - KDE
- Screenshot - spectacle
- File manager - dolphin
- Image viewer - gwenview
- Document viewer - okular
- Video player - mpv

![image](https://github.com/user-attachments/assets/2c6f1d64-d543-4bb6-bbae-e62ec0bd76a6)

## Various tips
### Settings
If you add the CachyOS repos, you could add their cachyos-settings package. This will add zram to your system as well. If you use disk swap, make sure to set the priorities right (to use zram first). You can do this by adding the option pri=10 (or any other value less than 100) in fstab. Default priority for the zram is 100. You can confirm by typing `cat /proc/swaps`.
![image](https://github.com/user-attachments/assets/6df8be44-e676-49d4-9993-7fe3f3ad9695)


### Hyprland and KDE
Having KDE installed together with Hyprland makes theming so much easier. If you were to install breeze and dolphin, a lot the dependencies are common with plasma-desktop, so you might as well. This removes the need for qt6ct-kde or any other theming app, as you can simply use the KDE system settings app with the appropriate environmental variable. In order to fix the [weird MIME behaviour](https://bbs.archlinux.org/viewtopic.php?pid=2167579#p2167579) of dolphin, make a link in `/etc/xdg/menus` like this: `sudo ln -s /etc/xdg/menus/plasma-applications.menu /etc/xdg/menus/applications.menu`. If you want to install Hyprland, this is a summary of my programs:
```
yay -S --needed hyprland waybar hyprlock hyprpaper swaync rofi-wayland jq xdg-desktop-portal-hyprland grim slurp wl-clipboard
```

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
xrandr --output DP-0 --primary --mode 2560x1440 --rate 180
```
You can get the numbers from running `xrandr | grep -w connected` while in an **X-session**. You need the package xorg-xrandr for this to work.

### Anki
After an update, the audio in Anki is low. You need to specify ao=pulse in mpv.conf, and put it in ~/.local/share/Anki2/ so Anki reads it. You may want to add ANKI_WAYLAND=1 as an environmental variable if it behaves weirdly on Wayland. 

### Gamescope settings for CS2 stretched
`gamescope -f -r 240 -S stretch  -W 2560 -H 1440 -w 1920 -h 1440 --force-grab-cursor -- %command% +exec autoexec.cfg`

## Basic maintenance
- `sudo pacman -Syu` - to update
- `sudo pacman -Rns` - to remove package
- `pacman -Qq | wc -l` - to show package count
- `sudo pacman -Rns $(pacman -Qdtq)` - to remove orphans (does also remove some make dependencies for AUR and tkg)
- `paccache -r` - to remove previous versions of packages, but keep the latest 3
- `paccache -ruk0` - to remove previous versions of uninstalled packages

## Personal packages

Check my pkglist.txt file to see all my packages!

Flatpaks:
```
flatpak install org.keepassxc.KeePassXC com.obsproject.Studio com.usebottles.bottles com.github.tchx84.Flatseal info.cemu.Cemu sh.ppy.osu org.prismlauncher.PrismLauncher org.gnome.Boxes io.github.xiaoyifang.goldendict_ng org.qbittorrent.qBittorrent net.davidotek.pupgui2 org.kde.kdenlive org.yuzu_emu.yuzu it.mijorus.gearlever
```
