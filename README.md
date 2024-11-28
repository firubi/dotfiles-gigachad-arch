For a simple Arch Linux installation using an XFS-filesystem, look here: https://github.com/firubi/gigachad-arch-installation

# Dotfiles for GIGACHADS
This is the dotfiles for GIGACHADS.
> ![image](https://github.com/user-attachments/assets/458343e2-fd69-456f-99e1-a5f85142741d)

# Programs
- Distro - Arch
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
### Increase vm.max_map_count
For better game compatibility, you may want to try to increase [vm.max_map_count](https://wiki.archlinux.org/title/Gaming#Increase_vm.max_map_count).

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
You can get the numbers from running `xrandr | grep -w connected` while in an **X-session**.

### Anki
After an update, the audio in Anki is low. You need to specify ao=pulse in mpv.conf, and put it in ~/.local/share/Anki2/ so Anki reads it. You may want to add ANKI_WAYLAND=1 as an environmental variable if it behaves weirdly on Wayland. 

### Gamescope settings for CS2 stretched
`LD_PRELOAD="" gamescope -f -r 180 -S stretch  -W 2560 -H 1440 -w 1920 -h 1440 --force-grab-cursor -- %command% +exec autoexec.cfg`

## Basic maintenance
- `sudo pacman -Syu` - to update
- `sudo pacman -Rns` - to remove package
- `pacman -Qq | wc -l` - to show package count
- `sudo pacman -Rns $(pacman -Qdtq)` - to remove orphans (does also remove some make dependencies for AUR and tkg)
- `paccache -r` - to remove previous versions of packages, but keep the latest 3
- `paccache -ruk0` - to remove previous versions of uninstalled packages

## Personal packages

Minimal KDE:
```
yay -S --needed plasma-desktop kscreen plasma-pa plasma-nm bluedevil ark dolphin kdegraphics-thumbnailers breeze-gtk kde-gtk-config sddm sddm-kcm plasma-systemmonitor
```

Everything else: 
```
yay -S --needed pacman-contrib kate firefox fastfetch steam heroic-games-launcher-bin wine-staging wine-mono wine-gecko fcitx5 fcitx5-configtool fcitx5-mozc mpv spectacle gwenview okular flatpak gamemode gamescope mangohud xdg-desktop-portal-gtk alacritty gnome-disk-utility xclip xorg-xrandr
```

Flatpaks:
```
flatpak install dev.vencord.Vesktop org.keepassxc.KeePassXC com.obsproject.Studio com.usebottles.bottles com.github.tchx84.Flatseal info.cemu.Cemu sh.ppy.osu org.prismlauncher.PrismLauncher org.gnome.Boxes io.github.xiaoyifang.goldendict_ng org.qbittorrent.qBittorrent net.davidotek.pupgui2 org.kde.kdenlive org.yuzu_emu.yuzu it.mijorus.gearlever io.github.mezoahmedii.Picker
```
And flatpaks outside of Flathub:
```
flatpak install --user https://sober.vinegarhq.org/sober.flatpakref
```
Search for an anime launcher to play those games. 

